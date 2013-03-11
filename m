Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UF2yk-0008K9-KE
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 14:41:28 +0100
Received: by mail-ob0-f182.google.com with SMTP id va7so3246456obc.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2013 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=gG4ls6CyV0RTxnrqnYE7bw37dpIFdx+QdVstxD+A3/s=;
	b=I9c4afSPjx8BPB0+WAfFa7cNhplxjMml77ylTTbmqEPApzA9wB6fJuJD3MSaBDV4uX
	xCkG6ZbwpAWPmPSDBfbN2L3Jn83cHus5+39IMisEWHXtsInTh3gZPYO7nDXE1b+hrddb
	psAhCb6cnVyO0zoAJQAj6Rcz3I+mHL6uOtlKVLBRnacsOGpeOHPs7uBM5Xs1mB8asSmL
	NOV3/mMIjSZAK1gMFYpfcdNcZbiZDN7cdFguF3wpqWAs0JzdUBaP32YciGB8mTzz0XEV
	eKex7DnH7ALtjxF7HHUW4MDYrV+YsVdl40NAKBdwqY7IfQh95SNxmB8jwgH6UBlDiCYe
	uR7g==
MIME-Version: 1.0
X-Received: by 10.60.13.1 with SMTP id d1mr8721151oec.55.1363008287897; Mon,
	11 Mar 2013 06:24:47 -0700 (PDT)
Received: by 10.60.76.199 with HTTP; Mon, 11 Mar 2013 06:24:47 -0700 (PDT)
In-Reply-To: <1362670329-16891-1-git-send-email-s.stirtzel@googlemail.com>
References: <1362670329-16891-1-git-send-email-s.stirtzel@googlemail.com>
Date: Mon, 11 Mar 2013 14:24:47 +0100
Message-ID: <CAGiJk9c9MD_GXju=NWjsO5pEaOnvi0s16hp2PmM+FOP0h5YSNw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] maliit-framework: fix for Qt based applications
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
X-List-Received-Date: Mon, 11 Mar 2013 13:41:33 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/7 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Previously Qt based applications did not trigger the Maliit virtual keyboard
> The Qt inputmethod plugin could not be loaded because it did not link to libmaliit-1.0.so
> It is also necessary to set the Qt default input method to "Maliit"
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  ...k-to-libmaliit-1-0-in-inputcontext-plugin.patch |   23 ++++++++++++++++++++
>  .../recipes-support/maliit/maliit-framework_git.bb |   13 +++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
>
> diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch b/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
> new file mode 100644
> index 0000000..749ddbe
> --- /dev/null
> +++ b/meta-oe/recipes-support/maliit/maliit-framework/0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch
> @@ -0,0 +1,23 @@
> +From cc33efdedbec9e9a55e9a0c6756516fd84d42e53 Mon Sep 17 00:00:00 2001
> +From: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +Date: Fri, 1 Mar 2013 11:31:41 +0100
> +Subject: [PATCH] Link to libmaliit-1,0 in inputcontext plugin
> +
> +Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> +---
> + .../input-context-plugin/input-context-plugin.pro  |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/input-context/input-context-plugin/input-context-plugin.pro b/input-context/input-context-plugin/input-context-plugin.pro
> +index eefbe93..296e2fa 100644
> +--- a/input-context/input-context-plugin/input-context-plugin.pro
> ++++ b/input-context/input-context-plugin/input-context-plugin.pro
> +@@ -15,3 +15,5 @@ CONFIG += plugin
> +
> + INSTALLS    += target
> + target.path += $$QT_IM_PLUGIN_PATH
> ++
> ++LIBS += -L../../lib -l"maliit-1.0"
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> index a164e78..11d06aa 100644
> --- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> +++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> @@ -10,6 +10,7 @@ inherit autotools qt4x11 gtk-immodules-cache
>  SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
>      file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
>      file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
> +    file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
>      "
>
>  SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
> @@ -65,4 +66,16 @@ do_install_append() {
>      sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf
>  }
>
> +pkg_postinst_${PN} () {
> +#!/bin/sh
> +#can run online and offline
> +echo "EXPORT QT_IM_MODULE=Maliit" >> $D/etc/profile
> +}
> +
> +pkg_postrm_${PN} () {
> +#!/bin/sh
> +#can run online and offline
> +sed -i "/EXPORT QT_IM_MODULE=Maliit/d" $D/etc/profile
^^^^^
This is a silly mistake, it should be export instead of EXPORT.
But more important it seems that no user is sourcing /etc/profile,
instead they only load their user profiles...

I'll send another patch after this is resolved.

> +}
> +
>  S= "${WORKDIR}/git"



-- 
Regards
Samuel


