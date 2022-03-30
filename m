Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BDCC433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 23:02:14 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.554.1648681333557667629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 16:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b22vGZO+;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id hu11so18363950qvb.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 16:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9j3O23tfjAWZZQSChhRMabQVTV34z3JHszIQ/IK8K34=;
        b=b22vGZO+vAwDAMEDBsVNaY3jB1U74WYWK7VupvPOXcpU6EKPUD0xvqNQ/peJpgYI6z
         un7a0ll3XvhQp9hQWFnMY2A+/lyPTd1FQ2GcG+hhO2BeYUPyjtL1z2XuN5tDpzDT2l7q
         PKn7eZyp7okMNBc1d5A2R7oX3c1glskanCWoxr6xihxSPz2/Z+qERWXsjma5032+uOJx
         G+vghGTh9Kkx0cEcHG+i7h5mQOSg/CJqEp5mL3XQYLrJuYef06Vg1N+E0uZBqoNc7+2g
         XE0vIHgOp9peKGsmpeknK9b4dE1GI+5WY4aOCtmFFuWhkVc81dJTOODQieUpN4Tpoz2a
         nNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9j3O23tfjAWZZQSChhRMabQVTV34z3JHszIQ/IK8K34=;
        b=RWyUVt8ecyFeVxvg/qKllfF5C4NAFFh26B0ZPOrRuXFEe+V4NJbJWY6sl6UoigkcWP
         EYZkFWlhk/Cz+Q/wRwKbVJnWW22G22F5HblC5dST3NH5ahgycmmO+9h0XFcq82qJ5aS4
         q1lJKSXIjzh2TihuvMhwKG9aAT1K+hMM1NiQSzc3hDGT2c6vFRw43VJQxocugEnbvbga
         aUqtgi6tzoifaIDGkuWYN6v5h9hZo2/paIO1S3Fnf0JnPM0J/XnLTZ2zR7nnr/EQKDlj
         Xy901r5YY2iFiPkYk04zADPVHGvnZNy4bD9h17q7tPdoy4+YvrWaKJ/oDJFN5fkPRupy
         tuxw==
X-Gm-Message-State: AOAM531Dh67wn4SpiEmd9VaCVL+ujGZve0Tr0ymO0JOmdpyM7wYPaF+p
	i+TbbcYHU3LgntqaRxLVTKpPyWe51TnRe2BJ//JIxceVQy4=
X-Google-Smtp-Source: 
 ABdhPJy1oN+OFDe3O1PQyAn1qmAG/O6Y2FWkQEytS7XRW+KNHRjZk4EZF4rtEBOJzMEvcL5xB6GX9ScqKlPVQ0R7fzk=
X-Received: by 2002:ad4:5aa3:0:b0:443:9ba7:3f27 with SMTP id
 u3-20020ad45aa3000000b004439ba73f27mr359749qvg.63.1648681332410; Wed, 30 Mar
 2022 16:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220330093933.12701-1-kai.kang@windriver.com>
 <20220330093933.12701-2-kai.kang@windriver.com>
In-Reply-To: <20220330093933.12701-2-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Mar 2022 16:01:46 -0700
Message-ID: 
 <CAMKF1srd9koWkraUFQs4jzdayOFPyAUYB_L_k69R+3avSd9x7w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-wxgtk4: add recipe
To: kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 23:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96271

this fails on mips https://errors.yoctoproject.org/Errors/Details/653726/

On Wed, Mar 30, 2022 at 2:39 AM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Add recipe for python3-wxgtk4 which is a python3 interface to the
> wxWidgets Cross-platform C++ GUI toolkit.
>
> Add patches to
> * add back build options for oe
> * fixup build scripts for cross compile
> * fix sip oevrride functions compile errors
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../add-back-option-build-base.patch          | 22 ++++++++
>  .../sip-fix-override-functions.patch          | 35 ++++++++++++
>  .../wxgtk-fixup-build-scripts.patch           | 53 +++++++++++++++++++
>  .../python3-wxgtk4/python3-wxgtk4_4.1.1.bb    | 32 +++++++++++
>  4 files changed, 142 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
>  create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
>  create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
>  create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
>
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
> new file mode 100644
> index 000000000..a46f3f870
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/add-back-option-build-base.patch
> @@ -0,0 +1,22 @@
> +Add back default user options for cross build.
> +
> +Upstream-Status: Pending [oe specific]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index a215da7..dccfeb3 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -105,7 +105,7 @@ class wx_build(orig_build):
> +     Delegate to build.py for doing the actual build, (including wxWidgets)
> +     instead of letting distutils do it all.
> +     """
> +-    user_options = [
> ++    user_options = orig_build.user_options + [
> +         ('skip-build', None, 'skip building the C/C++ code (assumes it has already been done)'),
> +         ]
> +     boolean_options = ['skip-build']
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
> new file mode 100644
> index 000000000..51b9a462b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
> @@ -0,0 +1,35 @@
> +It fails to compile with errors:
> +
> +| ../../../../sip/cpp/sip_gridwxGridEvent.cpp:35:9: error: 'int sipwxGridEvent::GetRow()'
> +  marked 'override', but does not override
> +|    35 |     int GetRow() SIP_OVERRIDE;
> +|       |         ^~~~~~
> +| ../../../../sip/cpp/sip_gridwxGridEvent.cpp:36:9: error: 'int sipwxGridEvent::GetCol()'
> +  marked 'override', but does not over      ride
> +|    36 |     int GetCol() SIP_OVERRIDE;
> +|       |         ^~~~~~
> +
> +Make these functions non-override.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + sip/cpp/sip_gridwxGridEvent.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/sip/cpp/sip_gridwxGridEvent.cpp b/sip/cpp/sip_gridwxGridEvent.cpp
> +index 0830b677..314aec94 100644
> +--- a/sip/cpp/sip_gridwxGridEvent.cpp
> ++++ b/sip/cpp/sip_gridwxGridEvent.cpp
> +@@ -32,8 +32,8 @@ public:
> +      * this class.
> +      */
> + protected:
> +-    int GetRow() SIP_OVERRIDE;
> +-    int GetCol() SIP_OVERRIDE;
> ++    int GetRow() ;
> ++    int GetCol() ;
> +      ::wxEvent* Clone() const SIP_OVERRIDE;
> +      ::wxEventCategory GetEventCategory() const SIP_OVERRIDE;
> +
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
> new file mode 100644
> index 000000000..0d65ebb59
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/wxgtk-fixup-build-scripts.patch
> @@ -0,0 +1,53 @@
> +Fix issues in build scripts:
> +
> +* remove hardcode lib path from buildtools/config.py which is not suitable for
> +  cross build
> +* only build target 'build_py' in setup.py
> +* do not override self.install_lib with self.install_platlib which causes
> +  package issue when multilib is enabled.
> +
> +Upstream-Status: Pending [cross build specific]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + buildtools/config.py | 4 ++--
> + setup.py             | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/buildtools/config.py b/buildtools/config.py
> +index c837e5d..d426005 100644
> +--- a/buildtools/config.py
> ++++ b/buildtools/config.py
> +@@ -312,8 +312,8 @@ class Configuration(object):
> +                 # wx-config doesn't output that for some reason.  For now, just
> +                 # add it unconditionally but we should really check if the lib is
> +                 # really found there or wx-config should be fixed.
> +-                if self.WXPORT != 'msw':
> +-                    self.libdirs.append("/usr/X11R6/lib")
> ++                #if self.WXPORT != 'msw':
> ++                #    self.libdirs.append("/usr/X11R6/lib")
> +
> +             # Move the various -I, -D, etc. flags we got from the config scripts
> +             # into the distutils lists.
> +diff --git a/setup.py b/setup.py
> +index 64bec4b..fb29253 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -130,7 +130,7 @@ class wx_build(orig_build):
> +                 'message and the wxWidgets and Phoenix build steps in the future.\n')
> +
> +             # Use the same Python that is running this script.
> +-            cmd = ['"{}"'.format(sys.executable), '-u', 'build.py', 'build']
> ++            cmd = ['"{}"'.format(sys.executable), '-u', 'build.py', 'build_py']
> +             cmd = ' '.join(cmd)
> +             runcmd(cmd)
> +
> +@@ -233,7 +233,7 @@ if haveWheel:
> + class wx_install(orig_install):
> +     def finalize_options(self):
> +         orig_install.finalize_options(self)
> +-        self.install_lib = self.install_platlib
> ++        #self.install_lib = self.install_platlib
> +
> +     def run(self):
> +         self.run_command("build")
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
> new file mode 100644
> index 000000000..af7b51d83
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "Python3 interface to the wxWidgets Cross-platform C++ GUI toolkit."
> +HOMEPAGE = "http://www.wxpython.org"
> +
> +LICENSE = "WXwindows"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce1d18e2d633d41786c0a8dfbc80917"
> +
> +DEPENDS = "wxwidgets-native wxwidgets"
> +
> +PYPI_PACKAGE = "wxPython"
> +
> +SRC_URI += "file://add-back-option-build-base.patch \
> +            file://wxgtk-fixup-build-scripts.patch \
> +            file://sip-fix-override-functions.patch \
> +            "
> +SRC_URI[sha256sum] = "00e5e3180ac7f2852f342ad341d57c44e7e4326de0b550b9a5c4a8361b6c3528"
> +
> +S = "${WORKDIR}/wxPython-${PV}"
> +
> +inherit pypi setuptools3 pkgconfig
> +
> +export WX_CONFIG = "${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config"
> +
> +RDEPENDS:${PN} = "\
> +    python3-difflib \
> +    python3-image \
> +    python3-numpy \
> +    python3-pillow \
> +    python3-pprint \
> +    python3-pycairo \
> +    python3-six \
> +    python3-xml \
> +"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96266): https://lists.openembedded.org/g/openembedded-devel/message/96266
> Mute This Topic: https://lists.openembedded.org/mt/90127900/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

