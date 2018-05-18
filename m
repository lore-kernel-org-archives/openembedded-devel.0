Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 299A374AFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:06 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id az12-v6so3587753plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=S1dOXcyZjHHThelTR1fcG+nvVpqwqOZ+i8GD3aDJPDk=;
	b=la4tyUw6DjmriqRNJITq5TUbzHnsbl8Q1eVJUMq630DXXDMOY0MNDsZl3uReUQbMz8
	JXU03c5FuctP5hW04Vjj7hUgyOwXS9GWx8zn+ZbLIYv+wPhzT/v2yiT5XHYT6XuwDgv7
	UGhMDLTpxrSsBJbjlkh2W7mnar3gqq6QVCD+14tE/aIgW8f2vyAf08OXtILZvbV+iQcJ
	J0ZvT/uYl3+3NvVhnmwKj13OBIQPOsWATCa7wrfQsd7gCgdz1bBAork7LahFQxOU+fWd
	6TIo5eSxHvqQasSPSCV1L3uxChZQNBW874heNbqkemmJu1Jgq6D/1eY25NTVAbIXFaMu
	ZgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=S1dOXcyZjHHThelTR1fcG+nvVpqwqOZ+i8GD3aDJPDk=;
	b=F7Nv91YkOnDl9ZXTwKSHi5rejeolDXA+d3cQthYRQqyE0jy7Mkh0qkCR9ZOpvj/Ran
	B0Uuh9eA7S7Gh0dnIoRt6LH+7iNPsoJIpRV1zPNXOKSjPu9BAHSAx8MzGhK1RJU23uZV
	5Y7Eey+YMTG7jLm0k30Vr1T5Ppcdwqbej0sl1vxVEQLu+mQTwL9qSzJf3TUQhg+AKwII
	tUnaldlTIQmoMlHkhH7cIPldlfVz8w1JH+kr9ppfyo1rNpnmvjpwUJXvkMv24f9/jw/8
	nXVcapz/vZKwmZfB5u7KGyoJyPFIdx9jpnUwbO4wV/XWDRzWzuhhy73/A0cXdT+xXsT8
	oxnw==
X-Gm-Message-State: ALKqPwdvoTzauvfZkaxzVUEX3G1N8STvS3RK+Sp5Var4hg6oOOT+33mv
	YwJsSFke0ZS0osYEIjednssGDA==
X-Google-Smtp-Source: AB8JxZoyLExlq5u+TRoliRZV6iMS46SUsL+XwLAVBrmZaUW2NAXpv+2iEqon0rn0no1aBFFktLQYCg==
X-Received: by 2002:a17:902:5e3:: with SMTP id
	f90-v6mr7574776plf.175.1526607067832; 
	Thu, 17 May 2018 18:31:07 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:33 -0700
Message-Id: <1526607046-8081-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 04/17] capnproto: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
index ffbe73f..b448a11 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.6.1.bb
@@ -2,25 +2,23 @@ SUMMARY = "Cap'n Proto serialization/RPC system"
 DESCRIPTION = "Cap’n Proto is an insanely fast data interchange format and capability-based RPC system. "
 HOMEPAGE = "https://github.com/sandstorm-io/capnproto"
 SECTION = "console/tools"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=0a5b5b742baf10cc1c158579eba7fb1d"
 
 SRCREV = "c949a18da5f041a36cc218c5c4b79c7705999b4f"
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV}"
 
-EXTRA_OECMAKE += "\
-    -DBUILD_TESTING=OFF \
-"
+S = "${WORKDIR}/git/c++"
 
 inherit cmake
 
-S = "${WORKDIR}/git/c++"
+EXTRA_OECMAKE += "\
+    -DBUILD_TESTING=OFF \
+"
 
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-compiler = "${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


