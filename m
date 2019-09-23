Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2EC7E468
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 15:58:12 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m18so9901386wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yuePc8U8mcPZoBG1JO+9uiRSLrktWid0IwbvyT62NAY=;
	b=Nm3L/VfiUBTeG9VLJhcsYgZ096XOotnWneSRXSASkNaguy9kNcprLMVcn56Reqy2NL
	gRmdkir4HguGCAi5nx5yELkEIMJ1CduD+hl7gaath0nT4IYvGaTHXRpdXy4L1083D9NY
	sL95HGcQVfaJhD+XlzFGE/F9t+5ir5CdYRFvuP6IFzdAKJx1F6/qCC7PhDOWAc57mFeB
	NRizrtaHqgS8jaEc5uS02XxdhwA+tNl2mhi2tRDiRXv8HKT8+1kNiwpEdMyfy6B/DT3K
	Ndeb17otPtSS7pXWCxBlXHIC6FZ8QpFh6ChCU1zdXjR3eJG7wm5E0msH0YlT31nfOQ/Z
	SSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yuePc8U8mcPZoBG1JO+9uiRSLrktWid0IwbvyT62NAY=;
	b=VFO+LTz5JZYXiKN/P/7zvObEaeRmYexDKs6IREURJ4Rcafbhw0l4Hl7mXgF0UOi3BS
	+cQTQCXIETHo5KSGy0wNGalZDi4NH+EmEMuuxwaRuJpYnL0k8CY1V7JAUD2TqsbpwGRY
	nhVTgsLnW8a2t8Hr/Q1eafhJ/ASHbUzpgNVD5R2xuWV5hEFNcSAczgZAoFkwcJDeQndp
	DoG4dFziUKm8abUBkFDz9IkXEMppNfQJ0U0PWpnSTNL8ZxXwD1OMCXlK6q6sm2Y+lOeJ
	8p1cjiB32DyK37uL0AcQmHFbmRucE6FpRbp5rJmFyXs1/IzzqzfPGejL102H8S3SPiCc
	7cpQ==
X-Gm-Message-State: APjAAAWL2eggCJ3lvCKPNaGSj87zi3CcT6TfBGPzgkUUxzEN8W5rqAad
	uslTuA9V+62mFf5T6Qkls9DfKw==
X-Google-Smtp-Source: APXvYqxi/x9lfaVcNHdT4GpXaZgHfu+FlDeK3Yno115d1l0cLo0wL75D6pglWykjlraDgrJscwEyIA==
X-Received: by 2002:a05:600c:24cf:: with SMTP id
	15mr314179wmu.112.1569254293745; 
	Mon, 23 Sep 2019 08:58:13 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	r13sm16321620wrn.0.2019.09.23.08.58.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 08:58:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>
Date: Mon, 23 Sep 2019 17:58:11 +0200
Message-Id: <20190923155811.25526-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-dtschema: new package
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
X-List-Received-Date: Mon, 23 Sep 2019 15:58:13 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for dtschema package developed by Rob Herring for
easy validation of YAML device-tree files in the linux kernel.

The version is current git as the only release so far - v0.1 - is old
and doesn't work with kernel's dt_binding_check make target.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- added PV

Note: I'm already seeing patch 1/2 from v1 of this series in master-next
so I'm only resending this one.

 .../python/python3-dt-schema_git.bb               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dt-schema_git.bb

diff --git a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
new file mode 100644
index 000000000..831b8fb8d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Tooling for devicetree validation using YAML and jsonschema"
+AUTHOR = "Rob Herring"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=2;endline=3;md5=c795d4924c5f739424fa8d9b569c6659"
+
+inherit setuptools3
+
+SRC_URI = "git://github.com/robherring/dt-schema.git"
+SRCREV = "5009e47c1c76e48871f5988e08dad61f3c91196b"
+PV = "0.1+git${SRCREV}"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "python3-jsonschema python3-ruamel-yaml"
-- 
2.23.0


