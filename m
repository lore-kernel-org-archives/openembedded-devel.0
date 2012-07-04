Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SmRsG-0000MG-AW
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jul 2012 17:52:16 +0200
Received: by bkcik5 with SMTP id ik5so3430572bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2012 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=OwOFGLfhyZNM8vWlkPDtHaQVoWrnQ33HoRA2moFStw4=;
	b=bButgu8Od11CpLd/tr3OgDWk9Xgvi7YeQcbOf9d8ltDGUQVIA8RjJmkArqZQXPQPSh
	gBGkO4gSWghhbk5ZGY+JySXPeLkMg+EJmKfvVqNzxXFeXGke1JtJX0o673+2vFTdRMI7
	x7OR3CvrIDKf0zFKq1Q13Lunx/w5GNEz43r7IRkWLqvpH26i3ejr6gQ8YBzUCDkUjMhY
	PygGiC+WeyGb/+MHKEduTJh2QTahSM7BemaWU3a7W+KLrntwZTckRuPe3PnGNHL26z3l
	d7k6bQdUv/CR7n131VhuEbw2QX7xGJpZI1GiUc53BetxiC3+vsCfzebmTbFERjGeap/p
	DJHQ==
Received: by 10.204.145.76 with SMTP id c12mr1263342bkv.70.1341416473175;
	Wed, 04 Jul 2012 08:41:13 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id h18sm19243241bkh.8.2012.07.04.08.41.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 08:41:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jul 2012 17:40:51 +0200
Message-Id: <1341416451-20362-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] lighttpd: follow oe-core to 1.4.31
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
X-List-Received-Date: Wed, 04 Jul 2012 15:52:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...pd_1.4.30.bbappend => lighttpd_1.4.31.bbappend} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-oe/recipes-extended/lighttpd/{lighttpd_1.4.30.bbappend => lighttpd_1.4.31.bbappend} (84%)

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
similarity index 84%
rename from meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
rename to meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
index 1341405..df6dac7 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
+++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
 
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-- 
1.7.6.5



