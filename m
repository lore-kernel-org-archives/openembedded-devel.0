Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 40ED56BD8A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 11:14:18 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b15so7116406eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 03:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QYltFU7yaVZ4Rd+Il2/0SC/jxnU1fAH5vcPG7P2N+Uw=;
	b=OLOnBXC7W/paB2xBBNyENdK7JPKayuCFS34Af6LW9ji6vxfgR8U1ynB2iPmFNhNGtZ
	/Z+csVS1KpynOmIZ20bbQu2J/I89WyEIejIj6WahcgTvJf34vs5AVGSiY2qCRR31n4X1
	H1w7NGBr9+7G7Ma83rkyRFzxh47XNScGxCzyKQAzHjnmemKugXhrxRebnYiiawUUuB6M
	X2YkPTvnXTTMoBMRsvqWSUzXtfjwwhY7aFIUmOP3aaKH7AIrqANASXEVDZ9BTgqUwScS
	wIqjpIJgCYXjjTX6kjFGSkYdda+b7lt03r96vEjy7sA/dijm/pkz0OUCLLWplz1OerhL
	bxzA==
X-Received: by 10.14.199.1 with SMTP id w1mr78945454een.29.1388834058684;
	Sat, 04 Jan 2014 03:14:18 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm152658306eef.9.2014.01.04.03.14.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 03:14:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 12:14:05 +0100
Message-Id: <cb182019c4f7485713cb50623240c01882448ffd.1388833883.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1388833883.git.Martin.Jansa@gmail.com>
References: <cover.1388833883.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-dylan][PATCH 9/9] tvheadend: Disable dvdscan
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
X-List-Received-Date: Sat, 04 Jan 2014 11:14:18 -0000

* when enabled it will try to download
  http://linuxtv.org/hg/dvb-apps/archive/tip.tar.bz2
  from do_configure (bypassing PREMIRROR and bitbake fetcher), but
  what's worse even when it fetches it, it fails in do_install, because
  dvb-scan directory is empty, reading the script called from configure
  3.3-r0/git/support/getmuxlist, I don't know how it could work before,
  because it first moves files to dvb-scan directory and then removes
  them all one by one.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 7c8b959..65d43c6 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -20,6 +20,7 @@ do_configure() {
                 --bindir=${bindir} \
                 --datadir=${datadir} \
                 --arch=${TARGET_ARCH} \
+                --disable-dvbscan \
                 --disable-bundle
 }
 
-- 
1.8.4.3


