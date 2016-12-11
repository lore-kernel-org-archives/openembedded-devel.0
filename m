Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 236B170018
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Dec 2016 11:40:07 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so4773235wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Dec 2016 03:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=eYWyjWO6V+UOnbALgbT2iwsSOwEM7cBWZtO/KTbY8u8=;
	b=G0zRLOKLov14y9lwtYcfx44ymiQW8rIZOYXLkVxy52ri09fKsj8Ks1+VoXkPRY7xdU
	EwPxXCRPlq3gtbN6WlROpH8/rIyfaNwAxEyFI7MspXm8rv3veOkVRyCXDcQw67Wq5/OA
	9JZphuOs/KGata5Ej3MdkBGWk53zu0JpKu42m0qfuFpLCUdk8AbO8WIMYsS2zdR1vP3Z
	zWr6ITY0Z9Ltkq5oGhIHaP/NVtgXdZckGMB9Cwbr6NfIu5/DQRJtiO4GNuHCFbp9i7j1
	iSkw67i0Q3WRmKkXtk8v7EyluQz8hSTZzHcjE9VzJdAfhuBN0p6Ksjwf4uQZFDqcB/Iv
	QeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=eYWyjWO6V+UOnbALgbT2iwsSOwEM7cBWZtO/KTbY8u8=;
	b=DKVQimcca2G7vN7iG4STOJVMi1forzU1Kj1qXx8IRFR7M3HYPQNqPGDt4jD1vqf0Z6
	A2ORj0Wt4Bb0uB+lLTux00BlQMkblXnVG7H2ZkonIt7vDeXO5oSGgn2EDWWIkGqtHhwB
	dasS+C3MZkVu9+1HA3nFCkA4iBSRztVfroxqM/0IDeq5rWXw2+QOSqHsL4hsRrk+tup2
	Tm5f5XnxnT8VNGBRgszO4Kkphy1R95J6qaFlYoUpwb3PVU/ORThBBdDHYAh1QJO1c+T/
	9Oc9fgya0TSWILraL41QRb5wUK1KjxKMz1xbOM3p3msQ8D3uZoX0B49zhfpQW8g9gQEO
	gOVg==
X-Gm-Message-State: AKaTC01bj9tRIPH0z9swaJEtrVvBPPG/ZyGUUGOFUZsqsFuzuOZnc7qLIsMYWJ+Dq16/sQ==
X-Received: by 10.28.36.193 with SMTP id k184mr12867548wmk.40.1481456408135;
	Sun, 11 Dec 2016 03:40:08 -0800 (PST)
Received: from sgxcmp483.sigfox.com (ram31-1-82-234-79-177.fbx.proxad.net.
	[82.234.79.177]) by smtp.gmail.com with ESMTPSA id
	q65sm30107072wmd.6.2016.12.11.03.40.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Dec 2016 03:40:07 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Dec 2016 12:40:04 +0100
Message-Id: <20161211114004.14413-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] Update makedumpfile recipe to add ARM into COMPATIBLE_HOST
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
X-List-Received-Date: Sun, 11 Dec 2016 11:40:14 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
index c9a22703a..93a6f62c3 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.0.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN}-tools = "perl ${PN}"
 
 # arm would compile but has never been tested upstream.  mips would not compile.
 #
-COMPATIBLE_HOST = "(x86_64|i.86|powerpc).*-linux"
+COMPATIBLE_HOST = "(x86_64|i.86|powerpc|arm).*-linux"
 
 PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/*.pl"
-- 
2.11.0


