Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SYLFM-00019X-4H
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 May 2012 19:57:58 +0200
Received: by werg55 with SMTP id g55so1245739wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 May 2012 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=TjDL2ptKb6f0pTrgXoxsN+hC0i8fThZ9M70y7Fhh7p0=;
	b=lBq5wO3X7ICedJiNIDGlEtOZ+qjIQeOgwMoYVE7Bp6Zm9/a7n3LkXkra47hjmd99gy
	AghiIB70dS/QeOTO9BlX16xl6vguTI2wdAqd2W/0vsjgL7tgY6z+sCdRr6X6+wlkp0l9
	ZfSvGq+ERpV7folTA2y9USF7kfoy3HF7CkIelsaqaJ7COirJePzxX3RqOwExLTyzlYFj
	PW5Etre5bQDd+3WV7DRXq5qxvwlh9MYxjFPx8lhXy16gCGAp60875e2EgwjRjk1cuDZ0
	6YDwINt7QiGkWBXq7iTQA9BuP9248cNMwtniPQWt99qEjGAzByISwyoKqhF0eEk1ls10
	8VkA==
Received: by 10.180.83.197 with SMTP id s5mr4651993wiy.9.1338054454470;
	Sat, 26 May 2012 10:47:34 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3F27.dip.t-dialin.net.
	[91.10.63.39])
	by mx.google.com with ESMTPS id m1sm6672902wic.6.2012.05.26.10.47.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 26 May 2012 10:47:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 May 2012 19:51:37 +0200
Message-Id: <1338054697-9996-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338054697-9996-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338054697-9996-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/2] systemd.bbclass: Unbreak systemd support for recipes with SYSTEMD_SERVICE without extension
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
X-List-Received-Date: Sat, 26 May 2012 17:58:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To set service files the following syntax is allowed:

SYSTEMD_SERVICE = <service_file>
or
SYSTEMD_SERVICE_{<systemd_package_name>} = <service_file>

First option was broken by

author	Martin Jansa <Martin.Jansa@gmail.com>	2012-04-24 13:11:44 (GMT)
commit	154d0bb399ce6a0bdc2bf756d1a8a9c77dd0a755
systemd.bbclass: allow recipe to inherit systemd with empty SYSTEMD_SERVICE

The error was discoverd for networkmanager.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 1edd1e4..c04b71a 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -190,7 +190,8 @@ python populate_packages_prepend () {
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-			if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
+			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
+			if systemd_services != "":
 				systemd_generate_package_scripts(pkg_systemd)
 				systemd_add_rdepends(pkg_systemd)
 		systemd_check_services()
-- 
1.7.4.4



