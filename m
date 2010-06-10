Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMnmK-0005jz-9N
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 21:51:06 +0200
Received: by fxm9 with SMTP id 9so257526fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=zF3MjHyemdBrTtPm3VFpDWOTgBMjQOsFKbObmD0MUgk=;
	b=pHENeqA//RUEm2qPH6FnIvIYFpuKIXXF8io5dq3RxTNFXtREhee+hDn+LfE1y/+t55
	M09/lYKvuaaq8aopXjwr0sapqJ0iU90jZZdoIvxXEYsa9xGhZDMrJy63zI5rfWM33NXu
	hlezw/RAElBSYY8EooTWIhJPVwzHNck+cqzcQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dCpa33ZsIEyQAdoMqH5SS2/ltos3DRkMVAvuVaq6a9Ac8tqslwjyEXeNMqbAV4Wh/6
	M+/vsupxLBoDpXyrbKKblh6GzTxamHEerchVIms+ElM0WU09kVyktbb7z/7y8Q83I4T2
	z0SXakp5s1q9YdlLuoGBHyUpRr+Zab4G9QC18=
Received: by 10.223.56.206 with SMTP id z14mr804666fag.97.1276199200972;
	Thu, 10 Jun 2010 12:46:40 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id j23sm1401924faa.14.2010.06.10.12.46.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 12:46:40 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMniE-0008Km-BB; Thu, 10 Jun 2010 21:46:50 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: philb@gnu.org
Date: Thu, 10 Jun 2010 21:46:47 +0200
Message-Id: <1276199208-31929-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] uclibc: handle DISTRO_FEATURE="largefile"
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
X-List-Received-Date: Thu, 10 Jun 2010 19:51:07 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/uclibc/uclibc-config.inc |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes/uclibc/uclibc-config.inc b/recipes/uclibc/uclibc-config.inc
index 624f596..ff334da 100644
--- a/recipes/uclibc/uclibc-config.inc
+++ b/recipes/uclibc/uclibc-config.inc
@@ -95,10 +95,11 @@ def features_to_uclibc_settings(d):
 	cnf, rem = ([], [])
 	distro_features = bb.data.getVar('DISTRO_FEATURES', d).split()
 	machine_features = bb.data.getVar('MACHINE_FEATURES', d).split()
-	uclibc_cfg('ipv4', distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
-	uclibc_cfg('ipv6', distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
-	uclibc_cfg('nls',  distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
-	uclibc_cfg('bx',   machine_features, 'USE_BX', cnf, rem)
+	uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
+	uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
+	uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
+	uclibc_cfg('nls',       distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
+	uclibc_cfg('bx',        machine_features,'USE_BX', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 # X, Y = ${@features_to_uclibc_settings(d)}
 # unfortunately doesn't seem to work with bitbake, workaround:
-- 
1.7.1



