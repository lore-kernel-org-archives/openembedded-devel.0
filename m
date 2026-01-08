Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD3DD148BE
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:46:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1640.1767858384274054361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kzZnVW0W;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1406136f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 23:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767858383; x=1768463183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z7WNFFvSjPyJgLNPUu99rJXsDMg9AiFUZuMDJnSJZ4=;
        b=kzZnVW0Wt5jMJEwjHqGyV0QqlIJbupLE1C0PZIwJcGmcfV1BMEolS7gOInVCQuVISc
         7wM6QjghCPSMjvQH18+goC562LSeUGoIKWisauxS0vzC5golF4t8TaKb6Iq5cU7SQI2M
         kvFyZoDtgBU8bg75gH+GXR3d9Jt9lHg1XzHdy/EMJo8I5pFWEqYGvj8sB2Z2QFi8BQ7s
         Cc9bP6TvI4VQAsVYm6WOybcSga2t4tNZnc6knK/t5On1VMnfz6WOW76HpDELaUXsujCw
         rjzAvRalKdX9gDCRh9F+pg+FNgnc5K9pzQ+zcVKBFcqhM0u7ZF0u3UOjC73KLrct5N1x
         c6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858383; x=1768463183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/z7WNFFvSjPyJgLNPUu99rJXsDMg9AiFUZuMDJnSJZ4=;
        b=GrvURr8P1g5vsjMZ1xzKmIRDqLrthUbnOmzKn9eEGlGOOT8SPpd95+9Fpveh/yEzQt
         PGbnIv8FOieVoCLgNrR2Ir7JXhNnjnmR5yNf/wSazN0igKZqm12HdIeaoZEIo23HQJvG
         MsHN5imZka87+rh/5pkbgZEHGP/lw+e8d4iO1h/36rtB10ljls7hPVtvEWPArfmGayE8
         DzHTAsksbiLKL0RAQs3mxoFJwzqX+fLlzXhk/Z+BPivYfyI1NNqbYZ7zCazD2/sVqXuP
         IHzRL1qugOrbMwNp+o8yoQNULoGrH3WeXwL5OHjQH1qp5UDUXOhnF/RY9oDOVimAoFkq
         bh9g==
X-Gm-Message-State: AOJu0Yxz7RKoT4afxsof2y6jn/mBzQmXHid5KFquWxYLPqhtSyOdz3gv
	zFYT4Ns5Wgfo/M02OrKqmsw15ELcAHrnGNdlRRwVoUFDAeChiXDDPp0F0PwTvQ==
X-Gm-Gg: AY/fxX46e0d+JpKyvSXuA7mSWDxPpdo50GuU1GvNxxfwEaGHJLwt+9PerkyGfGG9wf2
	/o33mZV3bJNe0/ERBdUxzsO5GaEx46U1kWIZp/sUsJCS7G55V7DoLo/Li4nGLuar9LnREG9odxs
	6Ei/vu4VNzFUWLCxwmo3vzdw+csfO4hJJvc/rrQ5PAMJbcP/kExWtvhP55ePtCYLQatB/PmF+9+
	Eze0dlRjvkWk9lVSsOLic2PICg24YgRoih++JUpsNVMPySEPydFrSwIgok2TG7+n5DUMO4pGClx
	a4GlkkCCz2VDdCKGHqx4fWG5BCmX6kYHYPrbRiPJlwI4TNzAhszbIwn4I61647btT1vCvdyWwG+
	keqDo7hI1Ix1Ca1u+DrrX2jbt5cquexChMnzzGvA+3qmsUY28+BHfoul9CjZTQbFVQBGU48K5Xe
	upWIhOGffo
X-Google-Smtp-Source: AGHT+IFA0yXCObkFU9f59e/ftVCE3JJQ5pU+DYkq1tygqrsJv3vQTae4rmpSbYBPEs6qzbV4jqFqFg==
X-Received: by 2002:a05:6000:258a:b0:431:1ae:a3be with SMTP id ffacd0b85a97d-432c36280damr6166209f8f.3.1767858382570;
        Wed, 07 Jan 2026 23:46:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm15200292f8f.11.2026.01.07.23.46.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 23:46:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/5] python3-tqdm: patch CVE-2024-34062
Date: Thu,  8 Jan 2026 08:46:17 +0100
Message-ID: <20260108074618.2782232-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108074618.2782232-1-skandigraun@gmail.com>
References: <20260108074618.2782232-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123252

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-34062

Pick the patch mentioned by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-tqdm/CVE-2024-34062.patch  | 64 +++++++++++++++++++
 .../python/python3-tqdm_4.64.0.bb             |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tqdm/CVE-2024-34062.patch

diff --git a/meta-python/recipes-devtools/python/python3-tqdm/CVE-2024-34062.patch b/meta-python/recipes-devtools/python/python3-tqdm/CVE-2024-34062.patch
new file mode 100644
index 0000000000..a4aaf6248b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tqdm/CVE-2024-34062.patch
@@ -0,0 +1,64 @@
+From 35f8daf26d28950aa44a763f19a13c6ee133ff6c Mon Sep 17 00:00:00 2001
+From: Casper da Costa-Luis <tqdm@cdcl.ml>
+Date: Wed, 1 May 2024 14:56:01 +0100
+Subject: [PATCH] cli: eval safety
+
+- fixes GHSA-g7vv-2v7x-gj9p
+
+CVE: CVE-2024-34062
+Upstream-Status: Backport [https://github.com/tqdm/tqdm/commit/4e613f84ed2ae029559f539464df83fa91feb316]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tqdm/cli.py | 33 ++++++++++++++++++++++-----------
+ 1 file changed, 22 insertions(+), 11 deletions(-)
+
+diff --git a/tqdm/cli.py b/tqdm/cli.py
+index 3ed25fb..e4f587b 100644
+--- a/tqdm/cli.py
++++ b/tqdm/cli.py
+@@ -21,23 +21,34 @@ def cast(val, typ):
+                 return cast(val, t)
+             except TqdmTypeError:
+                 pass
+-        raise TqdmTypeError(val + ' : ' + typ)
++        raise TqdmTypeError(f"{val} : {typ}")
+ 
+     # sys.stderr.write('\ndebug | `val:type`: `' + val + ':' + typ + '`.\n')
+     if typ == 'bool':
+         if (val == 'True') or (val == ''):
+             return True
+-        elif val == 'False':
++        if val == 'False':
+             return False
+-        else:
+-            raise TqdmTypeError(val + ' : ' + typ)
+-    try:
+-        return eval(typ + '("' + val + '")')
+-    except Exception:
+-        if typ == 'chr':
+-            return chr(ord(eval('"' + val + '"'))).encode()
+-        else:
+-            raise TqdmTypeError(val + ' : ' + typ)
++        raise TqdmTypeError(val + ' : ' + typ)
++    if typ == 'chr':
++        if len(val) == 1:
++            return val.encode()
++        if re.match(r"^\\\w+$", val):
++            return eval(f'"{val}"').encode()
++        raise TqdmTypeError(f"{val} : {typ}")
++    if typ == 'str':
++        return val
++    if typ == 'int':
++        try:
++            return int(val)
++        except ValueError as exc:
++            raise TqdmTypeError(f"{val} : {typ}") from exc
++    if typ == 'float':
++        try:
++            return float(val)
++        except ValueError as exc:
++            raise TqdmTypeError(f"{val} : {typ}") from exc
++    raise TqdmTypeError(f"{val} : {typ}")
+ 
+ 
+ def posix_pipe(fin, fout, delim=b'\\n', buf_size=256,
diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb
index 3cb45f1a6e..5533b34d25 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb
@@ -5,6 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=1672e2674934fd93a31c09cf17f34100"
 
+SRC_URI += "file://CVE-2024-34062.patch"
 SRC_URI[sha256sum] = "40be55d30e200777a307a7585aee69e4eabb46b4ec6a4b4a5f2d9f11e7d5408d"
 
 inherit pypi python_setuptools_build_meta

