Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B12EEA86A
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 22:35:47 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57997.1770935739986236210
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 14:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CtNFBxoP;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4362d4050c1so317855f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 14:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770935738; x=1771540538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAnMc5t1DDKVLP1JEYhEwYrAygQwfNCcbSPPIvIkIUY=;
        b=CtNFBxoPHGINce2EzCNLIBEZYYzqkM5mD+UnNpjpmDalUTf06tXoWcQkeiHO43UtPz
         9TEvCltc5KpBfiaBngintbAqpm1bkRVGH7fOPbuJY41sptEMkWejKzdSfBcqVgy4QxDt
         av36N9DaORcBKITwtJ/R10up2S4tTIBoLqURsPjUNjvu1frJjh6efXQfccoqpYOXM3K1
         Gh9argz3IWxQsxlIcQ08JdJKRvBcfjeurmWGwHzy5wOeAQs62cVkFFs9gr15Ks45lM3r
         gnVjTdMfUTgLmA1CtuxFOh0TYq7sXAyLzGFq7b4jBm1H0rIGzIilezVFtbNUjgUaP3Bb
         sqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770935738; x=1771540538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAnMc5t1DDKVLP1JEYhEwYrAygQwfNCcbSPPIvIkIUY=;
        b=waCA2wmhsHIZpWCaUyunLE3UtCMGGybPwtaZgUM2puwzyiKfamQCUa0H9qy507LzZU
         uAeCmqlunlLzsmvp9xgTGUXTFOqXjXajIiFtfiuLIZC3qFNH9X4rMDWPyqVf+wyLXbs2
         rMnlsuh4yikMOJP8CtusNOAJ17XTHAG8m2blaWPbcB6Z1EgQ8u+jAHR14+N6YV0fTla/
         xJseBqhoGHkT1cW/P49auLyxUQQ2RW/PEYrWTpXzH+kSzGHoMEBst3NAZpr48IEvYfzF
         hdkV7opu5qG/XqbWQAvVdflJI663dZ8acaeTe2Cl/N+V7ucJgyLjVLkbcnmg10uxHwMt
         Biyw==
X-Gm-Message-State: AOJu0YyUAL324meuQN1sei1CWzQ6DiX55HKFqJBoY8hQQymcJ2wqGZOz
	DDZXMbK5FGCbQ9o0vGnWTyU3+239OjHtOndVMvRKCU/toxRP85j98mkwYMn4PQ==
X-Gm-Gg: AZuq6aJSTtZeYvJRRivJTKvhhoT6CUl8cXuz0E8kXfxSiqZ9nZvG0CrIse9AuTJ2/uu
	4DtesDkE/Bi7d9pbDaGPKCcWevof8D12eMBu4K59sEPxZtTEnVoTUJ9epBtd8MayCMJ66tQRTMN
	P8YkUODIdA99aceguCPaok15mj2WpNBOl+YOIi7D6NLxO7PRNbSAi34EbraAyZab5Oz4ocM/WLj
	s55grff73Bi0lUxqqJidtnwNoyVOAM6ImjV5xBMAk8nIlVZ4sRh496ZSOgs42DQ5sh4ZPT9gISG
	74zVYnucSH0n5gXWB6q9xIB5XIFGoPU73CC+lUnwpkKVDxxB8n486lrTNut1+RP1Syw7QLvNN4E
	6YnVeIdPGHS5hKiJAO7LvOZ61NTjvwk+dtCVXEsPDRbPmOf2ixzCn27OX8JBB0x6BKGwwm40NVq
	14+PaXPTTE1DqS0obQPOI8
X-Received: by 2002:a05:6000:2dc1:b0:437:6bbf:71ab with SMTP id ffacd0b85a97d-43796a9efc4mr912660f8f.5.1770935737875;
        Thu, 12 Feb 2026 14:35:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad112bsm914517f8f.36.2026.02.12.14.35.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 14:35:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] valkey: remove TMPDIR truncation in binaries
Date: Thu, 12 Feb 2026 23:35:36 +0100
Message-ID: <20260212223536.1099865-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 22:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124362

These seds were added to remove reproducibility QA errors about
TMPDIR being present in the binaries. The root of the problem was
changed LDFLAGS in oe-core, and after adding back these LDFLAGS
to this recipe[1], the QA error is also gone - the binaries require
no changes due to this.

Also remove the INSANE_SKIP, which was most likely fixed by the
same LDFLAGS issue - it doesn't happen anymore.

[1]: https://git.openembedded.org/meta-openembedded/commit/?id=e8981bf43163d2fe90ea28b2952a2443ceaea934

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/valkey/valkey_9.0.2.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
index 7b4226d2af..419efab17c 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
@@ -46,11 +46,6 @@ do_compile() {
 }
 
 do_install() {
-    # Remove debug paths to avoid TMPDIR [buildpaths] errors
-    sed -i -e 's#${TMPDIR}##g' ${S}/src/valkey-benchmark
-    sed -i -e 's#${TMPDIR}##g' ${S}/src/valkey-server
-    sed -i -e 's#${TMPDIR}##g' ${S}/src/valkey-cli
-
     export PREFIX=${D}/${prefix}
     oe_runmake install
     install -d ${D}/${sysconfdir}/valkey
@@ -79,5 +74,3 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "valkey.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
-
-INSANE_SKIP:${PN} = "already-stripped"

