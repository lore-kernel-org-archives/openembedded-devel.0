Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id B6CBC7FCD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:25:48 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id w9so23718232wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=B3fe/LDeMviReb1uLZ96qROz7uh4q4HSkELlJvgi4zI=;
	b=cjoeRoD3V6P/D/TAX0PFMqi8+uYUR0gsWGUJPx3+srJbepg89FpPBl4pzmkTe7o0pK
	3ME/6WRmiJ8fbpS/w0eB15KKjzHKA/NVsl6b1eBmHT/96ZPKFRwNtohnaNHaZrDxldH4
	9Y2L5Bsmeolm9aSftnjsXjdN3Jq5girL9pPOAptP10/I1PkQaNwc3doWuBFbpnYuKwdb
	XUZaOt4z0gBbAjxocL74+tNGB5ZXpfOsdEpir5SmHnkFpK6obt2m4FecjO5g8tZTjEEP
	OnGz9Rxs8fWnUlPPEQ31oZ1ZlDYSn/1CabxSIwIUPwooGgpas0pEo2/6XB8yAo8+PwjV
	jczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B3fe/LDeMviReb1uLZ96qROz7uh4q4HSkELlJvgi4zI=;
	b=V4mkPhQZ7d71/YM32leHVxYyW/8yYo/rKM82EuYhWUIzXIHHFPoXE0YyUt4xBH0+xC
	7djE3VypX3bgeqU8np+iVqQG7zh0zpksEA6eR0d7Jy7TXGuaYVQDFPFAf7fdqh+a4eCA
	8qtXQztAOy1rm338WuPILN60HrDBfW+ctKoBWZ2IKGkmI5bUa6p0kmBavYO04hheOZo6
	BYDP4hp8BO+CPmQ4RxPtMFk8+NKVn+Tf3j5lKBXoBMSxU9RxXbQhvsL+onhMbDnTtirB
	EVPZGqU00TjYY9qNERIthfSzdhPBjnPRSoTT0ZjloxY/js3wUtgc4Bn8soCx2MT5Or3S
	2N1w==
X-Gm-Message-State: APjAAAVq6yyeaMC2bScJj/ctO2PdBtwd65Fm32CBxcK1hdvj+4NgsjfO
	Q4HVI50RpxIVdjzjplzJCTCD21LdRWE=
X-Google-Smtp-Source: APXvYqz/KBelw+5YTyLFfn7eMhTvokOk4LnJKpkuHD5abxGkFad/belaPM3xFRIaKGzPQXdgc42oKw==
X-Received: by 2002:adf:ed01:: with SMTP id a1mr1882628wro.199.1574792749291; 
	Tue, 26 Nov 2019 10:25:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g207sm4322144wmg.40.2019.11.26.10.25.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 10:25:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 18:25:35 +0000
Message-Id: <20191126182535.21076-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126182535.21076-1-ross.burton@intel.com>
References: <20191126182535.21076-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glmark2: use Python 3 to build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2019 18:25:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-benchmark/glmark2/glmark2/python3.patch  | 12 ++++++++++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb     |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/glmark2/python3.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2/python3.patch b/meta-oe/recipes-benchmark/glmark2/glmark2/python3.patch
new file mode 100644
index 0000000000..df208cf878
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2/python3.patch
@@ -0,0 +1,12 @@
+Use Python 3 instead of Python 2.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/waf b/waf
+index 6ce2a24..de3c898 100755
+--- a/waf
++++ b/waf
+@@ -1 +1 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 8b767463bf..50b553c807 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -14,7 +14,8 @@ PV = "20190904+${SRCPV}"
 
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
-SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
+SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
+           file://python3.patch"
 SRCREV = "24a1139dcbfd86bd02065316eaa90559e39374e1"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


