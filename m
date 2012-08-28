Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FRL-0005dC-Cs
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 08:38:19 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so1414241eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=jUvHUsdDXoj3zmUQaPFuoDIZh5Ffa89Xb0MQ3CUEjiA=;
	b=KjapnFdLorCqQFQtSy6EyIt8TTZmFUPb+aaHMKTuBGR4WlloFHUZgK+UwSceb2sijG
	bR3udMWz573rurPDCYbsGvwJk7Kj14LuuBWcXKMA1AyEnWRv4WdW6BAfkNaXsKwmcbr3
	SV3pJMQsEU/Dq2Cl59aROOUNaC9wwMfnZe4Q8yQwqAxveVcKrrLM3262XQvteUo3xvbP
	KWGdS5IyitPQzgfWbvr8N0NAuW0+8qXh8VsgZIGLfHTKb1bvgrAQhF3uKe596Rytt6yu
	c+ovEQQUMlsZ92lFDA3lnpQl4P/U0+DVNvLkoYF/RQE2N2jvfu3DbvlAx5rAwJWpG4Ze
	4WaA==
Received: by 10.14.199.67 with SMTP id w43mr20627815een.33.1346135169323;
	Mon, 27 Aug 2012 23:26:09 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id v3sm58136880eep.10.2012.08.27.23.26.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:26:08 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:25:47 +0200
Message-Id: <1346135149-11256-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
References: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnoXd8vpjKAJySiLasWVUwYQhJmH0kXAxhWiqZP87ZSxM5uFG48ZjmGCyaUApWiEOI13KnV
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH 5/7] systemd.bbclass: do not warn for systemd files are in ${PN}
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
X-List-Received-Date: Tue, 28 Aug 2012 06:38:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Since we have our own layer there is no need to separate out systemd packages
---
 meta-oe/classes/systemd.bbclass |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 2e585c3..babe15e 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -46,18 +46,13 @@ def systemd_after_parse(d):
 			if pkg_systemd.find("-systemd") == -1:
 				if pkg_systemd != d.getVar('PN', 1):
 					raise bb.build.FuncFailed, \
-						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
+						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
 						(bb_filename, pkg_systemd)
-				else:
-					# Only complain if recipe lacks native systemd support
-					native_systemd_support = d.getVar('NATIVE_SYSTEMD_SUPPORT', 1) or ""
-					if native_systemd_support == "":
-						bb.warn("%s: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd" % bb_filename)
 			else:
 				pkg_systemd_base = pkg_systemd.replace('-systemd', '')
 				if pkg_systemd_base not in packages:
 					raise bb.build.FuncFailed, \
-						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
+						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
 						( bb_filename, pkg_systemd)
 
 	# prepend systemd-packages not already included
-- 
1.7.7.6



