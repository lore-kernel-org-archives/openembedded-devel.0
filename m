Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 44BA56C4D8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 21:28:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c17so11299946wmk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 13:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LFYD7sJQIhL6PK9IS0GfAhkXNepi8ztXdkafJUPOR8I=;
	b=oNdOixVBsFPA0V1aDHmUguYGDBB9RtGEyS47dJAe2u/Geh7kYNQKHiM39Tpz5xHH23
	pEcAIQytsGwT9R14U05XDrXG9YKAOfepy0gSpzeUVAzOacbsfemOSOnFexANpW9Wmeae
	h+B1CEGIbna8WSQ3ZWuPNnQSesN9VHEI8JYeEUg6AioXwGx7l7sWufB6qDzkAIq+Ky4O
	5VclssJ6TwfzAKRm6zGmT9H7Lm1kNY/yEuR0Be8/4FOGvDBS8yq/ZdjbhgBghiSE160L
	aQJD2ailZuH18G+aVH9p4mJN5lddLD6bLQ1chdXInAwGVBlb78+RzeFnqSU7NIkSKhlB
	P/dQ==
X-Gm-Message-State: APjAAAXlIjZw2Qw+gxclC8a9El3JiJjUyu1K4FcB9icXhjkNyCcOJliS
	nNzxAaOL5GiHdhFqMPQKNI655QIl
X-Google-Smtp-Source: APXvYqxOrQQZAJy7Qh765qFp512GGf8yCR1t1iCYx7cnHhtbLIzVEYetB4kH9fkXhjKsquB8sknKlA==
X-Received: by 2002:a05:600c:2295:: with SMTP id
	21mr16592312wmf.85.1573421285460; 
	Sun, 10 Nov 2019 13:28:05 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n17sm12862421wrp.40.2019.11.10.13.28.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 13:28:04 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 21:28:02 +0000
Message-Id: <20191110212803.9262-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] gyp: update to fcd686f1880f
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
X-List-Received-Date: Sun, 10 Nov 2019 21:28:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This brings a few python3 fixes:
fcd686f1 (origin/master, origin/HEAD, master) Add .tbd to the .xcodeproj generator’s extension map
a8921fca fix encoding issues with inputs for better Python 3 support
12ef00df fix make output checks under C locale
aca1e2c3 Fix Python 3 incompatibilities
4f1618ab Add missing b'' qualifier from da63cb0f.
da63cb0f Misc python3 fixes in xcode_emulation.
5c270f76 Fix incorrect depfile path relativization
9f2a7bb1 Add flake8 checks to travis configuration.

Signed-off-by: André Draszik <git@andred.net>
---
 meta-python/recipes-devtools/gyp/gyp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index 2b3f3fb2b..61f3c8637 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
 SECTION = "devel"
 
 SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
-SRCREV = "8bee09f4a57807136593ddc906b0b213c21f9014"
+SRCREV = "fcd686f1880fa52a1ee78d3e98af1b88cb334528"
 
 S = "${WORKDIR}/git"
 PV = "0.1+git${SRCPV}"
-- 
2.23.0.rc1


