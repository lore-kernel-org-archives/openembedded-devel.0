Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 564766E98D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 02:15:19 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kq14so1512437pab.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 18:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dZ5ivZtEh3SfMHn7mKeuDBfNE7w1yG4ddgN8uwWZPM0=;
	b=S6XjzQ/DmPQvX0U3ysB6DcKAMl/5TSovHyIPjOT8I+rdXkhUftsUVoug8GLviggQz8
	E2rrxiHgW4gdk5w8Cwr+cHyXghcacnf+UgTM3lsVyrnbp7R1Fsai61xj58xuMFKbEIa4
	isekE2aRzzebP7sHbvIlm3nsmoVYA1GijzPq1J9Y+8BBhtEpAMAkNXRU+n6+4+cgAkfc
	w1yl1U32S39qR9Oh7c2zBIGdvCM2qSlxHicDxrM9ymS8qRYMy917Oz5mLGhFedXB8wCq
	MdSntrxjLbqpYnpsszLETAlaICxGXMutBIcPmO66PYN9a6OHiAm8B9zy4KlhOdlbnogw
	7R+A==
X-Received: by 10.66.231.40 with SMTP id td8mr7194365pac.103.1393640120563;
	Fri, 28 Feb 2014 18:15:20 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ug2sm25996506pac.21.2014.02.28.18.15.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 18:15:19 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Mar 2014 13:19:54 +1100
Message-Id: <1393640395-9737-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH 1/2] qtimageformats: allow empty qtimageformats package
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
X-List-Received-Date: Sat, 01 Mar 2014 02:15:21 -0000

This fixes installing qtimageformats-dev with opkg as it depends on the
qtimageformats package which wasn't created.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtimageformats.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
index 1b4bb4f..f90e58a 100644
--- a/recipes-qt/qt5/qtimageformats.inc
+++ b/recipes-qt/qt5/qtimageformats.inc
@@ -1,3 +1,4 @@
 require qt5.inc
 
 DEPENDS += "qtbase tiff"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.9.0


