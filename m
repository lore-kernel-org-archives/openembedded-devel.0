Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec@linaro.org>) id 1UPwQA-0005Z3-Kx
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 16:54:49 +0200
Received: by mail-wg0-f46.google.com with SMTP id j13so547610wgh.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 07:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=9jGJFGfqxakXKPbGimoRVQMn0pLjwwbQNJikD1IXX5A=;
	b=Vws13qr453LhnT7AtojsLxpQ9XD4mY2sB0l/8iKSd68CpYmDExixPukeNS/yaAf2/q
	QhdDiDSeiaGf4mi1doKqL052zVWI0JeD8L4EerjRGAt1rURv4NDsVjRBrsLqvAcvOxRe
	w6uk/FQt8r58j2rM/71tJkKnZECjlOdjFX6RdBSolJiTb60B5bb1ssbKRptjWRVFOYIY
	duOVw3ApfEF22EENx+uPjp/F+45A4iD65LWVLBr2wbCGcGyQaqOw/qDJFnUjyb7YXZmc
	UbP7v5510/t1JngszB/rGTV3pYqeJvxgOqO8rfxtTbxhNpqBGk6v/YKDM8vuFa7rE9w/
	l89w==
X-Received: by 10.180.188.105 with SMTP id fz9mr2725696wic.21.1365604645096;
	Wed, 10 Apr 2013 07:37:25 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPS id gl11sm32149005wic.8.2013.04.10.07.37.23
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 07:37:24 -0700 (PDT)
From: Nicolas Dechesne <ndec@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:37:19 +0200
Message-Id: <1365604639-5235-1-git-send-email-ndec@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQmgXFQMUamX4PNhcNntmTHplBiGq31C6AoumfX8akIfb8ZHeZE7OilXxn489T0pAqmmgMjZ
Cc: Nicolas Dechesne <ndec@linaro.org>
Subject: [meta-multimedia][PATCH] gupnp: remove dependency on gnome-icon-theme
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
X-List-Received-Date: Wed, 10 Apr 2013 14:54:52 -0000

As discussed in [1], let's remove the dependency on gnome-icon-theme,
since it's not required, and it brings additional unwanted dependency,
such as the whole gtk+...

[1] http://article.gmane.org/gmane.comp.handhelds.openembedded/57483

It is build-tested with
 - core-image-minimal
 - IMAGE_INSTALL += 'gupnp'
 - directfb in DISTRO_FEATURES

The build was failing before (GTK failed to build with directfb, which
is expected).

Signed-off-by: Nicolas Dechesne <ndec@linaro.org>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
index 81db3ea..f793236 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -2,7 +2,7 @@ SUMMARY = "UPnP framework"
 DESCRIPTION = "GUPnP is an elegant, object-oriented open source framework for creating UPnP  devices and control points, written in C using GObject and libsoup. The GUPnP API is intended to be easy to use, efficient and flexible. It provides the same set of features as libupnp, but shields the developer from most of UPnP's internals."
 LICENSE = "LGPLv2+"
 
-DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme gobject-introspection-stub"
+DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gobject-introspection-stub"
 
 require no-vala.inc
 
-- 
1.8.1.2



