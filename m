Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FFEF3ED5C
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:02:36 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.279320.1776103352673018427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bR0ihJgk;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0046078so46843655e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776103351; x=1776708151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpGaIny5CWEpkWfQ6eCVNZDRNUdZgk9XEw5rJsw9q+s=;
        b=bR0ihJgkY3O/Kr1CSvN3Fir6D6jmF0WqJMc59qdQ1g0v05wZgJ1D2HTsTJIIoTy5T6
         a56ltRo572HEB2tKT0IZwbG53eMCDNGlEbPLzGOt7I/QAJmZK9zgWnge3WIN7Uz0KS2O
         AegTwJnCW1l7S6m08/ZoZBEla87wH/i4FqDNkL5hrXRbP4v1oAugYKU6h/vYj7H6HUMX
         PAYC7dOW5Z1V25TxiA+kOS3Zwey3YIy7DaBMWIg7/ruCIcjEsDH282ArWKs0aFnnnE74
         6PXockvPVjjiZoiOBQ1ciYkJHAR6xF42S00cAaVJf6HNahWBogZNc0cf4fAUKjkVsk3x
         N/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103351; x=1776708151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpGaIny5CWEpkWfQ6eCVNZDRNUdZgk9XEw5rJsw9q+s=;
        b=E6jfeQnXd1tYAQfILDFNBbp0kFXgmm6rB26SBRAO0P1Af9uFiZHq0sUxVDJUKGMQdp
         ICiORuGUC6fmuJxa6UPRhFKLvd25mZ8v+LCgk8RV4D1p0k8FItNIZYH76o+e8lEztY9P
         NyAUskRh3Thh0nFSXSZkYSM8FXevTbYKlayr+6F92Zf4n0OZzWM+X7KK+GorRXfYIUaC
         fuyBCw2hY7oG5//CaWM9er2/z+wituHr3uXdbN6zQyQmM7fRsV3pP0hpuPC4EYsKu0UA
         Io0xlLdcU1LAIwqsTe/n9YvkV60KQsFBi3SaZozMoNof8wZBNOdKGjqW/e2/NNUn9Ryq
         WPYw==
X-Gm-Message-State: AOJu0YwuMwko4+2iLcdor2sjU+Qk9wkbyN2qF4SnzPzekfS1+JWmxvSi
	piH8HyXEHJPfEUwd2jKhynhZn2pQb8QUd4eYBMILk/39voJKk+8bMiIqJTg+TQ==
X-Gm-Gg: AeBDievymD+qj+xwoBUzcBNhSfrhx3yxQ5WtMnOeSDfnMZ/IEPgFE5VkXTQF3ic/16A
	wHFfOXSI6KZ3lIlwDk80ojqx/VDRnzV+DPrY9MsLFQTMTvJTeew94uW1lUr2VNhETwO8VAZSMQo
	zn7pHueSNIut8zrO27x1u9zT/ZKX3vN/utS2MuffiSeMwCoI73YXSsZ/XjCagWGA5KfjcCeAIbR
	b0eeKifwiJ37VbMK9IY3n5eFCIuVDyzHt45gqOql74uHmHv51dzgjEf/26OhiIvpyAZjlsjPc92
	VH+sndRlO3qOCL6cPlGXLUTUs4U3aKafVxE6rNJn36VXYjlD105f3Nek+VKvw8mcizBJht/rexy
	tzGmyrIq2OmV0zOeE0waWzdflSDLq0rvHFi16spwp17aYdNmXutLRxlY4pxqIfRILW3m31H9OsN
	nxN2GEk9+FX6odxfdh7zQr2jRLuoE+pYji9YYc71J6Yw==
X-Received: by 2002:a05:600c:3b24:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-488d687adb3mr206412455e9.24.1776103350863;
        Mon, 13 Apr 2026 11:02:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm20841686f8f.8.2026.04.13.11.02.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:02:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/6] flatpak: upgrade 1.17.3 -> 1.17.6
Date: Mon, 13 Apr 2026 20:02:23 +0200
Message-ID: <20260413180227.755337-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413180227.755337-1-skandigraun@gmail.com>
References: <20260413180227.755337-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126284

Contains fixes for CVE-2026-34078 and CVE-2026-34079

Add explicit CVE_STATUS tags for these CVEs, because they are tracked
without version info by NVD at this time.

Changelog:
17.6:
Bug fixes:
- Fix the remaining regression for Chromium based browsers by not leaking file
  descriptors down to wrapped command
- Fix a regression when installing extra-data without a runtime, which is the
  case for openh264
- Fix the remaining regression for Epiphany by ignoring unusable sandbox-expose
  paths for sub-sandboxes in the portal
- Fix the installed tests by allowing to add a new ref to an existing temporary
  ostree repo
- Avoid closing fds 0/1/2 when they are used as a bad argument to flatpak-run,
  and reduce duplication in handling file descriptor arguments

Enhancements:
- Disable auto-pin in flatpak-repair to preserve the pin state across
  re-installs
- Small improvements for the tests

17.5:
Bug fixes:
- Fix regressions caused by the sandbox escape security fix, which impact some
  browsers, browser-based apps and Steam (#6577, #6569, #6576, #6574)

Enhancements:
- Expand test coverage of flatpak-run features used by flatpak-portal (#6573)

17.4:
Security fixes:
- Fix a complete sandbox escape which leads to host file access and code
  execution in the host context (CVE-2026-34078)
- Prevent arbitrary file deletion on the host filesystem (CVE-2026-34079)
- Prevent arbitrary read-access to files in the system-helper context
  (GHSA-2fxp-43j9-pwvc)
- Prevent orphaning cross-user pull operations (GHSA-89xm-3m96-w3jg)

Enhancements:
- Enable ntsync unconditionally
- Automatic branch following for extensions to ensure that "no-autodownload"
  extensions stay functional after an update that requires a new branch
- Translation updates: eo, kk, sr, zh_CN

Bug fixes:
- Prevent CPR sequence from showing up in the terminal
- Fix a crash for apps/runtimes with multiarch permission
- Fixes for Coverity warnings
- Add test-preinstall.sh to the test matrix source
- Fix a test message to refer to "systemd-localed" instead of "located"

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../flatpak/{flatpak_1.17.3.bb => flatpak_1.17.6.bb}         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.3.bb => flatpak_1.17.6.bb} (93%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.3.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
similarity index 93%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.3.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
index cd461e2632..1512b7239f 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.3.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
 
-SRCREV = "13b26a94a3bd6fec309a16982a3a80d83776d7ac"
+SRCREV = "9b21874f1a175a9b7c79175a221fa043e202ca73"
 
 
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd
@@ -76,3 +76,6 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --user-group --shell /sbin/nologin flatpak"
 
 FILES:${PN} += "${libdir} ${datadir}"
+
+CVE_STATUS[CVE-2026-34078] = "fixed-version: fixed in v1.17.4"
+CVE_STATUS[CVE-2026-34079] = "fixed-version: fixed in v1.17.4"

