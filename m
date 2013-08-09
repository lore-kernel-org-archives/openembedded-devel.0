Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id D62B56B478
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:54 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so1994810eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/OKx/Eo/gZApneREnX3xWqLevJL0TeVsxu4ogb+O7SU=;
	b=tEqFNj1ox0A/lSASUmY1UrwtuUFmOAylEdBkPGLJj8aRrZexn7UOQhifscop2VjRNd
	TTa8sZgr5nzsGEMTqDGi9jhOivY1zA4N6C3cTar/WXIg4p7tKrayUsT+m1OstHAfHChi
	QyLZ5v/B8jFASRFjC/btmSR3Gz/7cocauXwAADh8WhHlw5KWPbmfCHqspdtJ4WB7qTVN
	Szd4+ijcftNFz8+pRfGtwgngzYQcBb2xSTAkS4m2V/sIikisEh4vdLAwOpJ7ggP7ckDG
	9bKaYQlcvH2MkNnyhD3lw9xuDOCMFLyavg+bt5DNjZhJkcGDJBwv3oeXqjWbzrA2XFTY
	SBkA==
X-Received: by 10.14.88.65 with SMTP id z41mr12063995eee.38.1376038435189;
	Fri, 09 Aug 2013 01:53:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j2sm26793534eep.6.2013.08.09.01.53.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:26 +0200
Message-Id: <1376038471-32202-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/12] start-stop-daemon: add dependency on ncurses
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
X-List-Received-Date: Fri, 09 Aug 2013 08:53:55 -0000

* fails without:
  | configure: error: no curses library found
  | Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
index f8a1ef4..06db8c4 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -3,6 +3,7 @@ package"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aaa7a370ce4"
 # start-stop-daemon is usually shipped by dpkg
+DEPENDS = "ncurses"
 RCONFLICS_${PN} = "dpkg" 
 PR = "r0"
 
-- 
1.8.3.2


