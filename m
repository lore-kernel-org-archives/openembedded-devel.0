Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 582CD60291
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:07:01 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q8so6083366pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IyP5Hhjn6LyJG9NFISBzothxtsS65YQPtJVXBt9aJaI=;
	b=G+2bLafa9Y6RVcE4DsrS6Ro20PueAiIvnchM58UjgaAhM5rbTdLKecFZsGxjhuOPCW
	sE7EI4NcpeRzo/8Hjxxi5EhG0Uz5ubOUqavZJ06j9TiEGF+fjfNwtf5SHnXqWWH/ukS+
	ThKhpR0bHM8rnsRfugSVmly6UFOoXu5hgGh73HxVYtTucwUnhmeIuawS7hjuSrU2ELMj
	nzQ0zX/b1UI/J8SYnmvaQ9j5KIizhwhYznouRymT9fvSkLM3+4IfmUyqdgzmMOJGsPHy
	LJkbjLy/SNU43gDmZ6Knbr4Cez2E95OEx5oz/T83lMDvGLwmwzpK+SwrWdfdrJKOdLdw
	Ol1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IyP5Hhjn6LyJG9NFISBzothxtsS65YQPtJVXBt9aJaI=;
	b=FIhymBmu17mJO6ldBJHKyt98Rk1byWScnyijylWSM242FB0sdUj2spqEWu7Ft4MarZ
	wrVC8dJSoFlqvGhwXThFoPe/eLgT/MrTeLKkhknWDA2GGvrP3Rd6koVkxkyVfGEy9qjQ
	FlmzzLS8TjZVa+Oe0zt/gUSbktW/tk7dzXlljJNVmS8euKjrk6FxkrOdQhpxNSREQ8zV
	JUAPSAq5xTVbPuf99UvgvnOPIuSGRyElSlEJ9xGgiBzn4HRxVoX/FzmylD6iHv20wN50
	2jBOrJi8yqhMQMQPqzmcGAF3kLLBWrvkcQrQ+TOs8M5Xt5KpyCte3wN7P8CYm2jmeB3w
	R63w==
X-Gm-Message-State: APjAAAXkKgic3hvGqpFvTwfuR+ldHkIAxx4UGYPqX3JDLr1O1YiQRmgL
	pjkjt3hmlhe5uz17lF4zIHtF+GehV8E=
X-Google-Smtp-Source: APXvYqzPNTUbmh5NF9UsLOlV+CA2Oi7e+G2KiK+iPcl5qW75rxTjcfSH9yBrWGV//7WIVu9HfVos6w==
X-Received: by 2002:a63:f551:: with SMTP id e17mr17497145pgk.162.1576886821929;
	Fri, 20 Dec 2019 16:07:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.07.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:07:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:31 -0800
Message-Id: <20191221000635.1573390-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 19/23] ruli: Define OOP_LIB_DIR and INSTALL_LIB_DIR
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
X-List-Received-Date: Sat, 21 Dec 2019 00:07:01 -0000
Content-Transfer-Encoding: 8bit

This helps in taking care of multilib install dir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ruli/ruli_0.36.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
index b82a3d08e8..8548f9a353 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -19,7 +19,10 @@ SRC_URI[sha256sum] = "11d32def5b514748fbd9ea8c88049ae99e1bb358efc74eb91a4d268a39
 
 B = "${S}"
 
-EXTRA_OEMAKE = 'CC="${CC}" OOP_BASE_DIR="${STAGING_EXECPREFIXDIR}" INSTALL_BASE_DIR="${D}${exec_prefix}"'
+EXTRA_OEMAKE = 'CC="${CC}" OOP_BASE_DIR="${STAGING_EXECPREFIXDIR}" \
+                INSTALL_BASE_DIR="${D}${exec_prefix}" \
+                OOP_LIB_DIR=${STAGING_EXECPREFIXDIR}/${baselib} \
+                INSTALL_LIB_DIR=${D}${libdir}'
 
 do_configure() {
     touch configure-stamp
-- 
2.24.1


