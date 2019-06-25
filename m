Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 799517DE4B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:56 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id e3so25677161edr.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MALl+egEZmE29ydwTVWqNsaqgNitc1zmQBrvmRE2wEk=;
	b=FEAzgpBi/F/Ol+a/8rxRjzXK8bPou0Wym+UgKv6OHPVyyzpv3+YjDOTp8O1gZ2Jfev
	/agAaA/tXJGRLHuDAJX7zqZr98aIvdKHbsKQfKLFM7LtNMcasaEY0jmqxI78oraqr+zT
	KPXxI57PEZrV7k4EV2ER5bIGBUDYSNmOtpsDItvPa20QeCMqbIjRQyIp6Kjb84+2LgoK
	H8et4V8Mp4REgDpci3Zp0+fmzAccH6Bhv8ukYdLPNUeeIS8kUFdv3i8kUYTOoRWwX5vm
	AJfBsQjC3nZ99Q2pYxQqR6TH66OB6O9f85V1XBO/UaMUC5iMokAf5uzKkanjh214uEry
	1opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=MALl+egEZmE29ydwTVWqNsaqgNitc1zmQBrvmRE2wEk=;
	b=uhA+iUF3/HtlPk8fRP7dk0Te+KxDq6bBcKDcD+2YBJdX/Jyez7d0EOjSOk1d9Yxg9n
	HMbzpDc0hgeujdy4I4fO4jveGfTpTWjbVVmL+Jh8fhn6IABdooUTfpNa8e6RVOGP95Hb
	CSpMwf3EP6UQOsFLNJsC3ukyliPyBCFhrYZsQ3d5mJE5vUN28HG5TNK59zh9QKzag9Q0
	PBjyj4FBQRu58PgIFGXNjnu/Eh3cYMFgga/ZCUHXYNHMSOhbHo26jjUsasodRzQbBdO+
	gvCBh7/fc9WGBpCzslRKZB/6ouYsJifn1V4DOhEb5b469nIAYYPkVMaWyMm7251iJ+zw
	OJHA==
X-Gm-Message-State: APjAAAUDODNTJ39tya3FmZhxnfLu3RandhI0qvhQicB/Wi4EdOfYAbYo
	rgE3/vRQiIYtxbj5qFNsXm2zgjYYaYU=
X-Google-Smtp-Source: APXvYqxyYwa5KaxDBhjVXR16MxGi7Rz1QKmfLeCioOlbIEDZo5Y0je7QDFcUxLEWbAQa37VCxsF5eg==
X-Received: by 2002:a50:87d0:: with SMTP id 16mr116621196edz.133.1561449177017;
	Tue, 25 Jun 2019 00:52:57 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:56 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:22 +0200
Message-Id: <20190625075223.13585-23-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 22/23] jdom: Do not use all as PACKAGE_ARCH
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:57 -0000
Content-Transfer-Encoding: 8bit

It DEPENDS on packages that are not -native.

Fixes:

ERROR: mc:qt5506:jdom-1.1.3-r0 do_package: Package already staged (/workdir/build/tmp/sstate-control/manifest-allarch-jdom.package)?!
ERROR: mc:qt5506:jdom-1.1.3-r0 do_package:
ERROR: mc:qt5506:jdom-1.1.3-r0 do_package: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/temp/log.do_package.5632

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/jdom_1.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/xml-commons/jdom_1.1.3.bb b/recipes-core/xml-commons/jdom_1.1.3.bb
index 8073819..df9125d 100644
--- a/recipes-core/xml-commons/jdom_1.1.3.bb
+++ b/recipes-core/xml-commons/jdom_1.1.3.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://www.jdom.org/dist/source/archive/jdom-${PV}.tar.gz"
 SRC_URI[md5sum] = "dc8391e84cfdb170fcd8279aa370019f"
 SRC_URI[sha256sum] = "d471718c4ac7a1a2f10715b93cb3fcd2ecbab60384b73ad1c089712e47bd8d1f"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit java-library
 
 S = "${WORKDIR}/${PN}"
-- 
2.20.1


