Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id EFB076FF56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:30:27 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id b67so42125464qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zZODbu+dchDo7HnbZTFCyH+LoCgrZ1UhU2BnXtE17FQ=;
	b=vF8YngyHhB0hgu9zIsD20YfCAoLB9+gSUPQKUAS9BXxiJB/bODHFdXAGzK2e7U8euK
	SgHKaArAyUcxVa/f0lsnUtf1mL2yjyibOF3Ll35FqKdXQ7JPOf/nezbBFmKwPv/jQhZn
	0TDuZgY1QcwgiFDDNFMdMsac20SDU64EG0/ieQtmFHz8Mj0BQEQQJQRLe/Vk7N6PSbgP
	mg7edeiafJQ70/L4dgnzYdthyzcsZhmzlZQBoW5ZxU+MPtSGpPvLMgJ5ix0e2GGZYdN9
	TrNhlo9lxjIhGRIUIOGKOi0FFlTfj6rF/WoB/WpdnyzkCDw2Ok92+oWEy7AcXA9W2C9G
	/O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zZODbu+dchDo7HnbZTFCyH+LoCgrZ1UhU2BnXtE17FQ=;
	b=A1TO63bW+QWjDeZprkDAT9B3LHkRHGesIEXb9pmP+aqdVh/kKYcGjcwncNl/56wXMB
	Z7mr5RH5GV1s7nlk7WzEKBXK/d6v6t2Lv89NGLxgokmF3/5GND6Iuoz017I29Noht89z
	9EdjsvYHD33cnapP55Kc51RVsjEHTT3YvYJdkVoanLcCGfCLT+CUjCnLZhsNgZugRbb9
	uh9m6IEePh5rXF1SdbrfY0CwjecERhoI2XgXiNXRjvgXW1TJlcjOmIRJQ4IVyQBTQSkB
	o/Cfn2OxGzJNpRUzJ8CTxh17AN8bxd1GuUG0snTV2uItK89vJn2S9oLAYViAfStfNEhO
	+akw==
X-Gm-Message-State: AG10YOSEwV5tdf0Q0x8zv8rF0PxHFJNlo/gJbQn814usomOJjdntVuWYblVyLRASM74igg==
X-Received: by 10.140.145.72 with SMTP id 69mr10854225qhr.95.1455816628247;
	Thu, 18 Feb 2016 09:30:28 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.127.4.90])
	by smtp.gmail.com with ESMTPSA id
	p129sm2925535qhp.44.2016.02.18.09.30.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 09:30:26 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2016 15:19:05 -0200
Message-Id: <1455815945-9857-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-oe][PATCH] fio: Remove --disable-static from EXTRA_OECONF
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
X-List-Received-Date: Thu, 18 Feb 2016 17:30:28 -0000

As of commit OE-Core:773c9e18071d71454473dd81aff911104a2e9bc6
EXTRA_OECONF is appended with the option --disable-static on
DISABLE_STATIC variable and this cause the error:

    DEBUG: Python function sysroot_cleansstate finished
    DEBUG: Executing shell function do_configure
    Bad option --disable-static
    --cpu=                 Specify target CPU if auto-detect fails
    --cc=                  Specify compiler to use
    --extra-cflags=        Specify extra CFLAGS to pass to compiler
    --build-32bit-win      Enable 32-bit build on Windows
    --build-static         Build a static fio
    --esx                  Configure build options for esx
    --enable-gfio          Enable building of gtk gfio
    --disable-numa         Disable libnuma even if found
    --enable-libhdfs       Enable hdfs support
    WARNING: exit code 1 from a shell command.

So, we need to disable this option.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
index dca0e64..5bf387c 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
@@ -25,6 +25,9 @@ SRC_URI = "git://git.kernel.dk/fio.git"
 
 S = "${WORKDIR}/git"
 
+# avoids build breaks when using no-static-libs.inc
+DISABLE_STATIC = ""
+
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
 
 do_configure() {
-- 
2.1.4


