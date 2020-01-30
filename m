Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 89A2D60266
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:58:08 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id p8so2923342iln.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YHueINraLROCxuUQIQXdhmkiNbdR9CnOHzy0moW3Qp0=;
	b=qVr98CY10oeMPQ2o/2Dh/5MgGaT+t4UKhVqatnDy35OQ+he3+E+ssPlTQedIdjVbwm
	gb8up5EOhbyCkxtmcITfFIdNW52yvZr/RtOeQAV441txhFaChLMlXIQtqiSkCmJm7uh/
	3Z2znXFMVlVpqI1fcw7qmC9svcI0bpSYZiL+Aom5je4WS4gmsIU+XVrV7gk3o/Y0km1l
	Zyag8vL4Oq4AqTS71v0h52r156rAaP0iuDrJhK3zViBd9vK0scQT6Umpuxj9F+yS3EkX
	5mP0h/bkqt2M2TP3yAej2kKNAqV0ZvYL7zSQQN8x4S7UsxAXKeDreFe4nVxcnDyM3sQA
	CPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YHueINraLROCxuUQIQXdhmkiNbdR9CnOHzy0moW3Qp0=;
	b=tJGeN9qTH9zYXAmYkLW5aTQhum136SVZBHZr3vHQE5uojuQN//rqXdxubkoQ6NSrbq
	e0J7Amk3BWVdq8+Jg8jKBnphVOsU7dJFeKnnDeMAHCr/bezBEBmAhiEn49NuWPoyIsAg
	byXV340O9TjAh63j4GpFjvkWotyx3XmtEAIQIlonTo7gQ7WPbGOyFj5vxR8CiDt2Szfi
	HimL+1o0ZSwjLKo/633/MMSGWis9tjktyXDr4rslDKKex9j5M8jlBsrz9c0l0lFEkIou
	6kct90gFbOeZfj0Vz0UJww7dxncMjhRfj5uQsitW/Fyiesii9m/YhvbiXwunhr49ZrnM
	gKZA==
X-Gm-Message-State: APjAAAVn2+ZP5LcHhpbr85Cei/6gxUEPTrV9TcrYBPxQJDDTN/G6Tn2R
	+04cEJsD7IqiKedsY6WI55bSHRNxa9gTrg==
X-Google-Smtp-Source: APXvYqz1HN20/9KNingBho5EpkJOaMQDjGheMV0+ey7I1JXwxRVJzt/HYzCG9tcZjJbHupcjpSZD0w==
X-Received: by 2002:a65:4381:: with SMTP id m1mr3124977pgp.68.1580364370000;
	Wed, 29 Jan 2020 22:06:10 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:7c00:5907:d290:cfc0])
	by smtp.gmail.com with ESMTPSA id
	t63sm4829667pfb.70.2020.01.29.22.06.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 22:06:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jan 2020 22:05:34 -0800
Message-Id: <20200130060534.5679-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130060534.5679-1-ticotimo@gmail.com>
References: <20200130060534.5679-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][zeus][PATCH 2/2] kas-meta-python2-ptest-image: add python2 test
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:12 -0000
Content-Transfer-Encoding: 8bit

In addition to ping, ssh and ptest, run python2 test(s).

Run python2 before ptest (fail early).

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 kas-meta-python2-ptest-image.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas-meta-python2-ptest-image.yml b/kas-meta-python2-ptest-image.yml
index 3a15add5..1dc0f4b8 100644
--- a/kas-meta-python2-ptest-image.yml
+++ b/kas-meta-python2-ptest-image.yml
@@ -14,7 +14,7 @@ local_conf_header:
     DISTRO_FEAURES_append = " ptest"
     EXTRA_IMAGE_FEATURES = "debug-tweaks"
     TESTIMAGE_AUTO = "1"
-    TEST_SUITES = " ping ssh ptest"
+    TEST_SUITES = " ping ssh python2 ptest"
     TEST_QEMUPARAMS += "-smp 4 -m 8192"
     TEST_RUNQEMUPARAMS += "kvm gl"
     IMAGE_ROOTFS_SIZE ?= "8192"
-- 
2.25.0


