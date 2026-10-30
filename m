Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8912.1793358214347650579
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=loq8jhmX;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so294111f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358212; x=1793963012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+Z0V6tgC4dcCNIBPt59D8tOvr2vziisCUaiCfuj3/o=;
        b=loq8jhmXAlL70pttyRbkhTJvcn7YyJMhNqyq14JOT4f8a3X7dkMoVs1wvCaqd+GGLR
         gzFKT5hw5OoyjvpskgyI2aD4QaRUITAo0NtrtP5R5d9fa9o/zKXF1TdOhawINKfU9i0m
         ENcNRwi68Je8nTLTegbYC8u46WMEwn94ZpBT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358212; x=1793963012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+Z0V6tgC4dcCNIBPt59D8tOvr2vziisCUaiCfuj3/o=;
        b=F9GgxUsyhTohq6BeHqqcK/x6FWSns8ahVvLyABMfvAhywvfV/LWe+2U4WnUeqf0fpf
         GURC6r+HhBGfLQdQBeBCadpfy93PRatyTceY7qmt/cR5f+PBOHKKoMlg/u7zqF1aUhXI
         u9LM+1zbhpeDn4FdwBsXAWeRX/4WHPw0uGDK2ZWqU0TTRBToe8koCB0eEO59tu0r0Q6G
         MVOSJq4/+3jTDFXV9YdbaAbyimwgFsOKT/PhP2BU6zaDo2B5pVOKQ7rCfpPxfJSVZvQH
         iKpJDkns0jw84WqwB3hi6ph7WuQuJei7WQjJ36TjswpTuZMpdAbML/0c52ATBj5bp19m
         1KFg==
X-Gm-Message-State: AFq9FYJQDSv6ZSfK1z/4qjcPp36B5iXz/n7TRYYUxH8DDH5dvhW7sDdg
	gT54pig7gRXQwKtWSBf8E2PE88SzJdpmRTiY0C9GxiLQ/UBnABWYzr+WEBLfkMCMKSn3kzZ12Wy
	9cFdp
X-Gm-Gg: AYBFou2xKB2VWbKoda9f97W6VXNXERkpK3FqGlvwMEQ+7nHtHmIDE5Tf0wFhxakghSo
	18TuWlhFYCcd4JjlA77r+wa5wXk43Pit+eZ1Emdmam6EquVK98uYoZ78LoArrYxLZ/XmJX0de52
	36wSqg46WKhMr+HZt0a7ee3dNaz61H5aDoQHAqe6hhRaxXLNSh+oWsQ6lvtsUccCK+phGdxqwme
	0yjVfxeNSrWGbDHi4eHUDZLGvv8emQfkD/je7dABb4GWk2nnB6DxfRANymqVRtboZ0L2gfagQ7W
	xPCxSmOOeNJp45qW+x2tKFWByRaZk/5VMb7cZY0/JBlyCVwTliEZYeMekYXzfRA/XvMOd7LGXzH
	NmPg/I3E4H4n6g3LkhV7cLNSCsMyXD8phLNWCJnDOmAxIc/A1tfGVgYtqg234/wREQyUl/HO9Ru
	gmqrpW5ZmVHO8imSh+PV5l4uvyTvwbiQupbJ6t1rl/XzMaYRyF2h5BIiw768O4N9l4tT+JJnk5v
	db4iR2P5KDCMzEc2af0Q/9s4sDyr6zskxaYJZKeIhReiIyaUJJPXtOZXiQWOq6IygnypTYstJG1
	BDVfcbmGhhMKO1hbILw8aTJJDBEunxezWLUIDT4f3cs8ZF3qMt6JPG3/v4jug/wETNqKk0cYbq3
	RVFlWRo/l00mKsLwJgZtcSSM7/wis8A0JFu5W7XQVw34HRCpXuM1FkA==
X-Received: by 2002:a05:6000:2892:b0:48d:eb44:650c with SMTP id ffacd0b85a97d-48e6e309f40mr4750086f8f.40.1793358209296;
        Fri, 30 Oct 2026 04:03:29 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/25] python3-pyflakes: Upgrade 4.0.3 -> 4.1.0
Date: Fri, 30 Oct 2026 13:02:58 +0200
Message-ID: <20261030110309.1124614-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131698
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.1.0:

- Drop support for EOL python 3.10
- Significant performance improvements
- Fix handling of Literal and Annotated for lazy imports

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyflakes_4.0.3.bb => python3-pyflakes_4.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_4.0.3.bb => python3-pyflakes_4.1.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_4.0.3.bb b/meta-python/recipes-devtools/python/python3-pyflakes_4.1.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_4.1.0.bb
index 5fd08b65ab..1472253e66 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "94762a3a5a343a79b28754f96c554bce057a592a4896907d73f0369fe824e053"
+SRC_URI[sha256sum] = "592beb57058eb82eb190fb7514f2081c555c51000b029ff71286a681e6cf2f83"
 
 inherit pypi setuptools3
 
-- 
2.47.3

