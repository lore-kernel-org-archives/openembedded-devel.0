Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id B427074221
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 16:47:49 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so90263690pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=bgSMqTv9vp8QP5KE7Z+7D4aq1PQW6p2CRFr1lJKaRDQ=;
	b=cdLrTuKKXbz8NHvh1n64+PzMjO58IjzmWnBojY9dyoFLPEiSpUMruoS481sud5TtMX
	YfgTabiY1ux+G9xrkVToPwFwpAtsCtVWSBxU32hRCUHH6faLAAiU1h6u8q+qIvPJC1uS
	pBDHfqCIeRI9ukAGmXEHRDHci8HlVMvbhsp08L+VWc33rdvKMKQpdhkGipfj5wuxA3jg
	FKzO+bGqS0d6xO+Jr3teWg7kdMdleRgrA4O1wfAEs0WiiPukdGdbPdZC8Sd+c9fFIDtz
	8h1D/gFuXuhwbaqKJOf9BOJLrgR0PTMhgv0xmJH9yGJM/I62Qphce23wKrWH9IITn9mX
	LOig==
X-Received: by 10.68.57.209 with SMTP id k17mr33542066pbq.118.1433090870835;
	Sun, 31 May 2015 09:47:50 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:92d:29db:6263:7aa7?
	([2601:c:a700:3ba7:92d:29db:6263:7aa7])
	by mx.google.com with ESMTPSA id
	ve1sm11693322pbc.52.2015.05.31.09.47.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 May 2015 09:47:49 -0700 (PDT)
Message-ID: <556B3B29.30500@gmail.com>
Date: Sun, 31 May 2015 09:47:37 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Stefan Agner <stefan@agner.ch>, openembedded-devel@lists.openembedded.org
References: <1432104728-18440-1-git-send-email-stefan@agner.ch>
In-Reply-To: <1432104728-18440-1-git-send-email-stefan@agner.ch>
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
X-List-Received-Date: Sun, 31 May 2015 16:47:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged to akuster/dizzy-next

- armin

On 05/19/2015 11:52 PM, Stefan Agner wrote:
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
>                   from /usr/include/endian.h:60,
>                   from /usr/include/bits/waitstatus.h:64,
>                   from /usr/include/stdlib.h:42,
>                   from
> /home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/ptpd.h:40,
>                   from
> /home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/bmc.c:54:
> /home/cceylan01/mywork/pdu/toradex/oe-core/build/out-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/ptpd/2.3.1-rc2-r0/ptpd-2.3.1-rc2/src/bmc.c:
> In function 'initData':
> /usr/include/bits/byteswap-16.h:31:5: error: invalid 'asm': invalid operand for
> code 'w'
>       __asm__ ("rorw $8, %w0"           \
>       ^
> /usr/include/netinet/in.h:403:21: note: in expansion of macro '__bswap_16'
>   #   define htons(x) __bswap_16 (x)
>
> This problem is already solved in fido/master due to the change to
> pkgconfig by Joe MacDonald...
>
>   meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> index db74e44..b6abfee 100644
> --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
> @@ -8,7 +8,7 @@ SECTION = "network"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://README;md5=2452033fe374283f29579898663b1aa8"
>
> -DEPENDS = "libpcap"
> +DEPENDS = "linux-libc-headers libpcap"
>
>   inherit autotools
>
> @@ -30,7 +30,7 @@ S = "${WORKDIR}/ptpd-${PV}"
>
>   EXTRA_OEMAKE = ""
>
> -EXTRA_OECONF += "--disable-snmp"
> +EXTRA_OECONF += "--disable-snmp --with-pcap-config=no"
>
>   do_install() {
>       install -d ${D}${bindir} ${D}${mandir}/man8
>

