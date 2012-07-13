Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSG-0007zC-17
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:28 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247498bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=6y+QShdcil5b0fQ7M7ZHg4fbHsPftu2yaDtUWGdylUw=;
	b=wJaEiIjbywzWjpenhrc+xwVAAK+53TKVvX+BAZihYO2hMgkjtMl4JEVcuyx0nymJq2
	QxalDvUUmlk5jTA+idIMWAzRjBFfzFG7h23jWrbst1fpWgaRA5LKkk4r97mfDjcKCif8
	6fiJgPMRF7YaXTgy/17l7JzQOV6d7j8SfISp6OAI5UZvD5Kw0yS7EVDv2C94Fo2faixp
	Ni1ki5yno5CT4THrwqRJi/D/3NZK/d9ViiHlH6tSKSOFIzoRUH7RNX677TZvQf24elKQ
	9tiV8y5VH0jDiRU6Uu9OvntCau7Gwfh0gCYWqKvD0OgPV86647cc5iaudbL56onPFr4/
	2taQ==
Received: by 10.205.133.11 with SMTP id hw11mr157532bkc.46.1342168276176;
	Fri, 13 Jul 2012 01:31:16 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:14 +0200
Message-Id: <1342168240-7760-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 06/32] systemd.bbclass: do not warn for systemd files are in ${PN}
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since we have our own layer there is no need to separate out systemd packages

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-systemd/classes/systemd.bbclass |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index fce314d..8af0d58 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
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
1.7.6.5



