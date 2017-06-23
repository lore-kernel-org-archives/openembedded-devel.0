Return-Path: <net147@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5527371984
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 06:24:46 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so6113710pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 23:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TMRFGnb5+F0IKG5oF47MkLaRYkwgrny1+6TFxyqNSDE=;
	b=D7HXlJHiYYeZkm5LTUZkJy59foEeswbTBcbIV9TC9RBb+Xbhxxw0n4i4/51aHDgLDS
	e7LQ84bUdUUq7+ol3ZPwi7/jUVPc4hCUyyZtVUjOi/TfrCVxh3T88wKMhcCmjOWiSRvA
	F4vxnrfYCOpTaQtNzixYCSTrqn0Qi+/E8W/JExRsShjF0OO5ty6Y+cJLqMJBi+krTTc6
	RiK9LBsxZ/D+JIjf8m0M7MrPu5h8vZKIcbBNnR1Mh1QiYc4phOZDrnm5vAkdu1ryr0yg
	JbLkoKfLy9KzfybWtD8jxvpMWelAC2oKnnBkx4nDwYbi5KRtkt6+hIYYmCntqaAc2WEx
	LAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TMRFGnb5+F0IKG5oF47MkLaRYkwgrny1+6TFxyqNSDE=;
	b=bPLo7CgnhKqPmT1a63kGzwtleeyIFrfA7VoWgCunrg4/jxE9fuNuMX1GSeioWbllXT
	5Rdxs7Jp8dOOMXIhTlcuEsbLhYpjzgBA5ksg40VCSuXlP+dBbOPlBnT0JRkyqhSoiS/D
	Z8T1Hj6l9wCjv52oikAjtM437A7dXU5KyiWv5oNcYBWOWaCPpAy4IIRcBFBaMm25fK77
	Ux7SZzT0wBmtrHKOohH39OTb9mW1WCI2EUOrfzjVz4uvCm6aqKgBbuX85gl0vKuVXXlX
	aacIN7HZpXgu1Cg4KKHoNcIl00hnmgXEG2YM337CVgIdnH1hMVZgj+56L+yBEgBbrmou
	rvYg==
X-Gm-Message-State: AKS2vOwpJwfK7bdhyS0UHRDSTogmyIBoXsfIlR9lmzmV+mnRDiZYLOSm
	Kmkq6mFO/g62oQ==
X-Received: by 10.84.241.4 with SMTP id a4mr493104pll.160.1498199087832;
	Thu, 22 Jun 2017 23:24:47 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id j6sm8233809pgc.1.2017.06.22.23.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Jun 2017 23:24:46 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Jun 2017 16:24:53 +1000
Message-Id: <20170623062453.21908-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-qt5][PATCH] libconnman-qt5: update to 1.1.10
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
X-List-Received-Date: Fri, 23 Jun 2017 06:24:48 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb b/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
index 3ceb355..9605777 100644
--- a/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://git.merproject.org/mer-core/libconnman-qt"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
 DEPENDS += "qtbase qtdeclarative"
-PV = "1.0.98+git${SRCPV}"
+PV = "1.1.10+git${SRCPV}"
 
-SRCREV = "8d4580a55ca02b84fc3db374c6530e39c94e0d92"
+SRCREV = "4d6def3053eaccaac04e4f9e03ee24dea8b9e8d8"
 SRC_URI = "git://git.merproject.org/mer-core/libconnman-qt.git;protocol=https \
     file://0001-Don-t-use-MeeGo-as-prefix-in-order-to-make-this-a-co.patch \
 "
-- 
2.13.1


