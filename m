Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 559CD76FEA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:59 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so2881529wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=9sy//udRJFJgQ48dS5+ioiIHqbZavFJlUypBC8ly38g=;
	b=OqyqWgaw9vmT+1O36uBLG/+3TKzhMhINN/fbh+gZ35yckEKouY341vCdhAvazZoBlY
	OBt2GmQm7AWJIhNxIT76KCqCTvDYhZTrz+xCoA9raHwLpUxkWkG3yPlgO5Pd4SQC+RwA
	V3f0dKMTH05BP+2tLHpf7q8WFNA/xBDuVAtdDwJ9YIjZvkubK7BLEfPpBrPhc/58QRyp
	cBcyMI68IH6nE166v46fKYTKSMYrpl47d48G64uTkVP8OJvNXlDj6X843UBWjjJivh5J
	UjHWB33E29FeCI8hAQnMb/q+gZCGj5JfDmB5f+IkU0gzkzA0nb+PZa0D0GhVOcaquxBQ
	wgmg==
X-Received: by 10.180.88.164 with SMTP id bh4mr1941963wib.18.1442450520039;
	Wed, 16 Sep 2015 17:42:00 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:31 +0200
Message-Id: <1442450491-14912-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 19/19] xfce4-settings: make Adwaita default icon theme
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
X-List-Received-Date: Thu, 17 Sep 2015 00:42:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
index 8498d42..67df05a 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
@@ -24,7 +24,7 @@ index 65ba1ee..9efb3cd 100644
 -    <property name="ThemeName" type="empty"/>
 -    <property name="IconThemeName" type="empty"/>
 +    <property name="ThemeName" type="string" value="Xfce"/>
-+    <property name="IconThemeName" type="string" value="gnome"/>
++    <property name="IconThemeName" type="string" value="Adwaita"/>
      <property name="DoubleClickTime" type="int" value="400"/>
      <property name="DoubleClickDistance" type="int" value="5"/>
      <property name="DndDragThreshold" type="int" value="8"/>
-- 
2.1.0


