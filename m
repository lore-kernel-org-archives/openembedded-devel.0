Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Psywl-0004K5-1b
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 15:47:07 +0100
Received: by gyg13 with SMTP id 13so737256gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 06:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=IQ/ucf3uDXXb7VqOOfvKT2mHYq5x2aUwiDlN+F/pBzo=;
	b=JVf8O7sk18oE+MhDEglJyedOKdHgsc3QQ53LfBbX+AGe7ms96KufW99y5mMwjvPTDz
	ZlfamB689zhaajSw/AHCbGS3Y2L1zNwN9m693bLMXh4Fg4L3MyW2BYXeR1/vgb5sJNNi
	cTVEH0tRXIl9Plek+Lc98hUoWWoi3WD/r50po=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=Q/VqwrlwrSU2B2m+gRNBII+ODv1RTtcPqZ3MBM3UAwZCi6Sb/5wwxKY1XuhJeQsCP/
	3aMHOrZgTfkCNJj6jbLSuIC/t5hIUN+IYfvbSy4gZDImaqmKjE5J9KwtAIXvBuAd6DPw
	0yUJ9SOSRVpdepyiUnQPOgeXVG5qMqfb0Xj4U=
Received: by 10.151.99.9 with SMTP id b9mr3766537ybm.209.1298645144075;
	Fri, 25 Feb 2011 06:45:44 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q9sm122217yba.18.2011.02.25.06.45.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Feb 2011 06:45:43 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Feb 2011 14:45:28 +0000
Message-Id: <1298645128-32394-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux: update 2.6.37 to 2.6.37.2
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
X-List-Received-Date: Fri, 25 Feb 2011 14:47:07 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/linux/linux_2.6.37.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/linux/linux_2.6.37.bb b/recipes/linux/linux_2.6.37.bb
index e11af81..1cd40f4 100644
--- a/recipes/linux/linux_2.6.37.bb
+++ b/recipes/linux/linux_2.6.37.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r3"
+PR = "r4"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -20,7 +20,7 @@ DEFAULT_PREFERENCE_visstrim_m10 = "1"
 # DEFAULT_PREFERENCE_om-gta01 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.2.bz2;apply=yes;name=stablepatch \
            file://defconfig "
 
 SRC_URI_append_om-gta02 = " \
@@ -34,5 +34,5 @@ SRC_URI_append_om-gta01 = " \
 
 SRC_URI[kernel.md5sum] = "c8ee37b4fdccdb651e0603d35350b434"
 SRC_URI[kernel.sha256sum] = "edbf091805414739cf57a3bbfeba9e87f5e74f97e38f04d12060e9e0c71e383a"
-SRC_URI[stablepatch.md5sum] = "7693d1d32ed39346cc988e0f027e5890"
-SRC_URI[stablepatch.sha256sum] = "c33bfa59828a9ff6916993ec008967a8c1d71a18b743ee15f4280e773ef4baaf"
+SRC_URI[stablepatch.md5sum] = "bb5798f2a2a5af13219d1a250c4dad11"
+SRC_URI[stablepatch.sha256sum] = "3d65f2fb5f0018e8dafda4abe68d947d2ab5e21c386062cb0d6e011244a16aef"
-- 
1.7.2.3



