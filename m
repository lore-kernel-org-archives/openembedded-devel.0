Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C37F71A8C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 19:00:56 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id h201so45029777qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 11:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6eeY7LfeB1qijvC3zna6NoyvB3uEYJ+UF9LG8CAdxUg=;
	b=kRE4n+bWPA8ebIaAEyom6ba+/x/k/gRoOSTTpyawjC+VmkVMXJPgluSENg4BiYzhNB
	xVQsJNthrbKFfAXYyJu51sCJCFF9rKbivJ62jQtaFcRu9O/Ek/C8B7Fv2C1K1ijFzhwN
	+oD/y+/OHme0r6AeKrOz5s2T+8CISL8C8cdzMCPTIah/FS7y0NjkAg1Y4nKY60EgLXl4
	JdSGXT+13UD9ykzLKq6UDxiAzTTI0sXw354Hz0SdEkVIM0DG70LeiXNcu0z7Yn34tqx7
	snzCl6BHD26KUDbg5ku4aQY1Y7DvvJ9FYxVnEZ76Tbg4Gd73Nw1K1l7lYlnlWvud5mlS
	rDxg==
X-Gm-Message-State: AKaTC02kL5uU/AxLCKCm7drESKyLYuEC1V11ZlZG1m27EcT9zlqhrMbc7B2Tp9CIAUhXow==
X-Received: by 10.233.216.71 with SMTP id u68mr62860377qkf.161.1481050857790; 
	Tue, 06 Dec 2016 11:00:57 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	v18sm12754480qkb.40.2016.12.06.11.00.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Dec 2016 11:00:57 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 14:00:46 -0500
Message-Id: <1481050846-19188-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] pypi: add default values for UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Tue, 06 Dec 2016 19:00:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/classes/pypi.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 3d81ab3..c69d356 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -18,6 +18,9 @@ def pypi_src_uri(d):
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
 HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
+UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
+
 SECTION = "devel/python"
 SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
-- 
2.7.4


