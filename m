Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PaVNA-0006qf-HP
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 16:34:00 +0100
Received: by bwz10 with SMTP id 10so14949517bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 07:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=y7lasOl2Z91Lp+wu+WsHJXxi/5l9xvna042r6HfsXPA=;
	b=vOwN71VlypLsXEzhsbg8BVB3kEW2BCt7gGfqjOBl2Nxn2kc1IFgz1+A6ZkwYfD6yXZ
	ZB5yru6WLCuDWZqE2ihHgF1no2vfbeViJUL2ikkrqrRhfZRaH3r8SQjtjIN8C4TZ5zXY
	U81BdUN38FOTTp6OXKxbab7rre9Je4w9oR+lo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=PZ1bnWceqN8dZmwjg1EnHslze0qVsROgo5P42nFX6R+GNVs6VeI0+6quAHWUJg+AbS
	ZHw/mN3N74+9bUBwsUSSyklWxLPD5CIhrYqcDe6261b47qU/ENLlNKExi8c/AYqfB1Qi
	/dldx5AS7c4Ypk7rSagFk9coW5pH+DqjGZzH8=
Received: by 10.204.59.76 with SMTP id k12mr17618175bkh.70.1294241614587;
	Wed, 05 Jan 2011 07:33:34 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v25sm12982935bkt.18.2011.01.05.07.33.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 05 Jan 2011 07:33:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jan 2011 16:33:31 +0100
Message-Id: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 1/2] azy: add mysql5 to depends it's used in azy/src/tests/T_SQL.azy_server_stubs.h if mysql-config is found
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
X-List-Received-Date: Wed, 05 Jan 2011 15:34:00 -0000

---
 recipes/efl1/azy_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/efl1/azy_svn.bb b/recipes/efl1/azy_svn.bb
index 5d6cb00..7e96c60 100644
--- a/recipes/efl1/azy_svn.bb
+++ b/recipes/efl1/azy_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Azy is a library meant for implementing rpc clients and servers in a simple manner."
-DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native azy-native"
-DEPENDS_virtclass-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native"
+DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native mysql5 azy-native"
+DEPENDS_virtclass-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native mysql5-native"
 LICENSE = "LGPLv2.1+"
 PV = "1.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.7.3.4



