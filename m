Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03978C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 00:38:42 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3651.1786667913924634596
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 17:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pu2CSg5w;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so610808a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 17:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786667913; x=1787272713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHCr3sHR3hmxjXsb98FMB6SHVx0JLjcGE7hB0qTsC+w=;
        b=pu2CSg5wqpJ1skxWcTKh4MRISkYRtP9lqyqRmoH0oghPQgV5VWNF+hapnpeBMynEf1
         PM5DJLybVMVK0M062Iy1uN7tSxcGLz4fiQ0sIXR2VF5PXVkD21bVxyUs+hdaJo8bWi9V
         O7KAGvMxNfSdIk3A9Dql3uQhROAj9Y9KuLrzW3TFmT4VxAenubW/wKdXtJrL8SU+i/sI
         /gnlYgzPIDunnXDR4BEK032gzK657IGCPwm3fR1GPSNn5fXJVBiqUof5Lro42lJLiwLU
         T7A8cS/YjBXc0LakYIFcEvcD0eAikev+fufTzCKUcRdXSF0FZ7lpaJeJqCfYwd3rmsjY
         j7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786667913; x=1787272713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHCr3sHR3hmxjXsb98FMB6SHVx0JLjcGE7hB0qTsC+w=;
        b=fz6gwMX8opRMRak/hXHe1dB+/HX4Vujs7wjXqdJ/d6Ttit1iTDsbwWp5cmPcmP2bC1
         8EKbPU2yWkLLHHzFg/DPmg/TyxPQQwxwQP6EWTT2fTtYLo/LLMFgDhGakqNtTaY7dqMH
         Er7xNUXK+1y3boO7UahViTatvT9t1v5H4ogU5zwd85pkKn49u2YvUsjwCqKO1VEOmcYB
         khhy7TRM4ngyXqUZjamRwhSIHaxSO+fp0Tx5YxDdDnnNidfE6osjGJRbec8pj1LM7wxj
         DR7Nx6uabhg3Bx+dGPIJorT9R/h0zBnZwxLqHqvhJu5yPATpueKB62cbdQk0kp6nQvpz
         097Q==
X-Gm-Message-State: AOJu0YyKUsxBAWT6Ok/L0P9eWvlwrqLgH1RkdefNW3G+lqxXai0EQ1DB
	hQx8HJnShhlZIjI3UZL8xT2MuyUh4lhKTM4UEyIvNjElPWC1w5ietQc7a/vbTg==
X-Gm-Gg: AR+sD13kDXX1GWy0rkBH6l1N7kmFEhP1fcpkNgRr98u5wjlZpIrsHBwl9ie1Z7HxFU3
	Pr3I7Vyx1qystGjMNRxsTuqkAoamla8xoGhopdJaye2CrSDdh77z8pJcwIO3uqHivNdsZcUgk5Z
	anD070YFLLdVm2lk2P9arMVE6bdQOZ1zQF6doIkdBWY0+goDcOEnolS/FscwtO46ook86FFlY5y
	OfTmr4XJ08dlAAKaoky35cpVgfhBjlQ+W6sHlygwiesEncOpkYB+U/zLiGZQLSvAjLFWbDWiB4x
	/gqNY6E0YhIO/Pmwm6+I6YP58nL74PVu006//MPT+Gun70n8c8IYGhP5TqtIsFlttoNnChSimd3
	NOzDcGdJryX9aAX+n1c6NR5YqChvniLtWsLcASI/x6vvdk2QrbsCEkFZzHO3KxuCUKzNRhr3iH4
	vCOg6ZNOe2n6eunqswXtDyNQXW913Qc3KOwLyBy/oVi6uEW++UCgd7WreM+t09mAToMto83Z09F
	diuDOsdEa8wcJuxjs76Epah4sw+d9OWtR5mUJmFa6ahbD0JlEDZhUkUYvfY9o17+YeNCTCNL+Ho
	X+Nu7TnDvpVfqTRx9f/gY+ePRPfnliyUT1ZpX2qaIbFH69xHFJgO+iFf1S/6FD4TW2qKrXXXxfR
	gDpU+RVK8RaWzyCVpA1ZaFO1rpN8zbq/6Qk1U0yMOMQYUMw==
X-Received: by 2002:a05:6a20:430a:b0:3c3:c07b:5322 with SMTP id adf61e73a8af0-3cc71e7d6f0mr1552726637.34.1786667913252;
        Thu, 13 Aug 2026 17:38:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm3236209c88.2.2026.08.13.17.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 17:38:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 4/4] openipmi: add SWIG py2/py3 C-API compat patch for python bindings
Date: Thu, 13 Aug 2026 17:38:19 -0700
Message-ID: <20260814003819.1417656-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814003819.1417656-1-khem.raj@oss.qualcomm.com>
References: <20260814003819.1417656-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 00:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129028

The Python-language SWIG typemaps in OpenIPMI_lang.i use the Python 2
C-API names PyInt_Check/PyInt_AsLong/PyInt_FromLong/PyString_FromString(AndSize).
Python 3.14 no longer ships any fallback definitions for them, so the
generated OpenIPMI_wrap.c fails to compile:

  OpenIPMI_wrap.c:13486:10: error: use of undeclared identifier 'PyInt_Check'
  OpenIPMI_wrap.c:14950:21: error: use of undeclared identifier 'PyString_FromString'; did you mean 'PyLong_FromString'?

Add a patch mapping them to their Python 3 equivalents.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nIPMI_lang.i-add-py2-py3-C-API-compa.patch | 43 +++++++++++++++++++
 .../openipmi/openipmi_2.0.37.bb               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-support/openipmi/files/0002-swig-python-OpenIPMI_lang.i-add-py2-py3-C-API-compa.patch

diff --git a/meta-networking/recipes-support/openipmi/files/0002-swig-python-OpenIPMI_lang.i-add-py2-py3-C-API-compa.patch b/meta-networking/recipes-support/openipmi/files/0002-swig-python-OpenIPMI_lang.i-add-py2-py3-C-API-compa.patch
new file mode 100644
index 0000000000..5f9f892228
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/0002-swig-python-OpenIPMI_lang.i-add-py2-py3-C-API-compa.patch
@@ -0,0 +1,43 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Subject: swig/python/OpenIPMI_lang.i: add py2/py3 C-API compat macros
+
+The Python-language SWIG typemaps use the Python 2 C-API names
+PyInt_Check/PyInt_AsLong/PyInt_FromLong/PyString_FromString(AndSize).
+Python 3.14 no longer ships any fallback definitions for them, so the
+generated OpenIPMI_wrap.c fails to compile:
+
+  OpenIPMI_wrap.c:13486:10: error: use of undeclared identifier 'PyInt_Check'
+  OpenIPMI_wrap.c:14950:21: error: use of undeclared identifier 'PyString_FromString'; did you mean 'PyLong_FromString'?
+
+Map them to their Python 3 equivalents.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/swig/python/OpenIPMI_lang.i
++++ b/swig/python/OpenIPMI_lang.i
+@@ -31,6 +31,24 @@
+  *  Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+
++%{
++#ifndef PyInt_Check
++#define PyInt_Check(x) PyLong_Check(x)
++#endif
++#ifndef PyInt_AsLong
++#define PyInt_AsLong(x) PyLong_AsLong(x)
++#endif
++#ifndef PyInt_FromLong
++#define PyInt_FromLong(x) PyLong_FromLong(x)
++#endif
++#ifndef PyString_FromString
++#define PyString_FromString(x) PyUnicode_FromString(x)
++#endif
++#ifndef PyString_FromStringAndSize
++#define PyString_FromStringAndSize(x, n) PyUnicode_FromStringAndSize(x, n)
++#endif
++%}
++
+ %typemap(in) swig_cb * {
+     if ($input == Py_None)
+ 	$1 = NULL;
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
index c945428307..9409a67d4b 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
@@ -29,6 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://ipmi-init-fix-the-arguments.patch \
            file://include_sys_types.patch \
            file://0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch \
+           file://0002-swig-python-OpenIPMI_lang.i-add-py2-py3-C-API-compa.patch \
            file://openipmi-helper \
            file://ipmi.service \
            "

