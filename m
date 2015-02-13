Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 70CBF60167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:34 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so4898951wgg.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=9jzKtA4t4fe0A0zfT1gZ4sLj1ttS9Y4o4TVXv0DRZ3U=;
	b=smUIBsxY6ZkXGTwZKBGMoVE94ryBizDplgf2jhrHCE5CFftw17mxruINbeDtax15QY
	zE6ecMjR5KU3CD1I6RLvsEdEYwwKP6NL6F4neTCCQEtA4S/bcXYl2KlPEUG0dZktX5uQ
	sWZ7zNpW2qqRob87/d4hLgl89yYfSLYLcX0XlBSeRehkhOu6Ai2//1VIdcvo6ptR3Ki2
	ucUL7pWeVG1MeEUpoCgtONl4CcSWIfYW90Odu+krTXaYnqmz96GJkKzHhx9KHXSCwG+f
	xCSGJo65wj8Ya/JLv//FjAQ7WmJF3HQv6ml5kk3/QPyuWDS+p1/4B1t8pk9Tj8+ZXmTF
	G/Ng==
X-Received: by 10.180.14.104 with SMTP id o8mr12983157wic.47.1423810955237;
	Thu, 12 Feb 2015 23:02:35 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:55 +0100
Message-Id: <1423810919-9857-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 15/19] xfce4-equake-plugin: update to 1.3.6
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-equake-plugin_1.3.5.bb => xfce4-equake-plugin_1.3.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.5.bb => xfce4-equake-plugin_1.3.6.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb
rename to meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb
index 76cd5d4..d4f069f 100644
--- a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb
+++ b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "7c520e2f1cd0cc5e33d8346b12e31c02"
-SRC_URI[sha256sum] = "43bbc781575c357c13ac6720eb8e8485115099411d5382668e106de58ab0e416"
+SRC_URI[md5sum] = "ee76ed3825999b24ee9c2c976d906e22"
+SRC_URI[sha256sum] = "8129067080c8a4656063e7cde20f13fabb47b49c84ce610916f54644acb93d67"
 
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-equake-plugin"
-- 
1.9.3


