Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvP-0006vQ-Nb
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:02 +0200
Received: by mail-pz0-f47.google.com with SMTP id 37so936443pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=fsmplt2g9eQPK6fDuQKN9wI4UB7qTSem7otkBvjh0iA=;
	b=vbx4px36Xh5P+mmEaABOz4d2xG1H/NJ3v1S7RgNBZTTGQZ40M/X7VxgdAgat5N+wLX
	TnDtYBlzzcmwbpPtssbooxVGr+2afcjjsVXHuQUSIAT/mj4KaUaesSspM8rS+A0VNoG7
	F3ZPDUwJeO+FqqCQmcHhM4hWi69a9Ea0pcXKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=P9mD135/8TlB29tiUNZqp+VDT3mR5mZFno72jjqyaVuZjeqkmJ6bja+yBBJc1nesL3
	Ky6PqTAwrT2rUP43oChRz3hCDBUQSHdWJs3uIhS9ddIUqq+SR9iz3ooPqkMFlaVma90b
	uE+OCoYsklweK6QgAkKOwpgsMbZtqBjvXzpjk=
Received: by 10.114.112.6 with SMTP id k6mr5901074wac.194.1285456373139;
	Sat, 25 Sep 2010 16:12:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:26 -0700
Message-Id: <1285456353-27457-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 05/12] kernel-arch.bbclass: Add logic to account for mips64/mips64el in map_kernel_arch
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:05 -0000
X-List-Received-Date: Sat, 25 Sep 2010 23:13:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/kernel-arch.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel-arch.bbclass b/classes/kernel-arch.bbclass
index d615fb7..970e7ee 100644
--- a/classes/kernel-arch.bbclass
+++ b/classes/kernel-arch.bbclass
@@ -23,7 +23,7 @@ def map_kernel_arch(a, d):
 	if   re.match('(i.86|athlon)$', a):	return 'i386'
 	elif re.match('arm26$', a):		return 'arm26'
 	elif re.match('armeb$', a):		return 'arm'
-	elif re.match('mipsel$', a):		return 'mips'
+	elif re.match('mips(el|64|64el)$', a):	return 'mips'
 	elif re.match('sh(3|4)$', a):		return 'sh'
 	elif re.match('bfin', a):               return 'blackfin'
 	elif a in valid_archs:			return a
-- 
1.7.0.4



