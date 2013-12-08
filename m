Return-Path: <ashcharles@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id CAAC061566
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Dec 2013 09:55:18 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id ij19so582558vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2013 01:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uo4khPp789TZt0ZXA3vnRJDu4B/5c2lCW/AqxxiqtQo=;
	b=WgZHfLnMQKbCvTk15nnIbLkK7oWJZAnacGaxx9qSl2411Zk2u0VI4I5lIDYDrfXXNq
	PMP0p7CivfqOyqPJa3ckJcTkReD3UhhpPW/Gku1W0CllrbI3ugScIg7fEumppRJGOwzD
	DDbx2N8szmcuB3IdOET09A41q8swsZrNZcubfXuMqm66N3zKiqlttVZjzXd0gZZnTfqo
	bXJYorUqkbPPzIy+wbNosor0YzP39G9FiP0UQtDYE4j6mnGU2S2CUXDvrQoDJXwq3glI
	Q2/UFJkDuo1dQHJ7ISdSdlhNqyy0QsvdzFbKlOKAstVvz3ssqdBtIE5UNhv+XL7aLTKu
	FCZQ==
X-Received: by 10.220.48.194 with SMTP id s2mr735956vcf.43.1386496517525; Sun,
	08 Dec 2013 01:55:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.11.230 with HTTP; Sun, 8 Dec 2013 01:54:47 -0800 (PST)
In-Reply-To: <1386455381-40913-1-git-send-email-ulf@emagii.com>
References: <1386455381-40913-1-git-send-email-ulf@emagii.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Sun, 8 Dec 2013 10:54:47 +0100
Message-ID: <CAK8F28kgXNypdjBPVoZrfn4ovZpY7Wfx8s_Qzg6qkZDtubYjAw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] xfconfig: use sysroot and target perl
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
X-List-Received-Date: Sun, 08 Dec 2013 09:55:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Thanks Ulf.

I just tried this on my dora branch instead of my disable-perl
bbappend and it worked for me.

Tested-by: Ash Charles <ashcharles@gmail.com>

--Ash

On Sat, Dec 7, 2013 at 11:29 PM, Ulf Samuelsson <ulf@emagii.com> wrote:
> xfconf-4.10.0 does not use OE sysroot as is.
> --with-sysroot=yes
> will make configure run CC --print-sysroot
> and use that.
>
> When searching the PATH for perl, no target perl is found,
> since PATH does not contain any reference.
> Instead native perl is found, and if certain perl packages
> are installed on the host machine, the xfconf perl support
> is enabled which may cause the build to fail on 64 bit hosts.
> If the perl packages are not installed on the host, then
> perl support in xfconf is disabled, and the xfconf build
> will succeed, even on 64 bit hosts.
>
> If native perl is found, and the perl packages are available
> on the host, the perl support is enabled.
>
> Since native perl is used, the native linker is used to link the
> resulting *target* code.
>
> The perl support requires some libraries, which are built for the target.
> If the host is 64 bit (x86_64) and the target is 32 bit (ARM?),
> there is a mismatch which is detected by the linker,
> and the libraries found are rejected.
>
> If the host does not have the correct libraries,
> then the xfconf build fails.
> If the host has the correct libraries, then the linker will try
> to link host libraries with the target application.
>
> The patch will define PERL as the target perl.
> This means that configure will look for the required perl
> packages in the target sysroot, instead of in the native filesystem.
>
> The patch has been tested in Angstrom master, which does not
> build the required perl packages, and thus perl support
> in xfconf is disabled, and the build succeeds.
>
> A simpler way to do this, proposed by Charles Ash <ashcharles@gmail.com>
> is to simply disable the perl-support in xfconf.
> This patch will be better, if ever the support for the needed
> perl packages is added to the OpenEmbedded/Angstrom build.
>
>
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> index 4ea2b88..6d5bf57 100644
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> @@ -2,10 +2,14 @@ DESCRIPTION = "Xfce configuration daemon and utilities"
>  SECTION = "x11/wm"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -DEPENDS = "dbus-glib libxfce4util perl-native"
> +DEPENDS = "dbus-glib libxfce4util perl"
> +PR="r1"
>
>  inherit xfce
>
> +EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
> +EXTRA_OECONF += "--with-sysroot=yes"
> +
>  SRC_URI += "file://0001-Simplify-checks.patch"
>  SRC_URI[md5sum] = "4ed48150a03fb5f42b455494307b7f28"
>  SRC_URI[sha256sum] = "175219a441cc7d0f210bbd1a3b0abba41598627cd9db27235811400c3e100576"
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

