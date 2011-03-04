Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvX93-0001x3-Ce
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 16:42:25 +0100
Received: by pwj9 with SMTP id 9so369996pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 07:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Y29SUoh0h8W9PmDbSVn/QfKevpMI7vzQy0ahEOkTntc=;
	b=Nagok2vKTm5u4iWP+bJnc6YwgW/vdMipKnb4ThxVqLyWpKXbLQzKgLwLVml5vJWLFt
	dzhdr3oBgkBEF03Ns082G1l5EPThUuWqyPIJaJGvKRjcy8au4BszHEPtabzFJA6grbpD
	uTQ3opDoEDZqvH6IEyNaBGcw78TwJqF7xWKOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=GyNd/Bbv4UI3YP7ZYLUWhL3IyOJZmYa/62A4AWKOAE9g517micfZ/WBNbIphQN4jJg
	VBhU805vS5cfwC6qwhCExrUoNAaSudCZjg5cvOXIGfGrpjRTtRVDfF/yOA9CZgfjb2pP
	DwkImXQ7/IG1TmUS5gGpSSF2OCtqsfgVRS3HY=
Received: by 10.142.217.12 with SMTP id p12mr594114wfg.382.1299253245735;
	Fri, 04 Mar 2011 07:40:45 -0800 (PST)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p40sm3118368wfc.5.2011.03.04.07.40.43
	(version=SSLv3 cipher=OTHER); Fri, 04 Mar 2011 07:40:44 -0800 (PST)
Message-ID: <4D7107F9.90008@gmail.com>
Date: Fri, 04 Mar 2011 07:40:41 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D705C07.20508@freescale.com>
	<1299244359-5345-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1299244359-5345-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] mrouted-3.9.4: intitial recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2011 15:42:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/2011 5:12 AM, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
> This was only compile-tested. It would be nice to get some feedback.

Looks ok to me. Does it need any deps? May be building it from scratch 
will detect it if not otherwise

Acked-by: Khem Raj <raj.khem@gmail.com>

>
>   recipes/mrouted/mrouted_3.9.4.bb |   23 +++++++++++++++++++++++
>   1 files changed, 23 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/mrouted/mrouted_3.9.4.bb
>
> diff --git a/recipes/mrouted/mrouted_3.9.4.bb b/recipes/mrouted/mrouted_3.9.4.bb
> new file mode 100644
> index 0000000..4ba4111
> --- /dev/null
> +++ b/recipes/mrouted/mrouted_3.9.4.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "DVMRP multicast routing daemon"
> +HOMEPAGE = "http://troglobit.com/mrouted.shtml"
> +SECTION = "network"
> +LICENSE = "BSD"
> +
> +SRC_URI = "ftp://ftp.vmlinux.org/pub/People/jocke/mrouted/mrouted-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "688b74fc42919d588f262e6b3c9c6d4c"
> +SRC_URI[sha256sum] = "c697549b2e506a380575f7adb67e87288ef2295b97241b3a1aeb0e88b827a3e1"
> +
> +EXTRA_OEMAKE = " \
> +        datadir=${datadir} \
> +        mandir=${mandir} \
> +        prefix=${prefix} \
> +        sysconfdir=${sysconfdir} \
> +        DESTDIR=${D} \
> +"
> +
> +do_compile() {
> +        oe_runmake
> +}
> +do_install() {
> +        oe_runmake install
> +}



