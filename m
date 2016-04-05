Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 979A3605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:38:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n3so1223229wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZVPQ/BSN5eCrXYcZayu3goTdTenlpHfiGMViNUrkK8U=;
	b=E0nvn9IhVh0WLSHP0V4JMRMnUQFSmj8VbVs+VLgnPiikzD5limIbtAdjLVv+pd5YQ5
	ugvk+2BZTeYTW2no1nXI1XZyucz3l3TSysQ1r6YCjy6AAT2We0RymXfqZH6e13T4xg3J
	QaT4y9/YTKQkstTu3W+XXX7+dcZ0AUaHrueWEk5Mo4liab+xBG9rH8FQnVJEdDYLlkO7
	5Y+6zICdgBMadPmC4M/kHCK8ZhxB5qzia+01GzojKQLQpcoAcXlW7XgWs4PfNAC04J2P
	4GfgGk2dXvOazz2HmJ0HbtnF9asEasoeCzZ+rZbdAbk+dc4vdE4AjZEDEZj0r8iepGY8
	aGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZVPQ/BSN5eCrXYcZayu3goTdTenlpHfiGMViNUrkK8U=;
	b=MhTBgnahH3MHYUQ/PPT7eBamXA3vTIRiIsVsSEACeWcj/eT6wCRIUpOQvlmpzdjBGQ
	lYDENTe9gkXJwrnK97/diPlgrszrjoX9MJHfS0mmIX60fq5TlAw1mKX4n/PPXIlPNuFq
	f10J4o+PpBC3XCFp5SXslpJ/cqBf09x/AWeXlyOehtnHJOAT9bc8BwOnduNGFOVbHQkh
	onZ5lxCLwpnQMqnnv7G8dN4TYlN7k7MlGaBSRj8/+P5DfZ6awj89ON9nmUoiNnVFh0lL
	uy2fG/0ooWxOXC0/fcmBxCS6/KKIhlkk5aAvQgZbUs56JOlZU3kb0lgk7LyTNqiLhyUe
	O32Q==
X-Gm-Message-State: AD7BkJIgVPzZ9OqDcq+X+wNu9EEZFlHwfZAV+Ck9InpLoVu4lY4ldF+cxo0RrAJ5OfNLFg==
X-Received: by 10.28.45.212 with SMTP id t203mr15534254wmt.71.1459834740071;
	Mon, 04 Apr 2016 22:39:00 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.38.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:38:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:12 +0200
Message-Id: <1459834720-17165-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 03/31] qtbase: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index bf56741..e9a9051 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "41706400f605524a5a9953714aa0cfbf811dba7e"
+SRCREV = "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
-- 
2.5.5


