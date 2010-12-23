Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PVis7-0006nV-L6
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 11:58:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3D566314BE59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 11:58:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0xa1a9N3jqp8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 11:58:00 +0100 (CET)
Received: from [10.200.6.10] (unknown [82.149.226.166])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 79134314BE56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 11:58:00 +0100 (CET)
Message-ID: <4D132B38.3050808@opendreambox.org>
Date: Thu, 23 Dec 2010 11:58:00 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D10B09F.2050505@opendreambox.org>
	<1293097031-26936-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1293097031-26936-1-git-send-email-rep.dot.nop@gmail.com>
Subject: Re: [PATCH] e2fsprogs: fix symlinks and work with dash
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
X-List-Received-Date: Thu, 23 Dec 2010 10:58:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Bernhard,

On 12/23/2010 10:37 AM, Bernhard Reutner-Fischer wrote:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  recipes/e2fsprogs/e2fsprogs.inc |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
> index ef9aace..e400c75 100644
> --- a/recipes/e2fsprogs/e2fsprogs.inc
> +++ b/recipes/e2fsprogs/e2fsprogs.inc
> @@ -30,8 +30,8 @@ do_compile_prepend () {
>  do_install_append () {
>  
>      	oe_runmake install-libs DESTDIR=${D}
> -	ln -sf ${D}/${base_sbindir}/tune2fs findfs
> -	ln -sf ${D}/${base_sbindir}/tune2fs e2label
> +	ln -sf tune2fs ${D}${base_sbindir}/findfs
> +	ln -sf tune2fs ${D}${base_sbindir}/e2label
>  }
>  
>  do_install_append_pn-e2fsprogs () {
> @@ -43,9 +43,10 @@ do_install_append_pn-e2fsprogs () {
>  	done
>  	fsck=$(cd ${D}${base_sbindir}/ && ls -1 fsck.ext* | sed s/[^\.]*//)
>  	for e in $fsck; do
> -		rm ${D}${base_sbindir}/{fsck,mkfs}$e;
> -		ln -s ${D}${base_sbindir}/e2fsck$e.${PN}$e fsck$e.${PN}
> -		ln -s ${D}${base_sbindir}/mke2fs$e.${PN}$e mkfs$e.${PN}
> +		rm ${D}${base_sbindir}/fsck$e;
> +		rm ${D}${base_sbindir}/mkfs$e;
> +		ln -s e2fsck$e.${PN}$e ${D}${base_sbindir}/fsck$e.${PN}
> +		ln -s mke2fs$e.${PN}$e ${D}${base_sbindir}/mkfs$e.${PN}

this would create fsck.ext3.e2fsprogs -> e2fsck.ext3.e2fsprogs.ext3
etc., which is not what we want. Also, PR needs to be incremented,
because the links didn't appear in the current package.

Would you mind if I pushed the following changeset instead?

http://git.opendreambox.org/?p=obi/openembedded.git;a=commitdiff;h=d87d337f2d2693f3859de64a8b09c5b4b362abdd

Regards,
Andreas


