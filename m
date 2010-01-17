Received: from mail-pz0-f185.google.com ([209.85.222.185])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NWUw7-0007h5-GV
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 14:13:02 +0100
Received: by pzk15 with SMTP id 15so1602515pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 05:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lpb+sO5m3NZSaSlZVmIf1EMzU9AizMOhuT4lQ7UGur8=;
	b=o2cwQCtyWGnzys4Mn7TwDjIyrEQQBrEScNuC4Kdb7JBlzdaqo0Ey09Ho4yi0OBhgnq
	sSSHIoVwnaw6/8UBdpwqyrYvcljlP74rcdCNlofDJZuF8brcUO1JWelv5kkXQ3SxJvaa
	8SooXKhT9juSRYEkGc9bHFbLcAt8rApxxiC+U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iJdYsvGAKIPkRRqRidv7W+HWTth9ot0O4eF+9W6x7eIFAos40K7XxaDHn3BMLqfdqE
	96Jxt+b9C+nekrd9XtsddGEgUDZHZEmxbBEydADuWUJ7oZops5eLeflzgAUn3lzAIXGE
	DP5FUGSsDmKAtVoZi5JOvZalwN4Kf+qw3PN8Y=
Received: by 10.143.25.19 with SMTP id c19mr3364615wfj.87.1263733845040;
	Sun, 17 Jan 2010 05:10:45 -0800 (PST)
Received: from localhost ([123.54.105.23])
	by mx.google.com with ESMTPS id 21sm3342447pzk.3.2010.01.17.05.10.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Jan 2010 05:10:44 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 21:10:18 +0800
Message-Id: <1263733818-32111-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.222.185
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Set preferred glibc to 2.10.1 in conf/distro/micro.conf
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
X-List-Received-Date: Sun, 17 Jan 2010 13:13:03 -0000

* the preferred version of binutils of conf/distro/micro.conf is 2.19.51
* the preferred version of glibc is 2.6.1 which is defined in sane-toolchain.inc
* the ld produced by binutils-2.19.51 reports that it can not find the __begin symbol when linking with glibc-2.6.1

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 conf/distro/micro.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index d9fc595..9885425 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -62,6 +62,8 @@ MACHINE_KERNEL_VERSION = "2.6"
 #############################################################################
 LIBC ?= "eglibc"
 PREFERRED_BINUTILS = "2.19.51"
+PREFERRED_VERSION_glibc             ?= "2.10.1"
+PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
 require conf/distro/include/sane-toolchain.inc
 
-- 
1.5.4.3



