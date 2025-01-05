Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35D7E7719E
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.48442.1736119441815031355
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nODY33/6;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so17733776276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119441; x=1736724241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8R45s8KbkWJz5OEFqTsKoyxHltpyTDYf8JrtumXCjs=;
        b=nODY33/68OsizxF71biwQY9ECN6DQz7aCNLFKoxAIIs5zGp7tDnEgr9YloZzBcH8Ar
         9HrF2lG18jI82zrbEtF4YUmktswfrN9qoiPeqW4My76GloE4tQQgRwu282VRfEsREp/x
         3mD/7dkLmPx7oQT+DGwBrH+CKLfig8WuttI8btA+tT4u6t4KFwzeqEEy00ATyOfA8IjO
         hdLTtAUYWSmL/Zq53Ztj2tUE9g2MmmMydY7Za7L2MR7xhBmlLF6uWgFxT7Q9wWvYo996
         OdzH9o8nIv+4oxtB2BiWZbX8CByKOiacCIl+77+/CgsbIXlk5Ud2kIcDPOOBgXka96Ib
         BK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119441; x=1736724241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8R45s8KbkWJz5OEFqTsKoyxHltpyTDYf8JrtumXCjs=;
        b=S38DtygarT1ZSl1Sp4gqig3e7q69frPaqcBMCBzB7oqj/QaeCsKXhecLRC1RncmU8V
         aMi5xf91W1UmTymCJu82AfaPi76+/K8OU3u1EeFNwhAH3iFell/lVJTSdMw/VUffB050
         cTAPfv2cJHEHgdqFracJvLo/xnJlPGJom8G2c7BpQVEbgFYrehdhYiB5E45n3SfW946j
         aG1gedhLtWWO1NA2nqKLf3Z+9oCZCJl1aout8A+BkktANe/1a8fJQvplq1tOVEe/HKpy
         YaE5Or0sRH3ysgUryviwP6QcyKkaYPGEwwRMP0uE2w8lj9LgSIakN6/sFLOwfm+hFMBT
         JVzw==
X-Gm-Message-State: AOJu0Ywu8PwSxI7ZgXgLlb0WawvMsgjIQ3r0VONRj+EF0lOPwKewKVUk
	+0NxZ+eSXpIlHwelHOHqvxpBBAtg+4SkIMb+Zjois8rxayzHgsjx5ZglFZ6R
X-Gm-Gg: ASbGnctsxjv6t0x0Di4XDYj3LEW3YrUQ95hZ+bP0qQyBFSfo5Pjwg7glihpWV76jYFI
	rg0OD3RYXcZ/MYQs/b91OMREiSAd8RGdCAVPGD6ogtGeN8ART+fTfJCu5jaHrm/+d/FP6PaBKKp
	401loWuHHRFK85nRomOgedhKqZ5QHOnkgN28Gshzh6fEq460eEFx3LNgPKv3DBba4UxMb62dorH
	sSYne3TsJCxVgIIU2l3UU6Wq0L3Ghwm7yQR79m0Sz20Due5ElHB4nNEqKvHMqJ/oiRpTQ==
X-Google-Smtp-Source: AGHT+IGf/Qs3XvuUW7sDV74TXOsLlxY9kQqhyz0vIlSmJkwKWVdPXrrMhbSwL/jANDD2codXiaYGxw==
X-Received: by 2002:a25:d855:0:b0:e4e:acc1:7b42 with SMTP id 3f1490d57ef6-e538c23a34fmr29509947276.14.1736119440928;
        Sun, 05 Jan 2025 15:24:00 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 04/24] proftpd: set status of CVE-2001-0027
Date: Sun,  5 Jan 2025 18:23:37 -0500
Message-ID: <20250105232358.1502946-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114634

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


