Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2E15960167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:29 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hi2so9784938wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=7fIN0aI4gGTW4pVo2pHtc1MkQDMExtWx0eqpczJ2I3U=;
	b=MMRKJlmXpIeshVe8vwDV6+C1doskR7/PCXmAMWrCxoohCiYldveiy1iBAjXU9Ru4aK
	AI6FVqh+YbYhqDL07FUkKsm97T0jjTaySn+NPdJCnU2zLppbTgG3EMReMxVrZSHQD6t+
	7SIX4s9m/arT07IMZL4lK+KlH2BSoyww2kpAsnmm0pPvqdB5Pkj5zIF3x/P0OYj54hCz
	4qZx9fYJj8lhDCl+c6U45Q3Z5hL+cRtsGEnclYbWVv+eB0S8bdn7KUMsu69OFWO7poRJ
	EYuy85XKZxaQPnfRNrw8DlORqiES8UTG6WZEOwNZqpJSKIZgcMkyPuPlkT5G9E2oaVZs
	G9sw==
X-Received: by 10.180.88.193 with SMTP id bi1mr9812476wib.70.1423810950918;
	Thu, 12 Feb 2015 23:02:30 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:52 +0100
Message-Id: <1423810919-9857-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 12/19] xfce4-netload-plugin: update to 1.2.4
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-netload-plugin_1.2.0.bb => xfce4-netload-plugin_1.2.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.2.0.bb => xfce4-netload-plugin_1.2.4.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb
index ef1039b..c9f7a2a 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.4.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "05180d60ed347029dc125368c1d4406e"
-SRC_URI[sha256sum] = "c824f09e2d3860011b44d8272d661c458237786828027f3d9ad6a1d4f0096845"
+SRC_URI[md5sum] = "ce53e1135e4bff5afcd899627110bd11"
+SRC_URI[sha256sum] = "fface918822c012d806717116566e54947ad7613b9290b45a18e2d5ffb8730d3"
-- 
1.9.3


