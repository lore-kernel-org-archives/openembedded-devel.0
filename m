Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id CE6706FA40
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:21 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id r20so5603672wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dqcxuTYLEma4io/kpZhvygnnONl9Cir2iuQ1XPy3Sg0=;
	b=lFf+ALd/538tL3c3PLUhlJAo1Jjglt1kpxbm7tNQsumRqj/LDS/jCWc1yiQYdx8b0c
	f8S9P2vSXWICmG80Fne5NHJgavqWQBU1KkKb9BtgxZKXXjsv7aFi7NKO3N4zuUsKId/t
	0TKsbkp/UKSRWklEAeXl+K8CRo6CppewxeRXAU0/Jb9nimSToDO6ORpevD3CsBsnbPAG
	hELEsEdwK+wC/dEs5UsNR46ei7bsYYjlDrj7VnGzL/KLB7Ex9rp4UyleDIBmiVKvmf18
	sjDwgGTiK+yUkrdCMtrPs3r36gRCIuzkYBZ3I9jeksrr+AQ1lN7Zjt2Pd96kC4pWqu3r
	TD0g==
X-Received: by 10.194.81.98 with SMTP id z2mr24313633wjx.12.1396372522356;
	Tue, 01 Apr 2014 10:15:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm41875012eeg.8.2014.04.01.10.15.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:44 +0200
Message-Id: <1396372434-10710-36-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 36/46] zram: include whole sysconfdir in PN
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 17:15:22 -0000

* when sysv script is removed it leaves empty /etc behind and QA warn is
  shown:
  zram-0.1: zram: Files/directories were installed but not shipped
    /etc
  empty dir doesn't cost much, so just include it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/zram/zram_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index 3b1c845..e07f570 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -23,7 +23,7 @@ do_install () {
     install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
 }
 
-FILES_${PN} = "${sysconfdir}/init.d"
+FILES_${PN} = "${sysconfdir}"
 INITSCRIPT_NAME = "zram"
 INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
 
-- 
1.9.1


