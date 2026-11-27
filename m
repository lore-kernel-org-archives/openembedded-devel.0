Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10329.1795752994186594310
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ClGSnswe;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b244fb7fffso8340880c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752994; x=1796357794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAs9heZgXJKbzv7rDs04qhntd55rSnLv5WdFgGsep9M=;
        b=ClGSnswe83OssUenMI51nuaT+nqpjqWPqiX7wP8IeJ6Ba25nJKP+uwtzam0dMOhnCR
         /U1ylN0oBShmaWZlaDEiiJrsqutZ5RWNpx6kTWpUEfv1FBkfAdIRksZP7DenaIWo3SeF
         lNejIOe+9cm1jtDiq1Ze3dxXevK4DMdicRxC8i1NpUy6ibN24Qlb+pbg3KXUDnFGS8ZK
         JjNLidooVxSjn5frtQL+AYtykXTLGwmXQEc8MsRt9YiHBnQSHBJzKXYfb7wdOimxnrMa
         iNcidzlLU5HYesFqJ+y5Jd/caJ2pumb+C7Q6HgMjGRnc5FRcFvPRsuJiDe39bK+EC5ro
         gvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752994; x=1796357794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAs9heZgXJKbzv7rDs04qhntd55rSnLv5WdFgGsep9M=;
        b=QLIbKBPNBC5Ft/AKo3wn4W9bk+F+ZRx3aR5NLYblGfP3tyWYs47sWS3oNrTMAe/ACP
         mH3LIVkSrIVcZ8MaWLQR75YXCQMDlgBUlpf7EkDy91PzvlVoqs9wwi1l//9ERhWWlDIX
         EMVl/ioZfMIPiOjtPr1uVvZoqgh5DfKCfqyDifx/K012uKvw2i0f0T190FpcTJez4ZYu
         IUg+bq5TbfvUMbEH6GMmD7ZfY1MtFUy+P8chOAyS0qhcXRpY3DogC01t7iB7SrhmBpK4
         JFdUTCDuIeSkWkdSOP7JV7dx4gf210hDu79HWUZbJzuTHf0Jj70ETnvBLC8HxhX8hPZE
         yQQA==
X-Gm-Message-State: APuU4Z/DHuoKcp7qWTtZ9u/WNrw6FFGu1ggy/7HQs0+Ro/EBSktIxt4/
	VNY2NVkI1rjRLXI7qDiQtH8DiSu8fi72UlxWC3jOeXgoSjFD92HPZCUzC9aQO+HT
X-Gm-Gg: AZFdTZdTZLWzaqWB3PUSJt0AlXqVLjpTxza4WqJZD90+zFzzBmOL12j3QKGOLOJpzek
	DtoyQCQabwsIeBU+vSvo9PXuGkdQUlNdJ8tMSDnTxnOd7eFx2DNja7thgrcpxx1eIe7BYC+D9as
	7rOGqhLsLCqXjVGxNitAj1in3Fec2ITFzUolI0RWEl0nn+z3kglZ9P3BtZpviEoWro2jMz8ekJB
	vxAFK5wxOzdGR72A07E9tWA3xu4JiaUMdxS+h6B6AzUppX8NEkW28UVABUJJb02gYJECSylmhxB
	k+w9TFN8+ZYR7IfAiyiu1cDxneOvBCIxvRfgDH+R+h9WUOXTGYtbFNuxRqYV+KShVovUZF6d15X
	ZXu3M5WF3uy7gkoSw9DzayBBHoUaNCuNNBEZm28YreLuNYOrCeVuKMP24Wfv+iFHRfyek+MCcmM
	Ut6XRkEkS/GFT3p8YMfdO8+tGAI5yUxkwsRPJWt4410NhrGtIw1LmiFPvkQYDOkxw/AtyTOwN7b
	CGsdp3VkY2wT1rskdcItz14dhxOLW9RcArTWQ+q0GVQRGkhZFngfFhIWDfoMq0R/vwiLnPSrwda
	fO7VXUg5BZsodhKH7gOV8RC5GHsAYwJ4E7+hLFrhj+lSfKSDZc4gAy3kgKWqqVmrsnVtR+GHcwT
	Kb3fC54pX6FMZ1B4h+K3VxJcpjrK7UgDlzxux7d5TyM9xXGrVJdhwGm/J3UAwqnlpEpsg9zo8vH
	M2GpEekq6ugZej7wRfKUNPSYOWkmInTzkN8y4APRqFzHKcYikDic842GW17gf8mUpK+QVCmGZ/S
	ho9EmGSIb0pWGG89tGhJIu5kug0VAkcvmL2lUtJlShSXhde1KJQmyQg4Z8dQ3Jl3OF4cZWNr/DX
	OFXb
X-Received: by 2002:a05:7022:698b:b0:168:3243:c91a with SMTP id a92af1059eb24-1b556865248mr31531407c88.13.1795752993529;
        Thu, 26 Nov 2026 20:16:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 14/32] python3-cachetools: upgrade 8.0.2 -> 8.0.3
Date: Thu, 26 Nov 2026 20:15:56 -0800
Message-ID: <20261127041614.1775064-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133233
Content-Type: text/plain; charset="utf-8"

- Fix recursive calls with the same cache key waiting forever in
  @cached and @cachedmethod with condition, and in the cachetools.func
  decorators.
- Minor cachetools.func performance and @cachedmethod error handling
  improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-cachetools_8.0.2.bb => python3-cachetools_8.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_8.0.2.bb => python3-cachetools_8.0.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_8.0.2.bb b/meta-python/recipes-devtools/python/python3-cachetools_8.0.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_8.0.2.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_8.0.3.bb
index b660595024..bba8764786 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_8.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_8.0.3.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "30ac523adfc118b51d2b2e7bad8a0ddb31370dfe2700c7f10ca224f36ccf81e0"
+SRC_URI[sha256sum] = "79245d0d90464e29355f13658cd769e57d98ed06242d3c6fbd71796ca0938ef9"
 
 BBCLASSEXTEND = "native nativesdk"
