Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.800.1794363041500004325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 18:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PT7BZrMz;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1930736c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 18:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363041; x=1794967841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mk/g8cJkLQA6dWa+iAYbm5E1Ex97/zG0BpHy66J5w3I=;
        b=PT7BZrMzjYbMO1Nzp14GUSVE+eNPBFI78Ym6VtpRKyye4qwR5B3vbGsb9h55A6sm6p
         IQGk7922gh+Jke69TCKY0EiwPlAiagvqqvVuqDYTFIoDVJoVIcF/wJxMnxctbAjWHf+2
         bedi6+wlH5/nF4I64iogNCq3BWbHllVp/MemdStX4XT8HZNV2YU0yyzrBmOr4RPyIOZn
         Utgl0CAf4vIUmjlQK1KFFfprMqJreBqGgIuJUH7Ba6ci/1Sye9DwqjT9SJsQ43OXKoJp
         9Ie2KO/VweSR/wU6rS2Lbo2lf7Li607tswNXK8s0kiwA6AJiYJeWnJcI6EqZbws0SHzV
         qF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363041; x=1794967841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mk/g8cJkLQA6dWa+iAYbm5E1Ex97/zG0BpHy66J5w3I=;
        b=U5xe6xUMMQ6i0XfnePmE07IBqDk1j3/OXhVwfV1cLYyksgLZtJKXos1op1OPhUjpxc
         eGoDY7+JA/PbupYnI8BpWF71mgXz27org3AD0/xqNag2HgX0oi1qVP9e8glB75Yq9dqO
         nWz2uCb28a9aGiFXerWz7peTcMx2on0EJf3pm2zFfNu+ikuO+1DjZGVi5OZS/F24DT18
         4cGz9KKFsegyrQP4VEcQeAJ3LCbLAiPxga4/WmveNXoi4rTOAxK1+qJfSxxFbUat6uwq
         T7jahavJ75tCc/n/yodYmdaWErz1c2JtbqD/WLpuzPYeZ41HVaUNf7X5j8/TOBXdrHyr
         OaeA==
X-Gm-Message-State: APuU4Z+rGwda5b0/mj9Aj9qvBsP6SSqAHvRTlt9BmhoRIqYTE1hxmUUF
	duhQhfai585ig+FloznuBNrOMfzWrNegjQTQsizHIhaTvFeMdQ2sCTRdf9yHfnJOP6h5vA==
X-Gm-Gg: AYBFou1AqJQwz+TelAhB5JuesjPCgwJk06FzKV9x359x6lHN3RIlacsWMb/ShPuvQzD
	R1BLK4bCHwkrthkBOizbXE1XoStt5e8u/XnC774edjQLH4sAm5txIK1ZzfvIWtjl5ULSxYZOfVe
	/GT47T3Ti8LtX8jKe8/WLe7hDBKOIzLFCb8X2wd3vtFsGQec5jMmOf8UD3+A+K+p/WAmVdasrVa
	CK+FXPL0KNRUXjUut0undEqd18H/KSJWYbGkDb8fgeGgFkUCfLZlzERB5RjP+GaMztfxCYeyzA+
	0eW9/hJpYzEj0wRyzDxHs73u98MbTVLJAj4JW/aCe++kurnm+Ly78MF1ZokKHbNYFEu6h4+pcfd
	CII4JTxc8EPThjSfWUUSBhN6EbcSUB1t1chPvFNyVenJvZURpePL6FkIWyvigI3esuAGmGWcpsZ
	n/DZrDFs19rUpoAXPPu8/3JzbJkzQItu88LnIwcaE3nasKihGfZ/pY9Vt4OGdnVsKmurUcIolCr
	/fJq17/1WfIGy2O2cX3mbT0I9HCQ+qAqWeEZv17QuV0QEqoicC5C2Hn6IWDySfvnwv6XUQgieev
	1esGhgzlA+tfx+HafDvQJp7x7leiMa9JZCICHDiPpH2qpmSVxabzR6QYTvNdZMNvG/Oxhyo0AoD
	4Eq1WscHNL+WwPZs6/k+3iV9hKBGuTnctB+Y6MEAxkLj4AYJALwDxzvMhStrtwPG1pKXRY4Onjw
	qAq8b9Cg7kS/TnJJkKCZscjCc6SOY619dit8xuSmcNd72ribmJqQW3WO886ZaSc+uXendWX2Wqm
	wnmxPN0UH7XC9/Rl3nJGYslJ/oupSdpwmYLg/5lh2FVO+x7UZlcSrXRtiCbBebfXCZ4Xd5lz9VO
	Bq4y
X-Received: by 2002:a05:7022:ef07:b0:13b:2f26:6881 with SMTP id a92af1059eb24-1b3c024ac7amr1266243c88.4.1794363040731;
        Tue, 10 Nov 2026 18:10:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm9475312c88.15.2026.11.10.18.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:10:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mongodb: Keep build paths out of buildInfo
Date: Tue, 10 Nov 2026 18:10:36 -0800
Message-ID: <20261111021036.3866389-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111021036.3866389-1-khem.raj@oss.qualcomm.com>
References: <20261111021036.3866389-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 02:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132110
Content-Type: text/plain; charset="utf-8"

By default buildInfo embeds the compiler version string and CCFLAGS,
CXXFLAGS and LINKFLAGS, which carry --sysroot and -ffile-prefix-map
paths into mongod and mongos and trigger buildpaths QA warnings. Pass
a variables file that drops those entries from
MONGO_BUILDINFO_ENVIRONMENT_DATA.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-dbs/mongodb/mongodb/oe-buildinfo.vars     | 11 +++++++++++
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb    |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars
new file mode 100644
index 0000000000..950dc4baa2
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars
@@ -0,0 +1,11 @@
+# Keep the compiler and its flags, which carry build paths, out of
+# the buildInfo command and --version output
+from mongo.generators import default_buildinfo_environment_data
+
+MONGO_BUILDINFO_ENVIRONMENT_DATA = {
+    k: v for k, v in default_buildinfo_environment_data().items()
+    if k not in ('cc', 'ccflags', 'cxx', 'cxxflags', 'linkflags')
+}
+
+# SConstruct rejects unknown names left in a variables file
+del default_buildinfo_environment_data
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 22169ddd64..6c4fdf91a9 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0003-boost-Fix-build-with-clang-23.patch \
            file://0004-ssl-Fix-build-with-OpenSSL-4.patch \
            file://0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch \
+           file://oe-buildinfo.vars \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
@@ -87,6 +88,7 @@ EXTRA_OESCONS = "PREFIX=${prefix} \
                  TARGET_ARCH=${MONGO_ARCH} \
                  MONGO_VERSION=${PV} \
                  OBJCOPY=${OBJCOPY} \
+                 --variables-files=${UNPACKDIR}/oe-buildinfo.vars \
                  --ssl \
                  --disable-warnings-as-errors \
                  --use-system-zlib \
