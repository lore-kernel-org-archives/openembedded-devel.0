Return-Path: <andrei@gherzan.ro>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3FADE60CFC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 15:55:06 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id el20so3821516lab.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/5KmsBATRdYLDGr6qLva1YXaMvtKzck3E5ir+uk+wbM=;
	b=D7XYLNhxObZlaiyA34vjauLyRWpH39Rj3c7gpECUnHC7U/Fo8tqEgMuX8bFFhqWfA8
	T0XemglF6Or+rClMQSfLbyE3RibtGc9YaJWsEUsrwSJ5VhpVng42PV0/kKq1PHFj/peD
	gZbCyuHc5DS9nDAitk0H6nn7eM9AJI6pQp74TsEnRJ/pkrrb5Yo7MbSJEdBKYyLp9OuI
	RaHg7kVHKOs2bUHmxhYmX+ZRkVe0UWfvjw+RbTYotT0eNxUXfvk3jiO0gqfb3yPYoLEM
	PG7d0HGyiQRIZPYebrQ32HKrfuNHXp7RilnoVVQ9A5Z4zd+DhKDrVOd1aHF9H3DZi6+X
	rcFA==
X-Gm-Message-State: ALoCoQlAlYJ/2gVZ0h2EIh2oS3Ej0Oxqg128UdIEK5u12Q8bxr+U5D8QVg3E+Zh0gJ5/Cp9dFYBx
X-Received: by 10.152.29.230 with SMTP id n6mr24169072lah.29.1408290907074;
	Sun, 17 Aug 2014 08:55:07 -0700 (PDT)
Received: from otp-agherzan-l1.gjk.dk (dhcp-189-34.gjk.dk. [195.249.189.34])
	by mx.google.com with ESMTPSA id o4sm8819275lag.47.2014.08.17.08.55.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Aug 2014 08:55:06 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Aug 2014 17:54:57 +0200
Message-Id: <1408290897-3508-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH 1/1] libcec: Update to v2.1.4
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
X-List-Received-Date: Sun, 17 Aug 2014 15:55:11 -0000

Change-Id: Iaacfe4506b8ce68443fafd1eeee6b3eea6ff667d
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-extended/libcec/libcec_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bb b/meta-oe/recipes-extended/libcec/libcec_git.bb
index db032f9..0f2a64e 100644
--- a/meta-oe/recipes-extended/libcec/libcec_git.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
 
 DEPENDS = "udev lockdev"
 
-PV = "1.9.0"
+PV = "2.1.4"
 
-SRCREV = "9884e9ffc5293de5bb9092db1ed581f213a678df"
-SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
+SRCREV = "81e38211724bc6e8bd7a60f484433053ed682635"
+SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.3


