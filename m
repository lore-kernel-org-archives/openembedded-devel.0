Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsETd-0000tP-Gt
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:57 +0100
Received: by yie16 with SMTP id 16so3295317yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=4S9mwZFeCM7ZdvxDnwPtfwdZtI9hMgWvzM/zPmOpjtM=;
	b=XGQmX8r4VleniJKUGvwenUdoJn6OjDhOzfZRh2iSV436svGoS9EJ/UOh6yFlog9gWZ
	ZvqQwjtWVpkGgEsc8X9Jr+OeHOp8M+EdE9O7f1cojT39aWnk+tWwr/em9PBaCXKwrS3p
	UCtWyiEKthKXwi8bAcxsVaY/pYesOyZzU2374=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=vAtl7NhXkYRK98LrxOtjRFq3zJvydcce6ixQIibQr3HvQhM5OOhniUIABSZ4WRTFji
	tLMmcBoongH4lrwK+eCFOGXJyD7PRY2YQj/+icSnEkhtFEFohze6P7aTVVOJH/NTCu5D
	5wnXp37tj2juiYM3BiDPw5mBhXf5oP6qeavpE=
Received: by 10.236.110.162 with SMTP id u22mr7292452yhg.51.1298466516473;
	Wed, 23 Feb 2011 05:08:36 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.08.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:24 +0000
Message-Id: <1298466445-16486-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-13-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-10-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-11-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-12-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-13-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 13/14] linux (2.6.37): add 2.6.37.1 stable patch
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
X-List-Received-Date: Wed, 23 Feb 2011 13:09:57 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/linux/linux_2.6.37.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux_2.6.37.bb b/recipes/linux/linux_2.6.37.bb
index 39c0c08..e11af81 100644
--- a/recipes/linux/linux_2.6.37.bb
+++ b/recipes/linux/linux_2.6.37.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r2"
+PR = "r3"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -20,6 +20,7 @@ DEFAULT_PREFERENCE_visstrim_m10 = "1"
 # DEFAULT_PREFERENCE_om-gta01 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
            file://defconfig "
 
 SRC_URI_append_om-gta02 = " \
@@ -33,3 +34,5 @@ SRC_URI_append_om-gta01 = " \
 
 SRC_URI[kernel.md5sum] = "c8ee37b4fdccdb651e0603d35350b434"
 SRC_URI[kernel.sha256sum] = "edbf091805414739cf57a3bbfeba9e87f5e74f97e38f04d12060e9e0c71e383a"
+SRC_URI[stablepatch.md5sum] = "7693d1d32ed39346cc988e0f027e5890"
+SRC_URI[stablepatch.sha256sum] = "c33bfa59828a9ff6916993ec008967a8c1d71a18b743ee15f4280e773ef4baaf"
-- 
1.7.2.3



