Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYI-0003rN-Oa
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:50 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592229fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=r7hYObKZksL5HSIbJPxuy2UQJ5ampHOUOppeLnGhg68=;
	b=euc6iPpsBHMuNQZwKTw5w8WnxLE7Dzv5d+HjvYHkoo3cKcPLfrtG/B0EdYbAlZN7qq
	/uQepKGIvpfMxB88X/qPiyhvnDN9sMIRvEmmJ5dNbHfL58tEBRlB9GJN6quSFbOdkGmA
	KeWOLFOnoaWFSZbt29UGpQ8GRU9d03DvxJoow=
Received: by 10.223.97.151 with SMTP id l23mr2003341fan.107.1316345017956;
	Sun, 18 Sep 2011 04:23:37 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:37 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:07 +0400
Message-Id: <1316344999-26642-6-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 05/17] opie-today-addressbookplugin: add dependencies on opie-today and libqtaux2
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:50 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../opie-today-addressbookplugin.inc               |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-opie/opie-today-addressbookplugin/opie-today-addressbookplugin.inc b/recipes-opie/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
index f5352a2..0bf5d5f 100644
--- a/recipes-opie/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
+++ b/recipes-opie/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
@@ -3,6 +3,7 @@ SECTION = "opie/today"
 LICENSE = "GPL"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+DEPENDS = "opie-today libqtaux2"
 RDEPENDS_${PN} = "opie-today"
 APPNAME = "todayaddressbookplugin"
 
-- 
1.7.2.5



