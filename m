Return-Path: <36kVmWwgJAO8UdZkiZpqnRpdf.Tfd@flex--dmitriyz.bounces.google.com>
Received: from mail-qk0-f201.google.com (mail-qk0-f201.google.com
	[209.85.220.201])
	by mail.openembedded.org (Postfix) with ESMTP id 3756A60290
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2018 00:33:45 +0000 (UTC)
Received: by mail-qk0-f201.google.com with SMTP id w126-v6so9311192qka.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2018 17:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=h20UbPQLoDs+rcjaBpiWduDrkr3H35ej2Wh0Ez8UXD4=;
	b=DdBG9m5db4AQ0OAC1c9aSC9Wx33cNGxI39mnF0UKuuDMIGWlEAdj6HrGVQGPxXq8an
	9DRW5P4dtRT9vI7hmvS2Qi3WVm5HtApLh0xSTLfaluy2uuWnMiSL3cHwCJHlAMhqV9lW
	CGr4nlvHKItoazcQpP16D1NLQq0loM2aTmmw2UdWZfDXzZIoO6umGLRuxbjO3P/pdnMp
	2CuF2lNFRebrdpn55Yfy/z1HfRqk6gJD7H5igScLznGGJjr35dBKOeWq1lADMheWtc+n
	nxefAZpwqxm/7W0D8ZudNjSj8dY05FaIxUyvHSuqKfirH/PZLMdr7DqxXCaZgWN3fpFC
	Qp/A==
X-Gm-Message-State: AOUpUlFgyQ/W9Z2J3vigdz/Ex74QjP3ceOOf8rFA/kKDvtktucLnvTFj
	bKrTG5YtWVDImpsWfflnNeEoXED6PBkzYzIDYlpT/j19Yvfz7CqR332h/T5aW/RyKiVapiGC239
	j+Mo3L9twkfIEVFJdnVnRfLEBeYwuFKJIZq27oVe/+wS6RH6yA/X5RWj3ptxpHY9opYG5LeWR97
	IbGr4dtyz6wUNzAJU=
X-Google-Smtp-Source: AAOMgpfx6Oz/d1oqfN5v/J/2a4N8bgF2yQkVLLGecIO9NCY5K8Cu7x10I8Zob4cXUQpSrts0jqDKaC7ROj9tFg==
X-Received: by 2002:a0c:96d0:: with SMTP id
	b16-v6mr6822016qvd.41.1533429226939; 
	Sat, 04 Aug 2018 17:33:46 -0700 (PDT)
Date: Sat,  4 Aug 2018 17:33:34 -0700
In-Reply-To: <CAMKF1sqe-mfHGwxi8A0yxnFVOeFG4mQxLyHNOLECn5G8gTHG4Q@mail.gmail.com>
Message-Id: <20180805003334.97254-1-dmitriyz@waymo.com>
Mime-Version: 1.0
References: <CAMKF1sqe-mfHGwxi8A0yxnFVOeFG4mQxLyHNOLECn5G8gTHG4Q@mail.gmail.com>
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
From: Dima Zavin <dmitriyz@waymo.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-chardet: add a '3' suffix to binary to avoid conflicts with python2
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
X-List-Received-Date: Sun, 05 Aug 2018 00:33:46 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Dima Zavin <dmitriyz@waymo.com>
---
 meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb b/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
index 038043c56..38d8122ce 100644
--- a/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
@@ -1,2 +1,7 @@
 inherit setuptools3
 require python-chardet.inc
+
+do_install_append () {
+    # rename scripts that would conflict with the Python 2 build of chardet
+    mv ${D}${bindir}/chardetect ${D}${bindir}/chardetect3
+}
-- 
2.18.0.597.ga71716f1ad-goog


