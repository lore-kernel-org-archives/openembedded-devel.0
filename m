Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjTYM-0002lW-Fu
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 12:35:42 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so371970wic.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 03:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vzh3xbBh6yvJ4NxaCB1XVjGQWPn7M1YwDNoQFVcFyyQ=;
	b=O8lwaWi3udYM0+rp+CCGafydZxG3Hktj+usFCza9iYs5WZTqKVASftzz51aaEabHcG
	A08m4fJeJg/saDJZTOUPC7zYZ8G1UXlOWiy23P1ZqmRgm3/4hruMqYXdqAp+MDVJQzUS
	cXbpcsKYe/BWJax+/OwTeQ9KQSGKz5IjD8mAssJMpcWMMSffeeXmsn52i6klzo3C/950
	J8NHRG5TWCzu7bUonPqTKc3vGlbKMGf0eCXLPcDn7pVj+UWLik3u6HqGkizCw2oDug5S
	jrsdOxb3yw2WR9DzufQoCNl1iaYtr+mqEvlAlFvCnr7ghVzOGXfU+FHnjBia4W99nl1u
	IEyQ==
MIME-Version: 1.0
Received: by 10.180.78.161 with SMTP id c1mr2003970wix.4.1355484066605; Fri,
	14 Dec 2012 03:21:06 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Fri, 14 Dec 2012 03:21:06 -0800 (PST)
In-Reply-To: <1355482437-30298-1-git-send-email-johan.hovold@lundinova.se>
References: <1355482437-30298-1-git-send-email-johan.hovold@lundinova.se>
Date: Fri, 14 Dec 2012 12:21:06 +0100
Message-ID: <CA+chaQd45pxo_RPGWpaU-_XDZRbm7NLO=rYzfDwQvqboyVWNHg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] udev-173: fix file checksums
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
X-List-Received-Date: Fri, 14 Dec 2012 11:35:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 14, 2012 at 11:53 AM, Johan Hovold
<johan.hovold@lundinova.se> wrote:
> Commit 7895ab08270d9 ("udev-173: Fix SRC_URI to fetch bz2 archive")
> changed to source file to bz2-compressed tarball but did not update the
> checksums.
>
> Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>

This change looks correct, but why are you using this older udev version?

see http://patchwork.openembedded.org/patch/39873/

Cheers,

>
> Hi,
>
> the above mentioned commit breaks udev-173 builds. It also claims that the
> gz-tarballs are no longer available, but yet they are still available from
> kernel.org as well as my local mirror. Perhaps a revert is more appropriate?
>
> Thanks,
> Johan
>
>
>  meta-oe/recipes-core/udev/udev_173.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
> index 576302c..02c5690 100644
> --- a/meta-oe/recipes-core/udev/udev_173.bb
> +++ b/meta-oe/recipes-core/udev/udev_173.bb
> @@ -32,8 +32,8 @@ SRC_URI += " \
>         file://cache \
>  "
>
> -SRC_URI[md5sum] = "2afd20ee1c790eac6d7abe0498ebb414"
> -SRC_URI[sha256sum] = "0f753ad9c3022a074d1c052bcee9139581db825283771ac78c0be0d1de109d0c"
> +SRC_URI[md5sum] = "91a88a359b60bbd074b024883cc0dbde"
> +SRC_URI[sha256sum] = "70a18315a12f8fc1131f7da5b4dae3606988b69d5c08f96f443b84b8486caaaf"
>
>  # Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
>
> --
> 1.8.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


