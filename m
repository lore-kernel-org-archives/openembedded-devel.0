Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pawoq-0000af-NY
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 21:52:24 +0100
Received: by ewy28 with SMTP id 28so4178546ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 12:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=pwVHpd/p+7t4WxvLhc3fOzOMrSowwJMiJVLP5fZK7js=;
	b=K/8YMn+1buZCnoApMDSuykHG7GKvok4RN71ms6taIAOIOHkIExjFtvDFdx1Ix/RP3k
	k6w421ljn6cmCY/FJBpU6it5J1XRAoyh+gvPryDVadPF5rWX/V9hLsd4p794axf3I/Cj
	0Qjnrft7N2ZRhPh31U00etdxfDyTcjGkhMqQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VGcdPM7uYNdrKgP9b2KLe0X3MT8+AvFTHXoZ8kVHu6XrCd4XeJZI6i/6Hfi7gIree5
	l3Jjw6S5TNODrN4bwBCsPHTncx2Eba0oCigzRUiOS7KET+1KDn6s32C0/UdsVGI9UO2S
	xEwzibHpmhTNRkaTgEho9QIt7w3SHMAQTOnIU=
Received: by 10.213.19.137 with SMTP id a9mr681086ebb.68.1294347121406;
	Thu, 06 Jan 2011 12:52:01 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id b52sm1616494eei.7.2011.01.06.12.52.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 06 Jan 2011 12:52:00 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jan 2011 21:51:54 +0100
Message-Id: <1294347114-8645-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] kirkwood: move preferred kernel provider to linux
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
X-List-Received-Date: Thu, 06 Jan 2011 20:52:24 -0000

preferred kernel provider used to be linux-kirkwood, but
that has not been updated for almost a year and seems dead

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

I am not too sure if there are much other kirkwood users.
If you are one, please verify if the linux recipe works for you too.
If I get no objections I will push this in two weeks time (around jan 20)

Frans

 conf/machine/include/kirkwood.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/kirkwood.inc b/conf/machine/include/kirkwood.inc
index 6325403..d1619cb 100644
--- a/conf/machine/include/kirkwood.inc
+++ b/conf/machine/include/kirkwood.inc
@@ -9,9 +9,9 @@ MACHINE_TASK_PROVIDER 		= "task-base"
 USE_DEVFS = "0"
 
 PREFERRED_PROVIDER_virtual/bootloader = ""
-PREFERRED_PROVIDER_virtual/kernel = "linux-kirkwood"
+PREFERRED_PROVIDER_virtual/kernel = "linux"
 
-MACHINE_KERNEL_PR = "r18"
+MACHINE_KERNEL_PR = "r19"
 
 IMAGE_FSTYPES += "tar.gz ubi"
 SERIAL_CONSOLE = "ttyS0 115200"
-- 
1.7.1



