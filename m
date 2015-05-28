Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 88EE67567D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 07:09:43 +0000 (UTC)
Received: by igbjd9 with SMTP id jd9so17252767igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 00:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=IBi8TaHMRTx1jMF55CWseH75YcAC6p5unPsU5gDoStA=;
	b=hLgdHKsBS0rmjrhnypvilVFgB5B5Os68Kqxf91x4gXmq0NgZiJnOIvnkxkYZFUQq7w
	beh4hLl2Tv4n3BNwxHXzZQ+rg9iIp8mt/+Re0jj3Fj1j55St/5FHhklomvZYcJo1PRjS
	zQ+b3AiZmtj981c9P5bIFQ+Z76SXozqUd44f2L6lU3HzvDgT8Vgg30JRvf4G04E0cnmu
	YuzG30XJsNrR21KITx8lkJZgy6ArQbNvWHy/c+hN9BU8ZP7VbM87JmXWlXGtK3ZbajsX
	eK+3wW+r8upNxiBIAGw2BG8w32fAXS4Tad4UBJIydYn4O7t84uiXny+nooZHRGney/bW
	Wh/g==
X-Gm-Message-State: ALoCoQnfAD4qperqL8TzNPnKjwcAzSj4Hh3Gh5u4H0T1/3uxr+239WXMyqBG5wrHqkARnhdDQjEo
X-Received: by 10.50.61.229 with SMTP id t5mr9444622igr.34.1432796984536; Thu,
	28 May 2015 00:09:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.20.5 with HTTP; Thu, 28 May 2015 00:09:24 -0700 (PDT)
In-Reply-To: <34D595E1-BD07-4EA7-A4F7-7E75AB8249A1@gmail.com>
References: <CAAzKXngGv=tmUgOnBvAaz37mdc5R8k6YPjaQNc2pYWJF+qAD=Q@mail.gmail.com>
	<34D595E1-BD07-4EA7-A4F7-7E75AB8249A1@gmail.com>
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Thu, 28 May 2015 09:09:24 +0200
Message-ID: <CAAzKXngfXaq4B87iQQXY0b-dxkncf8ROsYg4z0TnQFM5wNgxBw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser] [PATCH 2/2] chromium, cef: fetch chromium source from git
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
X-List-Received-Date: Thu, 28 May 2015 07:09:45 -0000
Content-Type: text/plain; charset=UTF-8

On 28 May 2015 at 02:56, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On May 27, 2015, at 10:37 AM, Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> wrote:
> >
> > Updated recipe to fetch Chromium from git.
> > LASTCHANGE file is now created using the proper
> > gclient hook.
> >
> > Change-Id: Ie1790abec002a0dd39c8d0aae3d03f5ebe6f46aa
> > Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> > ---
> > .../cef3/01_get_svn_version_from_LASTCHANGE.patch  | 32 ------------
> > recipes-browser/chromium/cef3_280796.bb            | 57
> > ++++++++++++++++------
> > 2 files changed, 43 insertions(+), 46 deletions(-)
> > delete mode 100644
> > recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> >
> > diff --git
> > a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> > b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> > deleted file mode 100644
> > index 9b14429..0000000
> > ---
> a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -Fetch the revision from LASTCHANGE file programmatically
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > -diff --git a/cef/tools/make_version_header.py
> > b/cef/tools/make_version_header.py
> > -index 84d49f5..395c2cf 100644
> > ---- a/cef/tools/make_version_header.py
> > -+++ b/cef/tools/make_version_header.py
> > -@@ -64,6 +64,8 @@ def write_svn_header(header, chrome_version,
> > cef_version, cpp_header_dir):
> > -       revision = svn.get_revision()
> > -     elif git.is_checkout('.'):
> > -       revision = git.get_svn_revision()
> > -+    elif os.path.isfile("../build/util/LASTCHANGE"):
> > -+      revision =
> > open("../build/util/LASTCHANGE").read().split("=")[1].strip()
> > -     else:
> > -       raise Exception('Not a valid checkout')
> > -
> > -diff --git a/cef/tools/revision.py b/cef/tools/revision.py
> > -index 1d94602..eb89e3b 100644
> > ---- a/cef/tools/revision.py
> > -+++ b/cef/tools/revision.py
> > -@@ -16,6 +16,8 @@ if os.path.exists(os.path.join('.', '.svn')):
> > -   sys.stdout.write(svn.get_revision())
> > - elif os.path.exists(os.path.join('.', '.git')):
> > -   sys.stdout.write(git.get_svn_revision())
> > -+elif os.path.isfile("../build/util/LASTCHANGE"):
> > -+  revision =
> open("../build/util/LASTCHANGE").read().split("=")[1].strip()
> > - else:
> > -   raise Exception('Not a valid checkout')
> > diff --git a/recipes-browser/chromium/cef3_280796.bb
> > b/recipes-browser/chromium/cef3_280796.bb
> > index 9a9efe5..806a4ac 100644
> > --- a/recipes-browser/chromium/cef3_280796.bb
> > +++ b/recipes-browser/chromium/cef3_280796.bb
> > @@ -7,21 +7,22 @@ RDEPENDS_${PN} += "pango cairo fontconfig pciutils
> > pulseaudio freetype fontconfi
> > SRCREV_tools = "99bcb0e676eb396bcf8e1af3903aa4b578aeeee0"
> > SRCREV_cef = "bbad53dfca9f98dddcb31a590410fece0a4f0234"
> > SRCREV_egl = "a5b81b7617ba6757802b9b5f8c950034d5f961ec"
> > -SRCREV_FORMAT = "cef_egl_tools"
> > +SRCREV_FORMAT = "cef_egl"
> >
> > -SRC_URI = "
> >
> http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${PV}.tar.xz
> > \
> > -           git://
> >
> github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=src/cef;branch=aura;name=cef
> > \
> > -           git://
> >
> github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=src/ui/ozone/platform/egl;branch=master;name=egl
> > \
> > -           git://
> >
> chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools
> > \
> > -           file://01_get_svn_version_from_LASTCHANGE.patch \
> > -          file://cef-simple \
> > -         "
> > -SRC_URI[md5sum] = "9efbb50283b731042e62b9bd5e312b2f"
> > -SRC_URI[sha256sum] =
> > "f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
> > +SRC_URI = "git://
> >
> chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools
> > \
> > +           git://
> >
> github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=${S}/src/cef;branch=aura;name=cef
> <http://github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=$%7BS%7D/src/cef;branch=aura;name=cef>
> > \
> > +           git://
> >
> github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=${S}/src/ui/ozone/platform/egl;branch=master;name=egl\
> <http://github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=$%7BS%7D/src/ui/ozone/platform/egl;branch=master;name=egl%5C>
> > +           file://cef-simple\
> > +  "
> >
> > -S = "${WORKDIR}/chromium_rev_${PV}"
> > +export CHROMIUM_SRC_GIT_URL="
> https://chromium.googlesource.com/chromium/src
> > "
> > +export
> CHROMIUM_SRC_GIT_COMMIT="e800fe7470fa87dc1ca5b148a7c2c41f603fdcbd"
> >
> > -do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl SRCREV_tools"
> > +S = "${WORKDIR}/chromium_rev_${PV}/"
> > +
> > +B = "${S}/src/"
> > +
> > +do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl"
> >
> > GYP_ARCH_DEFINES_armv7a = " target_arch=arm arm_float_abi=hard"
> > GYP_ARCH_DEFINES_i586 = " target_arch=ia32"
> > @@ -30,14 +31,41 @@ export GYP_GENERATORS="ninja"
> > export BUILD_TARGET_ARCH="${TARGET_ARCH}"
> > export GYP_DEFINES="${GYP_ARCH_DEFINES}
> > release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
> >
> > +do_fetch_chromium_source_from_git() {
> > +  cd ${S}
> > +  export PATH=${WORKDIR}/depot_tools:"$PATH"
> > +
> > +  # Note: --deps-file needs to set to .DEPS.git for syncing to old
> > +  # chromium versions
> > +  gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=".DEPS.git"
> > +
> > +  # Runhooks is disabled. Running the hooks will trigger the
> > +  # gyp_chromium command replaced with cef_create_projects.sh by
> > +  # cef3.
> > +
> > +  gclient sync -f --nohooks --revision src@${CHROMIUM_SRC_GIT_COMMIT}
> > +
> > +  # We need the lastchange hook to generate the LASTCHANGE revision info
> > +  # file.
> > +
> > +  python src/build/util/lastchange.py -o src/build/util/LASTCHANGE
> > +}
>
>
> small nit. formatting is not correct for this shell function.
>

Z: Could you explain this in more details?


> > +
> > +addtask fetch_chromium_source_from_git after do_patch before
> do_configure
> > +
>
>
> so we will never patch chromium sources ? if we have to how will we do it ?
>
> Z: CEF is always built on clean chromium checkouts. CEF patches on
Chromium are applied using cef's internal patch script. Here is an exampla:

https://github.com/kuscsik/chromiumembedded/commit/da9609deab1345fc480667ce04ef670f4c94ef62


>
> > do_configure_append() {
> >        export PATH=${WORKDIR}/depot_tools:"$PATH"
> >        # End of LD Workaround
> >        #-----------------------
> >        # Configure cef
> >        #------------------------
> > -       cd cef
> > -       ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi
> --depth
> > ../
> > +       cd ${S}/src/cef
> > +
> > +  # Fatal linker warnings need to be disalbed to avoid linker issu
> > +  # with GCC 4.9:
> > +  #
> >
> http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095947.html
> > +
> > +       ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi
> --depth
> > ../ -Ddisable_fatal_linker_warnings=
> >        cd -
> > }
> >
> > @@ -47,5 +75,6 @@ do_qa_configure() {
> > }
> >
> > do_compile() {
> > + cd ${S}/src
>
> formatting is inconsistent
>
> Z: Will fix

> >        ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
> > }
> > --
> > 1.9.1
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

