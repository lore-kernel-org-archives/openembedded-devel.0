Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id DCE947F2A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 08:46:10 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b16so770164wrq.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2019 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mbGPWudQXTk43MA9R3EQnSgZeDiX5ctZlRc1VjR73AA=;
	b=oZuzwUiYTfVbBNIuEfjwUcwbYdrfL7ne0u+MkG2blHsScgyW9RFyL4wq6FfBChgYR4
	Xgd9wNjQcL96QjPJ1wX2cX0pCqaWuh9+xinEYNRxoLyEhWQ0PhUYDOI6jgHDqjnulRaw
	DG12XAn6K9AVO1speVD4lXcP1r5vRMtLUb6wWS3gGPGzP5YJdFDYAL4BR6JVS6YtHKdE
	q5pqkcIYXMWFNEuvZx9a2aq4lJTKBGvb8x9GJ8R1eCamNG6EUxfQGAjpDImO5Ewfq3rM
	3RD1zyE3exfUDd7dbxlfqvqEUADMf+jF/sPZrR/UK2Z/4bLCoDRJ+VmefMKYRuT/PGfM
	bGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mbGPWudQXTk43MA9R3EQnSgZeDiX5ctZlRc1VjR73AA=;
	b=BQ5IiYp8/QZUoTYlcEE3z0+ZkiAJivj4NvPj6x2gSCbvqy24Ky3Sk90P2dBY0NiMsg
	G4EkOz2rk2nAxjZegBdH5ioMBTgAMjXID58jV7qdhbTA5Ydch1bcwdeiOn2EWlmART7e
	9w+67/jzJciD/365LcH6GniaiI5fs5Nm3/6E9xGzp9HU5iIemCC3eWgdpLbxK+l5g7Z5
	gvW28x8Ph42PJMAGQ8xdai9dntBYGpMpTmQFuTrkL0JJVTt9+cB5oTQiyik/T+UoJWyE
	bMkSs6l79nlG2BITNE3DD0znc6WxB9O6pwTVIovd+8TS/1R/vzJsFcSmSkuHU8Osf+oI
	kdDQ==
X-Gm-Message-State: APjAAAX/nqx9cX7ZTGjxQw4MqTZSzvS2fICEkKiEKDgUa7gDp7Bscr6E
	Zi0VFe0xxzEJ9WWUE5rUtj+C20IIn/E=
X-Google-Smtp-Source: APXvYqycDxxEXluVNfXXRmbxiU8AYZBdJWmAd1Huf2BBrielWjBeXrV0zC5bRyPbmX4n66gflzgytQ==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr15610459wrs.82.1565340370898; 
	Fri, 09 Aug 2019 01:46:10 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.130.50])
	by smtp.gmail.com with ESMTPSA id g8sm4863690wmf.17.2019.08.09.01.46.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Aug 2019 01:46:10 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2019 10:45:56 +0200
Message-Id: <1565340356-11073-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] [PATCH] mongodb: add mongo shell as a PACKAGECONF option
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
X-List-Received-Date: Fri, 09 Aug 2019 08:46:11 -0000

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index 7634e5d..ed05517 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -45,6 +45,7 @@ PACKAGECONFIG_remove_armv6 = "tcmalloc"
 PACKAGECONFIG_remove_libc-musl = "tcmalloc"
 
 PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
+PACKAGECONFIG[shell] = ",--js-engine=none,,"
 
 EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  LIBPATH=${STAGING_LIBDIR} \
@@ -55,12 +56,11 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  --disable-warnings-as-errors \
                  --use-system-pcre \
                  --use-system-zlib \
-                 --js-engine=none \
                  --nostrip \
                  --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
                  --wiredtiger=${@['off','on'][d.getVar('SITEINFO_BITS') != '32']} \
                  ${PACKAGECONFIG_CONFARGS} \
-                 mongod mongos"
+                 core"
 
 do_configure_prepend() {
         # tests use hex floats, not supported in plain C++
-- 
2.7.4


