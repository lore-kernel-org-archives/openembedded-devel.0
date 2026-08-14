Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05C4C5DF76
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24559.1786747662207181212
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HwX0r21X;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cee9b74ee1so11906345ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747661; x=1787352461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiE4dQtY1uByY2iT/qLJisprJT7NiBJre4EdPxXuQxc=;
        b=HwX0r21XcjwBHoEARp8PespIPqS5MpCKYYvoz5mePMSQg2VM/A8M0+clD4CFRy/O8L
         73xsFmc/Z+oKVPk4Y64/1bConzm3dfgsK2lXVNFgOWNkgrlAq3jRDDWCL5ioY0+surSL
         v4N05AXjsfzMSWon3sWYUH2Y2D3+Q0rBJ/ovESR3YlYF+QSFABqf92Hu3kcr0JjaC4/9
         9UJoYZH/XgCf18oeU12OO6VhPvLt7kZW4v3ZUH+LdrUtl/oKXKwcYnttVjZCHZy7KQ9p
         rdqAdPbZtFotvCRvmiSXtnBJGCl+Xd4ZveNTb4GobeMh+vB2AX6gQEMhriPuMFc9lmRJ
         +o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747661; x=1787352461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiE4dQtY1uByY2iT/qLJisprJT7NiBJre4EdPxXuQxc=;
        b=syMAr8YI4e9n61LCHo7er3wxOEmz85v0fkXhR1X6I0PVT0sXuepFTHbwQ5St4sFK9H
         p8gt80jwUkeijXCuIm8zrcVbx4XlS9hYNiYfj3RBNFEXiY8mG6qBrvTLPqts+lOZ/Dq+
         lQIak3uf+rQECdiQ8izEEOAgeADBC/m/LDPUoJnGBPXmwJjuoZx4WxbGQx8xZCubztG6
         FTBzRqeiTDrxht8TlxYTEYYEyzQHfilu/87AotOYJn+thOrlVv3N1nn8xirz20Qwi0kp
         KkFW8C41q119T6Zgm2R2vapDLsmdmBJFdW8VvHpNnst+zVSlPNlsz3dCTRCg14ydaeEd
         V6Qg==
X-Gm-Message-State: AOJu0Yx4qdJtjcwl9K/EJq4cz4q9GshjmFB2Cw8CQhqn3C+xgxoe7YMk
	RgrMvbL8rzZjYiMpyA28Yc41TKIe8icwTVQVOJ/y2YsVhqIdRGKNskjtLpSsGPZb
X-Gm-Gg: AR+sD113nUW/Dv/hVPHk+k57nrYtsN+KgRLn2vsmaa7vbmNYHc9G/9ozZyiqYCcE81y
	e+/qzalwBQ+lFRWYMUgfA3pfMr5EUC7D6gRRO+sF9GhDGS4ID8K16K/jkaLl/FoB8S5/Q753pPj
	938ouNy/rNpiFZBPO8SCi+ukh6RpqruMe7nJsapPBHCCt77oI68VYl6osKWzixALy2z2V2vk+Hs
	E4stvPDCTjvx2oXWQ5/9TihwIvfaKMFBd/KBucvkCnRgRzJ1hbx3u9bArPA/koYFuosNIeC0iSb
	xPlShgjofvI03Bzz45HA0DJj0sex3dFTF8ryzkMsqCN+rw1G0a0vAurrg9YM8Tr5+ssLdL8bbEa
	/XO7bC3DwzSVlLphLHz8jllhYTfkhSQrHsIZI9y3dumTGJbj6obpGMg6IgXhK4zNcJsYbAPZM1Y
	nK4ro8xuLFxkwQCYtmx8FKoP7+uzAxd4NF2G3kSk4xvHTgBdpKeE0Ayl/ukeZ8LBmaDA35Az9vs
	QW3z/gHkRuCJFR/AY6yLnp1Z8V6mV8fjt29L/HbgKy7FhaktCcYtpkABRgUkPXcl9sFkeby/IBY
	4SWIWG4e5Xjy7Vl8ScHmjD10yqGnnTFW18OUN3HUOCg/DPyFcYHyyn/FOqHer5+OEP1e75SMr42
	jf3XhvK4LXydwWGPmLSjIiV+hCVIeXsYKGQHpw1ogi8flWA==
X-Received: by 2002:a05:6a20:6f8a:b0:3c4:1916:9d46 with SMTP id adf61e73a8af0-3cc71f4a5famr12068692637.27.1786747661489;
        Fri, 14 Aug 2026 15:47:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 100/109] python3-scapy: upgrade 2.6.1 -> 2.7.0
Date: Fri, 14 Aug 2026 15:45:26 -0700
Message-ID: <20260814224539.1523174-100-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129164

Bump to the v2.7.0 tag. Rebase the ptest ICMPv6 skip patch: upstream
added a "needs_root" tag to the "Sending and receiving an
ICMPv6EchoRequest" test's tag line in test/regression.uts, so the
"skipped_ptest" tag now needs to be appended after "needs_root"
rather than replacing the whole line. With this rebase both hunks
apply with offset only (no fuzz).

Build-verified: python3-scapy builds and packages (including
-ptest) successfully.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...01-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch | 4 ++--
 .../python/{python3-scapy_2.6.1.bb => python3-scapy_2.7.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-devtools/python/{python3-scapy_2.6.1.bb => python3-scapy_2.7.0.bb} (98%)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch b/meta-networking/recipes-devtools/python/python3-scapy/0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch
index 68e5cf5b45..74c9ebb660 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy/0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch
+++ b/meta-networking/recipes-devtools/python/python3-scapy/0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch
@@ -43,8 +43,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      sck.close()
 
  = Sending and receiving an ICMPv6EchoRequest
--~ netaccess ipv6
-+~ netaccess ipv6 skipped_ptest
+-~ netaccess ipv6 needs_root
++~ netaccess ipv6 needs_root skipped_ptest
  def _test():
      with no_debug_dissector():
          x = sr1(IPv6(dst="www.google.com")/ICMPv6EchoRequest(),timeout=3)
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
similarity index 98%
rename from meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
rename to meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
index 0c547a53ce..c21d2eb0e3 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # If you want ptest support, use the git repo
 # UTscapy does not exist in the pypi pkg
 #
-SRCREV = "8e08cbf759de6709a5b4af6bea3655d293129bb4"
+SRCREV = "1de09fe85fe5c9d60ea5c6de130374e170b5bc28"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch \
            file://run-ptest"

