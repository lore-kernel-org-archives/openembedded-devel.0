Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 20F587341E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:31 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id x13so14709172wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=j5hsNX64xyzq1sZ9ne5twU4UH8iOaAGYMGiUj+cCgGk=;
	b=vXHOJviGroqxFDRBm+tSBHivh5qPLbyPrlDXsnR+BV+1Ml/FbKdi8BsOV2iTDF6+Qv
	D9V82BTaMYomx4+yFmdGPcBbcXhtMCa3EcyEamOi+g66ubBHtv40v/VkoAzyf4cbqtsL
	LjfH1JgrA9YUaEddzzSyFSRFOiyjwQ4Q8clfXG5PT+S5NikJ0a7xx1a1eziOHRG1PHmF
	Ns6lVw2Ry0GmExyq6op2XwP6hZssbN2N3Nj12t08gwk3NMmRWwgyrWKZFnhq/ME+rj4v
	vWXCnmsc/vMx4eWgp8996jLPlCvcw7tM6ZF65htGrhtm1IqvwyET9w/o+9AJAkgCatBk
	uRnw==
X-Received: by 10.180.80.230 with SMTP id u6mr13158266wix.69.1423810952322;
	Thu, 12 Feb 2015 23:02:32 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:53 +0100
Message-Id: <1423810919-9857-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 13/19] xfce4-eyes-plugin: update to 4.4.3
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../eyes/{xfce4-eyes-plugin_4.4.2.bb => xfce4-eyes-plugin_4.4.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.2.bb => xfce4-eyes-plugin_4.4.3.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
rename to meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb
index f1ed6c7..2ac63f9 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "1ef352c68dd8929c9e8743200b758b3c"
-SRC_URI[sha256sum] = "dad102fedd0d9e6df45338a018387b2aacaf24b05eb798275be0dfc05ffa3021"
+SRC_URI[md5sum] = "86ae8bce96e028921fcc0ee8424ff565"
+SRC_URI[sha256sum] = "4b9a335bcfdb8e4e2f6aedb3556575e5331f181912565f4289e354126230817c"
 
 FILES_${PN} += "${datadir}/xfce4/eyes"
-- 
1.9.3


