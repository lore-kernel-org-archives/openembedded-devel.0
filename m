Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 104D2607BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2015 11:32:19 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 2DBFB5C0FDF;
	Fri, 29 May 2015 13:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=agner.ch; s=dkim;
	t=1432899015; bh=4hXy7I5+h7n/Fl4/X/dY5P00RFfBnjWTkQYVyVwQRRk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YTJK0DaodDlcBKqcQPltQHWLmKV7vwNagiEEgRuLndzVKC1RjRg5S0uqrvxGjoeji
	4lBiWvRIM8BmCQltcVW+nQXZdSSjnNyCgaFiA3LQOHZh1uSCQ5S88kBz19dkD/sB80
	WwgfjwhUzxkjOM6qH9w3Pt6MSztoUVtidQleoG0k=
MIME-Version: 1.0
Date: Fri, 29 May 2015 13:30:24 +0200
From: Stefan Agner <stefan@agner.ch>
To: akuster808@gmail.com, martin.jansa@gmail.com
In-Reply-To: <1432104728-18440-1-git-send-email-stefan@agner.ch>
References: <1432104728-18440-1-git-send-email-stefan@agner.ch>
Message-ID: <ffcf3d20cec25b5bf79f0a18976e4939@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][dizzy][PATCH] ptpd: disable libpcap detection via pcap-config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 May 2015 11:32:23 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Ping...

--
Stefan

On 2015-05-20 08:52, Stefan Agner wrote:
> When the host system provides pcap-config, the configure scripts
> detect that and add a bogous CPPFLAG:
> 
> checking for pcap-config... /usr/bin/pcap-config
> checking if we want to build with libpcap support... yes, pcap-config
> ...
> PCAP_CPPFLAGS =  -I/usr/include
> 
> Which down the line can lead to compile errors due to wrong headers
> being included. Fix this issue by using --with-pcap-config=no which
> prevents detection using pcap-config but does "guessing", which works
> fine for OE.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> If the host has libpcap development packages installed (which provide
> pcap-config), this lead to compile errors like:
> cc1: warning: include location "/usr/include" is unsafe for cross-compilation
> [-Wpoison-system-directories]
> cc1: warning: include location "/usr/include" is unsafe for cross-compilation
> [-Wpoison-system-directories]
> cc1: warning: include location "/usr/include" is unsafe for cross-compilation
> [-Wpoison-system-directories]
> In file included from /usr/include/bits/byteswap.h:35:0,
>                  from /usr/include/endian.h:60,
>                  from /usr/include/bits/waitstatus.h:64,
>                  from /usr/include/stdlib.h:42,
>                  from
> /home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/ptpd.h:40,
>                  from
> /home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/bmc.c:54:
> /home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/bmc.c:
> In function 'initData':
> /usr/include/bits/byteswap-16.h:31:5: error: invalid 'asm': invalid operand for
> code 'w'
>      __asm__ ("rorw $8, %w0"           \
>      ^
> /usr/include/netinet/in.h:403:21: note: in expansion of macro '__bswap_16'
>  #   define htons(x) __bswap_16 (x)
> 
> This problem is already solved in fido/master due to the change to
> pkgconfig by Joe MacDonald...
> 
>  meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> index db74e44..b6abfee 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> @@ -8,7 +8,7 @@ SECTION = "network"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://README;md5=2452033fe374283f29579898663b1aa8"
>  
> -DEPENDS = "libpcap"
> +DEPENDS = "linux-libc-headers libpcap"
>  
>  inherit autotools
>  
> @@ -30,7 +30,7 @@ S = "${WORKDIR}/ptpd-${PV}"
>  
>  EXTRA_OEMAKE = ""
>  
> -EXTRA_OECONF += "--disable-snmp"
> +EXTRA_OECONF += "--disable-snmp --with-pcap-config=no"
>  
>  do_install() {
>      install -d ${D}${bindir} ${D}${mandir}/man8


