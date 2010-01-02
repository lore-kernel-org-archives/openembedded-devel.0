Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NR7X3-00086r-GK
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 18:12:56 +0100
Received: by fxm4 with SMTP id 4so11662038fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2010 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=safH7cJtyQS2BD2GEz64EsbQYNOpsKvA/0yDivgQbn0=;
	b=s1z4VAUufYOa+7BvvSiK2WHCepc+y2cqMEXsAnDSYIkvbSAiDTQK9w4w34SpDlg7AH
	sjCKNejHcTqbN88PlAkFZ4OWHb5eOrEay7xT9JMSDDMdLZPv84D6Juf2rH/7dAsKRWWP
	KE8wLayc33IB9PchNM1JlOTbxUaniZ3EZf09w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=lNFhT+dI9NbCipL+Au2aXmoQ7LxKhZ1bF+CxnXsD5q3kRxZ1gHb6cwxq8skxeNZt17
	6cLQ/94mRvhpG3OtP4OKHwpEwTToutt98RscyiLVhZG31abLOnEocY2TFSi8rCl1vZsv
	fTP1iurizcHQor71s2lTYn+btDDagIYctgu4M=
Received: by 10.223.132.204 with SMTP id c12mr3328861fat.80.1262452252626;
	Sat, 02 Jan 2010 09:10:52 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm5482530fxm.12.2010.01.02.09.10.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 02 Jan 2010 09:10:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jan 2010 18:10:43 +0100
Message-Id: <1262452243-8187-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] sanity.bbclass: Reading /proc/sys/vm/mmap_min_addr is not permitted with 2.6.33+ on host
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
X-List-Received-Date: Sat, 02 Jan 2010 17:12:56 -0000

* With 2.6.33-rc2-00252-ge9e5521 on my host I noticed that
  "cat /proc/sys/vm/mmap_min_addr" returns now
  "cat: /proc/sys/vm/mmap_min_addr: Operation not permitted"
  Its probably becuse of
  http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
  But I'm not sure if checking CAP_SYS_RAWIO even for reading this value
  is intentional or just bug which should be fixed in kernel.

* This patch prints notice about need to check that value yourself (as
  root) instead of failing with "ERROR: IO Error: [Errno 1] Operation
  not permitted"

* Its not optimal, because this notice is shown every time you run
  bitbake (even after checking/setting 0 to mmap_min_addr if you have
  kernel not allowing to read it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/sanity.bbclass |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index f65df61..4f90975 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -97,10 +97,15 @@ def check_sanity(e):
 				messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
 		if os.path.exists("/proc/sys/vm/mmap_min_addr"):
-			f = file("/proc/sys/vm/mmap_min_addr", "r")
-			if (f.read().strip() != "0"):
-				messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
-			f.close()
+			try:
+				f = file("/proc/sys/vm/mmap_min_addr", "r")
+				if (f.read().strip() != "0"):
+					messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
+				f.close()
+			except:
+				import bb
+				bb.msg.note(1, bb.msg.domain.Parsing, "/proc/sys/vm/mmap_min_addr cannot be checked. This will cause problems with qemu if it is not set to 0, so please check the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n")
+				
 
 	for util in required_utilities.split():
 		if not check_app_exists( util, e.data ):
-- 
1.6.6



