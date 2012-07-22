Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1St5uW-0004y9-4r
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 01:50:04 +0200
Received: by pbbrq2 with SMTP id rq2so8698351pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 16:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=F0q9DvrEWwtbfRPFH7QXGm5TszIsF5T+jb0u4h6ncOU=;
	b=IegPE2pacU34AwN/Scblt4fYh0fUMdaSrn017A9l4zBaHPw9Ayiavct5BPa6HKwpcF
	uPDPUdHv2jATyjxG01cnS6m9aQ5W4PjqnYe+vxZilzvuw71EgUg7ddUDgxgTQqcNIf2Z
	VNR+92BKGS9blC99AGuuEnGdBTI1E40u52hMl4nl3UXee1RLB6EIwl6AHU5uPi1GrBVG
	gUHRqrK7tyi/IOgaV5+o58FXAK1sIJHW2RDDgb815FayIFeoBYEIZZiscJADnx8NzAIS
	WGG/JMA4u6JRw8HTKeHzPJkItpyH/fICFdCwFkrq9094Dlk6pxEOSBJ1fIesUvbNE3t3
	BpPQ==
Received: by 10.68.194.201 with SMTP id hy9mr30518819pbc.69.1343000316641;
	Sun, 22 Jul 2012 16:38:36 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id pt2sm8681773pbb.58.2012.07.22.16.38.34
	(version=SSLv3 cipher=OTHER); Sun, 22 Jul 2012 16:38:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Jul 2012 16:38:35 -0700
Message-Id: <1343000316-19353-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH 1/2] systemd.bbclass: Consider /lib64 and /usr/lib64
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
X-List-Received-Date: Sun, 22 Jul 2012 23:50:04 -0000

Some 64bit architectures chose lib64 instead of lib
for default library dirnames. So we dig this from metadata
vars base_libdir and libdir instead of hardcoding 'lib'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/systemd.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index dd9f326..4036f91 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -154,7 +154,10 @@ python populate_packages_prepend () {
 
     # check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
+        base_libdir = d.getVar('base_libdir', 1)
+        searchpaths = '/etc/systemd/system/' + ' '
+        searchpaths += d.getVar('base_libdir', 1) + '/systemd/system/' + ' '
+        searchpaths += d.getVar('libdir', 1) + '/systemd/system/' + ' '
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
         has_exactly_one_service = len(systemd_packages.split()) == 1
         if has_exactly_one_service:
-- 
1.7.5.4



