Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 846A96059F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 07:39:43 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id t79so349792855wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 23:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=p795SZHJZHgSx2/1F5hjM2woDxctfmEVEFRVrNPJAL0=;
	b=nj1BHdOSiRabcjBOJ7mHkx0n2H0lyUJQoJYF9RiZYyNkgKiHp/RvVuJPwgXeimrECs
	sN9rs/D7pDAjlKZqEEHMG4KOcEWK8o43a3gV9NMwq6lvivGCwRuhr6cjawQAInJjpHc8
	+qnmpAZpGryazg68/uqW7gLivS2ciQ2YQkk5f3ZwUdiug7wFYlYSMKCXKZMKxfL5867T
	AIL6BlumLAqjqLS2KZRFNb/1+KMKFWFRqVKpuDb3FzyOrieW3Rj/swPBmyeEYS0Zczb6
	JML2rUBf4EBAbDWjqZAsHuLnOCO62WzyXxkuEs3vGVaNxh/o4fJKuxxLq284xNxR+vaL
	G90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p795SZHJZHgSx2/1F5hjM2woDxctfmEVEFRVrNPJAL0=;
	b=QA4sUbgL8wBO6b6aeQAYx24Unaq7FFi4MrgzvXyD/QzO4ZGMskKG3KDXJ9X/nDhQgi
	iJDGKb+aBoL7+FaWiMNQtuy46vx/JQagZCuiK+WZhrBzaXE8TIIIF6lLt3CvAGQVXr+h
	JUOCx7rKTaWemriwmW5CrWZuSRf7WaQ7RSrfksO9CBYqT/gM6oQoZ10aJmrRXAauwNdJ
	mNtx8alZR0eflKqK0LaqVOHokhI5h1Olxn59ysjox4RyxfezaFN255rlrOswErwAsv3Y
	oMPvQMeZEwUut6Gup4CK3Ji0dSwUfLvgS0XQxCI1kraS8cch8FzsA3kXwLXF/b+FjRpI
	mbnQ==
X-Gm-Message-State: AIkVDXKyllXFcsnosJiAeaRqPErQ2541h1TYogWY7x0mUlnL0ifnoTMKOB9eLkb6azvW0zoI
X-Received: by 10.28.51.141 with SMTP id z135mr37377033wmz.109.1483083583996; 
	Thu, 29 Dec 2016 23:39:43 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	di9sm72239163wjc.37.2016.12.29.23.39.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 23:39:43 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 08:39:07 +0100
Message-Id: <1483083547-20282-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] iperf3: update to 3.1.3
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
X-List-Received-Date: Fri, 30 Dec 2016 07:39:44 -0000

Version 3.1.3 includes security fix and all users are encouraged by the
developers to update to this or newer version as soon as possible.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
index bcf6537..d19aa1e 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -16,8 +16,8 @@ SRC_URI = "\
     file://automake-foreign.patch \
 "
 
-PV = "3.1.2+gitr${SRCPV}"
-SRCREV = "4fbdab392caf6fcd77c538b6712b721a56ff31b8"
+PV = "3.1.3+gitr${SRCPV}"
+SRCREV = "099244ec686b620393e9845478a554b1c7ca5c8b"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


