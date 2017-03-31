Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEA2377E71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:34 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 81so18582658pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4R8TH+BOnkWi8vNm3S60cM9bGa1mWW4Vumex4VOq2kQ=;
	b=dRSqUWrRlS6nRRj32rqFG1+ytC9FKTdAXdplLrYZQEDCMWcPpeqy6z/42ykHAjVEu1
	vKZJBTScgLzE9gJHKWFkvYZ8tNolR/Z2lRjycdCSVTP9MqW+k+cQ7mAYO609XQw5NsMO
	eDKLDx7lOSNUWo9b0OZ3b/N1rJZxK0rH9QX0mPCooyJ2oT8rsx45x5jO//kQVc23Dm73
	ioYyX+4EdgTTkw9wDnXcvOoRN8O4S1cNlgOV5JrSqCrZxkmRMcwlb3jog+YmrB7vRKjV
	p6mZyBt4PvCMnBlODVVQOu8B+RJ9TWFLt5sEg69uUqINu6/ts/oXN6xOtbkP9GcpKJEp
	5ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4R8TH+BOnkWi8vNm3S60cM9bGa1mWW4Vumex4VOq2kQ=;
	b=nA19qH5EptmlmYC2qIfzrXbUhl2OpjvyHl/OW2lcfAB1kxYRX+8Er1AkXRmRSb3ndr
	lU11hI2y31LYcNkPZ1/DK/T7WFZM3uDs55hGegZjgFZtnMZWYpb5bSQFSGUj+Epm+js+
	n4CsKarFFgjdwhK4r4CXaspirkj0cKpSNl5vU+5++KyZ1/TLOmjxzikELES03nVPTK+5
	AywJ8/OBVtpWinfiIdUru9uuR3C9+rw3oo28BclzBOMBPKHTXDeM2OzRXc5bTkNANxdh
	URFkn3IjYhXOht2mCBiPu9P5vm/iK0nw4mq8vxLIF7H5zhpQJWGUdYj714UmeEd/aZWo
	66lA==
X-Gm-Message-State: AFeK/H20DohWpj+LnQmnr7KKOnpYmHybyCCV+UKkcF+KZtQdGUlT6nxyaFGlm87tJMEYsw==
X-Received: by 10.98.25.202 with SMTP id 193mr3871883pfz.134.1490978616567;
	Fri, 31 Mar 2017 09:43:36 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:32 -0700
Message-Id: <20170331164247.5052-28-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 28/43] live555: Do not use XLOCALE on musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:35 -0000

musl does not have xlocale.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index 710dbdec8..a51619350 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -18,9 +18,12 @@ MIRRORS += "http://www.live555.com/liveMedia/public/ http://distcache.FreeBSD.or
 S = "${WORKDIR}/live"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+XLOCALE_libc-musl = " -DXLOCALE_NOT_USED"
+XLOCALE ?= ""
+
 do_configure() {
     cp ${WORKDIR}/config.linux-cross .
-    echo "COMPILE_OPTS+=" -fPIC "" >> config.linux-cross
+    echo "COMPILE_OPTS+=" -fPIC ${XLOCALE}"" >> config.linux-cross
     ./genMakefiles linux-cross
 }
 
-- 
2.12.1


