Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OWD5R-0005YC-ST
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 20:41:42 +0200
Received: by bwz10 with SMTP id 10so3406357bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=zF3MjHyemdBrTtPm3VFpDWOTgBMjQOsFKbObmD0MUgk=;
	b=NZ0QBNL+R3xZulP/Wtx341eojnxKQwYQ4T63ihdpUkR+zCMorVB+rv/sqRtJxV8ax/
	H1YWTcNHDfA/Mu+GTCAoRc+w4kk9At9B8TCB6CwOnEaNtDWaRYMRDLmJ2sW29pjQ4NYD
	p1IlwIl7SFiiC6N3Ara83qKfBXMlJI1brUKik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QMMRPCGoPZWnVhmPRBEtiwdn7m4PpMpoHFoYgUL6BHjzZbEpG73tXRjv7nxNpydqnl
	X2FN/TzS4XMblMEFgexqSYTSQJB6bQuglot9WwPa9qN3shn7TnfEqmwL3YssWn1YPWT0
	lQyIW6+KCXuzT4/+rDUzlBqemuyKprE+4vUtQ=
Received: by 10.204.152.4 with SMTP id e4mr3051666bkw.120.1278441413300;
	Tue, 06 Jul 2010 11:36:53 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id s17sm21151828bkx.6.2010.07.06.11.36.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 11:36:52 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OWD0d-0000u4-E6; Tue, 06 Jul 2010 20:36:43 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Date: Tue,  6 Jul 2010 20:36:36 +0200
Message-Id: <1278441397-3361-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1278441397-3361-1-git-send-email-rep.dot.nop@gmail.com>
References: <1278441397-3361-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][v2 3/4] uclibc: handle DISTRO_FEATURE="largefile"
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
X-List-Received-Date: Tue, 06 Jul 2010 18:41:42 -0000

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



