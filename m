Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id F32A26FF4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:03:52 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id j92so2103764qgj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xa1lWpgpI2imPttEC1Vdv6MP1WSn4w25Vpyes2xHQNE=;
	b=KIFjLKG0zRaxGHjLqEW5UpqG7N9gsAMoj8pj+x1gggnxysSNzbdr4SaSvgAjhAw1gG
	7Yay0UgqIHUP0dZ+XKOdkRftm/2sHoM4dzxtsTrtvTIB415hTLfmMXlrp8CyLzy6zxn5
	P2dWrw087zTnpCpRGz5HdGQEohmexpzrlLduVRyYxe/z68cafj7i16VQiNBcBrRRimlQ
	lKTBaH78Pb1nq9ue8Mn2LVqUPv9hZAYUfJAE4re6RSGYOWoVsY5vedSYcuowvUEKFWlM
	QJhlFEQo7U2jSQse+WDTB+cKloF9mnM3dtbiTfnmfdPbIM5xDDOLJVSMEfpIZuTsmdRc
	U4Jg==
X-Gm-Message-State: AD7BkJJtR2gwh5qbdYtBR3kYieXZlg6cY9NWREKWfKbm91hqNEpsCuWt/jPddCTNIZjkIQ==
X-Received: by 10.140.20.197 with SMTP id 63mr6028659qgj.18.1458763433153;
	Wed, 23 Mar 2016 13:03:53 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	b103sm1771859qge.2.2016.03.23.13.03.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:03:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:03:40 -0400
Message-Id: <1458763422-30827-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763422-30827-1-git-send-email-derek@asterius.io>
References: <1458763422-30827-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 3/5] python-parse-type: add initial recipe for version 0.3.4
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
X-List-Received-Date: Wed, 23 Mar 2016 20:03:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-parse-type_0.3.4.bb        | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-parse-type_0.3.4.bb

diff --git a/meta-python/recipes-devtools/python/python-parse-type_0.3.4.bb b/meta-python/recipes-devtools/python/python-parse-type_0.3.4.bb
new file mode 100644
index 0000000..9dc37cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse-type_0.3.4.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Simplifies building parse types based on the parse module"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=be38402eb4b6c224e4914fd82e0e1436"
+PYPI_PACKAGE = "parse_type"
+
+SRC_URI[md5sum] = "00ba70bc5ca67624207b0dfced01dc8a"
+SRC_URI[sha256sum] = "3dd0b323bafcb8c25e000ce5589042a1c99cba9c3bec77b9f591e46bc9606147"
+
+RDEPENDS_${PN} += "python-parse"
+
+inherit pypi setuptools
-- 
1.9.1


