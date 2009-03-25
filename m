Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LmVLz-0000iU-OP
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 16:49:19 +0100
Received: by ewy20 with SMTP id 20so116136ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=yogQe3atfdQeBPQoCtsTiGL/m6VKhs3nJ6OOUmt2/Ac=;
	b=b1M3aGC9on58cSLz4fAfZbq7s/MqaCPu10x/a2Udvii4SE44as7vXHXoxqzARFgiOo
	3uXC6HtCNKTuLyaKZysDqJqVP9toi/6h5cJjfNxRuRMkqtphG0I40of20JKi/Lv7Vj4/
	riABCf1SeGUI9AnkG17LYGjGyi5cumWiOzzw4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=q0dCIMX31Glita/Z/wdBI2j2yCxJBiyKQfOfEHUIAJqicKKHB2JGuDMorP+pqnxtp0
	b/BmSTQM997f7lkaB/FCPIpvnaJkBPgsHx/unaSnyHkoEwsuBADb1SDgKcDA6CU7iB0D
	vqyR05/HM97jkHKOY3gTNSUMuKqHCfO6rgZ7w=
Received: by 10.216.71.82 with SMTP id q60mr3706017wed.169.1237996060624;
	Wed, 25 Mar 2009 08:47:40 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 7sm2045597eyb.50.2009.03.25.08.47.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 25 Mar 2009 08:47:39 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Mar 2009 17:47:34 +0200
Message-Id: <1237996054-31234-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.2.rc2.22.g1d035
Subject: [PATCH] libzip: new recipe
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
X-List-Received-Date: Wed, 25 Mar 2009 15:49:19 -0000

This is a C library for reading, creating, and modifying zip archives.
Package is created for libzip-0.9
---
 conf/checksums.ini           |    4 ++++
 recipes/libzip/libzip_0.9.bb |   13 +++++++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libzip/libzip_0.9.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9ade7df..bc4bb96 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -14398,6 +14398,10 @@ sha256=ccefd4ceb29bb729dcaa9a9d4a86654a9134adfd29bdd72be1a9d3726efb54e0
 md5=d6a9a020a76a3db17848d769d6c9c8a9
 sha256=4e1f39ee16596fd2a83d28d6c3b065f742254f3336f93ce8ed1cae48ecbe49da
 
+[http://www.nih.at/libzip/libzip-0.9.tar.bz2]
+md5=56b9f11c1eee5eed189a20183d7e06b0
+sha256=23a8c3624122a3777bb4ac3be4a867fd0bed7f3aacb8f1d0b68fc459cfb035fc
+
 [http://downloads.sourceforge.net/lightblue/lightblue-0.3.3.tar.gz]
 md5=fb3761c8fff39a792035db4767847169
 sha256=90b3271e5ce4de91d3651ba11b92e64fc7afb2a54ebe01826023e5bb2b53a3bc
diff --git a/recipes/libzip/libzip_0.9.bb b/recipes/libzip/libzip_0.9.bb
new file mode 100644
index 0000000..914a0c1
--- /dev/null
+++ b/recipes/libzip/libzip_0.9.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "C library for reading, creating, and modifying zip archives"
+SECTION = "libs"
+HOMEPAGE = "http://www.nih.at/libzip"
+LICENSE = "BSD"
+DEPENDS = "zlib"
+
+SRC_URI = "http://www.nih.at/${PN}/${PN}-${PV}.tar.bz2"
+
+inherit autotools
+
+do_stage() {
+	autotools_stage_all
+}
-- 
1.6.2.rc2.22.g1d035



