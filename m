Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FRG-0005cL-AX
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 08:38:14 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1154438eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=NHLMsVHSvZlS8dPA4mfy2UacfFPKXz6UtKB4VAUdoLc=;
	b=pkfd5V+v4sCY3BWa/8P6xJYi8R6MIEA4UJTmMChRFKNHqnD8wh/N/W4UAiXWzIixBU
	bYSoxa0ddkU7PTywKBZOBfmt6xaETEyI9zAHuo0AwKK8ozDMVKBP+lsz6QWQRVwtzqIS
	7EO/mqQv6CIyfibABo0t7VxmZX7OWdLkCRD0Ew/K9b4yLihC4UT7kLJ4UOb4VZWbu2/W
	zRoQgAZueyhw187lSCOEyaoVLtr7DK1TgZC8fQn6lythaqQZajZBzlRVrX/w3KON8rRE
	QvVgJRwECbh1VEjgLu9ZmwFxcBHVAXjm/rMh2asFty98g/HOqK6cESjaAAG0N5c98m1N
	S6dA==
Received: by 10.14.181.132 with SMTP id l4mr20784231eem.17.1346135164217;
	Mon, 27 Aug 2012 23:26:04 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a7sm58115037eep.14.2012.08.27.23.26.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:26:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:25:45 +0200
Message-Id: <1346135149-11256-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
References: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmo49A3EvisF1mt5SYAoff4lunl/WER0vStTssQ3P1vT/LtQPDeKKGN4rKnvRPQgedKJjpN
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH 3/7] systemd.bbclass: remove unused code
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
X-List-Received-Date: Tue, 28 Aug 2012 06:38:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/systemd.bbclass |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index db35717..2881abf 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -54,11 +54,6 @@ def systemd_after_parse(d):
 						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
 						( bb_filename, pkg_systemd)
 
-		# check SYSTEMD_SERVICE
-		for pkg_systemd in systemd_pkgs.split():
-			service_pkg = 'SYSTEMD_SERVICE' + "_" + pkg_systemd
-			systemd_services = d.getVar(service_pkg, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
-
 	# prepend systemd-packages not already included
 	def systemd_create_package(pkg_systemd):
 		packages = d.getVar('PACKAGES', 1)
-- 
1.7.7.6



