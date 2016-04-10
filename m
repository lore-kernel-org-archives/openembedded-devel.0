Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 290D177232
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:42:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n3so16813035wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=g/IFkoGoUYkbtHn+eBt6FbdkqCxWNauVyLzBFQ7DQ34=;
	b=bdDmO53o54Q1YX7Xyi2PeHTZ9D5IdyqLiINBggZd3CLSearc993l8ZXUaIZiBjGVGe
	Jldf0OMfNbTSnvzn3ghFwjXRoI09tEX4g+dAPtW8DO8A4Vg+pBByWWxX9xclYm0AC8IY
	ZU0crJo0FJQi8H8xlTyX2J+l2Kh5DA9ciElUje0b2xvOGY1CMw8Y54uK/aV7nD9LOtjY
	CsDSfoMlATYgZAlDG9LC7TGh80IfK/saegCJZmclhyVWnazkEJND2cfMwS+r9dwSMBup
	DvGGaUV3dtu7q+Yy/1z5hiIRe2TwR7RsdI9D4lKRGQE4mK0w9kg9QnIJtooLVAyYQfVI
	oi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=g/IFkoGoUYkbtHn+eBt6FbdkqCxWNauVyLzBFQ7DQ34=;
	b=EH3jXvj2t2U/izU++EMSiXyz7pfnUP7YRoznfQ3NCdJwpReY80135YJsHatDEdEuZ8
	V8W8WUH6ot4Rd/HlzuG7fGU3cz50tkh55FYZTF7x/9JTHklv0pKD8GPONgFDK40CWctv
	yl+Lv0Qc3HrLpwaHIM+tS9Eo/PPgKE9xlqmO/TOAdbru7dKwPxRqO9wvE8EdjULmGYay
	jZUHDF4O7cJndLgkzNJ/JcSYVQ4O3jDLVxrGYSor5XcDkjQAl271vuTnZWR55EVRRkPh
	ltFp8Z+xwmSiwqgybWarWh4M2ZuIENjjydx5DOcZxMLZjmgpGdNRKj0WrAivqPUgOQEd
	F1CA==
X-Gm-Message-State: AD7BkJLm1z+7zCuDyiFb2IBMaPFVZLXOv3ynyyv1Elb2s++wBqPt/Dep+Y8DX80ZUOV2pw==
X-Received: by 10.194.176.129 with SMTP id ci1mr19639786wjc.166.1460317330791; 
	Sun, 10 Apr 2016 12:42:10 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.42.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:42:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:30 +0200
Message-Id: <1460317290-4787-32-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 31/31] qtquickcontrols2: initial add 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:42:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtquickcontrols2_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bb

diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
new file mode 100644
index 0000000..41c781e
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -0,0 +1,15 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.LGPLv3;md5=8ba7f2099d17d636d5fcc8303bb17587 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+"
+
+DEPENDS += "qtdeclarative"
+
+FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
+
+SRCREV = "7fc567eda8a187e365f4c29c6e8f08440bf31218"
-- 
2.5.5


