Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1245C10DC1
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 12:18:12 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.70825.1701346683843991004
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 04:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dnB9YNQt;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54bf73788a8so874328a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 04:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701346682; x=1701951482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IB1hRIajkgJqPNl/GwkWr1I+DvdpPToZaznFHgNyPBs=;
        b=dnB9YNQt7ZqUYwGMYz3W34mu8tXoO0TQX9DMerXKqdWdmLyktiH5z3XhFrN/F+0zwC
         RXNKh8UvvpFrZZUAGKao5mWun+F7Lf2pO0oLZV4K7XI/VgC6lxyW7zSuU9WdU36F/Jlb
         e8NUP+6+9f75TmsGdFsm/7JjAv2MdcuXlAKURtOMnB83LUgsxDOGolihGEw7Kntto7Ru
         EEANnEzzArrK58U2HRqZeyuJwWjFatvHP/ARt9VKR/MN8UIZ2g+0wL8J5bV82lg8Qtdn
         G9uINooPSw21cgZItGkCVbyDlMFxsKz/ni13g5NM21PNaNhxPmfHxR9MRL+Up17GLW5M
         4dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701346682; x=1701951482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IB1hRIajkgJqPNl/GwkWr1I+DvdpPToZaznFHgNyPBs=;
        b=xJmXHP5AhjPRiP1FElEDozdaHYE+EaQjS2BMqZW4wu3X8JUEzAarQt6gNJVlo7nFuV
         IbzEjGVFquHWiKLT4O0dHT1+6b34yR75M5xglsUgcQphRx8reWXGR3sKTPj5wWmIabBy
         gQgRl+Nmh+RCV9mPl24tzFL6XEGJuhl4ys4dq6acKmMC7nxUA0t7vbAXYO2304cOl/Oj
         vG5GoD0veHJEmAmDjVElUpDIjVA6Y15zkXMVY+S03zP91u73+UbQJYP5auxMZpmDjaxO
         PCog1X/j5ti2/ZDxm8J523Rfzp/sLdr7SY2DlQvMA0AT+aSNorwhQT2wDk2PcLL/168e
         aIvA==
X-Gm-Message-State: AOJu0Yw5gcpkJlTlx6k5tbxTT0ToH7roGjotz7egycnTbzktg5933/OB
	lX9GtQyNMObBJAGKWm4hhknWBsKYtco=
X-Google-Smtp-Source: AGHT+IHu67AawqzpxT2we4wIPMN6PCSg9rg2l8HQdvnoes01zS1GiB0+vqvmh7PmxE6OvEm1Wbxdxw==
X-Received: by 2002:a05:6402:50d3:b0:54b:532b:1f15 with SMTP id h19-20020a05640250d300b0054b532b1f15mr12017424edb.33.1701346681881;
        Thu, 30 Nov 2023 04:18:01 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7c695000000b0054af73f3c72sm489476edq.11.2023.11.30.04.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 04:18:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] glmark2: inherit python3native to fix build with python-3.12 on build host
Date: Thu, 30 Nov 2023 13:17:54 +0100
Message-ID: <20231130121754.335429-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 12:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107172

* fixes:
| WARNING: Unable to execute waf --version, exit code 1. Assuming waf version without bindir/libdir support.
| DEBUG: Python function waf_preconfigure finished
| DEBUG: Executing shell function do_configure
| Traceback (most recent call last):
|   File "/OE/build/luneos-kirkstone/tmp-glibc/work/core2-64-webos-linux/glmark2/2021.12-r0/git/./waf", line 163, in <module>
|     from waflib import Scripting
|   File "/OE/build/luneos-kirkstone/tmp-glibc/work/core2-64-webos-linux/glmark2/2021.12-r0/git/waflib/Scripting.py", line 6, in <module>
|     from waflib import Utils,Configure,Logs,Options,ConfigSet,Context,Errors,Build,Node
|   File "/OE/build/luneos-kirkstone/tmp-glibc/work/core2-64-webos-linux/glmark2/2021.12-r0/git/waflib/Configure.py", line 6, in <module>
|     from waflib import ConfigSet,Utils,Options,Logs,Context,Build,Errors
|   File "/OE/build/luneos-kirkstone/tmp-glibc/work/core2-64-webos-linux/glmark2/2021.12-r0/git/waflib/Options.py", line 6, in <module>
|     from waflib import Logs,Utils,Context,Errors
|   File "/OE/build/luneos-kirkstone/tmp-glibc/work/core2-64-webos-linux/glmark2/2021.12-r0/git/waflib/Context.py", line 5, in <module>
|     import os,re,imp,sys
| ModuleNotFoundError: No module named 'imp'
| WARNING: /OE/build/luneos-kirkstone/tmp-glibc/work/core2-64-webos-linux/glmark2/2021.12-r0/temp/run.do_configure.1263276:146 exit 1 from 'waf_do_configure'

* this first issue can be fixed easily by backporting:
  https://gitlab.com/ita1024/waf/-/commit/d2060dfd8af4edb5824153ff24e207b39ecd67a2

* but then it still fails a bit later, because of SyntaxWarning in waf --version
  output:

ERROR: glmark2-2021.12-r0 do_configure: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:waf_preconfigure(d)
     0003:
File: '/OE/build/luneos-kirkstone/openembedded-core/meta/classes/waf.bbclass', lineno: 52, function: waf_preconfigure
     0048:    wafbin = os.path.join(subsrcdir, 'waf')
     0049:    try:
     0050:        result = subprocess.check_output([python, wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
     0051:        version = result.decode('utf-8').split()[1]
 *** 0052:        if bb.utils.vercmp_string_op(version, "1.8.7", ">="):
     0053:            d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
     0054:    except subprocess.CalledProcessError as e:
     0055:        bb.warn("Unable to execute waf --version, exit code %d. Assuming waf version without bindir/libdir support." % e.returncode)
     0056:    except FileNotFoundError:
File: '/OE/build/luneos-kirkstone/bitbake/lib/bb/utils.py', lineno: 148, function: vercmp_string_op
     0144:    Compare two versions and check if the specified comparison operator matches the result of the comparison.
     0145:    This function is fairly liberal about what operators it will accept since there are a variety of styles
     0146:    depending on the context.
     0147:    """
 *** 0148:    res = vercmp_string(a, b)
     0149:    if op in ('=', '=='):
     0150:        return res == 0
     0151:    elif op == '<=':
     0152:        return res <= 0
File: '/OE/build/luneos-kirkstone/bitbake/lib/bb/utils.py', lineno: 138, function: vercmp_string
     0134:    return r
     0135:
     0136:def vercmp_string(a, b):
     0137:    """ Split version strings and compare them """
 *** 0138:    ta = split_version(a)
     0139:    tb = split_version(b)
     0140:    return vercmp(ta, tb)
     0141:
     0142:def vercmp_string_op(a, b, op):
File: '/OE/build/luneos-kirkstone/bitbake/lib/bb/utils.py', lineno: 89, function: split_version
     0085:    """Split a version string into its constituent parts (PE, PV, PR)"""
     0086:    s = s.strip(" <>=")
     0087:    e = 0
     0088:    if s.count(':'):
 *** 0089:        e = int(s.split(":")[0])
     0090:        s = s.split(":")[1]
     0091:    r = ""
     0092:    if s.count('-'):
     0093:        r = s.rsplit("-", 1)[1]
Exception: ValueError: invalid literal for int() with base 10: 'SyntaxWarning'

ERROR: Logfile of failure stored in: /OE/build/luneos-kirkstone/tmp-glibc/work/core2-64-webos-linux/glmark2/2021.12-r0/temp/log.do_configure.1264918

  so it's safer to just use python3-native everywhere, instead of more patches for waf

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 188d4e5bdf..68c42b329a 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -24,7 +24,7 @@ SRCREV = "0858b450cd88c84a15b99dda9698d44e7f7e8c70"
 
 S = "${WORKDIR}/git"
 
-inherit waf pkgconfig features_check
+inherit waf pkgconfig features_check python3native
 
 ANY_OF_DISTRO_FEATURES = "opengl dispmanx"
 
-- 
2.43.0


