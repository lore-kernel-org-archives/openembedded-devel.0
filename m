Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id DC2A4748D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 07:22:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c13-v6so4019888wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MnuEB1qA9Jg9LQrbH2Y5yCTM+UdH6/Y2LL8y+eIyPxE=;
	b=uk0J5fxVHsdJFh5RCCR/0OznIhsXNDf2NU3FgZ8T2jVDTIpnK/9nsar9cc1OSYZUfw
	0vzewkYLtqQI11OAMGVoAezPZhjn71w1Ku4RhJSgXHhYojCH0EkNm0DsyaaCCmu8pKnG
	y4OnfWZ2PZQ5oCANZ/Em4G+qfYxGJsombzuWX7ISO4wVvFScbAzA1llOWouNGzKkUKo+
	8Xxj9EGlZOnFxSGua1owhpkj+vgH8MjdIF2bUQ3oMXrf2yVG8sFxPSS8j1XOixoeqlVz
	QFjmPRfZ9iw4oItQfviSD7y1HV0IHQxeCd/mGLPrnkkEA0sTyeCY+P3eyiA7WHt8ZXri
	RcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MnuEB1qA9Jg9LQrbH2Y5yCTM+UdH6/Y2LL8y+eIyPxE=;
	b=LAT33KFp9yupBjO20rr22HysLnl65aACfZRduR3N3J8rGtbHaIp+Xd17nchkySjjNi
	QymUm0442osXl7Orag9UQOxYOYgZwPgYwppKLnmDU+gghlCQkrjq/jCHIWGLaw6A5Nxm
	AFpKOmXWpd3zhH3IvQWvFc7tU6qup2P21dfyeXrfmS8VpUJe+hcCLlMiKL1M9HdmgkyQ
	V9U+2Tz+IhcShLNZono3a4xEU5y5xx9Hsj9ASO+DQ1Kh/+iuEPxAMI8IL5vPdBDMK6oi
	EEYTt4e3SCWz/SdOBsIXGl0Z0WLGqE11cvQwpln+L6OM2+SrR/niN4dr6KfZ8PzSOJyS
	gzig==
X-Gm-Message-State: AOUpUlEhA4rPzNDQ+bhWcJjbZTMzTu6EaA5hPzous6EXujrAeY0OVGsL
	gTqiTO+vxEVIqpRY+K1gn2roiHYX7+F8JUsclXsd6Rut
X-Google-Smtp-Source: AAOMgpebnBM1geoGn0cUPPiACv8yx2v75Mff+mD0kcxxN2szF0pUgsUoSovB52JGhjfurrI677kKX6JAa2Fx5oeYffI=
X-Received: by 2002:adf:8541:: with SMTP id
	59-v6mr3618887wrh.223.1532676128627; 
	Fri, 27 Jul 2018 00:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <1519987524-4045-1-git-send-email-mikko.gronoff@qt.io>
In-Reply-To: <1519987524-4045-1-git-send-email-mikko.gronoff@qt.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 27 Jul 2018 09:21:58 +0200
Message-ID: <CA+chaQdsMvcCGbvZmp50eeOtuAm1LjTKwB=oQ7taMZuJn9j_tQ@mail.gmail.com>
To: Mikko Gronoff <mikko.gronoff@qt.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Change default SRC_URI from github.com to code.qt.io
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 07:22:08 -0000
Content-Type: text/plain; charset="UTF-8"

One disadvantage of this is that fetching from code.qt.io seems to be
significantly slower than from github.com.

One extreme case is just running in one of my old build dirs, where the
checkout from code.qt.io wasn't updated on premirror for quite long time
and now the do_fetch of qtbase is already running for 43 hours..

Most of the time it's removing various refs from gerrit reviews:
$ tail
work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
 x [deleted]         (none)     -> refs/changes/83/75483/6
 x [deleted]         (none)     -> refs/changes/83/75783/1
 x [deleted]         (none)     -> refs/changes/83/75783/2
 x [deleted]         (none)     -> refs/changes/83/75783/3
 x [deleted]         (none)     -> refs/changes/83/75783/4
 x [deleted]         (none)     -> refs/changes/83/75783/5
 x [deleted]         (none)     -> refs/changes/83/75783/6
 x [deleted]         (none)     -> refs/changes/83/7583/1
 x [deleted]         (none)     -> refs/changes/83/76183/1
 x [deleted]         (none)     -> refs/changes/83/76183/2

and there is a lot of them:
$ grep -c deleted
work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
81174

$ grep -c deleted.*refs/changes
work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
63253

$ grep -c deleted.*refs/builds
work/x86_64-linux/qtbase-native/5.9.6+gitAUTOINC+9c50112304-r0/temp/log.do_fetch
17921

Yes it might be faster to delete the archive from premirror and do clone
from scratch, but other developers wouldn't know what to do with local
downloads directory.

On Fri, Mar 2, 2018 at 5:19 PM Mikko Gronoff <mikko.gronoff@qt.io> wrote:

> There have been issues in the past with github qt mirror being out of
> sync with code.qt.io for certain module repos. Right now there's been a
> several days long break in update cycle for seemingly all the qt
> modules where content has not been pushed to the github mirror. Change
> the default SRC_URI to the more reliable code.qt.io.
>
> Change-Id: Ic7d3b9a82ef0ae502e99a8516ef78ca09250fd1e
> Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
> Reviewed-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  conf/layer.conf                              | 4 ++--
>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 7751ce2..f540710 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -33,7 +33,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>
>  IMAGE_FEATURES[validitems] += "qtcreator-debug"
>
> -QT_GIT ?= "git://github.com/qt"
> -QT_LABS_GIT ?= "git://github.com/qt-labs"
> +QT_GIT_PROJECT ?= "qt"
> +QT_GIT ?= "git://code.qt.io/${QT_GIT_PROJECT}
> <http://code.qt.io/$%7BQT_GIT_PROJECT%7D>"
>  QT_GIT_PROTOCOL ?= "git"
>  QT_EDITION ?= "opensource"
> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> index dfbe4ae..36d57f1 100644
> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =
> "file://qml/QtDemo/main.qml;endline=39;md5=7d80863906a4bc8ffc
>  DEPENDS = "qtdeclarative qtxmlpatterns qtgraphicaleffects qtsvg
> qtmultimedia"
>
>  SRCREV = "35d72a2eba7456a2efc5eb8b77afbc00f69ba0ac"
> -SRC_URI = "${QT_LABS_GIT}/qt-labs-qt5-everywhere-demo"
> +QT_GIT_PROJECT = "qt-labs"
> +SRC_URI = "${QT_GIT}/qt5-everywhere-demo"
>
>  S = "${WORKDIR}/git/QtDemo"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

