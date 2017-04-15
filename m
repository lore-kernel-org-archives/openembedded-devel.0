Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 49E4077E46
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 14:49:47 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u18so15502546wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yFRw5385Mbb+xgkrLcq/oiiXF6Q6svW4voCiR32pTRE=;
	b=f214h29IjdM262CpPtj5BksI2XnXfwtHRxaQFSrKZHebTIVXyDoMPx8OBXeQtkpo7f
	psxQbXPAe9PZPyKz1sZiUtXuK9yWCeCYsTolZvLSmJnfcL31eBYTUMNHcNIgsl+NAe/R
	h2nrstZuPHer7A5UIxD+rH9AlS7Ac4wTmdc8lbdRVZBr1AYOOVXvazep2ULGoeZwSJuF
	NQb9rj3Q8IMcuHMxuR4PMhecFfpz8X7nefCg2s1s9uEERvNv9fu6RhWmEtZAme8hsWWp
	Eq2D28Meuj9cvrWAGHVAzw4mxXQR13ppBfCs7qtTVkAtGDetqgnPtaAhDwPOkOMz7ARu
	KMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yFRw5385Mbb+xgkrLcq/oiiXF6Q6svW4voCiR32pTRE=;
	b=pBBL0/K776Kdb9ln4xsm6lNSI6r8JJJbkIQwTWvQLJIDq+g7c54NC2yLCzCtGME6qq
	y8J54YqRvDZlO4745P7epLK6ERJT0B/iVdMk7M4fBdl7vZRPZQEwv8rizHIFMfY6KWdO
	aRYX6SpMtODyposqP5QCBKNF5iH48jLDPipZ7/43nIRJaOeYqCEMyZ2kg2+WPbtj5JAZ
	CmAI8tSBjRD4JLR8IbSPc9IZwYD6Eyt4OEWTRWCmb5sTR8svjm5U/jghDqLEyxNBHWAJ
	WQ41FI58Pu/o+F2qRya2Mnky33Ng9HdLiaxX8J/DghOLmZcrikFKm062AmuoDrtTbeuk
	watA==
X-Gm-Message-State: AN3rC/6GTe0HlSFKohZCL3Hi3QZ9qx5xPDb0hxkQ4Gi7iysYjw/PJedO
	+nrhNrRRlJxEzmHZ
X-Received: by 10.223.136.56 with SMTP id d53mr11893834wrd.160.1492267787947; 
	Sat, 15 Apr 2017 07:49:47 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91387451E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e913:8745:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	v14sm6615281wra.65.2017.04.15.07.49.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Apr 2017 07:49:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Apr 2017 16:49:29 +0200
Message-Id: <20170415144929.24871-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170415144929.24871-1-schnitzeltony@googlemail.com>
References: <20170415144929.24871-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gimp: update 2.8.18 -> 2.8.20
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
X-List-Received-Date: Sat, 15 Apr 2017 14:49:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gimp/{gimp_2.8.18.bb => gimp_2.8.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.18.bb => gimp_2.8.20.bb} (89%)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb
similarity index 89%
rename from meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
rename to meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb
index 070fab8..9588ab0 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb
@@ -32,8 +32,8 @@ SRC_URI = " \
     file://0001-configure-ac-do-not-check-for-freetype-config.patch \
     file://bump_Babl-GEGL_versions.patch \
 "
-SRC_URI[md5sum] = "5adaa11a68bc8a42bb2c778fee4d389c"
-SRC_URI[sha256sum] = "39dd2247c678deaf5cc664397d3c6bd4fb910d3472290fd54b52b441b5815441"
+SRC_URI[md5sum] = "d405640c426b234d6efc36fb4f5bae57"
+SRC_URI[sha256sum] = "939ca1df70be865c672ffd654f4e20f188121d01601c5c90237214101533c805"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.9.3


