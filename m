Return-Path: <ka6sox@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 733B265CB2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 20:26:44 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id m1so4423544oag.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=d2reJXVnnDW74nFX3vnJvHM/nHJOjwoVmUO4d65B+RA=;
	b=Iwdr11VBx9tfBFumQdBPkNEH3dAnpCq8qYDoK6B6SXkwf2gE64cpsDOBu8iwAIW4bX
	1XTyFQF7sRkOmF143KppjC7LLZ8KLhd7uGVJX9Mai0OfxPLvEF6ldiXj8cV+NBkkmwx/
	DEHMLUspVh+ZxmI1XWApQTXKyrapT2fpuX4eI4SPVmxmM8KPc+yya0nG15E9gg/vtDho
	t1ftlnHBuNWvvTBsAz1njBIycImF7Hpm3r7ksQSRScFtEXFfKw+A47+X3wlTpUaBww9P
	QAk8I3/p6oNX3jYA+VYP6VezDspiJLFa7f3gEHLRK2AVje+Vx7dtozPVO25XgUfhaOkM
	yURA==
MIME-Version: 1.0
X-Received: by 10.182.142.67 with SMTP id ru3mr39331992obb.15.1408393605167;
	Mon, 18 Aug 2014 13:26:45 -0700 (PDT)
Received: by 10.76.108.238 with HTTP; Mon, 18 Aug 2014 13:26:45 -0700 (PDT)
Date: Mon, 18 Aug 2014 13:26:45 -0700
Message-ID: <CAHQecY4aMx0ytkLRf_0wjwO2uGvt6H8=sCaebzCAWL5FDR4-AQ@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][Patch 1/1 v2] gypsy: fix QA issue by removing EXTRA_OECONF
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
X-List-Received-Date: Mon, 18 Aug 2014 20:26:46 -0000
Content-Type: text/plain; charset=UTF-8

Addresses QA issue in:

http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095778.html

"4 gypsy-0.9: gypsy: configure was passed unrecognised options:
--with-distro [unknown-configure-option]"

Patch:

Signed-off-by: Tom King <ka6sox@gmail.com>
Signed-off-by: Ron Lockwood-Childs <rchilds@vctlabs.com>
---
 meta-oe/recipes-navigation/gypsy/gypsy.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc
b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 747b61d..7c93d0a 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -11,8 +11,6 @@ DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native
libxslt"
 inherit autotools pkgconfig gtk-doc
 PACKAGES += "libgypsy"

-EXTRA_OECONF += "--with-distro=debian"
-
 FILES_${PN} = " \
   ${sysconfdir}/gypsy.conf \
   ${sysconfdir}/dbus-1 \

