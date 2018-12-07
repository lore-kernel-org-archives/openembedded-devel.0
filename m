Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8562D6025E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2018 22:51:50 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 17so2335934pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2018 14:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2SfXv0dA4NKG/ZKKovpbSrKjPNywGQ5iOOgHpn6S3c8=;
	b=a/c5YcIykGUr5ELyQl1ORnAyosQ9flNmncw7ewHeiu1z1fRLBlc5495OcNQGy0l77a
	TPvOupTMj5hhy9oBKMOK1XJf0adRtkMSG/UqH+2nJ62EnhKvceKR6EH6sPTsbecWegyO
	SGSv+GoJZ5vq0w7UiPcUBjZ1JNVlX5ztuWL4Uu1giIm4uTJoJg0UDWxdJXCm762dTQls
	YxaMoBWLlIVhycwbBjKywa6iWuJFzEeBdjtdywVQnO9XKfvyiguB7sxcRGzP0kj58V4k
	83CFix/1LGGej1ZsesaTZ2wH1Ct4xvXKqG7IEoW2oRRwHwV4b/EZssUaBJPZgSV5MhIx
	PWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2SfXv0dA4NKG/ZKKovpbSrKjPNywGQ5iOOgHpn6S3c8=;
	b=Zh7yaQVMeXuxlCz2aZRoMCJD8NP0yqbYRT15Al/3fP66YAb6nz8R4tlqp6H3lgz9ZK
	MQZS91aOZaQEu8henKW70KEh6wQjtcoPaJDNan+XeW0HrxUDtkokU1yI0wY8hNezG+eQ
	l/urdlglFR1TBEjUz62O+BQMORR3Z5NbujU9JOEqtsiNyAsKRKqSyzuSOeAbyuiKDZaS
	hM50gXRyuu2dX19O4Jbt5SdHjftmva9BKU2FXQVyFtb/DjamA29TVDX7Vo1+xprVjB+9
	PYRyajeqkZKHDNEZ6t6xnY+Jg2s2v/bS8jV79+oFFv2wlrtaj12NWDj+doBDG2HC88jc
	jdBA==
X-Gm-Message-State: AA+aEWYtNo0oLrTp3j33DcAoyDcS/zygz75zOukQE9kl9DbdJXRfTpmi
	nEDR2OMeIy7Xwv5RQ2YbXf7mtye4nTo=
X-Google-Smtp-Source: AFSGD/WCTPTKPLU2pu2XJFyVkOEpteP6yfwPlqnWw7KRCmYIMLFfF+DvH1Tn7qXbmYEIyjjSqFuyrw==
X-Received: by 2002:a63:6f0d:: with SMTP id k13mr3548884pgc.42.1544223111128; 
	Fri, 07 Dec 2018 14:51:51 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id a73sm6929710pfa.7.2018.12.07.14.51.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 14:51:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Dec 2018 14:51:37 -0800
Message-Id: <20181207225137.38477-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] doxygen: Use SOURCEFORGE_MIRROR for SRC_URI
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
X-List-Received-Date: Fri, 07 Dec 2018 22:51:50 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
index 3137c48439..7c7024ecf4 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
@@ -8,7 +8,7 @@ inherit cmake python3native
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "ftp://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch"
 
 SRC_URI[md5sum] = "41d8821133e8d8104280030553e2b42b"
-- 
2.19.2


