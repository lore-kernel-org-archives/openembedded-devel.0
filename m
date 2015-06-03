Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id E9C1C65C63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 19:26:30 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so119663897igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 12:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=WmPoGYK5E55oSjOT7fw+AUr1NoDGAjUl3DMK6hYo7cM=;
	b=EnHFGsSoO5tcLn0U89QZeXhb9q1aXjayiVnv2a5i/LxEYRp72I1mWwUz2ZyZkDiRtG
	Op4EbIv7parmMpxP1pHNP8yQ/lDF8XN0+oT4RYAjouCmNa3Lqzzis+vfMjwPBBeIVDOF
	WGdXzCCrH37UieCaaSzZa9oftgEGoe0n8W3HvbGwbCtmqfl9UG5ZjayHVp4mUulSfHxP
	b7QRtofloYTEjP55TJ7jI2e6tChFGqZMVC63lBNuvqFZHHK2lkR5ejKc0IfYH/kb5Cly
	0reTXMZjURX+r0L0fdZMNqU1FcNXpPcoVjS8HVTvPFsB343K6uqJ4Y4uEIzDf0mNdV7F
	zbLg==
X-Gm-Message-State: ALoCoQlYOPTPGTqlhN7QOJHihmdgrXNtnxq3zXoQ+xm7s/O/uxD9KOK1eS1FIQ/NZEpJLqYawSls
X-Received: by 10.50.2.3 with SMTP id 3mr29273605igq.34.1433359591645; Wed, 03
	Jun 2015 12:26:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.109.129 with HTTP; Wed, 3 Jun 2015 12:26:11 -0700 (PDT)
In-Reply-To: <20150528071458.GA2383@jama>
References: <CAAzKXngGv=tmUgOnBvAaz37mdc5R8k6YPjaQNc2pYWJF+qAD=Q@mail.gmail.com>
	<34D595E1-BD07-4EA7-A4F7-7E75AB8249A1@gmail.com>
	<CAAzKXngfXaq4B87iQQXY0b-dxkncf8ROsYg4z0TnQFM5wNgxBw@mail.gmail.com>
	<20150528071458.GA2383@jama>
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Wed, 3 Jun 2015 21:26:11 +0200
Message-ID: <CAAzKXnghKgh7=j2sFkgOtbWdRu6Ds50siZMcVbDMTyMd0gZ3pA@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Jun 2015 19:26:34 -0000
Content-Type: text/plain; charset=UTF-8

Updated recipe to fetch Chromium from git.
LASTCHANGE file is now created using the proper
gclient hook.

Change-Id: Ie1790abec002a0dd39c8d0aae3d03f5ebe6f46aa
Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
---
 .../cef3/01_get_svn_version_from_LASTCHANGE.patch  | 32 ----------
 recipes-browser/chromium/cef3_280796.bb            | 73
+++++++++++++++-------
 2 files changed, 51 insertions(+), 54 deletions(-)
 delete mode 100644
recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch

diff --git
a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
deleted file mode 100644
index 9b14429..0000000
--- a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fetch the revision from LASTCHANGE file programmatically
-
-Upstream-Status: Pending
-
-Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff --git a/cef/tools/make_version_header.py
b/cef/tools/make_version_header.py
-index 84d49f5..395c2cf 100644
---- a/cef/tools/make_version_header.py
-+++ b/cef/tools/make_version_header.py
-@@ -64,6 +64,8 @@ def write_svn_header(header, chrome_version,
cef_version, cpp_header_dir):
-       revision = svn.get_revision()
-     elif git.is_checkout('.'):
-       revision = git.get_svn_revision()
-+    elif os.path.isfile("../build/util/LASTCHANGE"):
-+      revision =
open("../build/util/LASTCHANGE").read().split("=")[1].strip()
-     else:
-       raise Exception('Not a valid checkout')
-
-diff --git a/cef/tools/revision.py b/cef/tools/revision.py
-index 1d94602..eb89e3b 100644
---- a/cef/tools/revision.py
-+++ b/cef/tools/revision.py
-@@ -16,6 +16,8 @@ if os.path.exists(os.path.join('.', '.svn')):
-   sys.stdout.write(svn.get_revision())
- elif os.path.exists(os.path.join('.', '.git')):
-   sys.stdout.write(git.get_svn_revision())
-+elif os.path.isfile("../build/util/LASTCHANGE"):
-+  revision = open("../build/util/LASTCHANGE").read().split("=")[1].strip()
- else:
-   raise Exception('Not a valid checkout')
diff --git a/recipes-browser/chromium/cef3_280796.bb
b/recipes-browser/chromium/cef3_280796.bb
index 9a9efe5..a3a4eca 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -7,21 +7,22 @@ RDEPENDS_${PN} += "pango cairo fontconfig pciutils
pulseaudio freetype fontconfi
 SRCREV_tools = "99bcb0e676eb396bcf8e1af3903aa4b578aeeee0"
 SRCREV_cef = "bbad53dfca9f98dddcb31a590410fece0a4f0234"
 SRCREV_egl = "a5b81b7617ba6757802b9b5f8c950034d5f961ec"
-SRCREV_FORMAT = "cef_egl_tools"
+SRCREV_FORMAT = "cef_egl"

-SRC_URI = "
http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${PV}.tar.xz
\
-           git://
github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=src/cef;branch=aura;name=cef
\
-           git://
github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=src/ui/ozone/platform/egl;branch=master;name=egl
\
-           git://
chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools
\
-           file://01_get_svn_version_from_LASTCHANGE.patch \
-   file://cef-simple \
-  "
-SRC_URI[md5sum] = "9efbb50283b731042e62b9bd5e312b2f"
-SRC_URI[sha256sum] =
"f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
+SRC_URI = "git://
chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools
\
+           git://
github.com/kuscsik/chromiumembedded.git;protocol=https;destsuffix=${S}/src/cef;branch=aura;name=cef
\
+           git://
github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=${S}/src/ui/ozone/platform/egl;branch=master;name=egl\
+           file://cef-simple\
+  "

-S = "${WORKDIR}/chromium_rev_${PV}"
+export CHROMIUM_SRC_GIT_URL="https://chromium.googlesource.com/chromium/src
"
+export CHROMIUM_SRC_GIT_COMMIT="e800fe7470fa87dc1ca5b148a7c2c41f603fdcbd"

-do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl SRCREV_tools"
+S = "${WORKDIR}/chromium_rev_${PV}/"
+
+B = "${S}/src/"
+
+do_fetch[vardeps] += "SRCREV_FORMAT SRCREV_cef SRCREV_egl"

 GYP_ARCH_DEFINES_armv7a = " target_arch=arm arm_float_abi=hard"
 GYP_ARCH_DEFINES_i586 = " target_arch=ia32"
@@ -30,22 +31,50 @@ export GYP_GENERATORS="ninja"
 export BUILD_TARGET_ARCH="${TARGET_ARCH}"
 export GYP_DEFINES="${GYP_ARCH_DEFINES}
release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"

+do_fetch_chromium_source_from_git() {
+    cd ${S}
+    export PATH=${WORKDIR}/depot_tools:"$PATH"
+
+    # Note: --deps-file needs to set to .DEPS.git for syncing to old
+    # chromium versions
+    gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=".DEPS.git"
+
+    # Runhooks is disabled. Running the hooks will trigger the
+    # gyp_chromium command replaced with cef_create_projects.sh by
+    # cef3.
+
+    gclient sync -f --nohooks --revision src@${CHROMIUM_SRC_GIT_COMMIT}
+
+    # We need the lastchange hook to generate the LASTCHANGE revision info
+    # file.
+
+    python src/build/util/lastchange.py -o src/build/util/LASTCHANGE
+}
+
+addtask fetch_chromium_source_from_git after do_patch before do_configure
+
 do_configure_append() {
- export PATH=${WORKDIR}/depot_tools:"$PATH"
- # End of LD Workaround
- #-----------------------
- # Configure cef
- #------------------------
- cd cef
- ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth ../
- cd -
+    export PATH=${WORKDIR}/depot_tools:"$PATH"
+    # End of LD Workaround
+    #-----------------------
+    # Configure cef
+    #------------------------
+    cd ${S}/src/cef
+
+    # Fatal linker warnings need to be disalbed to avoid linker issu
+    # with GCC 4.9:
+    #
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095947.html
+
+    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth
../ -Ddisable_fatal_linker_warnings=
+    cd -
 }

 # Workaround to disable qa_configure
 do_qa_configure() {
- echo "do_qa_configure"
+    echo "do_qa_configure"
 }

 do_compile() {
- ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
+    cd ${S}/src
+    ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
 }
-- 
1.9.1


On 28 May 2015 at 09:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, May 28, 2015 at 09:09:24AM +0200, Zoltan Kuscsik wrote:
> > On 28 May 2015 at 02:56, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > +do_fetch_chromium_source_from_git() {
> > > > +  cd ${S}
> > > > +  export PATH=${WORKDIR}/depot_tools:"$PATH"
> > > > +
> > > > +  # Note: --deps-file needs to set to .DEPS.git for syncing to old
> > > > +  # chromium versions
> > > > +  gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=".DEPS.git"
> > > > +
> > > > +  # Runhooks is disabled. Running the hooks will trigger the
> > > > +  # gyp_chromium command replaced with cef_create_projects.sh by
> > > > +  # cef3.
> > > > +
> > > > +  gclient sync -f --nohooks --revision src@
> ${CHROMIUM_SRC_GIT_COMMIT}
> > > > +
> > > > +  # We need the lastchange hook to generate the LASTCHANGE revision
> info
> > > > +  # file.
> > > > +
> > > > +  python src/build/util/lastchange.py -o src/build/util/LASTCHANGE
> > > > +}
> > >
> > >
> > > small nit. formatting is not correct for this shell function.
> > >
> >
> > Z: Could you explain this in more details?
>
> Use 4 spaces for indentation (everywhere).
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

