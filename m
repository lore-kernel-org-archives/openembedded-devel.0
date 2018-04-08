Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7955075570
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:02 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id e7-v6so1201226plt.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=11NbikiKYh0ugXAfWheZUEGVIc+wK9qm6xpG5Jyntvc=;
	b=Hz817FscNuOUmMDOiF9kmAhOEU3G36VJlru5aqaLO22ospJcDgQRYSvQNWoS3y5ZFH
	oArJaf8DiZa7cIG0vNgTnFaUuJSZlLdXSSFHA7NNvBCJ+xsznIcHktGWc1U3IuQ8uKWy
	0v1HfHi77XcFNrXXK40vdeumX6EMNg7ewbIQSgK9lQ5m6FP5X6cSS5j7mNgACAAfT2/X
	pvDBe3K3o2/d/mII0M6RStBcbO9JvjXiSzLqI+EKjMQEKf27tFRAKIvdA981Ph9ivTAs
	r0GSz24pxz0YNW0KJp6ly7Y4YqmbNoC1N87iekqoU2e6il925JTWGT9AJp33qn1B9gRj
	Y+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=11NbikiKYh0ugXAfWheZUEGVIc+wK9qm6xpG5Jyntvc=;
	b=bU7KG5Wr6Cylp2j07I5RbmDuCMtDukkhEOHkY9Kw2H1HDnB7VPm2NBoGSHQuqHOsDq
	TxtvcG2ZOJbRagP+lRcyGOKGnT08neYkfCo4wsd8tWAY/f8Y01/kaaqzGZHDOPAL02Ze
	+GaAvJk1I2yd66FyrWCq0m9IE2wiQaQ5xNhhS3pqc+3hVBoxLc1qUsWTb6qmLK2CR99s
	3LC2GnlcJ8dBCJPokTTvBajTQYBNyDNckyPyIPjph+QR0vQV05XZAWkObcedhfBCnAkR
	p8XSyokAIT0JxuktspI5FwI+i+Pvp1/iwS11CSGOmyiG/kHlbkzpNdHfKEuN+hKhRY+K
	ZSKg==
X-Gm-Message-State: ALQs6tDXhG6XkHlvJc5iXJQ1Q5k4bymhrSp+R2OT2JMgyPPYr2ZeQ0QB
	167EZUKEYdrurxyGIuH7dqk=
X-Google-Smtp-Source: AIpwx4/nneuE4tXBEkEpD45MtdmJorXj5lbNfhVXb6spE5A6t6/uEMTjFuvMygyVmx9QJ7JaVVxfVA==
X-Received: by 2002:a17:902:bb8c:: with SMTP id
	m12-v6mr16191078pls.119.1523170743485; 
	Sat, 07 Apr 2018 23:59:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:23 -0700
Message-Id: <1523170729-26321-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 11/37] ctdb: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:02 -0000

WARNING: ctdb-2.5.6-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 02-link-rep_snprintf-for-ltdbtool.patch
patching file Makefile.in
Hunk #1 succeeded at 176 with fuzz 2 (offset 6 lines).

Now at patch 02-link-rep_snprintf-for-ltdbtool.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch         | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch b/meta-networking/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
index 1dd9b93..1294fe4 100644
--- a/meta-networking/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
+++ b/meta-networking/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
@@ -2,15 +2,16 @@ link rep_snprintf from lib/replace/snprintf.o for ltdbtool
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
-diff -Nurp ctdb-2.5.1.orig/Makefile.in ctdb-2.5.1/Makefile.in
---- ctdb-2.5.1.orig/Makefile.in	2015-05-07 16:43:39.276000236 +0900
-+++ ctdb-2.5.1/Makefile.in	2015-05-07 16:44:09.627000237 +0900
-@@ -170,7 +170,7 @@ bin/ctdb: $(CTDB_CLIENT_OBJ) tools/ctdb.
+Index: ctdb-2.5.6/Makefile.in
+===================================================================
+--- ctdb-2.5.6.orig/Makefile.in
++++ ctdb-2.5.6/Makefile.in
+@@ -176,7 +176,7 @@ bin/ctdb: $(CTDB_CLIENT_OBJ) tools/ctdb.
  	@echo Linking $@
  	$(WRAPPER) $(CC) $(CFLAGS) -o $@ tools/ctdb.o tools/ctdb_vacuum.o $(CTDB_CLIENT_OBJ) $(LIB_FLAGS)
  
 -bin/ltdbtool: tools/ltdbtool.o $(TDB_OBJ)
 +bin/ltdbtool: tools/ltdbtool.o $(TDB_OBJ) lib/replace/snprintf.o
  	@echo Linking $@
- 	$(WRAPPER) $(CC) $(CFLAGS) -o $@ $+ $(TDB_LIBS) $(LIB_FLAGS)
+ 	$(WRAPPER) $(CC) $(CFLAGS) -o $@ $+ $(LIB_FLAGS)
  
-- 
2.7.4


