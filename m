Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1438DC5DF75
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:02 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2465.1786762254300760921
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L4/N6aVX;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1827526a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762254; x=1787367054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGCJtvMuknmomRi3nfpQCqLb/Oi0a6tg351AuOahgBg=;
        b=L4/N6aVX+ZGBX4WY1VPYBY5peGQM8MzSVxRymBKC78WVBrT1XNaVBjpUn4Q4dZLB6a
         mlTi5URaqXv491G+Ecp4KUM0nkM4J9wyv/+sd+Twu8spdENdHEuCcf76exYSAyvNZjN0
         ZTOlMbqXojMXmtsuA6HVf8j/UWa/sUp5H+FG1T/tyBxcWbGqQiMWNw0LaP+OZIeE/13/
         77ypUg76ELz1ShQsjU13DVngWbM6fSsQQ+gfVgOZ8fYWJAIYGf2A9UCgIwHJ0NNfl3Sf
         HHOmW4W53h6eMFCroNRlbd3VMJ+bj64ltzBLJzoVMka8Qbie49T/+qvo/V54msAPvkBE
         xyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762254; x=1787367054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGCJtvMuknmomRi3nfpQCqLb/Oi0a6tg351AuOahgBg=;
        b=rE+Kv71RDlEAudu5HfgRWl2vGYnK5VJu6CiZNlealWEwN4Pg21LHObMKFBtaHCiZIS
         QXb1xuF0DJVAUcqzClnVYql9zrzxpzi7dYpY6utFlLMBITD9sqNhYKmpjQFrmVSGyyNt
         H/A+Y+MhMMnlzrxOCNvKV1wsjP+O+UXwTOu1kK40Uw3ukJcMvCR1J+j/EGlu8UudnbgJ
         B7FRK+DpZgVGjARHW6AfRpE5CBG9N79tGgHDnXkrRm/bC2kkQST6/pt30pCE/r+ZD7xN
         xEGYSms8JF1fa7PXLqcN/c0o4LbXx4J3maZ9+uXOMOFZ7f6gvXB0VJemCmDon9sUGdI3
         TvKA==
X-Gm-Message-State: AOJu0YzjjcNHutpmb0jcTO1qowijedbJXd4KElXtzmOgpAWfib1ZcR+b
	hhWuiBg74FoK1tMZsgjZniW8DFVzusVRNvszUZhe6mJ0JoOV8zeLNo7TbhuRqx7b
X-Gm-Gg: AR+sD116oaYuhVseR0zLHFvBcugP/pNCTopSTlumwnk+FYbWqg00LJkIbUO+/iuIOH3
	wrGxRhQVsaezFdHa6wVjRTYWK93auzyofYMhQPXnlPsc2vRfFS4Gku8b2dJ/O9JN3IF2tPS8mZf
	lcJqXfPqKbdk8fJp/NROH+gFs9Cv3IepKaqIt8wvUcL7qAoCNZPZ1on22e9WFrynIBe1LZ6Kij+
	GntLiPlpBMHQcZWyHCVS/b/vSa4IgXdyXWOZib+qXo71DSuxVSLdiyXA+ksZIIGnj+f4CeTOoJ4
	7h3Q1XYhTKuAXGQbnuMkbwatFYESAabtDTdldZp+Ars0cZShDvRtJJD5a/C5qWwh8aJoCjwzKB4
	A2yzo9z5RYHxP+23bqBEjDOgGzfSDqUp2Yh9vHxpTD0H6/WMR4KuL3h9Qay5X1HcqHBC/QHVR6A
	7w3b51Oz3SxTE4WWbveasdrF4EDhGJgjTZzcq51L/ZWpz3NL3cLt0h/JH95eq2gTvOUEPWR/uwJ
	T++/SIY5T4HoEkr0QKTzJr1lO4fc4QUtsFm0hUd7fo2SVg+qQxjDF7HZtIix3aFYsXBY1v6/Q8a
	6n1PpNcTJjO/qrXhDn9Uaha8G/qEusRzeb10/INRfqlB058C5kFzDErQRt4tu0574xedeFvEUrw
	SV5bQkKv88XTzRp0mRqJekQBlLR07nhnbYYSeHocHLyL7YA==
X-Received: by 2002:a17:90b:558d:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-3933b8fc711mr11667866a91.12.1786762253578;
        Fri, 14 Aug 2026 19:50:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 104/109] samba: upgrade 4.23.8 -> 4.23.11
Date: Fri, 14 Aug 2026 19:50:38 -0700
Message-ID: <20260815025044.437694-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129169

Stay within the 4.23.x stable series (do not touch the sibling
talloc/tdb/tevent/ldb recipes). This picks up two intervening point
releases:

- 4.23.9: bug-fix release (use-after-free in ACL claims/conditions
  handling, CTDB read-only record use-after-free/resource leak, RODC
  auth fixes, among others).
- 4.23.10: security release fixing CVE-2026-6949 (TSIG/DNS OOB write
  crash), CVE-2026-58216 (KDC kpasswd OOB read crash),
  CVE-2026-58218 (DNS TKEY cache-flood DoS), CVE-2026-58221 (LDAP
  privilege escalation via internal LDB special DNs),
  CVE-2026-58222 (LDAP Compare filter used as protected-attribute
  disclosure oracle) and CVE-2026-58224 (CTDB protocol
  bounds-checking gaps).
- 4.23.11: further bug fixes (DRS memory leak, pthreadpool fork race,
  RODC/NTLMv2 trust fixes, CephFS vfs crashes).

All 13 existing patches (including the musl-only pam/getpwent_r ones)
still apply cleanly against 4.23.11 with offset only, no fuzz, so none
needed to be reworked or dropped. LIC_FILES_CHKSUM for COPYING is
unchanged.

Build-verified with cleansstate + full build for qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../samba/{samba_4.23.8.bb => samba_4.23.11.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.23.8.bb => samba_4.23.11.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
index 3fc3df5471..49599f29f9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
@@ -39,7 +39,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "976129847456dc5b78c00f8ffb79dc605c49d6aaca8b2aa772fd22dbb69fae01"
+SRC_URI[sha256sum] = "089fdeeaf83593d8f9a16847a86b6cad2fc90f7a893eb8d9d5f509bbecadc0d4"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 

