Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A50F274197
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 19:19:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so21102978wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 11:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=g7/mKLeH5M1FMk2uTwjTeFEEGXQ7rA4gR5s2WjDSAzc=;
	b=eMenbX6open/65EdaJT8YNi612JdiJRjUraFH+x/AX7siZ5/WT7dUfad8tT9HUsHqw
	GwaU19MIeELw9c6MuIp2UueNhcl7CnTx6SLet1bpCUCb5dpqiNjdzsyHNXdamU+3dZhm
	g/fD1KrOefHDmH74K3tuNNB6uVBQ8ZNrkTZgZ7t95InGHbrzYoj5gcydNzF0AH7XkXtr
	j6Hk+ymYh71+NNOE0JOJC4Wqv7sya6mIGsM0mG095Qv65ctZYthFbUtX6SgKEy28jLw2
	a1UO/LJrw1MBcn3kQSeW9T2LMi16sWbKyUZQRXju0SvtWDlDXlSRmCPrPKfH8hxV2LG3
	jRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g7/mKLeH5M1FMk2uTwjTeFEEGXQ7rA4gR5s2WjDSAzc=;
	b=rHggycPrIQNFDMarfC0oqKPkD4ITyq6YECP200DvupeNY45mXpdiNj4NsTkFVbqWS3
	b7ynzNtau7++JiDN9l6BZpY7MVhWGSPCgFjhYxeZ0WIilX0338jyfcKR6YktlGIv553M
	ZIiApF0GJp0SNPLBWgPhPU2h40HS2YN0p3Rien0ISLN5jgqLQsGv3aY4rcUigH3Lcihk
	fZg1wHGTVtmTJLS7VxoxfIoprspMonwzvPiZ3pldVJy+pJUm8ASMT+s81veAOJphvdpo
	oha4vKvsh8L5PGRad9J3OH2pkz8rFUdA1wldrHmZWSQdDhoEmEEI+etFwIUkvorHKIXW
	5IRg==
X-Gm-Message-State: AMke39luywke/bsfqXIexcPDs75xsPEFSZPtTiIGOi+AR7YaBHnnrC8LJi7WpuzwWo8iHQ==
X-Received: by 10.28.203.6 with SMTP id b6mr38194814wmg.2.1487013589329;
	Mon, 13 Feb 2017 11:19:49 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id i15sm465122wmf.21.2017.02.13.11.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 11:19:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 20:19:47 +0100
Message-Id: <20170213191947.24394-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH][meta-browser] chromium-browser: add missing dependency on gperf-native
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
X-List-Received-Date: Mon, 13 Feb 2017 19:19:50 -0000

* chromium-wayland fails with:
  http://errors.yoctoproject.org/Errors/Details/132852/
  FAILED: gen/blink/platform/ColorData.cpp
  cd ../../third_party/WebKit/Source/platform; gperf "--key-positions=*"   -D -s 2 ColorData.gperf   "--output-file=../../../../out/Release/gen/blink/platform/ColorData.cpp"
  /bin/sh: 1: gperf: not found

* chromium fails with:
  http://errors.yoctoproject.org/Errors/Details/132851/
FAILED: gen/blink/core/CSSValueKeywords.cpp gen/blink/core/CSSValueKeywords.h
cd ../../third_party/WebKit/Source/core; python ../build/scripts/make_css_value_keywords.py css/CSSValueKeywords.in css/SVGCSSValueKeywords.in --output_dir ../../../../out/Release/gen/blink/core --gperf gperf
Traceback (most recent call last):
  File "../build/scripts/make_css_value_keywords.py", line 177, in <module>
    in_generator.Maker(CSSValueKeywordsWriter).main(sys.argv)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/chromium/52.0.2743.76-r0/chromium-52.0.2743.76/third_party/WebKit/Source/build/scripts/in_generator.py", line 95, in main
    writer.write_files(options.output_dir)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/chromium/52.0.2743.76-r0/chromium-52.0.2743.76/third_party/WebKit/Source/build/scripts/in_generator.py", line 71, in write_files
    self._write_file_if_changed(output_dir, generator(), file_name)
  File "../build/scripts/make_css_value_keywords.py", line 172, in generate_implementation
    gperf = subprocess.Popen(gperf_args, stdin=subprocess.PIPE, stdout=subprocess.PIPE, universal_newlines=True)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/chromium/52.0.2743.76-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 711, in __init__
    errread, errwrite)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/chromium/52.0.2743.76-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 1343, in _execute_child
    raise child_exception
OSError: [Errno 2] No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium-browser.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index 8c73207..54ca3d4 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -16,7 +16,7 @@
 include chromium.inc
 
 DESCRIPTION = "Chromium browser"
-DEPENDS += "libgnome-keyring"
+DEPENDS += "libgnome-keyring gperf-native"
 
 SRC_URI = "\
         http://gsdview.appspot.com/chromium-browser-official/chromium-${PV}.tar.xz \
-- 
2.11.1


