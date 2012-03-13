Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S7QnB-00022S-Jf
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 13:25:29 +0100
Received: by wibhj13 with SMTP id hj13so4574603wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=5e4Uvv0VIPeiSVSqkPaT+op60mRgihUpO6IK14sdh/I=;
	b=Ko5Mw9/wew37aQ4/le63rWvKq48ufgkJxwsJdY3l4I/V+4A+2BGK12Dq4RwDGlqMSD
	w2cYXsYasMyJ6M3VQt09jTzCfJNOEkRdFJyKN64i+3YLeWoq0yicQ5Y0tnBZek1is9rf
	dJVY9aEhPYbRqBGjGFWhCTQqKLgi7cu7eoKTLDRD/IVcZK7zayZrDY4/J43v6nUghAbx
	LhzGqCYvNfTucbe8KeBYfXStA4ks61UURmbV/3Q3V6XkGVZWz5XjwlW0VkU5h/bV2Ymi
	9R0/4YzPf+0hj5f50yx3Luaim+vfRcVMYG4hF9kUJMk5MquDjvVowElicO67txYM3j3K
	eZmQ==
Received: by 10.180.95.129 with SMTP id dk1mr8130124wib.3.1331641005359;
	Tue, 13 Mar 2012 05:16:45 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id 9sm1631941wid.2.2012.03.13.05.16.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 05:16:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Mar 2012 13:16:43 +0100
Message-Id: <1331641003-31546-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] connman: follow oe-core to 0.79
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
X-List-Received-Date: Tue, 13 Mar 2012 12:25:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...connman_0.78.bbappend => connman_0.79.bbappend} |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/connman/{connman_0.78.bbappend => connman_0.79.bbappend} (84%)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend b/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
similarity index 84%
rename from meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
rename to meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
index f1b05aa..167165f 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
+++ b/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
@@ -2,7 +2,5 @@ inherit systemd
 
 EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
 
-PRINC := "${@int(PRINC) + 2}"
-
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
-- 
1.7.6.5



