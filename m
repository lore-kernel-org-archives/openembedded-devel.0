Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3DCA5770CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i204so1222109wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eVyH1qEaxAJLSOcBX9Zqc90vrUCU0DmRvqamIg1+qN4=;
	b=QvzD6OEiaXkjsi9qy+7HtL8E91N/D9tMvAnJPp9qeAHAVsig3CQRVe8ktw3mhLGeUV
	+/cSR9bmlfIcKFVG5i+o/a+pES/Xd1CYnWVAsNPkp9WXHHcvkZbgqOk0P43J39SafDxc
	U2MLdMk7HiDgMqEMbG5vgc6td92dzNnsgg3eEP6/MTfIMkR+IQQIUEr9jD8wUAbxNlhs
	fK8njtE2lPMu+3rdgWb1lSuKWGbAIIiLD5ltrO5MZaIZZga0ObmQvwxJosUXDWc3q2QL
	sne6eHfm/8CBfUtrwYRBHmEF13op9s0rLQgVEoUMnMpqOqTws2W/qrKGUbjpWof2eLzk
	J5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eVyH1qEaxAJLSOcBX9Zqc90vrUCU0DmRvqamIg1+qN4=;
	b=MOFyXhusBqSoa8hXOYT/CqtIS9s0dgSHxQflGoqDXKvJDliSyrXFudXcfNWKU8jT3m
	q+3I1XsSpiLfL8jfIp5jJaSIdxrB8PUYk0sYTyUsr50+EQZYcZg+HyYFipH2E/QEit6a
	XmxZSQWDPvizIFKWyx17BxMJQVSwjuzq+rYb4K4LvnAjh4/oba2kS1sdXd0B8KioahPT
	vcvoKsE9kb7EE0pd1wZu9VeAB7odWL6yJZYfWAPKf/3D7uLq9uK0z1y3CGVI2jfGumqx
	fFUjs/PByRqE8xaH4BbVDVd8eciR8R1GmFEbatpquaf5V96JjOTy+ClNFFULJ4chtXiY
	dK6w==
X-Gm-Message-State: AD7BkJIQw6vztOj4CHiKiXu8KQjvMMHZKIGknBLSOlxGo4NgH/fD/EiHonHY0ZHshDBqWQ==
X-Received: by 10.194.2.41 with SMTP id 9mr14133955wjr.10.1459834758877;
	Mon, 04 Apr 2016 22:39:18 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:37 +0200
Message-Id: <1459834720-17165-29-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 28/31] qtcanvas3d: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtcanvas3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 4990f34..205593f 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "b351fb164af327828c9bdbc414ffd8e47e387e8c"
+SRCREV = "5a17c4ca0552c9f4e6b5646f0cee2b21a55c3d18"
-- 
2.5.5


