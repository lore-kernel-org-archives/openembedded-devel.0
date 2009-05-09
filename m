Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arc-0000U1-OL
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:28 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008350ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=I9sqe8cm+Pg2WmwMQbBH56+6z1jH/ffGoCDjsvjVW7I=;
	b=DmUmXEGP3L4BO3yLwlAiRf6lQ6JKqdHEYf7kx3vzMLt/La76V2bpsq7iWKT76E9J6E
	VMApXtExF8WKUzVKBLPycx4+7a4M6yuYGDvqGHQsKu2Tdkm7UCFk8WeYJEAqYDeE6m1u
	uCm4FoL2/etCArD/TB2JKaSGf1VCaWJGG2KAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=jcNcp2QanA1NqlmVVrSJVOUsFFQHQPzweTxhkCeMaJiHCNxGC4AQMcEKdRZ/gGOxyH
	DV2z8mSafbbtbSosPEc4QaABTpFc2IxcW+hh3ktjWsUVtXNwHXGYO5nxbCWmiKU9EwU2
	FhsVPOw+amASZtE5/hyoQnc3RZeOgGFEencSg=
Received: by 10.100.197.7 with SMTP id u7mr10025226anf.108.1241830212854;
	Fri, 08 May 2009 17:50:12 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm3656247ywi.48.2009.05.08.17.50.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 7185C61019E; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:21 -0300
Message-Id: <1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 05/23] python-pycups: add
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
X-List-Received-Date: Sat, 09 May 2009 00:56:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                     |    4 ++++
 recipes/python/python-pycups_1.9.45.bb |   16 ++++++++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-pycups_1.9.45.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 51f6f04..d314262 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19534,6 +19534,10 @@ sha256=a6d7db68c87699e283a1f58b637a7e730c350899fd7b35b88e63caa0e85a9ab9
 md5=4d5674f3898a573691ffb335e8d749cd
 sha256=b08d4ed54c9403c77778a3803e53a4f33f359b42d94f6f3e14abb1bf4941e6ea
 
+[http://cyberelk.net/tim/data/pycups/pycups-1.9.45.tar.bz2]
+md5=ff634a6751f8a859ed26751bf03abef0
+sha256=ef6e576e5465da9c338ac8ff9f162825cfb7997359efc52e6a110c295a9f363b
+
 [http://pycurl.sourceforge.net/download/pycurl-7.14.0.tar.gz]
 md5=6f73d518fb520af14634a06ee1b7ddce
 sha256=a60e08b01fc3355ec18ec0e447349b6f8bff3f9628eb42891cff1eb51b9618b1
diff --git a/recipes/python/python-pycups_1.9.45.bb b/recipes/python/python-pycups_1.9.45.bb
new file mode 100644
index 0000000..bd127d5
--- /dev/null
+++ b/recipes/python/python-pycups_1.9.45.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "cups Python Bindings"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "cups"
+SRCNAME = "pycups"
+
+SRC_URI = "http://cyberelk.net/tim/data/pycups/pycups-${PV}.tar.bz2"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+# used during compilation
+CFLAGS += -DVERSION=\\"${PV}\\"
+
+RDEPENDS = "python-core cups"
-- 
1.6.3.rc1.51.gea0b7



