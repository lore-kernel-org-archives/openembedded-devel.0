Received: from [209.85.218.213] (helo=mail-bw0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LZ4Hx-0001rJ-Kq
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 15:17:37 +0100
Received: by bwz9 with SMTP id 9so2887015bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 06:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=WF7pqUr0arypOQuduojDgvxoBultzdSFyHB4vE1JzFU=;
	b=E/yc8RlFOB3fIOjETfoI7FMvmXTqvvTahNWjHlmIMiP0k/4jbJzrcVS4Q9N+IuW8zM
	h6DOu5/yiOEbcuelKwMjdx3fhN4NCUt3c73eMSbDr2gaAscBPuA2qscn8B5XuGMD87ca
	Nhuaw3k6vJNpLf8uQ1Yg+UE7FdHs24oF0cSWE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=lDAEygGuvIZD4IoGSn/315gKcm84GY+UslaSsb1yzarCzTKPqVeDNnXsb/ZqYocg7N
	whwGQ7xT3HsKth8IK/Lje2xV8zAJtdQXJeNChQRMdaALoZSD1wIbC9yORNDka7bxA+1I
	tlZuZpammNIlofpEFAn8H3Uh6Bw3XbFrACDvw=
Received: by 10.103.175.9 with SMTP id c9mr2955569mup.3.1234793743502;
	Mon, 16 Feb 2009 06:15:43 -0800 (PST)
Received: from ?10.6.26.234? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 23sm7768648mun.0.2009.02.16.06.15.42
	(version=SSLv3 cipher=RC4-MD5); Mon, 16 Feb 2009 06:15:43 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2009 16:15:34 +0200
Message-Id: <1234793734.5643.1.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] neon: bump version to 0.28.3
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
X-List-Received-Date: Mon, 16 Feb 2009 14:17:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Seems that current neon versions doesn't work with gnutls 2.x

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/checksums.ini           |    4 ++++
 packages/neon/neon_0.28.3.bb |   17 +++++++++++++++++
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 packages/neon/neon_0.28.3.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 178f45c..a08be2a 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -15674,6 +15674,10 @@ sha256=76472e51576b42bfc129e487ae7dd3a5e1f1f380105b422fc14ee408e3a881df
 md5=516c576c0ca5c0a01ad24d018093cfee
 sha256=8a29457052b73ac0139e3b2824a74323256dd7631b1691239ddb18124e231a71
 
+[http://www.webdav.org/neon/neon-0.28.3.tar.gz]
+md5=47599a328862ce64ac3c52726d6daa12
+sha256=90dee51b4c70bc50ce2fa106ca945349b81cd86c90aa9d4dbff73abb284fcdc2
+
 [http://downloads.sourceforge.net/net-snmp/net-snmp-5.1.2.tar.gz]
 md5=8080555ab3f90011f25d5122042d9a8d
 sha256=1fca69e934c3d526e308450cc5af2478d440e012922dd0bb10388fcf093ef32e
diff --git a/packages/neon/neon_0.28.3.bb b/packages/neon/neon_0.28.3.bb
new file mode 100644
index 0000000..7f814b4
--- /dev/null
+++ b/packages/neon/neon_0.28.3.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "neon is an HTTP and WebDAV client library, with a C interface."
+SECTION = "libs"
+LICENSE = "LGPL"
+DEPENDS = "zlib libxml2 expat time gnutls"
+PR = "r2"
+
+DEFAULT_PREFERENCE = "1"
+
+SRC_URI = "http://www.webdav.org/${PN}/${P}.tar.gz"
+
+inherit autotools binconfig lib_package pkgconfig
+
+EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
+
+do_stage () {
+	autotools_stage_all
+}
-- 
1.5.6.3




