Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEC8E77184
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 18:36:24 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.40491.1734287779567104603
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Dec 2024 10:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3c1GVXY;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e39f43344c5so2553895276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 10:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734287778; x=1734892578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8R45s8KbkWJz5OEFqTsKoyxHltpyTDYf8JrtumXCjs=;
        b=R3c1GVXYIKSnp8w7MCAePRP/3p8vSa/5PBU3gWRdPwvFz8DKU+HqoGu98YkI6XEJlj
         Cn+JhUI1PwFzzpoRD+HxI3umr1nHPc2sSSBDRaAdoqX+0eRCBP1Q9YdPqra6ixtvwceH
         8lmzzxFEiwXTHEC3a1eKCT2MIOH+dgeR+9Hib8SY3Jwcktud95ZeBEh0oMS0jyjny2P4
         qSKyywwP5l3dJobtmAzL/Fu6F4ASlfG/V4VcMovTu/mT8RdnPCIZwaTDoOXeLq+vnOr+
         8vtYii9rh/nnKm55ouWo2CAZ0Exv9Q4Voe6yhUAPwk0vaUKg0u6IbdvFnRzno2waVAiI
         sl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734287778; x=1734892578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8R45s8KbkWJz5OEFqTsKoyxHltpyTDYf8JrtumXCjs=;
        b=NLhbNJbbI/XKM+3btwy0x3LBxWneDLxkP+FNbB0H1G5vw9JDJMiLV7CBgjMP4kj6QW
         m2pk79T2wsxZV1Sjwm2aQoVDc3rzv/SriBxVt1dJPS3vWVr9d+pE1JRvEjtNtPsMLj6I
         hSdpcCpiXxiSpUt+wfs+jOEgnSjpkX2Dnm7O+xkAEymACJ4jCurRCV7XubedO8BC4+7v
         wgZMcJFrC/mtpUkidYM+Ep9FOtU4Tesk9uK46BpRW3q+Rz2rGfiMQGx5RgSYYtupSDor
         M/D9jvztncmoQ3Sh8svMYKTyEccH5/6MZMPMXVIm3nwCdOxketvVD5J7d6oH14j9EW0h
         l0qg==
X-Gm-Message-State: AOJu0YxoqYyO73zUy95bbxz3ISUJbPHbXBxHK4eXkezZH5Wc9J4pemqZ
	r6BwYaE3PY+vo33SFYkFPrK5YrAAtKPsKPBNarSRg7TZvdqpbjsHTzz6+g4s
X-Gm-Gg: ASbGncsShaMMm80bIYMB5s+tTR81Wv19VBDMVgKf4P3Nb/avgQqEk1Lqs2nqYRyjwS8
	D3vCecimdaCfq+YCLTzyrPdIJVLrTfBHVWgXEEfYjrpmzIIgGbm76WbSMO+idIPre+/QFg+edQE
	0BlcBGkMU9aTDb39BqPMvpKdb7RYH0Yk0sMu3ys07KDxzTM6ejjEQiTcaTp69MDy/G0qlrOdj8/
	ReRjP77gFlsGadzQ6BWDhzbR637/t8+pBaffcRnJKcGWrDgK9s2aLEevEcihApbaPcJJg==
X-Google-Smtp-Source: AGHT+IET7cbv7a8vZM7vZXHBt74nOcaNilz8fihUogAbskHMKgv0vzRLir0f1Sjog+Ppwy/sdWq0xQ==
X-Received: by 2002:a05:6902:2511:b0:e4a:7154:9249 with SMTP id 3f1490d57ef6-e4a71731bbamr2364638276.38.1734287778620;
        Sun, 15 Dec 2024 10:36:18 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:a906:ba5:bc1d:da36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e47035366easm985356276.18.2024.12.15.10.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 10:36:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 3/5] proftpd: set status of CVE-2001-0027
Date: Sun, 15 Dec 2024 13:36:14 -0500
Message-ID: <20241215183616.7218-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241215183616.7218-1-akuster808@gmail.com>
References: <20241215183616.7218-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114319

From: Peter Marko <peter.marko@siemens.com>

This ancient CVE [1] is unversioned ("*") in NVD DB.
"mod_sqlpw module in ProFTPD does not reset a cached password..."

Looking at history and changelog, the module was removed [2] around
the time when this CVE was published, likely as reaction to this CVE.
"mod_sqlpw.c, mod_mysql.c and mod_pgsql.c have been REMOVED from the
distribution. They are currently unmaintained and have numerous bugs."

Note: It was later re-introduced as mod_sql when it got fixed under
new maintainer.

[1] https://nvd.nist.gov/vuln/detail/CVE-2001-0027
[2] https://github.com/proftpd/proftpd/blob/v1.3.8b/NEWS#L3362

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 03a1b56bc7ce88a3b0ad6790606b0498899cc1e3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
index 33480bff2c..ce31c8a475 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
@@ -21,6 +21,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
+CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
+
 EXTRA_OECONF += "--enable-largefile INSTALL=install"
 
 PACKAGECONFIG ??= "shadow \
-- 
2.43.0


