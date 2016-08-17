Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 44B2A7326D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:18:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o1so9433134qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=lnD3768UCDDeJr3EFYhdUPWfnBuFPHC3QFqG0OHtx4U=;
	b=Yxbf1n7ngJ7JaYsxqVDOjJSJEZWTEut4EXv7bfnGCwOZR+/G/o05quKhgdj+5Y2DBP
	YPuVJqJv1YQ9nh4b/2vdOQOz/onVfKVFp9CdYPAwbP3erz9WFZWpo08LxOAXLcMviQ0a
	xxD/wyXI7X8bBYCOBuat+xTU35nO05R8VYKEZHWginwcvR9f/Zl/ux7BEqQI1CK9x5uW
	JI2HPB4msMou99h7tfemk0WUU0t7EWYkfObI7hnYzFr3Aoe5kqykmT2RJAxLfh15CNLo
	AJuExOD6jRYzfNZzO+xdNoAYKPy/VG9mf09vf+30YszE5SFJ8DHRo+h51Tj9/vKuNmiI
	4NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lnD3768UCDDeJr3EFYhdUPWfnBuFPHC3QFqG0OHtx4U=;
	b=HKhojuZeKhz47JI+094COQ4H288b30F8qs8sl6776y3H56dYasUW+NvP8LWrSlzCFh
	k3hRilQbionL1b07czalDfbXJbNESdv1al75TLYtXsw5zIbDUBdMPLnLlKSU5EcWMhWZ
	Xm63Rt04gQi84/SWQ48R/20bIEXLWc7xXEDkR/SZcDF1ySMZQRTnkM/MYOs+Sy2kf4B+
	KzPxQfE4dQybpYP/0nA54z3KTb3A/tWOsvCQpNTZl1GiALpBnt5kyqugOOVV+kVwYbYZ
	cvkl/bqrWGe6aMilVn9Fom2yb6ZB0vbazvocvIfpsRfQvyot3LcvdqiwgUUJ6Mq586uL
	ZN7Q==
X-Gm-Message-State: AEkoouu2yVpeDzlMqxIU29HNHbeo04qWbXlU3Cu3VZBheXDQRKerBtirDTldSfH+sQEVZA==
X-Received: by 10.55.212.89 with SMTP id l86mr46093026qki.253.1471439908912;
	Wed, 17 Aug 2016 06:18:28 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	r187sm14680639qkc.49.2016.08.17.06.18.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 06:18:27 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2016 10:17:42 -0300
Message-Id: <1471439868-10118-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python][PATCH 2/8] python-rfc3987, python3-rfc3987: Add recipe for version 1.3.6
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
X-List-Received-Date: Wed, 17 Aug 2016 13:18:28 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-rfc3987.inc       | 8 ++++++++
 meta-python/recipes-devtools/python/python-rfc3987_1.3.6.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-rfc3987_1.3.6.bb | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-rfc3987.inc
 create mode 100644 meta-python/recipes-devtools/python/python-rfc3987_1.3.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-rfc3987_1.3.6.bb

diff --git a/meta-python/recipes-devtools/python/python-rfc3987.inc b/meta-python/recipes-devtools/python/python-rfc3987.inc
new file mode 100644
index 0000000..fbf6a0a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rfc3987.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
+
+SRC_URI[md5sum] = "da7dabf5ee0b1426a2c6c4f8406ee0d3"
+SRC_URI[sha256sum] = "599801156e35b5054138585c92ab4d1b729b0f2feeb961b65347116764df4aa7"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-rfc3987_1.3.6.bb b/meta-python/recipes-devtools/python/python-rfc3987_1.3.6.bb
new file mode 100644
index 0000000..dcda5aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-rfc3987_1.3.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-rfc3987.inc
diff --git a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.6.bb b/meta-python/recipes-devtools/python/python3-rfc3987_1.3.6.bb
new file mode 100644
index 0000000..cd1536b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rfc3987_1.3.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-rfc3987.inc
-- 
2.1.4


