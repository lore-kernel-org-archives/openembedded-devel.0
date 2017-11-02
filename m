Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D542A60685
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r196so10256622wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=i24G4sKkJM2MgqBC2w//JvgzQLpnBLyzvnmYt/wYgr4=;
	b=L9RrSVpcnRikf/9dl6TeJO4dbFx/+uXH3MgaKg/qnPU4Ch9GtUhrA7dAH23dPXogyp
	a2RX9dg8EtmTtDF5opGE3u3exqGdC1vZh4MavzPmskFxMHYz91BLf/eHXOLgeqcPjUhF
	85vl22nO+G+P036yi0T0Ib3GSmkbyA1Cx5x3cS6nJsPW5gdVxHOlS2711Jyf4OaRKHKw
	s9QQZNEze8tAE/UeBt+GmfTHr/sTKcBwKFOfP5FNPkd1qmLcpdzKYEyjkgxzPJcebS5U
	abCjqWaSLlAZFU1ezROul0gpaXW15jRsInWLyQFKM2Ty/IlvCac64jBEqYLRxgDWe1MV
	l0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i24G4sKkJM2MgqBC2w//JvgzQLpnBLyzvnmYt/wYgr4=;
	b=oI6mFFcKIjkxXLubJGP24imxqILdTByOdVDpJcK9AOlTmFJA7QWWjskYphVUJmQvKB
	IRhygWPbNIspIsKC+fwN+UZbIll6oa1yXl4rj+k6+gIGxvN4npdIFl0tu7yd3lUuAQM2
	W4zTVWz18zmM9HdHeTkJuJODpmTdmv2NP1OFF5vSL2K+OAU2a4qZHNp+kKyNnwE/cIDo
	yDYA4Lv87L+bJ4dygzfwsJ6g0jYW6qm91msx+OZxXrBI0ivCzAGwotcGqnTU4UJvYOy/
	+dIzB0zpYrQyN+j+KP93Fti36W4YtFQhjUNuQdVjvCRv1sbNNUd9dk/4yH235uPkqzrM
	jfbQ==
X-Gm-Message-State: AMCzsaWmYJ8ZS0wfL8hpgw8agE4NZgOQ67TCh93Yp1bqa8upnYJvZJjf
	BsejdGNtH99ByuNxE26IndyJdg==
X-Google-Smtp-Source: ABhQp+Rk9j6RpQbCqo/SFc7Em7Uc4Qk7EiShDed6vxuz1wNDwjv98v3/zSdFkG9/zTJPZb/zXF4U3w==
X-Received: by 10.28.199.75 with SMTP id x72mr1284954wmf.119.1509618709103;
	Thu, 02 Nov 2017 03:31:49 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:20 +0100
Message-Id: <20171102103129.3703-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] tumbler: make thumbnails work again
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:
| Failed to load the cache plugin "tumbler-cache-plugin.so": /usr/lib/tumbler-1/plugins/cache/tumbler-cache-plugin.so: cannot open shared object file: No such file or directory

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
index 1f5419a..fe331cb 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
@@ -15,6 +15,10 @@ INSANE_SKIP_${PN} = "dev-so"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer-thumbnailer] = "--enable-gstreamer-thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
 
+do_install_appen() {
+    ln -sf tumbler-cache-plugin.so ${D}${libdir}/tumbler-1/plugins/cache/tumbler-xdg-cache.so
+}
+
 FILES_${PN} += "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
-- 
2.9.5


