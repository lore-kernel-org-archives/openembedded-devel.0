Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 91B696ABFD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:41 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e52so3305942eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Bp4Ol2QULaZy2PWIGDawS1ivvCJ4DPFlYcUFLFObkMo=;
	b=03PX/P6AidQYuzqn9cxA/SUNmsqn9gDPc9yGdDS9b3H5AmhIKE4krVBgGP6PxhaaH3
	ly69jlcpzawumfcfPe852k0gvrk5Ub3EMvVNRXvOsUOqBZkCKz79wab6ViKIkfniHccH
	KDCj/Hm6D3LGR4rmyP42SZ2/TKCqWc+9tG/YPDzlQKL336AoBasurWsxA5A4nRmCPOt7
	K1ejJPyrxA4/CFHkOPrv3L9qB9gE1jyIYKEO0HKnZ/i3xQOYC4cmIn8GwSVdXBf8DPU6
	4TO2EMGkYnWmfEOcFAPj4k6W2CX/4wqOUNxl3pNCjRhXQwODM6p54LqVSjuSVy2RRQ4u
	NLbA==
X-Received: by 10.14.173.130 with SMTP id v2mr3660623eel.29.1371662982205;
	Wed, 19 Jun 2013 10:29:42 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:08 +0200
Message-Id: <1371662967-31734-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 01/20] midori: update to 0.5.2
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../midori/{midori_0.5.0.bb => midori_0.5.2.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.5.0.bb => midori_0.5.2.bb} (89%)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb b/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
similarity index 89%
rename from meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb
rename to meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
index f046375..f4f6221 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
@@ -6,8 +6,8 @@ DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native l
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.5/midori-${PV}.tar.bz2;name=midori \
 "
-SRC_URI[midori.md5sum] = "ad11685633e23f8173e2cd947d945cce"
-SRC_URI[midori.sha256sum] = "d280c19bb135f2b644a67d9f34d1ec1c148ceb14b5de11ce6c23f64c15be5df0"
+SRC_URI[midori.md5sum] = "e2c1e0b617397ec9f9eef4fdb47b3565"
+SRC_URI[midori.sha256sum] = "a9c5cb4606e8e4967a2b980caa9ada25623c50d927a302b6bf73eeac5815c97c"
 
 inherit gtk-icon-cache pkgconfig vala pythonnative
 
-- 
1.7.4.4


