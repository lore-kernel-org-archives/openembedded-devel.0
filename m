Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9328C61DBD
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:33 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.260.1787962289756235872
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I5zLmxbQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso1430048a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962289; x=1788567089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMI/OkwJgzjUilT7yyaTTX6kzZjvnIBXaeUUBLRpLws=;
        b=I5zLmxbQvsZ7zV1HLqj97pOf6hsVHYdQTOgeFPQ3r8WT31aTDTVMJJI7RS1hv9Jouy
         GAwByImesdVBE5jpyZHhXBzW/3pCsi1K0+WDrXvAcFAmbCzAYh2RMIjYLN0SAO+C6mJL
         CeEgRBjOg9v9A7P10TQkdATHziR3s5A8z1a9vckAAS83uIo4Ql/AP2W+XaMw91Vp+42l
         UTMMxR7VpGpdiAPj5WfnP6RuBONRSOzGmGCnpg9Nri7a+kEfBL5OoPBc+MwQ+HEEPjLb
         HKraE8S5097+yXc3Vh35zM19CI4SKvCMLMLhdxV9nN0INgkau4BI3d8foxoFcc9mCgNT
         BY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962289; x=1788567089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMI/OkwJgzjUilT7yyaTTX6kzZjvnIBXaeUUBLRpLws=;
        b=RrZLE5zUkeWZz8uwjPW1dkRzVNpoQz3Egbl89VQOYMlXrnJsDIE2/yt/vSudMXQQmp
         s3WTPrboN9szavBhXrxcQ0lFrYHrZITPyJ0uFlJbEByYRJ3q3igvUzY1YvuYcUBPaPLq
         pYFHXJTSUfE6BAZxtE+dR2Rmhgoy3InEmeCWXorJwQrw27tHqGtzuh7/0aXYXnjWpqQc
         QsLpdVBKkKqHXsX6zyCi74CDM3Bb0l7xoa4kK29ZnT/UM07rxh5dcGkBcW9bIcBWAmRj
         +GBEPix+mVQo0ADw5YgwXkdtifdl3k2nzU2eDiFpo22L/YFa6Q6kiHjJCNhuzuIs/Rq2
         Jmtw==
X-Gm-Message-State: AFuF++kLQHo/Lax/pSj5LNO7dCa0AeGUxsHdxiDqruTbFhUeGQe+4E0y
	fPh/eeF35y+mD/WdlIXuY/OyFC7G/LsPvXu6w8VWl8vqP3mJZjEgP6CKn1jLgvD8
X-Gm-Gg: AR+sD10r0V+Nrzlp0h+9+96yORciHC1z9tQaJyOAz2qpK6WzziPs7EY5nlz+TZ8MemT
	1fga+HhGvhF9XC3iGzpbMEtVKI1vcb77GUXIVDhaL2A7+4/7dCFc35GJSG6VKDCEjmehMNimrrF
	GFHxR2WbnY6/98XwYpKtpp4YaIDb2uxDN1eJP8iFe4GuQ53vZeVMIN9DuRT+8keZifERJ5gJ/jS
	XbxALS+iLLN0fQsBZUK6gY83w2uOvkqQ+uXqfev36LAOcgVTP6BB3lVg+OiUs0kHfV0NutjmwFh
	qv3of0G+Yh2f4WfmSonvu+gL0kZ4+tQasa6VQj1OeeBLl/s9Nt9ozVIWgqBWsIVI7pAPVAWRQAj
	opyCYAh+2GvEg0MQRGVHR9BHXeUV/XAsHwAaX6LvD13ZulLwFvFpT8/YiPhF5DCAzBlmO6oyG5a
	/MyeQs/yj0hfO6jXIH5I6RpD3y+DUXEBsptiIV2Av1AWIS0CSuRxR1STkOLv60YIy64s34nP3di
	XroWtntSx9eZMH4Bmi0vcdncNXJxQzyqRkuQRGZoYzrBVH1WpSa8XeeduYqzmeJk6UJV7fEa+7N
	Fa7yjl7iblCoU4b0eYbzzL+Lv5dcuWSjjVje+ML9HQxN/NIw6ohFqoqGducNzl7jgmB0z+1uB1c
	5Yr9Xh+t4mGybJCBkASUYkTtkDHvrSLc157W10J+PIILCoQ==
X-Received: by 2002:a05:6a20:939d:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3d266fc9867mr16084080637.8.1787962288983;
        Fri, 28 Aug 2026 17:11:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 15/16] python3-time-machine: load pytester plugin for testdir fixture in ptest
Date: Fri, 28 Aug 2026 17:11:06 -0700
Message-ID: <20260829001108.559544-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129574

From: Khem Raj <raj.khem@gmail.com>

test_marker_function/_and_fixture/_class/_module use the "testdir"
fixture, provided by pytest builtin pytester plugin. That plugin is
not autoloaded; upstream pyproject.toml sets addopts = "-p pytester"
but that file is not shipped into the ptest tree, so the fixture is
unavailable and these 4 tests error out (fixture testdir not found).
Pass -p pytester directly in run-ptest.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-time-machine_3.2.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
index 32d64f8d14..e898a43f99 100644
--- a/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-time-machine_3.2.0.bb
@@ -26,7 +26,13 @@ do_install_ptest:append() {
     # instant of a slim tzfile and returns a 0 (UTC) offset, so the epoch maps to
     # 0 instead of 21600. Python's own zoneinfo reads the same file correctly, so
     # this is a dateutil/slim-tzdata limitation, not a time_machine bug.
-    sed -i -e "/--automake/ s|\$| --deselect tests/test_time_machine.py::test_destination_datetime_tzinfo_non_zoneinfo|" \
+    #
+    # test_marker_function/_and_fixture/_class/_module use the "testdir" fixture,
+    # provided by pytest's builtin pytester plugin. That plugin isn't autoloaded;
+    # upstream's pyproject.toml sets [tool.pytest.ini_options] addopts = "-p
+    # pytester", but that file isn't shipped into the ptest tree, so the fixture
+    # is unavailable and those 4 tests error out. Pass -p pytester directly.
+    sed -i -e "/--automake/ s|\$| -p pytester --deselect tests/test_time_machine.py::test_destination_datetime_tzinfo_non_zoneinfo|" \
         ${D}${PTEST_PATH}/run-ptest
 }
 

