Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 428EE61BF9
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:41 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id ay11so2054169plb.0
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=d66RtAeKLW0uwCFHLEF37P+snFkwT1A2gewxormtMtg=;
	b=D+70YpgGw81Q98DneUz9niiolTaTZCzQQS4LKYppnM2DoIUJc4TiUwkPR2KUmmxKdy
	t3HCzxACaSSKczptDHLpwMOC/v/0fcINpuzBW+PTCSdDXx4iWB43uQepnx5FcKOXQ7da
	C/MYMaTtWGS+czOcX1oqp4LhCKVOEc0hmMyG+UhCQBbyLoZy80E+u1Qx++jNTevDWR88
	U/xJ9hLbvutRfX38WQUk2pk1D2qsjuNbeNk4sdmiSBEIw6UlLIHtVPp0av+uwF6sw9hF
	gKqocu2iB8KqsPGsGj3KuJdfyu3OnPjO40dU+UymKK3T51PuGBtLFtAtT5TuGOZNP7F+
	7FVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d66RtAeKLW0uwCFHLEF37P+snFkwT1A2gewxormtMtg=;
	b=MgXHyeLXVtS8pm9qstWYDlIrXFiRw5/hiRLa+xxE4gZsQFZCK8AzcbOO+mApWbsur2
	CsHI4yNPfcSVXtR1c0btMV7+vT8/SEGK8zKfxTtCJijKN6NAdHANABSTj1Cd7D9UMuAI
	mYuyTwXhC4BkISf9XHP/zIPXBxXL1tWBS5BPtvSfI4Y3YnSRImXOuxKU7rVNKWZa4dwY
	Erpdm8cS9Hhcb20d0msKRamkkt99Hk9oNADa61dSWk2WmG8d90XR6EvI3bW+s3NPdJo/
	xkKODwvPbrj8vUYFvHxbAwW4HMy62zvHT01/xRSzfQDQoCcatNgj4ZQaeVfxBIdiRHl4
	YqOQ==
X-Gm-Message-State: ANhLgQ2QQz6k3U5TNYq3VxpvDLgb7K1eRjNTqzxb0QBeFS05H/oAwhIf
	dO6ZT257NBzzvPlbrUs4DiXeSeLn
X-Google-Smtp-Source: ADFU+vsm8bih5+eFWZogF0aU1/0VssZdbpQUP0V6u+TnESNPy3QUlEJirx0iJIWYHtNibCE33qeO1A==
X-Received: by 2002:a17:90a:9dc3:: with SMTP id
	x3mr1846099pjv.116.1583981862098; 
	Wed, 11 Mar 2020 19:57:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.41
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:23 -0700
Message-Id: <57213b86c2999636b038ebc4fc4b380fec551523.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 04/13] lmsensors: Fix sensord dependencies
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:41 -0000

From: Paul Barker <pbarker@konsulko.com>

If sensord is removed from PACKAGECONFIG, the recipe should not depend
on rrdtool and the lmsensors package should not depend on
lmsensors-sensord.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Backport of 5674b0a9e8778f7538419451e629ef0c13711123 from master branch.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
index ffafd17f82..316d066d59 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 DEPENDS = " \
     bison-native \
     flex-native \
-    rrdtool \
     virtual/libiconv \
 "
 
@@ -93,7 +92,7 @@ ALLOW_EMPTY_${PN} = "1"
 RDEPENDS_${PN} += " \
     ${PN}-libsensors \
     ${PN}-sensors \
-    ${PN}-sensord \
+    ${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)} \
     ${PN}-fancontrol \
     ${PN}-sensorsdetect \
     ${PN}-sensorsconfconvert \
-- 
2.17.1


