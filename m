Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7497.1792574958110309681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KRcqPVgj;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1517bda04a0so520948c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574957; x=1793179757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLI0VP/Jt3BBslil/tHzmXSVaQanww03QlU4UwGU1P8=;
        b=KRcqPVgj2+aOPkM7+8aMobYxR5kawErTsU7gEpnir1HdyUXNUqUemplP4PVSsVDmOo
         MEHqnppGSe+IvaC6U+BIE+1A5gnSjlk8SPzEuJTiqsCOV5LVcTJ8fMg/KHE9e978YEXy
         ldOQT9ZgCDiIde1/hvuFP73wd8J2RtMRDWU6FceozVzxP0s0oO7EYY+6EwbneO0wSgF8
         W2NuSVBTHRugsYjKG27Ieo4Ks09+0TDTeOvCDv8ZOJ497TS6T5J382VWYtk5JO0i6lHF
         TA6UmkVJYZEGGAsHIHILcPxccsF27xcd0vQ9hTm3zIuG0AQP9iv4BySnmPsSNKpRAkk3
         R/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574957; x=1793179757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLI0VP/Jt3BBslil/tHzmXSVaQanww03QlU4UwGU1P8=;
        b=lmKBu5oXrku5USB89eFjvsPMzH9w7Ga6M92SshD3e4ZuE/6NE8I5FNvPXDEHmvIYwS
         VrwBuLlvvr/HMFIoVTbHgxJVoaPTZWRfb+jsb4DeNaDgDpggsOYXXBBbTihmhZvvCxiK
         a/UiaVpsyFYIpHtKR76MldyOUXSrR0A4AMC708KnOPuDU8E1DDxndo4/oeTTJtuSinL0
         MZtC2To/owbizBqYE51UcmnaISy5hOBsfLUGAitdEHBUkT7zTSS9DoY6Vuk8GYD64Zqb
         VQNAZbyn5rWu/JFW/TDDE3m/Q/wUHZbV3/K4QH65FS7VoGpydtVCz10Pm/AkeGxalWfS
         UiGQ==
X-Gm-Message-State: AFq9FYJjOQgFRy7bMrj3iKvukNck6QRvw8bxzErRI7cj30wdRLItZRej
	rsiqUJxGwUsYnSbBlAOheicn/YieJWotIyPd0tol8T6r2rbAYKS/SZYVauIi2Q==
X-Gm-Gg: AYBFou1F1FU5Eky2MkJJ1FcZpo5jbR9jx+FYIa0Pkb0VzAiS++cI34dRMN6KFruzw0U
	0HyUqiNeUOgBOFwYKYQfsob8UXKpvO8RlrFRb5Bg2YsdfZkY3qQW4UJHQN4qboWcf1QBAvph2h4
	zqpMSYyVLnFDCfNXWxX2uNO27yGPe8t+ctRUyCAsjxskHI0cIdB6cMwoAZAhOxejSEGe+fD8XU6
	YycwLdHnCYInNmgJ1HQH7XMquvvFMgloIBTZcVq6rr2ir4pxCdjAK32GforYZH+uywRN1xnTIR5
	G3OMujCwtg1wNwlP+K9LvUg6kl7Cs+cAdcNQLIGDFzRm/CwgEBXV23SO5sYuVih44U/6U1Oij0R
	PjXBL4klcibAi8pJLqBJsiYe34nZT3/0ity/34oTgesHic6EiltTfACGpET+V2vl640gAtbEore
	BgiK6CuKWnktV/4MsjA37FSo1zhCK6yOkmPJP4nID2iJ3GLmYN9r3wzMtXxN4MyBMgtjm07K/c9
	CLawKa55XALUxonDkhIJfFl4TmX8GU12NmLNWT9vN0m7b+2S5OAYZCai9Qw1f7o1wccHgCHy5LW
	zBjs1iOSp9KnuW+Xnji0C6tlPMpYgA8=
X-Received: by 2002:a05:701b:4254:10b0:144:ddf7:2570 with SMTP id a92af1059eb24-190a70a0808mr2056033c88.39.1792574957350;
        Wed, 21 Oct 2026 02:29:17 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 6/44] xdg-dbus-proxy: upgrade 0.1.7 -> 0.1.9
Date: Wed, 21 Oct 2026 22:28:19 +1300
Message-ID: <20261021092857.3585453-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131193
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/flatpak/xdg-dbus-proxy/blob/0.1.9/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
rename to meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
index eb21f701d6..1a65874155 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     file://run-ptest \
     "
 
-SRCREV = "6a170fa77e3cbecb48f9dd2478fe5c0a119eb467"
+SRCREV = "72b40c8f6d9d585cfbdb249690724f740d207087"
 
 CVE_STATUS[CVE-2026-34080] = "fixed-version: fixed in 0.1.7"
 
