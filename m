Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id DD1A261105
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 09:45:59 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so397910eak.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 02:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=muLH9iCvaiyqIluz5Mf5bSCxNvD+fAnVXmvcBl0zBUk=;
	b=Nq2JuqEWyjnFjJOYTNePhXniELNLTdP+AJVfr0/bR90GRKvu8CctW9uKHKxvqHmWhb
	vO8++Niu7eCytiT5wmA61uNtVf0BCQRMElRmuiWWzYhZPF113FKJB/L6cn9P+JkQo6n5
	4aV7O+H4UzIyxAyrZ4phDucYqXxoOLcQY45Lt6q/KZp8CdP+S0bNNPJgMWbWl81S7SOe
	8+rTkzezC+CF50Tmi+UKoO2RsPeiYMqhyegj0LhfARpyhYA5DP0sxZ3n2ix3p0w9elrO
	m1VWRJKF4pXbTC26f+8ry11uRpV+hxdkJEF7ZnAXgVfKG2QtRl+75dB7ce/yOMXkhI4v
	unSA==
X-Received: by 10.15.54.199 with SMTP id t47mr84461eew.46.1380188761008;
	Thu, 26 Sep 2013 02:46:01 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id k7sm1820855eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 02:46:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Sep 2013 11:45:47 +0200
Message-Id: <1380188747-9731-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-qt5] fix do_rootfs for images with dev-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 26 Sep 2013 09:46:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for qtquickcontrols-dev:
|  *     qtquickcontrols (= 5.1.0-r0) *
|  * opkg_install_cmd: Cannot install package qtquickcontrols-dev.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtquickcontrols.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquickcontrols.inc
index 63e884e..06b5350 100644
--- a/recipes-qt/qt5/qtquickcontrols.inc
+++ b/recipes-qt/qt5/qtquickcontrols.inc
@@ -1,3 +1,5 @@
 require qt5.inc
 
 DEPENDS += "qtdeclarative"
+
+ALLOW_EMPTY_${PN} = "1"
-- 
1.8.3.1


