Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD237553F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 12:18:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z16-v6so2097757wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j3/TCEtczT5GffD68J7g0nOCEy8CvCVDLnR0oKAMwxA=;
	b=W4Zy+C7vC/jCUfNH1XrIhnkog2UPYFQ4Fp4cZ4E8MQW20+5Zj4jBfZn3C5jRveLSWl
	Loir1WdykkNLTDX3rPBl7FUwrMiT4HeRv7MbJbFlfX+YUAmQNG067IBNXvpeQbWq/mQJ
	2ehnRuiE2ZMh5WMkSIDPImtrRjsHPP6R4acp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j3/TCEtczT5GffD68J7g0nOCEy8CvCVDLnR0oKAMwxA=;
	b=eeEXRNRsPPloX+I+uyHwjSP3OfOSEU1dDcPyJM8aXv3aYR95+xlbS//NvQPkOKuUCM
	SLx79vBe3UimgIa8JvtmT/1v8tqJ0Zlwj4aEFXMEUEZdXQMac83N+JWzsWORBNQd3khy
	niL52iXUjahLre2BMZa68WFy4uyNclpfSLt/MfAb8wDJrL9gB/W8Bx1wppubgQYvtgRt
	q0dQjtpv4O2R9Wo72oI7L1Sn+bRYkuohNmKOFRxEx0VZ1mC+Sb22F/Vy7IVJXpk+Y+wJ
	41vkYhgiNs2LdG14siD6mv4TAzA4lBpJUczBT/Fyp27VVnzh18cpNAsfeQ+214zxW2E1
	V1iA==
X-Gm-Message-State: ABuFfoh3XdzFavFG94b+za3K6/vQQ1PkLOIiqTO6RRhNgWP6xNGkS4/7
	UtJZHJGmizeghnNCmrEAREoJZg==
X-Google-Smtp-Source: ACcGV63ADUJmEw2EqpTn8wa9O4ProbcNmqXC+GgYS6evIjP1As/pGwy2RBoQa62UG4NVTxzyM7lFSQ==
X-Received: by 2002:a1c:1c13:: with SMTP id
	c19-v6mr2297397wmc.85.1537964297632; 
	Wed, 26 Sep 2018 05:18:17 -0700 (PDT)
Received: from localhost.localdomain ([92.154.90.120])
	by smtp.gmail.com with ESMTPSA id
	z12-v6sm4247960wmf.23.2018.09.26.05.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 05:18:16 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 14:18:03 +0200
Message-Id: <20180926121806.30667-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][sumo][PATCH 0/2] Fixed required for Yocto 2.0 compliance check
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
X-List-Received-Date: Wed, 26 Sep 2018 12:18:17 -0000
Content-Transfer-Encoding: 8bit

These changes are needed in order to pass the YP 2.0 compliance check script (yocto-check-layer). One change is a backport from master, the other one is fixed in master in a different way, and the backport looks inappropriate for a stable branch.

Armin Kuster (1):
  grpc: move it from oe to networking layer

Nicolas Dechesne (1):
  meta-multimedia: fixup LAYERDEPENDS

 meta-multimedia/conf/layer.conf                                 | 2 +-
 ...1-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch | 0
 ...01-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch | 0
 ...004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch | 0
 .../recipes-devtools/grpc/grpc_1.8.5.bb                         | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch (100%)
 rename {meta-oe => meta-networking}/recipes-devtools/grpc/grpc_1.8.5.bb (100%)

-- 
2.18.0


