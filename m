Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJO-0005cc-RL
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:14 +0200
Received: by fxm20 with SMTP id 20so805180fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=1f2pLEMO2HNnQABWOp6Zg+v/3vi2zlclYHeJwz/gZDY=;
	b=xpEsvR2kK4os+okEjbzrFTHqK74RLWMH2TIulIo9EWn6zIZRMxxLgvGCBvidu5N9xd
	7bGZSX+1NqUFMoCqPbqI5fZQxBLtFzUS+KpLM8lhD7UXPVUcDFg8ZX7LLRo0o8Dey7Oa
	3nFNphIn7Vu2WMJIVmGlUoNvIVN6R8JNnTkAA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=nsnRex1D7tmQgnAIYIoLt6sprQbXSjs2P/uLbPV7DL3W5fW3NjrNo/xelKBLcqd+9v
	T57lFtGGXeR1R0Homw2LC54D5S1A+97JLNWj92ftCfZDdLq7Z2vWniGiFB5WDucmqnPx
	yoohONHg2SnLuYQbCMJIFskw9OskNILx5ZbbY=
Received: by 10.103.227.10 with SMTP id e10mr417999mur.56.1242873581270;
	Wed, 20 May 2009 19:39:41 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id j2sm5575617mue.12.2009.05.20.19.39.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 3F2386103AD; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:19 -0300
Message-Id: <1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 04/23] python-pycups: add
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
X-List-Received-Date: Thu, 21 May 2009 02:47:15 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                     |    4 ++++
 recipes/python/python-pycups_1.9.45.bb |   16 ++++++++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-pycups_1.9.45.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 4bce0ee..2070cfd 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19698,6 +19698,10 @@ sha256=a6d7db68c87699e283a1f58b637a7e730c350899fd7b35b88e63caa0e85a9ab9
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
1.6.3.1.54.g99dd



