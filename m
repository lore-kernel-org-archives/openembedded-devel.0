Return-Path: <nkolthoff@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3257F71AEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 11:59:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v190so5670090wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 03:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ehvcN9X6/y2owgUdnfY9mSbk7q4SZhWOvFBWEVO2UsM=;
	b=fhv3UWfLEH3QdmY6cIDopomfD91wNeUQh5dBQ/lxslgQW7fmiB7dXPRVGFv3aeX2Gb
	Sn16PyotHtx3ZZzfO/NaoJqstXGaxLoiy6Xa2M3IAQ4wRp/aYs9TwZWin2/jpyLNKdQv
	uLGv7q1EdzJFo/prEsvbO6qGh+Kl2F0xmobKNQM4S7VVG1ql31beZS8EhTrwnrUlVpjc
	rIOt1z80fOjoYf4ycPlE9U4zsbw8HFC1OwCID/fkH+g3gq//4N4GqY7i7ekCEwir6pjy
	DAjGoC03nAUsTb1thFd0F+mBLzvVT6zVVih4SetmeiKtSQu5fPIHivxseEArHg7Ruiq6
	CtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ehvcN9X6/y2owgUdnfY9mSbk7q4SZhWOvFBWEVO2UsM=;
	b=RjAs49t3ZLXjSY1A0RmiV5aVq0Qj1N0JLZtiqSP73NJr18XrB8HXYoShcZcsC7XKhc
	7pupAIW9okNywcyURSc8Ocxeh6M9hyVBCUL3u0OmdO0dXVQoBhN7NKDdnxfhZwGRtfbA
	kWkHKRBKSbvWeplcPpC6KKTNU6mTBtETt7y7yJ09O2liEN8cCPZJHCY6Ur/rXpiscj5f
	g5kaXvtt38IzGAwOqEDAKz3Oo1cKrX1UCjLV+YfLByopy66hKxOQMocaLSy5WU4kBGEZ
	XPWVqPs95SaeivlyMgp5bPNi2DhDWhIQRjBv+Z0T8E5pqL+9b6zgY2aQGmW15pPKRJ8d
	H5Hw==
X-Gm-Message-State: AMke39mcXPHJJt5VrY3Q3tViD9dZuZZ8fq7Wu2Ve2p5+BXZfU1OAFtxIaEsJFAzILi3hmw==
X-Received: by 10.28.137.211 with SMTP id l202mr5222176wmd.118.1488974382906; 
	Wed, 08 Mar 2017 03:59:42 -0800 (PST)
Received: from ubuntu.bgr.local (D57DAFE2.static.ziggozakelijk.nl.
	[213.125.175.226])
	by smtp.gmail.com with ESMTPSA id 11sm3903530wrb.10.2017.03.08.03.59.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 03:59:42 -0800 (PST)
From: Niels Kolthoff <nkolthoff@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Mar 2017 03:59:34 -0800
Message-Id: <1488974374-29411-1-git-send-email-nkolthoff@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] packagegroup-qt5-toolchain-target: add qtquickcontrols2 package
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
X-List-Received-Date: Wed, 08 Mar 2017 11:59:42 -0000

Signed-off-by: Niels Kolthoff <nkolthoff@gmail.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 1521dbf..e638e1b 100755
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -106,6 +106,9 @@ RDEPENDS_${PN} += " \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
     qttranslations-qtxmlpatterns \
+    qtquickcontrols2 \
+    qtquickcontrols2-dev \
+    qtquickcontrols2-mkspecs \
 "
 
 RRECOMMENDS_${PN} += " \
-- 
2.7.4


