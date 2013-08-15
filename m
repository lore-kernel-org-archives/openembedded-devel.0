Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7486B825
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:35 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so182601eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0GiSzItNllpBgq92Dw9LbaVeueDMZtojmy5PIgjcttw=;
	b=JD/XtiaM5rd7QTBgbMiND/VWf1G1nnRn43ARg6C3eefY3bm0MIeo8ZATyMRTg1zvu7
	pMzKDXxH3UrFGDLZEqsI5adOcNUq6HkJtsgQXKF9sbXMjFRjR52BWynJkMTo5YeQGlYt
	W167ctEE0VnVmlz4tzGsxiZ5mm3hL9ioKIoR/p75tMxGDD2nKEicYRagH7oKj74iyBXR
	HA/Gt05UBA+YMYg6SiEAa3eEYP0CTkiII00tV2ntjAdM07ZMwusAlsPXdEZLJtvew+Wx
	YnTRhg+RlwNx+IBDMaHuA6na1MaGtXlX2BTC9iuce91uESpVa+/FDr4LAgIXx1FXLhSF
	AORA==
X-Received: by 10.15.107.132 with SMTP id cb4mr2783262eeb.54.1376551175764;
	Thu, 15 Aug 2013 00:19:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm81932522eeg.5.2013.08.15.00.19.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:12 +0200
Message-Id: <b9d346d92f428cb7eba52bb513c1fa6bbbe76b53.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 32/60] rrdtool: add PACKAGECONFIG for dbi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:19:35 -0000

* dbi was autodetected from sysroot causing undeterministic builds and failures
  in lmsensors builds:
  ld: warning: libdbi.so.1, needed by sysroots/qemux86/usr/lib/librrd.so,
  not found (try using -rpath or -rpath-link)
  sysroots/qemux86/usr/lib/librrd.so: undefined reference to `dbi_result_get_string_idx'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
index b92fe2f..dc43163 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
@@ -19,6 +19,9 @@ inherit autotools gettext
 
 EXTRA_AUTORECONF = "-I m4"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dbi] = "--enable-libdbi,--disable-libdbi,libdbi"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-local-libpng \
-- 
1.8.3.2


