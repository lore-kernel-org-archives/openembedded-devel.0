Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AE5C54F5E
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3030.1785293074053868997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kA5nnFBE;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-caf707e3a70so1155648a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293073; x=1785897873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IxZOtbr/zvpprlKhZdyyGe8VCavIVhDJS5RVfLI2Tk=;
        b=kA5nnFBEDO3DwrgOEsPbgeF+2jUitF+vHZaVylV3ITggQRVubm4L8HJPg5LZpipuEj
         vBEhO9Ma5kR739C3M+6CBipMCG7LMIP+5c2tMgLnqqJ8Tm6J1MwBWsmR2PFNYCP7u0Hw
         ja4OG5LJIeeh+UJT5U/h73n/JynCnhXcflKYACv+AU9uHV+7wuB+ZfrZc2QUGcf6BEIK
         2fVLwTQH/aTyVd1yhzO635MRNZeR5OtyqQfSHrdNlLbZMdokXob+cSkvBc0PtbGgRbNd
         0I66W8lPoJhuioBjza3sShnFjoQr6zY2bxVHd/VgPr/HP3xx0NFnGXtZNdy6a92JPuox
         ssWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293073; x=1785897873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IxZOtbr/zvpprlKhZdyyGe8VCavIVhDJS5RVfLI2Tk=;
        b=dG7v78mZqz3qX1mu75CizjeaccrBNlZXmIRXBSwQV0ymdzs7NEqkTyGH1m9DKhl2qG
         GABT0RJsm7d5mAi3mTwPAjegVF6jD6H9ruAYg41J+I85hDzuj+KU5TbeJsh82b2PB7PY
         IS4gdwMIocg51lO6OavMpZtXfW3+1t9jX/ATYMhdbWPrlm/PqaZ3Ec/IhY20prZ+ylcN
         ceDMoSk21Snn5H/cX58bmZhxAihV5GReVk54nROl083tLkx1w7cOEANFeITnAd6dGm/J
         eug8UktDunc1I5YB3FdyCZ62lzFSVmTk6Ri4YKbNqpI9wXWwEw/XAdC97mwD5lfmVmLX
         F57g==
X-Gm-Message-State: AOJu0YwjPz4hT+U9Fvv2OcOqAkhEpXUMkBI7c4hbbWcTANnVXRfFrtyt
	Goet3sFyAuRKIpnfkBvF07jvotiK9pN9Sd8N8+kgmwtAbq03h1Q1EglvAZg9Dch5
X-Gm-Gg: AR+sD12Kh42AsR3Ckr4jf7q/ebZ60y9TbXtNFlBHbhSSodrsy7CLtAiI9VROHJKlIxb
	58z1X/KUYmxSdr5hlI3XDBLVVeLBnd7NbJwzwFs65e+c7xBW2+dVtqtvKu4DeoMW7p52eV0j9JM
	7U2zwluii+L4xVYr8oCeaWW9DFeHHDHMwBQ4zjQaTMdYhGl1HyQSk73ja6WzjeWTRgTbS4okMof
	rfCHWivtKmiJWkzRgmHhuZvOSur9AmROBlzK591uv4CgpaOijZOHTO/vsd3mrnhVAc7RpQ2MMUE
	ICq7JQJT9sWsVrho8u/DsyUyffNJaDr+RIhDqfgi/wcIPdMuJ1g2C4LsV2qf+N6+mhj5fjlroev
	BljD2qfcLa8tVwYFNjAzNW4i9HFsPU5W6PIdFVAAgaoBjrRjDWdYvO1nhCMFW2nZzNV/Olg+pUd
	ZUy2lN5lE3ZQP0qeQDOkViokP+GNljkk01R5S/ByjjvG1gxi6Zt5R00UN/pRDv4yNJRBGpXcjf2
	j3TwWl0ODkgv849y1o4fEKTkZD6UWtVtdgkJY7MxsCRRoObeWCt6MX/+oUZLO0TXOMALIElKlcR
	ZB3LhQ2tNqefFr/g9oYMZwwUCtZL/+AgIfSMb9WDyDt2xhCWz5WIk+ONGBvJX/32e3dAaL7b1x+
	Fo/SJj0nzrogm
X-Received: by 2002:a05:6a21:a343:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c8e47c163cmr459438637.18.1785293073382;
        Tue, 28 Jul 2026 19:44:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/18] cfengine-masterfiles: upgrade 3.27.1 -> 3.28.0
Date: Tue, 28 Jul 2026 19:44:11 -0700
Message-ID: <20260729024420.2328180-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128525

Changes:
- Add dnf and dnf_group package modules.
- Refactor cfe_autorun_inventory_packages; use a Python script to check the
  Linux distribution version.
- Add cryptsetup to the stdlib paths.
- Add full-hosts-delete and 2FA support to the distributed cleanup script.
- Numerous lint/format cleanups, a fixed pip packages-promise regex, and
  CHANGELOG formatting improvements.

Release announcement:
https://cfengine.com/blog/2026/cfengine-3-28-released-introspection/

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ine-masterfiles_3.27.1.bb => cfengine-masterfiles_3.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.27.1.bb => cfengine-masterfiles_3.28.0.bb} (93%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.27.1.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.28.0.bb
similarity index 93%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.27.1.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.28.0.bb
index d85e75d916..47922ca64d 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.27.1.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.28.0.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=22b3189b9b79f1de35860dcc299bb6bc"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "fd32c1255c0114d55929b496a15a6a6f48231f108be23f50ad3b8abc2e734ccf"
+SRC_URI[sha256sum] = "e044ce5926491e649f96c943482bf56bc268389fcb5d2edc4bcc4e94ceff09aa"
 
 UPSTREAM_CHECK_URI = "https://github.com/cfengine/masterfiles/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

