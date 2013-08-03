Return-Path: <lpapp@archlinux.us>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id DF6BD6AE6B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 10:39:08 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id t61so1247226wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 03:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=cBX55xwY46xiRdYysJ5v9uVXeqYUdKkVA6vV3n5DN0g=;
	b=lOvH2NtwPuNXNXxF9Z0PcGUGW5rhWc2/wo/EvDnfSy+QdfV+lapZnieopQcCFuPxW/
	7JN5hq4WWzhreZcgkX8f9uacQJxEejuQqQfTW++sZ45YeWwKeHaoPRnQ07Mq04wNd8kf
	soZhPUJnxxWOiQzeoXRDuSM9Ba0kJa+vcqS7hgvx1ZpAoAhPZ1H3TbdZb8PhKePVq2Xy
	q8F693xlD4gKH4TUT0BauxdDXlzUPQNa/unA5v3I5Pt8Vw/ybxvOovF4KAAN2Y5GnFZ+
	Cy/vwJAZPgru1f8ziUU20rSV4pI8dZ8FuNNJ8nqw9TeYpeuBz4Vke1GXGY+q1On6s+BE
	rA0A==
X-Received: by 10.194.201.168 with SMTP id kb8mr485546wjc.63.1375526348936;
	Sat, 03 Aug 2013 03:39:08 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31])
	by mx.google.com with ESMTPSA id bt8sm1442407wib.8.2013.08.03.03.39.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 03:39:08 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Sat, 03 Aug 2013 11:39:20 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Aug 2013 11:38:47 +0100
Message-Id: <1375526327-16139-2-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1375526327-16139-1-git-send-email-lpapp@kde.org>
References: <1375526327-16139-1-git-send-email-lpapp@kde.org>
X-Gm-Message-State: ALoCoQki/Q+iwHtiiBIgmf3WzqXy97RWOB0NwqaRbpaO8zVATjYFlgaa/S9jyExXk+7ALNUGoisq
Subject: [meta-qt5][PATCH] Add QtSerialPort
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
X-List-Received-Date: Sat, 03 Aug 2013 10:39:09 -0000

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 recipes-qt/qt5/qtserialport.inc      | 3 +++
 recipes-qt/qt5/qtserialport_5.1.0.bb | 5 +++++
 2 files changed, 8 insertions(+)
 create mode 100644 recipes-qt/qt5/qtserialport.inc
 create mode 100644 recipes-qt/qt5/qtserialport_5.1.0.bb

diff --git a/recipes-qt/qt5/qtserialport.inc b/recipes-qt/qt5/qtserialport.inc
new file mode 100644
index 0000000..bbb05a6
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport.inc
@@ -0,0 +1,3 @@
+require qt5.inc
+
+DEPENDS += "qtbase"
diff --git a/recipes-qt/qt5/qtserialport_5.1.0.bb b/recipes-qt/qt5/qtserialport_5.1.0.bb
new file mode 100644
index 0000000..9b6f7da
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport_5.1.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "1f70621ae40cbda948106b070c6c37d2"
+SRC_URI[sha256sum] = "0f36803c480b2b7111b343e9dd871ffab1b4fd53147bd564125ef2994b09cfb9"
-- 
1.8.3.4


