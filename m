Received: from [209.85.219.12] (helo=mail-ew0-f12.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LaU0p-00054u-Jz
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 12:57:49 +0100
Received: by ewy5 with SMTP id 5so303790ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2009 03:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/ugVV/OrMl0NJO7uRjxge+lVI8kKCW+hoOCWuc3Wpq8=;
	b=AyEliDXgeCdiTHXirtfU3LUv/LSfwGuyGeMm/eeAg1bAXEiVrZIKzSYjWiov1qaYwQ
	ATXQIuO/MH99DWAjoPW4lxynIwNLjWrLE6t0cVM8fSqW36XPBcHe1h9jVs7DaOEvFujK
	PZko13sZVZd8uLRODlvK8QpOBTpftaAOIk9cs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VNeu0DEmJAxCDvlk6Zi/qjAKfqOw2PPXnRWwI0HKBSdv5OqzB0dUNSAwwC/99zftRr
	+/sAH2LGv3jJEzRWwAPyTpXHn4/J7hMOpCYNAuDYSWMYckynxvWPEpAHovpBAlJal3yY
	vingqitZjzxam0hXwpWhPvB9cc4igEyL6GFro=
Received: by 10.210.51.10 with SMTP id y10mr589853eby.52.1235130919742;
	Fri, 20 Feb 2009 03:55:19 -0800 (PST)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 5sm1673823eyh.41.2009.02.20.03.55.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Feb 2009 03:55:19 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Feb 2009 13:55:13 +0200
Message-Id: <1235130913-15461-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.2.rc1.20.g8c5b
Subject: [PATCH] Check if package provides qtopia-core not package name
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
X-List-Received-Date: Fri, 20 Feb 2009 11:57:51 -0000

This change fixes dependency loops for qtopia-core and qt-embedded.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 classes/qtopia4core.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/qtopia4core.bbclass b/classes/qtopia4core.bbclass
index b5f10fa..214232d 100644
--- a/classes/qtopia4core.bbclass
+++ b/classes/qtopia4core.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_prepend = "${@["qtopia-core ", ""][(bb.data.getVar('PN', d, 1) == 'qtopia-core')]}"
+DEPENDS_prepend = "${@["qtopia-core ", ""]['qtopia-core' in bb.data.getVar('PROVIDES', d, 1)]}"
 inherit qmake2
 
 QT_DIR_NAME = "qtopia"
-- 
1.5.6.3



