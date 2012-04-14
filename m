Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SJ3oX-0003wK-PS
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Apr 2012 16:18:57 +0200
Received: by wera1 with SMTP id a1so2502891wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2012 07:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=HIxd183Q5t1W1woJIimblW6GgyO+7xeyokZ8msRByjU=;
	b=OCtDrsc4zFyB+Rh5vqEf3akzcaWsLuNuOM6pHw9IH1MLbPu/oGjOjZYgkBaCS+AcUX
	AvC6Zm2V9p/5WEYBhtwzkluH6mFSquSv0AIyRG9GAmqWwFYZct5DCDLAmMaBcy6/daJs
	RTESwruD/ANXMxC+JtVW+YFRQKv7TZqD5zz8iwz1sNLcza6pgERDWIn3EJ1jzIKJ5Pop
	y68Vk0rGrVOIRS8krWqq5ey4oaMDMHoe+e9ZnlfB90Uo4VFfFdOLadj1XU8o5ITszT1O
	ogBmr+STyJlye4HigyVBlNS9b9WE350EZvVv+xA6nBHRG4fQWqHS840Y6zLMA1ebusET
	HQZg==
Received: by 10.180.102.101 with SMTP id fn5mr4453567wib.6.1334412575239;
	Sat, 14 Apr 2012 07:09:35 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id e6sm4655896wix.8.2012.04.14.07.09.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Apr 2012 07:09:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Apr 2012 16:09:32 +0200
Message-Id: <1334412572-19597-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQk/xHTAjyB8k5vM3av4DfYG85z2hnLFHAP3n7bXYn24qQh0UlDhS/536jxwIR+xHKAnoAou
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] systemd: create empty machine-id to fix first boot failures
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
X-List-Received-Date: Sat, 14 Apr 2012 14:18:57 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index b23e5f5..f4ca72a 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r26"
+PR = "r27"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -64,6 +64,10 @@ do_install() {
 
 	# create dir for journal
 	install -d ${D}${localstatedir}/log/journal
+
+	# create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+	touch ${D}${sysconfdir}/machine-id
 }
 
 python populate_packages_prepend (){
-- 
1.7.2.5



