Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7747804A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 17:01:57 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id i14so141765qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ITdlRCTkuI7meCFj0C+51mfGfV4At+4DrKgSJ7JhgqY=;
	b=nQj5E2t4vzfughPkaHNpBKDzVM8Icy1cOc2vAThTsVUV96IM2VCxygDeVLu/SZUD+U
	lW/9ISscINT47ZDATc98VO9l8WEizFYaM/c904qormcxIjTPJYbXkNfht1y0jDwlllKb
	mAUIi39ijThovbzH1hM7rqvGo/1drU+EUEcz/FeREMY/E8StBdTqT2nhDlOY2RF+sDGR
	MrP5dHWhSkdCY1xdGvxc4WGNKgV+kwx6OSA4jEnw+jJbIEwN7ny5WN3Usy1baVBRcovs
	6dIZrK7wt5r+LatiIlqvL9N1zj5S+ft3hohkQek5ZWyJANlGBSLqyGB3hvx7EZTaGv48
	BeTA==
X-Gm-Message-State: AHPjjUgTQEZT65RJ1Edk9rL2rXei0dZHyrcThpe2EV9TpbwR9XSPDdPO
	iN1k3LdSR5L5VgqlDiGXZPBWQ0FR
X-Google-Smtp-Source: AOwi7QCvphZcbvnMD9dgcNv4EYbCsRpx2hei0IDs5hjvEg1/mGwO5lSyovN0GjF2on9B4GoRmNwKFw==
X-Received: by 10.55.33.75 with SMTP id h72mr2717667qkh.132.1505840518508;
	Tue, 19 Sep 2017 10:01:58 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	d22sm7142562qkj.88.2017.09.19.10.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 10:01:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 13:01:50 -0400
Message-Id: <1505840510-25930-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] adduser: update to version 3.116
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
X-List-Received-Date: Tue, 19 Sep 2017 17:01:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-perl/recipes-perl/adduser/{adduser_3.115.bb => adduser_3.116.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/adduser/{adduser_3.115.bb => adduser_3.116.bb} (92%)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.115.bb b/meta-perl/recipes-perl/adduser/adduser_3.116.bb
similarity index 92%
rename from meta-perl/recipes-perl/adduser/adduser_3.115.bb
rename to meta-perl/recipes-perl/adduser/adduser_3.116.bb
index c211862..112a5f0 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.115.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.116.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_${PV}.tar.x
            file://adduser-add-M-option-for-useradd.patch \
 "
 
-SRC_URI[md5sum] = "6bb6d93922d281f1b56393a53f8ce5fd"
-SRC_URI[sha256sum] = "e7288281d4d1eec2948ba3687452ca33a8224d40c98d321bc3fbaefcf6d4c0db"
+SRC_URI[md5sum] = "e042a5842b8f24312d6f5a99a1af8f2c"
+SRC_URI[sha256sum] = "72d811ad3ba17d2794b14d19acd1d6b57f9dd31d9250d51e786895dee2daeac0"
 
 inherit cpan-base update-alternatives
 
-- 
2.7.4


