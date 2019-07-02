Return-Path: <erik.boto@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id D51F27EABC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 06:05:18 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b11so10463978lfa.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2019 23:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S5PJ4L6OV/cRBIWCi82FDVC+ZllNzf+ixJnqS3TdsHQ=;
	b=TCoVKvUN6qUEAilwGscDsC51LGauQ0gTknBxCZBD8yY4E7IQr0Bwl22B+ErX+KZcFz
	jN3/vHXvxY9UvKI84701JKrokolXDthrYB5ekCUfMxb0Bv8S9CMjPWhZfkswJfFm6aFb
	RFqZidCTZWnXo/euPtAs2mMHw9AVMise+hpyypsR/HrsZ9EaeplNHiDXcKfe8+GLLiTZ
	7xtPb4XIwUBpQ7XWRJxXG81d8UqcnwMRRoVB49ooGFx9uXJ3CF6DhU6UB/pvM44I9EEi
	UCk1m1mWjw3gCG0MNRTz88s+Fra0z9nbXtwI2V+3NzyGqHiaPT5jTr2oBJVZjTU5r1nI
	Q9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S5PJ4L6OV/cRBIWCi82FDVC+ZllNzf+ixJnqS3TdsHQ=;
	b=GmsDCJi6UudB4LU4MXh4Vj5yzmotHP0OqRzvEpiz2Nha+NYHbpZsYxgPJO7lmtgPYt
	D9xdkqTlKsAuxdISRYhXe3ddOQkxS1w0qmVoz4xyNZ0VDNCs30uGqDw1G1kfbQP6Olui
	7WQ93gQW/bhUJDK3QwxgnwT1dJ5l5XYGPizLcxFXwmlqWd2ZwX2U47W0g/qV4rJpzhCd
	PYVQugjU2BlEnhQhS/3B8gWaErUaXknYF6LbUv9sqyWU2kt/PaX34Pl4wywgz3+qQkmY
	PdYl5Y0kKGESQzXiVfbeuVKVf/V6JTjgPfE5Jet046W1A6Fp17saq5k2QocX8mkjmxIV
	ieqg==
X-Gm-Message-State: APjAAAWmnQnTl1WsdAMCTwmQbomTFMNQ85XHpLOXxDNatR+UrQct8FaY
	qioFYI4anDWxkYOHR39Nv5y+DHXR5X0=
X-Google-Smtp-Source: APXvYqyH40Zc4i9fZhSLXop7Knw53rEBz3CSPeP6FfDMd47Bn3tTduq9+eCraaLs+Ek83f8vZVyaZQ==
X-Received: by 2002:a19:c301:: with SMTP id t1mr14070108lff.137.1562047519070; 
	Mon, 01 Jul 2019 23:05:19 -0700 (PDT)
Received: from localhost.localdomain (90-231-37-116-no154.tbcn.telia.com.
	[90.231.37.116])
	by smtp.gmail.com with ESMTPSA id h4sm3645913ljj.31.2019.07.01.23.05.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 23:05:18 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 08:05:15 +0200
Message-Id: <20190702060515.123130-1-erik.boto@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] paho-mqtt-c: enable SSL
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
X-List-Received-Date: Tue, 02 Jul 2019 06:05:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pass the option PAHO_WITH_SSL=ON when invoking cmake in order to enable
the build of the SSL variants of the libraries.

Signed-off-by: Erik Botö <erik.boto@gmail.com>
---
 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
index 79a8f43d7..f3086315d 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
@@ -26,3 +26,5 @@ do_install_append() {
     rm -rf ${D}${prefix}/samples
     find ${D}${prefix} -maxdepth 1 -type f -delete
 }
+
+EXTRA_OECMAKE = "-DPAHO_WITH_SSL=ON"
-- 
2.20.1


