Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id A72A760CFC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:30:13 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 9so4870290ykp.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=O+vzSNO+ANKaOkwtvTbYaB/Zo8RKBgxMtGVzrNS1x+0=;
	b=W3gtqW62d2knBlyFCX9aSWCT8PgoSKGsxXFlihKYZr2XxrRWtp6s81JBae9IOZM9VC
	BcOeVxd25cNN/Hr3+9Um3kc7D6jP711mMW3bfPwl+PsZDXgLYELDyLsz2jlZRt8Degjn
	azgtK7LENlcG5XdZLWrsXQqiYB6JPxwal5YTLiKJg9lbZtuimAffXg4FTWTVJ7eIp5iW
	HAytS5w3pwuNeBJk8ZUarzCkcnmr9pE7hsOCUOb9/atsbvNO52pLA06xFPKVgsH85kT/
	rVNMBD8R6n7CHL4EnwxXczoiS3dEfh9LmiVxCyg8mlUu1yzgolgsKI3zwOkcdWygDQbt
	vAEg==
MIME-Version: 1.0
X-Received: by 10.236.231.161 with SMTP id l31mr58909683yhq.104.1417447813657; 
	Mon, 01 Dec 2014 07:30:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Mon, 1 Dec 2014 07:30:13 -0800 (PST)
In-Reply-To: <1417447595-2912-1-git-send-email-frieder.schrempf@online.de>
References: <1417447595-2912-1-git-send-email-frieder.schrempf@online.de>
Date: Mon, 1 Dec 2014 13:30:13 -0200
X-Google-Sender-Auth: eQGGCPUJ2mDo8EfJAkgYo22bcfM
Message-ID: <CAP9ODKrAWSD9Ssxpk2MS-rtPKEZTcxfhrcCs4hP74azaG5d3Pg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] add patch to allow qtwebengine build for linux-oe-g++ platform
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
X-List-Received-Date: Mon, 01 Dec 2014 15:30:21 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Mon, Dec 1, 2014 at 1:26 PM, Frieder Schrempf
<frieder.schrempf@online.de> wrote:
> ---
>  .../0001-allow-build-for-linux-oe-g-platform.patch |   25 ++++++++++++++++++++
>  recipes-qt/qt5/qtwebengine_git.bb                  |    1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwebengine/0001-allow-build-for-linux-oe-g-platform.patch
>
> diff --git a/recipes-qt/qt5/qtwebengine/0001-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0001-allow-build-for-linux-oe-g-platform.patch
> new file mode 100644
> index 0000000..05177b1
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0001-allow-build-for-linux-oe-g-platform.patch
> @@ -0,0 +1,25 @@
> +From a84b72bc45024a57ad75df8c10abfa0a9eb7f726 Mon Sep 17 00:00:00 2001
> +From: Frieder Schrempf <frieder.schrempf@online.de>
> +Date: Mon, 1 Dec 2014 14:34:40 +0000
> +Subject: [PATCH 1/1] allow build for linux-oe-g++ platform
> +
> +---
> + tools/qmake/mkspecs/features/functions.prf |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
> +index 491a640..0bb2145 100644
> +--- a/tools/qmake/mkspecs/features/functions.prf
> ++++ b/tools/qmake/mkspecs/features/functions.prf
> +@@ -7,7 +7,7 @@ defineTest(isPlatformSupported) {
> +
> +   linux-g++*:!isGCCVersionSupported():return(false)
> +   !isPythonVersionSupported(): return(false)
> +-  linux-g++*|win32-msvc2013|macx-clang: return(true)
> ++  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang: return(true)
> +   boot2qt: return(true)
> +
> +   warning("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation".)
> +--
> +1.7.9.5
> +
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
> index 84012f8..8225456 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -8,6 +8,7 @@ SRC_URI += " \
>      git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
>      file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
>      file://0002-functions.prf-Try-to-add-_moc-suffix.patch \
> +    file://0001-allow-build-for-linux-oe-g-platform.patch \
>  "
>  SRCREV_qtwebengine = "03a52863226aeb774721db610ba831808b30836a"
>  SRCREV_chromium = "66388297cf2ca42049fb099237134ec33465e2f5"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

