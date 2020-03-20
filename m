Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 906A461ADC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 14:45:41 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f16so2577304plj.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3UPHHLnE1xMb+dSGC+zXVy8ICfCcZFCWf7YBhf/klXI=;
	b=RixV0sT6x+PJfqeWEDS3KSRWbZLrl3Zqt2UQ6NDHjj/Td8BDCSnx7tp8OctQkwPkUk
	rvrUw9WRwgxP6A6p/wa5v/Ca5I6nQqjLnzszfJgh0dXNi2GDTKFWmI7w3Lfelz6bfYNm
	JW7ihjlGgex9DVOiUrm82uOsf6w5UORnR4kZFgDjENvRGmqfLgO40a00/nTsckCyjggq
	oyt/n7Quptm+1fFvlOxfKEdpegRuEg1lQd4FJvolfoesUrjWrYy4FgiGxP3clJVlprh6
	Z/vgcNZkZW+sU4Ti9tLSUMbHtnj+0LhLrvDzpz5BdKcPa5bEmJaim9khI8Z3cHOJOmK8
	8smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3UPHHLnE1xMb+dSGC+zXVy8ICfCcZFCWf7YBhf/klXI=;
	b=tdmlvqA1jcqVPShAfTTe5lwxi0DKOgUPhzN47GQqdTHmzx2uyhZzs4mdRKdbHh8iuM
	eVWczNvIlYAkuyPO7ITN14eaAXR7fmQe0YKptoh+Dsn2cNfIpXSPIB9kLlI9/n1srO1o
	iXTSwKZFj6Qqav38iHsTaXw7Ik1SSrmlGddLVYu3Yh+W7c/Zargv+Blw1IL5nezHlutT
	vWnseMG8zx/rPysYKwHtrc6OUPfLfWrCQU3Vdw/ra1yIEp4G3d3SoDKV7Q7F8tuc2V98
	MSdlWoxjmAgMmAa2tzPWtEA4IkqoNxbg9RxmzBjYfqpxibP/JmnUJCsW4jS0QKtlK0tA
	lrQg==
X-Gm-Message-State: ANhLgQ2EBikMjZI8SHQDpOIJaW2bkzAR1zeHtcp99wHWw4OWLXGlMWKc
	KlMyyAN6T8DishPAKcgFhK4Iv2CltZQ=
X-Google-Smtp-Source: ADFU+vtD2dJhAh1xbE9/imRGmAVd7c1apGqZj6Coom9kHWExQXPyQooTIs2C8BnN1ulNHOen6Suz9w==
X-Received: by 2002:a17:90b:1889:: with SMTP id
	mn9mr9575361pjb.85.1584715542271; 
	Fri, 20 Mar 2020 07:45:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::81bf])
	by smtp.gmail.com with ESMTPSA id
	k24sm5872176pgm.61.2020.03.20.07.45.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Mar 2020 07:45:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2020 07:45:52 -0700
Message-Id: <20200320144553.2587659-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200320144553.2587659-1-raj.khem@gmail.com>
References: <20200320144553.2587659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] safec: Put perl requiring tools into separate package
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
X-List-Received-Date: Fri, 20 Mar 2020 14:45:41 -0000
Content-Transfer-Encoding: 8bit

There is one script - a check tool that needs perl on
target, which perhaps is only needed during development and testing
therefore move that to a separate package. Rest of safec is then
independent of perl runtime requirement.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.5.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/safec/safec_3.5.bb b/meta-oe/recipes-core/safec/safec_3.5.bb
index c9ace3b0b8..66b1f6a1aa 100644
--- a/meta-oe/recipes-core/safec/safec_3.5.bb
+++ b/meta-oe/recipes-core/safec/safec_3.5.bb
@@ -16,4 +16,8 @@ CPPFLAGS_append_libc-musl = " -D_GNU_SOURCE"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm).*-linux'
 
-RDEPENDS_${PN} = "perl"
+PACKAGES =+ "${PN}-check"
+
+FILES_${PN}-check += "${bindir}/check_for_unsafe_apis"
+
+RDEPENDS_${PN}-check += "perl"
-- 
2.25.2


