Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSF-000812-8B
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:27 +0200
Received: by bkcik5 with SMTP id ik5so2247550bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=lhnfDjx9I28ndKMHiam0ZGEpVGApB9yZLr65zPKUgRU=;
	b=in4ovYE+L8Dn65ddR/Tx9oHGN0Fu5Ogrf7u1YWWaKMiasXAM2yH74DX6MPdFo6Qr+p
	DImdgnlU6r2Egg4qn1fritRYMado0EXJeKioNqdH+pXZiIZImR/ylSIvMyLCZ0gc1F0z
	GoHDBjyZS55K1E3h70npezzRcSOMJBg3BSg1E2PZWJ529NYDHXw1+Tlkue4s5iio4Tva
	nKx9ZGI8Yosne53LF1C3mHmQB8cGXE1IAOtRLYV+4Mv8DCgTOfrm1idek7DKMKH5gcH1
	hefqbRgFGUkawTdsgkON/KgcPXtguU3oruNXSX8EuvxgtAF3o3w/TpjwJpzSnITT89+1
	3NYQ==
Received: by 10.204.13.82 with SMTP id b18mr112509bka.118.1342168273345;
	Fri, 13 Jul 2012 01:31:13 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:12 +0200
Message-Id: <1342168240-7760-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 04/32] meta-oe/layer.conf: systemd-serialgetty moved to meta-systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 08:42:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/conf/layer.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 6f05871..550f8cf 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -25,7 +25,6 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   pointercal-xinput \
-  systemd-serialgetty \
   mplayer-common \
   task-x11-server \
   fbset-modes \
-- 
1.7.6.5



