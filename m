Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 04E7E6AC43
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:33:56 +0000 (UTC)
Received: by wibg7 with SMTP id g7so21286821wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=g23HfHniyjDVaqHK2SpMtQWj0a+aXXJfVVJ8YpKLbys=;
	b=mIDahWr6FQU5refYubzEawXjj3O8/uiKC6z0FSgrHK4CbkfM+r1CJqngnWWljsVmkK
	acSqFq3vILsKdZJzsyxmmZOblLPV+vsY0tXEQQWOSYaUP+ufC2I0ik3gIHcDFsIHIaSh
	9npLK6P+2It9aLyYS6brmQd7cuhnM+3ISuTGphpLQOPElFTlVnh2CS9YU2cw6+Yqpie0
	O4eW0rEhuQiSfsz5/jBwoyEXRkH9R+nIR8Fd/xsirlTEkyFL5LIqKBPz7F5u24Pgo6dP
	M/rhNhP0/P/xE7SZ2DtC7j1aBCtVo0XBpoLkprmV52BWPst2R+sk1QtjlsTdLUfnX6lL
	Qb3g==
X-Received: by 10.194.239.65 with SMTP id vq1mr113841925wjc.98.1426462437405; 
	Sun, 15 Mar 2015 16:33:57 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.33.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:33:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:12 +0100
Message-Id: <1426462419-10173-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 03/30] libxfce4util: update to 4.12.1
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
X-List-Received-Date: Sun, 15 Mar 2015 23:33:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libxfce4util/{libxfce4util_4.10.1.bb => libxfce4util_4.12.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.10.1.bb => libxfce4util_4.12.1.bb} (62%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.12.1.bb
similarity index 62%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.12.1.bb
index 4a79f82..d985a00 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.12.1.bb
@@ -6,5 +6,5 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "11eec87e8eda2bc62512c2416cb807a1"
-SRC_URI[sha256sum] = "e82cd1ad715c02a385b3cf6646cb89aa3c4724446dac1d7e424971df12f6cfbb"
+SRC_URI[md5sum] = "4eb012b6c1292ceedb3a83ebfc1ff08d"
+SRC_URI[sha256sum] = "876bdefa2e13cbf68b626b2158892fb93e824e1ef59cf951123a96cefbc8881d"
-- 
1.9.3


