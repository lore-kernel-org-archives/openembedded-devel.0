Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3536C6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 20:22:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f193so338154wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1PY0rXDVFMj4G2yBB6Rv/axRc0jkgVbJG0f8HdoQNIg=;
	b=ozLH5d6DvUWv/jFzP3lY1I5hBxXdop8XxcXD6TX0jgC2KHN4NkZ5zjRfwGPgvvq1RX
	V2fiYbaZO5fo9b65ZlZPY58zGwzbja57OkhabVfiqKaH09WkVQHZ9FLZXEd645YaWPzm
	OiYWT0irY3WSAftbzMP33gbCIOfl5/7OrHoIM1+Wfb4IdrslffjMY7Yq/D/d7cRFvjk+
	gfLdC71o3rMHyHrO2Mu1Pz4idUbJdXulors9tFE5fKlP64JZjmPeJn7er+dxlbizkMOu
	WmlHfPujp0yN+mg6jSzashx/cVFFuV/jySlUKZQNgOBgJJQSsVnRsacoj8a/0NACWfOc
	XyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1PY0rXDVFMj4G2yBB6Rv/axRc0jkgVbJG0f8HdoQNIg=;
	b=Q4OvCM0N/JDpBWkaAM4glEsv1hc0e0/2pomkEyDuYtByeiI12XQZ/yvWRhUT3XmA/f
	FWU0lGKehWC2DT27z43NTVSV3B6gzjZEkDsY3YgzbjBau+ejEzll645tk7i/PNSSsfr2
	IB7d+nu0Nau1em2oP6plERWLXqRqmpUy6MGPyKl7NCuFTBmTFbUp+BaFUuMtuiz6jaZy
	rIYqJsLQZAy7ysin8ZymFsdCZSrzLiAUX4vDDqMiApN5MChQ4fIBmAJsXxdA0z47TSpT
	wQvmvHyLX/C21j3bi9bs/NF+bfIUR4gvmzWhMdgcJ6O+RA2EolssYwGA7FZ1mCCipopz
	DWzg==
X-Gm-Message-State: AA6/9Rkk3Sq+oWoI4ydAQUcx6RMZMoEr0D1h7yGYAH7leB3+pqfwfz57i1hWjpqugmbErQ==
X-Received: by 10.28.100.214 with SMTP id y205mr5761078wmb.72.1475266964733;
	Fri, 30 Sep 2016 13:22:44 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D54.dip0.t-ipconnect.de.
	[79.223.13.84]) by smtp.googlemail.com with ESMTPSA id
	w138sm6111590wmd.1.2016.09.30.13.22.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Sep 2016 13:22:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 22:22:30 +0200
Message-Id: <1475266951-25848-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1475266951-25848-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475266951-25848-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] physfs: fix LICENSE checksum
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
X-List-Received-Date: Fri, 30 Sep 2016 20:22:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This slipped through in previous commit. License changed Copyright year causing
checksum change.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-filesystems/recipes-support/physfs/physfs_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/physfs/physfs_git.bb b/meta-filesystems/recipes-support/physfs/physfs_git.bb
index 3f1c156..a50715c 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_git.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "PhysicsFS is a library to provide abstract access to various archives"
 HOMEAPAGE = "http://icculus.org/physfs"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5d94e3eaaa10b00ca803ba35a3e87cde"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4424d2cfb8a288df2843c4467b5d719a"
 DEPENDS = "readline zlib"
 
 inherit cmake
-- 
2.5.5


