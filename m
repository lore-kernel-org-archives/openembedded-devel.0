Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1393ACCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:34 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18375.1777549645367788634
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KURmu/fU;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35f9ab079bdso521204a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549644; x=1778154444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvUVqa4XN35fomXswiRDHtp6FY7sTMTtsbhEc3ccGdg=;
        b=KURmu/fUmMg4zL0grzIesvHh743bfDhXuWKFi0mJ+u2wen+TrcsuHscCBXsTpj5Bnh
         RP67OKZS2jDu2Z4MThF9Qpqe3QpnuhGpyiAQ/7sQ3SH/R40HBcLCwBxUc24V2rrCx55a
         1tCZ1r4rmf56s25qgNzK/Y3+KRqsBftX97jZZLY3RYne4ZSF918u6JSltFMIXjSTwKdB
         aUV44DuHyox8O7JymmKYJE6pFgOWXELmneAzftpR9F8L/c7NYPcYFcp00U4E3D8cr2Vh
         SbbU6iPRz7/v0dxLPVN7huLdTpF0qyUkfFudE3dp+4m/tNnwC/YAnpLDdharCeBBcxFU
         c53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549644; x=1778154444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TvUVqa4XN35fomXswiRDHtp6FY7sTMTtsbhEc3ccGdg=;
        b=B2igVWUcORSX5s352HqdvywLeJX8ELNj8zKKg06flWRkM3p3eJBbwa8dKQbuIp6W3I
         R67gX05J+n+WtLrg2Rnxz5hbOURxjpHi6DW9dcxEjn8EvCC6h9ll8a3VR2ace9qyM5nj
         bGmanrIWO4LFv9VSuhgf4oGH6NpsVbGH8yWNWnIl2fm54Tu2tc369BP+0R/wL7ddTLO+
         R9amf4hjdPEj4+s5bYQl8HmAvAEgHLoFq6gKMfLsLEeploqqosHhaKg8Q90wYnK4/zcf
         NJTeH6UUxuzOT+DA92EQ1RYfgwMdWbXAXkJOpXASqIHIglOjxXg/JeJE5ED4+1MzSJiV
         TH1A==
X-Gm-Message-State: AOJu0YwEtmYXw//FiInprwWOWJNl5SNZibetoZly/TGI0rgKKmbz8LkQ
	hw/NnoN/F+HxD0Gw911abWCtdcp/VqQVYxDOZBDdMOvs32ZLaburZk48b9gmzAZp
X-Gm-Gg: AeBDietY8PDQAb0igIZUUIjuXabcfJDFo+ohiztyz4NUP9x0cNDtpeJVNz5FGEwMVCB
	E9H3pG7AxnA9VQOf0L2/JFPcziebR7GlQUT2WTgkMNvQ5hJVC8a0RdYFVqUI1hFBxrU8s9NS7nz
	QmDmr+pR3CWfafe+2lI6ADlVPoTVtBPqwRBQEVJWpkhNGbgEPoZo8V3pdNuke1G/C7TKv884f0v
	REYveKQanBWc2HY74+H3XNhiPWGvwKXwL8cHX7YJj5u+yX7mGWxA4bgi87imEkNfh7ZmtpJnG2J
	iR+w6aXQx/5qF0BaJdlQ1A4YHq8QEkJkvQz8j1RDYH61+WWemd8oRkAQ7KP9SPi4brglf1kjwIE
	ictBuPBrAgYKElYJiNTxkWt4sUHXArXfg5BwsYm+RL29Iw4pZIrX+UXnKMY/6YdRLovDFMLO0x0
	Qd4crvnerx120ltQNlEc5llkXiMaAhn/GY3mta7QLKBinp1no=
X-Received: by 2002:a17:90b:3e4f:b0:35f:bca7:5d22 with SMTP id 98e67ed59e1d1-364c2f8aecamr2531881a91.10.1777549644532;
        Thu, 30 Apr 2026 04:47:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 9/24] python3-werkzeug: upgrade 3.1.6 -> 3.1.7
Date: Thu, 30 Apr 2026 23:46:32 +1200
Message-ID: <20260430114649.4184890-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126743

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- parse_list_header preserves partially quoted items, discards empty items, and
  returns empty for unclosed quoted values.
- WWWAuthenticate.to_header does not produce a trailing space when there are no
  parameters.
- Transfer-Encoding is parsed as a set.
- Request.host, get_host, and host_is_trusted validate the characters of the
  value. An empty value is no longer allowed. A Unix socket server address is
  ignored. The trusted_list argument to host_is_trusted is optional.
- Fix multipart form parser handling of newline at boundary.
- Response.make_conditional sets the Accept-Ranges header even if it is not a
  satisfiable range request.
- merge_slashes merges any number of consecutive slashes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit db8bd24b0db925cdbd4b9d444981846871c354f2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-werkzeug_3.1.6.bb => python3-werkzeug_3.1.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.6.bb => python3-werkzeug_3.1.7.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
index e0caea2d3a..3dae69f7ca 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "210c6bede5a420a913956b4791a7f4d6843a43b6fcee4dfa08a65e93007d0d25"
+SRC_URI[sha256sum] = "fb8c01fe6ab13b9b7cdb46892b99b1d66754e1d7ab8e542e865ec13f526b5351"
 
 inherit pypi python_flit_core
 

