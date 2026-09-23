Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0191C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:25 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4162.1790160080838704844
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cB9i6vWr;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so446076b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160080; x=1790764880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNT73KzDZtsUMuSNfr0Zd2l7NPt0adjhqwXgtje7z4E=;
        b=cB9i6vWrRgMdDGxQiphLEAB68IoSwP1hK9vltZ6ecnrUBmW78sX4PckTvNOFBMoLaP
         trHb5ScXTvVIqm1u0vW6CSs5ta5u5fQ9Kbl9zkG0JD7o4PjxXhAz2RHNU4mNK214WUjk
         DQJveD82rdcT65DTcueJWLgiSwx7nGeFxwQqyxv88PHktmX2rr/5KocGiiBnwFT0s6uB
         F/c+1PCxK/oI7vnm3oWV3qaOtDyKWbaWuIol0Jkzuyjwps4JlkgEfQ4q1yai1UrtBwXH
         FSMuz2tEw48smbBORMc+EjMwoI7Ee+X872okWgKcV13Cb846vfpzxVVnJmLz9o6BK+OJ
         T5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160080; x=1790764880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNT73KzDZtsUMuSNfr0Zd2l7NPt0adjhqwXgtje7z4E=;
        b=l7vUYBfEvNMH10EPwfkRIUxhBRSeA4O8CVfOehkW1ionhzL7vUmqSEXLVEGGFw5x7h
         mMyRdRN15toPlzd6MAYPJy4ckMYBGnWOZiWMD4QXGPh6fdkfK8hLizJSEQUdOGW9FscK
         sheArhD4pi0C1NAt5L4SGlxLGhXM38+nNgwf4Qop6F+DEt8OlNPZaQgTTPyaR9TUAW5/
         98pv5iJuJLmLa6ILhJSbTVI7robJGf8itVj+JjD61Cnz99VrzkrzqzMxN5C8BNxA5KG7
         JFyLR/5G3EPu89WIKpiQ/l8rbYCVGi4g9keFv0EWmT2/1ZlScTj3BP8jF/o6ku7Mmr1U
         xesQ==
X-Gm-Message-State: AFuF++nXTxDW1HfzK2+bHFDIJ/6YzNezI9o3jRbTdE9mDOoVAmBy6pJm
	Y9aR4xtazAe05nvIsFSHDIpM2Vz6Di5aEA6/EF7r0K8rn7yLOugMXc9EQcIZIQ==
X-Gm-Gg: AYBFou17B4PHqGHQnPzjVIeyiCbLhVi3Ab8N+H8wOFqMcOtOD7g4tc3xqF6HUKuZicb
	mDxGK53B6LSspGBmNVjgFJEFbMlt6xzblc84DX2aIKacY6P2aN9lw/cjLKai/pjXjIUj23WnvcH
	XMeQDgA6rY8Op1Mb7J2PCqYF8zUNjMe6dhQgaLJRJdK3NzU+KXGy2DdZWtqrdkUyZUxIY8aPDI3
	nO3z7Ndwl2pwy7/hUtoHjohBPMRQSwy0BQZyDDj8ewATEEFvIdLrDVlE6Rfg1GbcyGy3ZfMSlwt
	U8kHKEAqYAU8U/ZChex3J7t5m+Z01FKvknLExY8EQQN/DKNY7COUTO6SOtsPIDy0fPaSaPa22XQ
	gqoMF/zENZ62MnnoIvXbqnPheOrO9OFvSzbz0y/iSkFfOTYbK3fD6if79ZpLkUm0cYf82+dDHoy
	ApC+tczNxfH5J4MwndG7+1QPhnsmXRXD4ys6tEz2TwyH13O4MFBcSZLyGDR2cP3aEgwXVRRSubQ
	VD2xUn3FVWNIL41/CDF8gg=
X-Received: by 2002:a05:6a00:4612:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-87d1a6b1b95mr2002802b3a.1.1790160080182;
        Wed, 23 Sep 2026 03:41:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 10/42] freeipmi: patch CVE-2026-85507
Date: Wed, 23 Sep 2026 22:40:24 +1200
Message-ID: <20260923104056.457360-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130197

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from v1.6.19 matching NVD description.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-85507

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freeipmi/freeipmi/CVE-2026-85507.patch    | 50 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.17.bb               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85507.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85507.patch b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85507.patch
new file mode 100644
index 0000000000..f0bea66599
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85507.patch
@@ -0,0 +1,50 @@
+From fa27bdb4a6df199b5a60c078ed1ce78936b6276f Mon Sep 17 00:00:00 2001
+From: Albert L Chu <chu11@llnl.gov>
+Date: Tue, 18 Aug 2026 12:56:55 -0700
+Subject: [PATCH] ipmi-oem: bound Dell CMC-info accumulation loop against
+ buffer size
+
+_output_dell_system_info_cmc_info accumulates configuration parameter
+data from four get-system-info responses into a 256-byte cmc_info stack
+buffer, copying (len - 1) bytes per iteration at a running offset with no
+check against the destination size.  The response field is BMC-controlled
+and can legitimately return up to 128 bytes per call, so a malicious BMC
+returning large blocks overflows the stack buffer with attacker-controlled
+data starting on the third iteration.
+
+Reject any copy whose cumulative length would exceed sizeof (cmc_info)
+before the memcpy, mirroring the existing invalid-length error path.
+
+Assisted-by: Claude (Opus 4.8) <noreply@anthropic.com>
+(cherry picked from commit 65759a170b0179b15a9bd3483ddc067e337bd150)
+
+CVE: CVE-2026-85507
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-19&id=65759a170b0179b15a9bd3483ddc067e337bd150]
+
+Dropped changes to the ChangeLog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ ipmi-oem/ipmi-oem-dell.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/ipmi-oem/ipmi-oem-dell.c b/ipmi-oem/ipmi-oem-dell.c
+index ff2d39b1c..19c962cb1 100644
+--- a/ipmi-oem/ipmi-oem-dell.c
++++ b/ipmi-oem/ipmi-oem-dell.c
+@@ -937,6 +937,15 @@ _output_dell_system_info_cmc_info (ipmi_oem_state_data_t *state_data)
+           goto cleanup;
+         }
+ 
++      if ((cmc_info_len + (len - 1)) > sizeof (cmc_info))
++        {
++          pstdout_fprintf (state_data->pstate,
++                           stderr,
++                           "ipmi_cmd_get_system_info_parameters: invalid buffer length returned: %d\n",
++                           len);
++          goto cleanup;
++        }
++
+       memcpy (&cmc_info[cmc_info_len],
+               configuration_parameter_data + 1, /* remove set selector */
+               len - 1);
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index 8fa615c13a..06fc6ca174 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
            file://CVE-2026-50031-2.patch \
            file://CVE-2026-85509.patch \
            file://CVE-2026-85508.patch \
+           file://CVE-2026-85507.patch \
 "
 SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 

