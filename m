Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYcAa-0003q0-St
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:20:44 +0100
Received: by ywh8 with SMTP id 8so1993332ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 01:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4qOgmxJtRXlO2YKtuYKe7lDAbjVWF/g3zxg6v0Gjaj8=;
	b=mRuaYgEh31WBA7kk+KCRCmQIvcDBLLESM9AEnsnvDV2+qcRFTOo1OmZU8FW8yk2YL9
	V8TM1lOiV2k4zJaDZq03KpY6ndqlAo1ag1opiWlKqxXOOdShTqgDpC6KBoPXEzfYaU2k
	20kD5HmnnhbmWfVRjhi1srvpvYNCh8wBfL/Ag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=R3umKWKKw06kKB91PoG5qFn6lIu4U8OvRqQ5tYYRSFCFDf8Qm8AizO2kQCoot8i1s8
	EKCXsxYSpXsil+XxDY1z904hM95hR93mnQ41Is86rhh7J7yKcn8iRULVx86QuDU92J48
	+LfutX/tSQvkEnKYcNl3YwqBk6y5hEq97nodE=
Received: by 10.91.51.37 with SMTP id d37mr3667983agk.65.1264238301892;
	Sat, 23 Jan 2010 01:18:21 -0800 (PST)
Received: from localhost ([123.162.71.84])
	by mx.google.com with ESMTPS id 6sm1096846ywd.7.2010.01.23.01.18.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 01:18:20 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 17:17:55 +0800
Message-Id: <1264238275-28691-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] checksums.ini: add checksum for linux-2.6.8.1.tar.bz2 and linux-2.6.27.7.tar.bz2
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
X-List-Received-Date: Sat, 23 Jan 2010 09:20:45 -0000

* Add checksum for linux-2.6.8.1.tar.bz2 which is used by sun4cmd machine
* Add checksum for linux-2.6.27.7.tar.bz2 which is used by storcenter machine

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 conf/checksums.ini |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index de94be8..cbdf41a 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -17478,6 +17478,10 @@ sha256=877af8ed89e56af004bb0662c1a9cfc785b40c602f71a8bf81521991026cf2f0
 md5=5fc8e9f43fa44ac29ddf9a9980af57d8
 sha256=877af8ed89e56af004bb0662c1a9cfc785b40c602f71a8bf81521991026cf2f0
 
+[http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.8.1.tar.bz2]
+md5=f00fd1b5a80f52baf9d1d83acddfa325
+sha256=910f4af05f40ed9a6ab3bc8ccf7ca77365fb7bfe9b5dcfa7ff316e03b354d4ff
+
 [http://kernel.org//pub/linux/kernel/v2.6/linux-2.6.11.tar.bz2]
 md5=f00fd1b5a80f52baf9d1d83acddfa325
 sha256=1fa39c202efe168bfeb0ddd74c8e4814f77da7dc78993e47826bad9173b95808
@@ -17682,6 +17686,10 @@ sha256=cb5837924f7234045b4841998987b257977e64d141291068e5b145a3a276df7a
 md5=ef06a3ea963f556948e77971df912303
 sha256=8527c8a9b235a370db3aac606d9262f5e549ef202f114157b45f62564e3dd3bc
 
+[http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.27.7.tar.bz2]
+md5=db323884c7dc46e4cd33d0d944fa59a9
+sha256=8e7075fc855ffbcf3c24cbd70b22791759224f98839886d50bba8d659193a950
+
 [http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.27.tar.bz2]
 md5=b3e78977aa79d3754cb7f8143d7ddabd
 sha256=0e99bf9e83f4d1ae0c656741a84dfddfa9c4d2469cf35475f5939d02dc3e4393
-- 
1.5.4.3



