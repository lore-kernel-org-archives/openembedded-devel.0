Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6F974BE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:14 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 70-v6so3655658ity.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=69usCY1mW5FapYJ8BhwNKNHVECBc1qdS4Msn4ifKtQs=;
	b=nPuZfEIRGGl9r/YR62VeMUqtA5QGemXQkzEsAUXrByVPGV4Iq4saNNeScFNmTmLAB0
	mAh7hmqjOmn7GcelpOQnLwCA7qMT0pMZWGSUf+8fsKbzzkz8GMLesCZt97snxswBwh3z
	/fgItU0ZrJHvLMa6/p2vWnR6xtdzXJkIpymRrwKLoFnArK2ED6SEUD7uRiLpN8P5PFYU
	w8nojAh9apPFqMfexfNup23MlWBl4Rczv/yr2KP7Gz8ffhIRDNxywSl6inMlA2aK317z
	a6P75ztRH8RA4+1NH9lz3jpgRFR82xlb6Hv0yDir0GKnexwBgJznVXTPar3Mrk2IyZLP
	5ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=69usCY1mW5FapYJ8BhwNKNHVECBc1qdS4Msn4ifKtQs=;
	b=fZGnVAoF2/pWmhng5tgX60FSywd9C2Aylu4r1JsRs6I2C4ADBxTPgELZLLYKFZTvBX
	4ZkIcNSVhMALzIJCLw53aTnWHSX+jGFoPOSEzioniJFv+Kb4V4JX6zKoDeiGDyNCUd55
	ueT1UHGlXdVNe7UClJziTXhmcbZn4sgQN3fmh78k8NsX8EUmGcksze8g6Kky5gClvq1p
	tKS3NJQrTOTePr++CnDOlJRrobjgMi8bMWyHfewIMe3Cvkott9Uajx0MNc+VtqV3LJPc
	6Q3rkO1rH8a6TIcKVYASMvjFvKkiYgdcEsLUVhjGEbLOC8geQlJTPyiMOF2cfq0oAkLo
	cyaQ==
X-Gm-Message-State: ALKqPwdWbD5ysegjO4nq4ktXNnOCzDQ6kwOFOHXbCg6MwMAsS4cbOiX1
	SbQO7Wtoq5WZNjB92QolrPmyW/f2
X-Google-Smtp-Source: AB8JxZqvLDMSoELsFnbqS/ZA/FD7SIkeu0SynqKYpsfqIERMQ4jvYlTmwNve28WhRxYRB0Oi5KvX3A==
X-Received: by 2002:a24:f102:: with SMTP id
	c2-v6mr9889811iti.121.1527186435648; 
	Thu, 24 May 2018 11:27:15 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:14 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:50 -0400
Message-Id: <20180524182659.19986-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 02/11] libssh: variable cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2018 18:27:15 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.7.3.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
index e5ea2b8bfa..6064969ae0 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
@@ -1,16 +1,21 @@
 SUMMARY = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
 HOMEPAGE = "http://www.libssh.org"
 SECTION = "libs"
-
-DEPENDS = "zlib openssl libgcrypt"
-
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
 
+DEPENDS = "zlib openssl libgcrypt"
+
 SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-7"
 SRCREV = "cdf7690e038230623cbbf6b024ece62f41efa98d"
+
 S = "${WORKDIR}/git"
 
+inherit cmake
+
+PACKAGECONFIG ??=""
+PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
+
 EXTRA_OECMAKE = " \
     -DWITH_GCRYPT=1 \
     -DWITH_PCAP=1 \
@@ -19,11 +24,6 @@ EXTRA_OECMAKE = " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
     "
 
-PACKAGECONFIG ??=""
-PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
-
-inherit cmake
-
 do_configure_prepend () {
     # Disable building of examples
     sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
-- 
2.17.0.582.gccdcbd54c


