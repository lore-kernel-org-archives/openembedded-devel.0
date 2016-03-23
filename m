Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 15DF16FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:03:52 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id 14so2098660qgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MhJ1K/+VMbm1MmINcxknrOP/chMwFkluFdVRSUw/skQ=;
	b=FrZY2Gpq3wjWdlsUDhFLJs0GkmAKMCN2AY/8G714Pm09XzQx5pkL3O+doSNtvxtseT
	J6jC6EZ5MAqAbRs4ZyALWbJLfu625R65f14LKDMEq44pm4CONbqbaTEisK3EdgtDsnhD
	fOzxXtQ9iWYosEbJr6bwkCfBqzqx3TS4sIXKzn9qP8uCKZLl30ADE8/9CMBZAM+hupKu
	FddMpg8yrRQSPH1qOCFZfl82iQblq3IIs18vnyDRcWPUDfJlOyl6Yo28DK5eV1Vkx4jn
	J2DdNDQCLctZAlmha4tp2K/E8SR7BhVRx255co7jgfYlKT3LQ7+LgomehKki9HN43gT7
	VhAQ==
X-Gm-Message-State: AD7BkJIJBpSpDVm4+trg8f39WEpFRNOR5BnwlaVY2D9F2Yl/pT/lC03LhbOyNqH99K0pJQ==
X-Received: by 10.140.96.22 with SMTP id j22mr6045756qge.92.1458763433758;
	Wed, 23 Mar 2016 13:03:53 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	b103sm1771859qge.2.2016.03.23.13.03.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:03:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:03:41 -0400
Message-Id: <1458763422-30827-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763422-30827-1-git-send-email-derek@asterius.io>
References: <1458763422-30827-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 4/5] python-behave: add initial recipe for version 1.2.5
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
X-List-Received-Date: Wed, 23 Mar 2016 20:03:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-behave_1.2.5.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-behave_1.2.5.bb

diff --git a/meta-python/recipes-devtools/python/python-behave_1.2.5.bb b/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
new file mode 100644
index 0000000..541a79d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-behave_1.2.5.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A behavior-driven development framework, Python style"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
+
+SRC_URI[md5sum] = "3af4bc2886d2be982e41bfaba61da3bc"
+SRC_URI[sha256sum] = "81b731ac5187e31e4aad2594944fa914943683a9818320846d037c5ebd6d5d0b"
+
+RDEPENDS_${PN} += "python-difflib python-setuptools python-pkgutil python-misc python-argparse python-xml python-importlib python-enum34 python-parse python-parse-type python-six"
+
+inherit pypi setuptools
-- 
1.9.1


