Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pp45S-0007Tb-Kn
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 20:27:55 +0100
Received: by fxm17 with SMTP id 17so5246054fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=wsGcsMnI8DVu0XBLdfb6GYynxvdEEvgM+K/dZZ1SM2w=;
	b=A22D4kxPcI3UaJvn7p4nY1K54LyaOwgom7J2BdYkUCwIigYWaKFoNnoLVbcK0O+IMQ
	4FTXDnkTwDKV3wq6O+IZWHtI9CQHPigmyu17EkG4z8LQ3XGPttcj1/ZliLazmAXsK3We
	5SERTpmyjPGgMd0LCUe6gUkWLVZ7akJ4tPPHA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=RczgQW8qycXWV4uxwnsGrXMvowpYxByYjFMEp07+2th1lW1Osstm7Kv+MFxC4URIcd
	5LJQvOwjVsbR7K4qgQ72IAsv86MuY0w7Ph7/g0fla8TBKWSD7InSnphcY7sgP2Ui+HZi
	DUUTUnkT96fC/lgMJcP/A+ehROuPJsVj3RPfk=
Received: by 10.223.101.206 with SMTP id d14mr5021383fao.134.1297711393269;
	Mon, 14 Feb 2011 11:23:13 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id n3sm1257147faa.5.2011.02.14.11.23.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 11:23:12 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 20:23:04 +0100
Message-Id: <1297711384-8582-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] package_deb.bbclass: depend on apt, not dpkg.
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
X-List-Received-Date: Mon, 14 Feb 2011 19:27:55 -0000

Both package_deb.bbclass and rootfs_deb.bbclass use apt-get.

Without apt system cannot be bootstrapped because there is no optimal
way to fetch new packages. Apt depends on dpkg, so switching from dpkg
to apt in EXTRA_DEPENDS provides both.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/package_deb.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index 837efd8..a98ec9d 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -4,8 +4,8 @@
 
 inherit package
 
-BOOTSTRAP_EXTRA_RDEPENDS += "dpkg"
-DISTRO_EXTRA_RDEPENDS += "dpkg"
+BOOTSTRAP_EXTRA_RDEPENDS += "apt"
+DISTRO_EXTRA_RDEPENDS += "apt"
 IMAGE_PKGTYPE ?= "deb"
 
 # Map TARGET_ARCH to Debian's ideas about architectures
-- 
1.7.1



