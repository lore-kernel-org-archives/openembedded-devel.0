Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiA4c-0006DW-5B
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:26:30 +0100
Received: by bwz10 with SMTP id 10so1579150bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=p1xglE4g3Qmv0z+Ya3UNr+biRkaYjjI6mjQ2esF9h0w=;
	b=FcMW/SnT2TPjxvo4E4w46kVvEvZp1reizTGG1/0cy1BulV2WWZsD6T2xQ1luV6XoYy
	vx/WWNLkQaWnMtskX0ykfp59SKaiTyZfr6oA+CkHGl1eVh5+vwOCvB8UvN2x4iXzvwT7
	X8PBEkftn/rhB4YJ/WrU9yi6aihmZ7lr06nhU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cvWYV5Zo3J6NUxQwXxgBJ185h0cYpNGAbIipzGVmsH7+5k8E32cXJLu3QYx6eM82wZ
	PATr+yx1sd0nFVmqN2JlXL7Hl/hoIEd8AArvoCDb99TgmV5NYVuGrhsuCRV9SUJnCnWk
	qpSVM6c4LKpsoZ6rgJZAL3yKnpmzwVdXHK4Hc=
Received: by 10.204.67.140 with SMTP id r12mr698041bki.147.1296065618875;
	Wed, 26 Jan 2011 10:13:38 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id f20sm7647920bkf.4.2011.01.26.10.13.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:13:36 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pi9s5-0002WC-Qx; Wed, 26 Jan 2011 19:13:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:13:29 +0100
Message-Id: <1296065612-9637-7-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 6/9] uclibc: handle some more {machine, distro}_features
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
X-List-Received-Date: Wed, 26 Jan 2011 18:26:30 -0000

distro: xattr (posix extended attributes), ssp
machine: kernel24

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/uclibc/uclibc-config.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/uclibc/uclibc-config.inc b/recipes/uclibc/uclibc-config.inc
index ef4385e..187f642 100644
--- a/recipes/uclibc/uclibc-config.inc
+++ b/recipes/uclibc/uclibc-config.inc
@@ -95,12 +95,15 @@ def uclibc_cfg(feature, features, tokens, cnf, rem):
 def features_to_uclibc_settings(d):
 	cnf, rem = ([], [])
 	distro_features = bb.data.getVar('DISTRO_FEATURES', d, True).split()
-	#machine_features = bb.data.getVar('MACHINE_FEATURES', d, True).split()
+	machine_features = bb.data.getVar('MACHINE_FEATURES', d, True).split()
 	uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
 	uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
 	uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
 	uclibc_cfg('nls',       distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
 	uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
+	uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
+	uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
+	uclibc_cfg('kernel24',  machine_features,'UCLIBC_LINUX_MODULE_24', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 # X, Y = ${@features_to_uclibc_settings(d)}
 # unfortunately doesn't seem to work with bitbake, workaround:
-- 
1.7.2.3



