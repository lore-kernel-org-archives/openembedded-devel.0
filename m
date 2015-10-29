Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6D6755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 23:18:58 +0000 (UTC)
Received: by wmff134 with SMTP id f134so34894230wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1ZYkncwSgA+BdLg0KYDikIoDuxwLOAEMlpmhbe9g0cY=;
	b=vnc5u4ofvWZrfXQz42XbdLPClRR8Z2ZlbEyD/KLMp4sC+C8+MCoLznINpawcbq4Wnj
	YOBLR9RDnhozB1CYYTqSgD5xZF9pF00DDCbHxIUivnWCWH5IqIseIqYe7Vfr6sa22N1T
	Qhad6N2IgUVErKe6zITayBLb1EITWX+cNUTBT02jrtkLt3vH/8MJtxamEMRAdH1sggxr
	0exPC+25nHgklpYDI2KTN7Z1v+wgpeHBZhyAkeUhQIP26C46edHagMXsoytPOAPnSziY
	0+qjhCyx+fXUjWMKMqccqv3GcNX+pQbKCGAJEORSAXP4q1JS+UakSTD9TQ7rnITTkmRy
	kIYA==
MIME-Version: 1.0
X-Received: by 10.28.214.146 with SMTP id n140mr6619222wmg.47.1446160738933;
	Thu, 29 Oct 2015 16:18:58 -0700 (PDT)
Received: by 10.194.154.232 with HTTP; Thu, 29 Oct 2015 16:18:58 -0700 (PDT)
In-Reply-To: <1446159993-15239-1-git-send-email-ian@boundarydevices.com>
References: <1446159993-15239-1-git-send-email-ian@boundarydevices.com>
Date: Fri, 30 Oct 2015 00:18:58 +0100
Message-ID: <CA+chaQc1mdFOTS3tZK0Cx2UMo8nkQSX2OtrQGoPi_mvFg9++sw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][jethro][PATCH] qtbase: Fix host user contamination
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
X-List-Received-Date: Thu, 29 Oct 2015 23:19:00 -0000
Content-Type: text/plain; charset=UTF-8

Isn't this fixed by:
http://patchwork.openembedded.org/patch/105649/
?

Which is already in master-next.

On Fri, Oct 30, 2015 at 12:06 AM, Ian Coolidge <ian@boundarydevices.com>
wrote:

> The copy must not use the host user when copying for packaging.
> Error fixed:
> ,----
> | WARNING: QA Issue: qtbase: /qtbase-dev/usr/lib/libqtfreetype.prl is
> owned by
> | uid 1000, which is the same as the user running bitbake. This may be due
> to
> | host contamination [host-user-contaminated]
> `----
>
> Signed-off-by: Ian Coolidge <ian@boundarydevices.com>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 4cffccf..19de7df 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -231,7 +231,7 @@ do_install_append() {
>          cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
>          chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
>      fi
> -    cp -a ${B}/lib/libqt* ${D}${libdir}
> +    cp -r ${B}/lib/libqt* ${D}${libdir}
>      # Remove example.pro file as it is useless
>      rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

