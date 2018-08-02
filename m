Return-Path: <3x75iWwgJALATcYjhYopmQoce.Sec@flex--dmitriyz.bounces.google.com>
Received: from mail-oi0-f74.google.com (mail-oi0-f74.google.com
	[209.85.218.74])
	by mail.openembedded.org (Postfix) with ESMTP id 6D98D78DA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 08:20:22 +0000 (UTC)
Received: by mail-oi0-f74.google.com with SMTP id q11-v6so1245670oih.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Aug 2018 01:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=/CfLXDINXDKaM25KpPA3/4DCiUokU420ZMBUQ8sgdOA=;
	b=sOiLZ1bCyOkKkIQbVsFnX1CpYONxvw3XRhfEf6fda+YXfa+cray/AnjrcIO+u5e4ql
	L3I1MdKVlWh5uNQ4nu/3g8pxooXRFcMvwA29/ZIeH/C7nv/8Uvx9UanX/3mmpWWeVKCC
	PHCmZwNxCMAhZzGI5zUB2nQLgnR0kuGuZrzzFMNUvh3SfWL/98o8tvDhx+cbHbfKWVCE
	poqolZunsmIpoCMdNbfJYnDL29AIGvdyDMTrgHN5ZT5cyKnKploCM1k/l47c+ejAeOqc
	IjHCakUEByq4BH2VywwYhiq6xViFJJJIOcro38jBP+ycPj+7z/gvUuN61uzFyR4aK64U
	zWqA==
X-Gm-Message-State: AOUpUlEw5wLLwFdtIDXHTqsmCl7E5Z1aM9Qx2s4kZeUtFbag0ZzHy+hj
	DoFzG4UxUH25Pb+Sj7e7U01y9JnaQaWPszjtcgNHKbExYA9vBPb80/5AD+nxFudwEkWXEw9L9Zz
	vT5+8QBFWBQDV2hB4CLoG99x2oN/yXsTQ0mBRAg9PeLYxQW1GbfIRI+Tu58b5YPsS9uCArgmoy1
	EGj7CwEFbIG5Mizt0=
X-Google-Smtp-Source: AAOMgpfVImD4kxS7XovKrxNkHzw/2Nub0ULpiJ36oDVB/B9Zft8WAJPlpWIso0yjSgWhZn/n4WXF2V1SmH5kew==
X-Received: by 2002:aca:aa82:: with SMTP id
	t124-v6mr1108786oie.44.1533198023482; 
	Thu, 02 Aug 2018 01:20:23 -0700 (PDT)
Date: Thu,  2 Aug 2018 01:20:18 -0700
Message-Id: <20180802082018.116688-1-dmitriyz@waymo.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
From: Dima Zavin <dmitriyz@waymo.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] meta-python: make python-chardet coexist for both python2 and python3
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
X-List-Received-Date: Thu, 02 Aug 2018 08:20:22 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Dima Zavin <dmitriyz@waymo.com>
---
 meta-python/recipes-devtools/python/python-chardet.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
index 246a65aa6..1a85e7410 100644
--- a/meta-python/recipes-devtools/python/python-chardet.inc
+++ b/meta-python/recipes-devtools/python/python-chardet.inc
@@ -22,3 +22,10 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-logging \
 "
+
+do_install_append () {
+    maj_ver=$(echo ${PYTHON_BASEVERSION} | cut -d . -f 1)
+    if [ "$maj_ver" == "3" ] ; then
+        mv ${D}${bindir}/chardetect ${D}${bindir}/chardetect3
+    fi
+}
-- 
2.18.0.597.ga71716f1ad-goog


