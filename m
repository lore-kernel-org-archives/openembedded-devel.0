Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id C52AF616F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 15:11:21 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so3820729obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=XS1vlUlydXRmcKA4edcId+SRHOwXHFGEb6lycQy63yo=;
	b=ia/xUCrimr7MpRyXiXfc/0Hy8GUQzCh1Pxz3CiVvETeUVlJFtvhSEFtWS1ptV2iBYg
	qPg73S3XFsJBbWogWER3nluLMbI3bSBXVxWo7F4uDHENU9lvHjAIR8KUctcntvv5wpUd
	BNGZbrFS/6Yduv9k57Bjf8PZD/4f1hXYKzOAZwauSfVcnQx57MUGxHTdUJPMb7JrflgJ
	KuUlR43/qWh6wEot9GHmMsIbCEEBH37AN972HnRUtNOhRSANumf1gQ4zjBsFESCMx4u5
	hzC8TpRN9m85XfDzMhflJO6tjR0f7caEISZzOImvDc7ATlcjE3aYb3P/0mWPK0qsdD2Z
	vwgA==
X-Gm-Message-State: ALoCoQnUOcjhFUIxBV+1hrOLqMYe8luUypXDS20bEmy8P9HRbT572wWA6ibK4aCfLJ/td2f4YbN0
X-Received: by 10.60.161.10 with SMTP id xo10mr908685oeb.71.1385046680857;
	Thu, 21 Nov 2013 07:11:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Thu, 21 Nov 2013 07:11:00 -0800 (PST)
In-Reply-To: <20131121123904.GX3708@jama>
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
	<20131121123904.GX3708@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 21 Nov 2013 16:11:00 +0100
Message-ID: <CAP71WjxW7KZp3D+gTEGV2ZzDfwPhwxqLUP5qw4Rj4XN_z1=cQA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Andre Draszik <andre.draszik@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: making qt5 package machine specific
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
X-List-Received-Date: Thu, 21 Nov 2013 15:11:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2013 at 1:39 PM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> There are 2 ways and I'm using both in different scenarios (different
> builds)
>
> 1) .inc file with
> PACKAGE_ARCH_pn-qtbase =3D "${MACHINE_ARCH}"
> PACKAGE_ARCH_pn-qtdeclarative =3D "${MACHINE_ARCH}"
> ...
> for whole qt* stack (use sstate-diff-machines.sh script to see that you
> get them all).
>
> 2) SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
> # Depending on MACHINE_ARCH GL/GLES binaries (or mesa)
> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D "\
>     qtbase->other-gl-gles-provider \
>     qtbase->mesa \
> "
>
> 2) doesn't solve your MACHINE specific patches of course
>

thanks. how about getting something like this merged? i believe our
situation is going to be an issue for others as well, so perhaps it's nice
to build the infrastructure to make it simpler for people to use

=3D=3D=3D=3D=3D=3D=3D=3D=3D

From c562d011f196b1ee8ceced76833dc80e48dd599f Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <andre.draszik@linaro.org>
Date: Thu, 21 Nov 2013 13:48:45 +0000
Subject: [PATCH] qmake5_base.bbclass: allow to set the package arch globall=
y
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Packages built using a (machine) specific qmake, will also be
machine specific.
Since it is not feasible to add PACKAGE_ARCH=3D... to each and every
recipe that is built using qmake, we introduce a new variable,
QMAKE_PACKAGE_ARCH, that can be set by the machine configuration as
needed.

We have to be careful though to only change the architecture of the
resulting packages if we're not compiling a 'native' package.

Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
---
 classes/qmake5_base.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 2db0fa3..e77dd73 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -1,3 +1,15 @@
+python __anonymous() {
+    barch =3D d.getVar("BUILD_ARCH", True) or ''
+    tarch =3D d.getVar("TARGET_ARCH", True) or ''
+    # do not do anything if we are building a native package
+    if barch =3D=3D tarch:
+        True
+    else:
+        tarch =3D d.getVar("QMAKE_PACKAGE_ARCH", True) or ''
+        if tarch:
+            d.setVar("PACKAGE_ARCH", tarch)
+}
+
 # This is useful for target recipes to reference native mkspecs
 QMAKE_MKSPEC_PATH_NATIVE =3D "${STAGING_LIBDIR_NATIVE}/${QT_DIR_NAME}"
 QMAKE_MKSPEC_PATH_TARGET =3D "${STAGING_LIBDIR}/${QT_DIR_NAME}"
--=20
1.8.2

