Return-Path: <psidhu@gateworks.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0616FF80
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 22:22:02 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p65so120685734wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 15:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gateworks-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iPnNNYLXovCeiwTKurgM3MvxhpLysZx+Xe1nq4H+gGY=;
	b=1HLM++8W+fi3izYrHBxvIryvKrCUQr1Y4EyvxLfrUogCJwCaT2+4RWhaOccANEwXJU
	0DVbnqWEwxaCj518pym7QCyW/fHKTGxMraH7HkgXC+qHj5/M/DGnSNqIiMEGJFoNegWC
	xymCvjRDsSEqnk+L0x3NCNv3ZhCij9q6mLq1U5+prwqi2dnxcjCKcB7YTGUrCJ56AmKH
	g4pV+B/WBzYSqlH0TsemeAK10uyYZ17BDsiLmjohGL1bgz/mK+XgEtCp6eX7PZCWbAry
	HzRh1RN+iSjLZJ2HoopggiPCddI3bv/4VwmrpbQK4yU/KamE8MQaK/BdVtTreH/F5Eky
	P58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iPnNNYLXovCeiwTKurgM3MvxhpLysZx+Xe1nq4H+gGY=;
	b=QwbOE+9oANc8KVfX3rs62DJN1sZ47SLpkvpFEy+zkWSYEFwoJAUFLOXL7hvxybqLDS
	TWGa9oh9cX6uBagD8JGQ4LUYXzmka8HIVavLz6rJtHwQkaaqWUSrvc7LF/VG3/yJYLu7
	MZdFqOQEAMwkexHZ7jBFJN9WgOdut4hoyjAfU9LHA1/jm6XgnRqwS8dkyoGmM8vNLASf
	Za4LXHNF7V37Wrt7Mosd4Hd0QJl+ZcOtwmqc4qeQPYv5BBAqg4+Ol6AQtAeTLbwe11kA
	NxG9LyYi3NEjJ63mKq4KWg5bz4iywPabZqJqWt3n0nYOVy7hx/IkRBwysMRgU/aK0YyG
	StLg==
X-Gm-Message-State: AD7BkJLnWuZr/hTN4GTfUBYoS5jWCqzmfGviH39HE1g4iPqFvFnfQNH3MlH9Jz8VEsDzPIhs/ReSJzx1VFXeYQ==
X-Received: by 10.28.18.194 with SMTP id 185mr21286756wms.14.1457994122858;
	Mon, 14 Mar 2016 15:22:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.234.38 with HTTP; Mon, 14 Mar 2016 15:21:33 -0700 (PDT)
In-Reply-To: <56E07715.8060801@gmail.com>
References: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
	<20160309191156.GH2542@jama> <56E07715.8060801@gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Mon, 14 Mar 2016 15:21:33 -0700
Message-ID: <CAD1M062aSMPUfMzCKZ2+8uZcV0q77sm3WHwvQexY2x5uO9hV+g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][jethro][PATCH][V2] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Mon, 14 Mar 2016 22:22:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed, Mar 9, 2016 at 11:18 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 03/09/2016 11:11 AM, Martin Jansa wrote:
> > On Wed, Mar 09, 2016 at 09:06:57AM -0800, Armin Kuster wrote:
> >> From: Armin Kuster <akuster@mvista.com>
> >>
> >> missed using "-D"  for OPENSSL_NO_SSL2 swig_features.
> >
> > fido version:
> > http://patchwork.openembedded.org/patch/117291/
> > needed -D as well, right?
>
> yes.
>
>
> >
> > I've pushed both to fido-next and jethro-next

When will this be merged into fido/jethro? I've been running into this
build breakage for about a week now and if I patch it myself, I'll
only run into a conflict again later, causing more build issues.

Thanks,
- Pushpal

> thanks
> -armin
> >
> >>
> >> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
> >>
> >> disable using SSLv2_method if not supported in openssl. This is now the case
> >> with the advent of CVE-2016-0800
> >>
> >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> ---
> >>  ...y_build_with_SSLv2_when_it_is_not_available.patch | 20 ++++++++++++++++++++
> >>  .../python/python-m2crypto_0.21.1.bb                 |  4 +++-
> >>  2 files changed, 23 insertions(+), 1 deletion(-)
> >>  create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
> >> new file mode 100644
> >> index 0000000..526c23f
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
> >> @@ -0,0 +1,20 @@
> >> +Upstream-Status: Backport
> >> +https://gitlab.com/m2crypto/m2crypto/commit/ac01b38302474920288c1a9eb63fd35fa8d1db5b
> >> +
> >> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> +
> >> +Index: M2Crypto-0.21.1/SWIG/_ssl.i
> >> +===================================================================
> >> +--- M2Crypto-0.21.1.orig/SWIG/_ssl.i
> >> ++++ M2Crypto-0.21.1/SWIG/_ssl.i
> >> +@@ -48,8 +48,10 @@ extern const char *SSL_alert_desc_string
> >> + %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
> >> + extern const char *SSL_alert_desc_string_long(int);
> >> +
> >> ++#ifndef OPENSSL_NO_SSL2
> >> + %rename(sslv2_method) SSLv2_method;
> >> + extern SSL_METHOD *SSLv2_method(void);
> >> ++#endif
> >> + %rename(sslv3_method) SSLv3_method;
> >> + extern SSL_METHOD *SSLv3_method(void);
> >> + %rename(sslv23_method) SSLv23_method;
> >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> >> index ff6203f..9daea5e 100644
> >> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> >> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> >> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
> >>
> >>  SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
> >>             file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
> >> -           file://0001-M2Crypto-Error-fix.patch"
> >> +           file://0001-M2Crypto-Error-fix.patch \
> >> +           file://dont_try_build_with_SSLv2_when_it_is_not_available.patch"
> >>
> >>  SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
> >>  SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
> >> @@ -19,6 +20,7 @@ inherit setuptools
> >>
> >>  SWIG_FEATURES_x86-64 = "-D__x86_64__"
> >>  SWIG_FEATURES ?= ""
> >> +SWIG_FEATURES += "-DOPENSSL_NO_SSL2"
> >>  export SWIG_FEATURES
> >>
> >>  # Get around a problem with swig, but only if the
> >> --
> >> 2.3.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

