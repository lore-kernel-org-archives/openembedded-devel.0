Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id F01AA762AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 02:15:13 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fy10so122827264pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2016 18:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Zaz4n9/IAypLqDJxeNySV+Jpv9TBrKSzqhO9pmxtU94=;
	b=tCfWKTYn7ZjsKkFbGCzMdL4iJ4QPhWQVpdO+WcrioTuhsHa6Wgif8662Y48Tzti44a
	trNXyvnKfL0113pbhBFtbDaP6tTdGA1OJEFGA9VKSjFb+NLSCjpEKQ5tGjkq1k26Gpg6
	cTXUSP1AaprhHY2GmbYfyI6GhLVPjCSsGsqVcNZBILBBABqySyZkCeksoF7McBOf1MvA
	Hu/EwXqvAVw1m4Yuz28m1iaIODxdxHEB7x1lKiH/lrSHqAtHbx6m+Szn05YHGtDRl3Yu
	ojTClASZxuc6SPlq9dBWS+ArZ6vu8fF/DNY9RaSF4aA2/LDCJ7sq61117TtWWGvcxJ8X
	53uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zaz4n9/IAypLqDJxeNySV+Jpv9TBrKSzqhO9pmxtU94=;
	b=eOp4hnjCAmtdNYnpHET/ABFCpehqkSJmgNX137lIugLkS0/iPkXycb1M28iY2Hd+iW
	0hofa0hnHZ+Wi/T8GT0vqLbwkryLUjHfNfXdrFWdcHng/xqyBKTMDpvVwAne7Qh5ZhBH
	8W6P2CCUeEjh0OCF9VXrgm/C9vwbe0DjnGGcbonxXhzxKx4lT1zcA3WRbfobg9ieLVPW
	2/8GvUHvvaQ+SD3ZmmpnMJzjM+x51CZTt9Bzs/UidPGOJsu6xlnbEx52GpqVu6DmbOtL
	yMmee2BMKZONLTPux6nrflCMvHfJA5jvXvqn9xMWQ0g3vexSTSkS9bilUY1yshYOIhxZ
	PRFg==
X-Gm-Message-State: AD7BkJL1x7wtGbUABI77EAo2cDtQc1ZqBIwznu3ncNXzBbIiXcqd7FC07Q7Y55o/V2K/WA==
X-Received: by 10.66.248.198 with SMTP id yo6mr34633375pac.54.1456884914394;
	Tue, 01 Mar 2016 18:15:14 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	ey7sm10881756pab.47.2016.03.01.18.15.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Mar 2016 18:15:12 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2016 13:15:24 +1100
Message-Id: <1456884924-18092-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-qt5][PATCH] qtwebengine: enable ARMv7VE support
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
X-List-Received-Date: Wed, 02 Mar 2016 02:15:14 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index d2975ef..8f5276f 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -47,6 +47,7 @@ COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
+COMPATIBLE_MACHINE_armv7ve = "(.*)"
 
 inherit qmake5
 inherit gettext
-- 
2.7.1


