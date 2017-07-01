Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id A2DD57826D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Jul 2017 08:03:31 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id a12so1830172ywh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jul 2017 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wcOej6eWgzUuPOXcfthM9JzwL+eS2QErlLMn9QlBzJA=;
	b=AtbWfAX7YWmGtudVP9DRHEFd+S7w5cCGzxPoyj2RROFtGptnWduyrp/4EQGZQWK7OS
	qkZlHmgX5JV1ymVD97tM3njJk+8GMeshjzbj1RRPZ+/rCEuNL58SrzJ/cBm4HieqUbFc
	QkA2Rh/yDaDJ4kvamsbmLffrTJyA1HNd1fVhjRp2qNn+U+as24VS1VXJnelqYo9CmRTX
	1+o9WSZq04NJoJrLkG9aSOCj5dC9UyDsz1Zu8GszUjTEDU4QIMgncvsXPW4T8ixN9pPe
	ZEtZA2Bs48Bz9NSuC0AB+Pvy/4yJWz7Rz0LeRhfdhqsqgWs4Kst09TRHNy1g515BlrcF
	4hyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wcOej6eWgzUuPOXcfthM9JzwL+eS2QErlLMn9QlBzJA=;
	b=auIntZYtLCfi0h453xP1wk0gYsFvEIII+Z0vBGOmbedd2yh7KC+rYhMR5hrFxUOsTF
	1GDoxuFNa4SAsTy+XxH+Wb4BwbmiaZrjh9wlt3tQBBsDHv8iZn6WyJF5oz0P61/2kDCT
	ntjVZrNnu1GKslP6l/z006jXQAlAjYX2fx997DMT2Ur/b5MlKdaK+ESk0FMhKO8nj/YV
	OtoUN/96cTkJiQ5X8kQLhBgz/kxq3fWWmQL+9tiXKLbH31pdbdcA6kYt3Iwzf2EqifZ6
	Daw3qLgpevi+1Wu9rrk8lKVPdVVtiiwIywBZ500oyTl7bFrm02zMxy4XnFVmyfsjZsq+
	UqcQ==
X-Gm-Message-State: AKS2vOy1xrA3lmmx6eiQ/MzMgHIe1ROCuKn/9tohQZz9YM1wb6W1+Ei+
	or1UCtSANwTWPGz+1AJeOR/9evUtpQ==
X-Received: by 10.129.114.137 with SMTP id n131mr19259845ywc.193.1498896212383;
	Sat, 01 Jul 2017 01:03:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Sat, 1 Jul 2017 01:03:31 -0700 (PDT)
In-Reply-To: <20170630085748.9189-1-ricardo.ribalda@gmail.com>
References: <20170630085748.9189-1-ricardo.ribalda@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 1 Jul 2017 10:03:31 +0200
Message-ID: <CA+chaQcVdDKFJv+wiVVpi+Y2avFMWTXjm8uFVpg0YK8DbCosNg@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meson: Port pkgconfig-native patch to 0.40.1
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
X-List-Received-Date: Sat, 01 Jul 2017 08:03:32 -0000
Content-Type: text/plain; charset="UTF-8"

Doesn't apply on top of Ross's patches, please check if it's still needed
and resend after rebasing on recent master.

On Fri, Jun 30, 2017 at 10:57 AM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> The update to 0.40.1 did not add this patch required for qt builds.
>
> Fixes: 163abe723deb ("meson: update Meson devtool to 0.40.1")
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  .../meson/meson/native_bindir.patch                | 36
> +++++++++++++++-------
>  meta-oe/recipes-devtools/meson/meson_0.40.1.bb     |  1 +
>  2 files changed, 26 insertions(+), 11 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
> b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
> index 53eeff7b688b..bd99f760ecca 100644
> --- a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
> +++ b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
> @@ -1,8 +1,8 @@
>  diff --git a/mesonbuild/dependencies.py b/mesonbuild/dependencies.py
> -index da73a57b7ecd..22100f69c580 100644
> +index 04a22f985941..3e33bc4a79e7 100644
>  --- a/mesonbuild/dependencies.py
>  +++ b/mesonbuild/dependencies.py
> -@@ -65,7 +65,7 @@ class Dependency():
> +@@ -95,7 +95,7 @@ class Dependency:
>       def need_threads(self):
>           return False
>
> @@ -11,7 +11,7 @@ index da73a57b7ecd..22100f69c580 100644
>           raise MesonException('Tried to get a pkg-config variable from a
> non-pkgconfig dependency.')
>
>   class InternalDependency(Dependency):
> -@@ -177,8 +177,12 @@ class PkgConfigDependency(Dependency):
> +@@ -224,8 +224,12 @@ class PkgConfigDependency(Dependency):
>           return s.format(self.__class__.__name__, self.name,
> self.is_found,
>                           self.version_reqs)
>
> @@ -23,10 +23,10 @@ index da73a57b7ecd..22100f69c580 100644
>  +        else:
>  +            pkgbin = [self.pkgbin]
>  +        p, out = Popen_safe(pkgbin + args, env=os.environ)[0:2]
> -         return (p.returncode, out.strip())
> +         return p.returncode, out.strip()
>
>       def _set_cargs(self):
> -@@ -212,8 +216,8 @@ class PkgConfigDependency(Dependency):
> +@@ -259,8 +263,8 @@ class PkgConfigDependency(Dependency):
>                   self.is_libtool = True
>               self.libs.append(lib)
>
> @@ -37,12 +37,8 @@ index da73a57b7ecd..22100f69c580 100644
>           variable = ''
>           if ret != 0:
>               if self.required:
> -@@ -933,10 +937,10 @@ class QtBaseDependency(Dependency):
> -             corekwargs = {'required': 'false', 'silent': 'true'}
> -             core = PkgConfigDependency(self.qtpkgname + 'Core', env,
> corekwargs)
> -         # Used by self.compilers_detect()
> --        self.bindir = core.get_pkgconfig_variable('host_bins')
> -+        self.bindir = core.get_pkgconfig_variable('host_bins',
> use_native=True)
> +@@ -1091,7 +1095,7 @@ class QtBaseDependency(Dependency):
> +         self.bindir = self.get_pkgconfig_host_bins(core)
>           if not self.bindir:
>               # If exec_prefix is not defined, the pkg-config file is
> broken
>  -            prefix = core.get_pkgconfig_variable('exec_prefix')
> @@ -50,3 +46,21 @@ index da73a57b7ecd..22100f69c580 100644
>               if prefix:
>                   self.bindir = os.path.join(prefix, 'bin')
>
> +@@ -1202,7 +1206,7 @@ class Qt5Dependency(QtBaseDependency):
> +         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
> +
> +     def get_pkgconfig_host_bins(self, core):
> +-        return core.get_pkgconfig_variable('host_bins')
> ++        return core.get_pkgconfig_variable('host_bins', use_native=True)
> +
> + class Qt4Dependency(QtBaseDependency):
> +     def __init__(self, env, kwargs):
> +@@ -1216,7 +1220,7 @@ class Qt4Dependency(QtBaseDependency):
> +         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
> +         for application in applications:
> +             try:
> +-                return os.path.dirname(core.get_pkgconfig_variable('%s_location'
> % application))
> ++                return os.path.dirname(core.get_pkgconfig_variable('%s_location'
> % application, use_native=True))
> +             except MesonException:
> +                 pass
> +
> diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> index a2c5e4d39719..fd96b4238eea 100644
> --- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> +++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 3b83ef96387f14655fc854ddc3c6bd57"
>
>  SRC_URI = " \
>      git://github.com/mesonbuild/meson.git \
> +    file://native_bindir.patch \
>  "
>
>  SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

