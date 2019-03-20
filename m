Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id C6BAD7CE66
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2019 12:45:41 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id y13so2624948wrd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2019 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hOGX8YUBylfSGJAe9bzpeUjFYmNPGlMrVSQB/YvGDUM=;
	b=KLupVURp8Ja+a2gocpGnZYnJY5FF0QVLT9WJM+BBHQ/GYE9+NbrorVz7hy3838AYLy
	No4yk2nAa9KHcZCZGGnoBO0/dlS3cqQz5Yxy3BjzWSgkTuMotZ5Bbq+S4G5kOiMSGQNA
	hYbEOn9JQmXPZOg9gWWL653L7OLZzC6F5yAvOVIJSM4Q4AHmXcnZLGRcc3sGkeDN1TD0
	mQu0GLjrcZrdS1FUZJOL00xRDyIq4Tj6QKkL5N5jz7zzNC2ksWwSyRqmePD8NO4JxCp0
	7ouVm3mpkq4zk53DdmHwWKVv6i1KIPGo1Ezmcjj3gTjhuUxjRy82O50aOcZm0TPNKwq/
	OH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hOGX8YUBylfSGJAe9bzpeUjFYmNPGlMrVSQB/YvGDUM=;
	b=NH5mWMqFeIlS/GkGVpZ5GfHY+Qz1V9p2Dfq1TXhbAxLITziOWzt3GIQylZgnc5dr1E
	vwkMIAOBM8UOFR1QdZnm6YngfpP55XjFcttVfpqCanGTlWwp15bS0gHQLpTeYWgjX+Ts
	426urA/dvaNhGki56u8WzpPcbTBv3y+pB+o+wg6W4rsxP78Ox5mgrgdXfKfx95DbpfDd
	cHRgyijT7q2tp3PP1e88ZlwNwAGsZe3oyKG0S0dc364wcKdBsnCp2xBa0S+sBJFgVxoF
	7I4ZeYtxRVNQAu+bwf9+BShTw0GAN/ayS9PoCe9sdJ0If2xQYKxBRpMRkjckL+WVmorE
	m77g==
X-Gm-Message-State: APjAAAWoX4jZ/G7x1hW/NM3Arw1Xa34yVNNJprpMdpXtT4UAWTDOzib5
	vEmpJ+DPCOzTQ8AtcInGHJE8GhbeEcg=
X-Google-Smtp-Source: APXvYqxRtlqSt99Jg6X9vQ76cYEMgzAo3AWzn5rjpEgChWZjpkTh2EVPf3XKSKWMj0CvuspueIiTYA==
X-Received: by 2002:a5d:4606:: with SMTP id t6mr13053087wrq.43.1553085942268; 
	Wed, 20 Mar 2019 05:45:42 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r63sm2910259wmr.32.2019.03.20.05.45.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 05:45:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Mar 2019 12:45:37 +0000
Message-Id: <20190320124537.10232-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-python][PATCH] gyp: add recipe
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
X-List-Received-Date: Wed, 20 Mar 2019 12:45:42 -0000

GYP (Generate Your Projects) is a meta-build system by Google.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/gyp/gyp_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/gyp/gyp_git.bb

diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
new file mode 100644
index 0000000000..2b3f3fb2bf
--- /dev/null
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "GYP is a Meta-Build system: a build system that generates other build systems."
+HOMEPAGE = "https://gyp.gsrc.io/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
+SECTION = "devel"
+
+SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
+SRCREV = "8bee09f4a57807136593ddc906b0b213c21f9014"
+
+S = "${WORKDIR}/git"
+PV = "0.1+git${SRCPV}"
+
+inherit setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


