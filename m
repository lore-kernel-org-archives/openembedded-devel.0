Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 27EC17E447
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 20:17:20 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id s11so7291441pfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DlFIrOuwDH7I5D7BHCWcDMTLdmQF97NLYdZb/lu4iPg=;
	b=VvIQU6FmGHg2ibR3NaREYSoSXzTFtxvPzyd2qYWoMM6CvmTkUHiD9fi+ryhM04JnTN
	W/fHn20iouFUgoXB5BJbXd11DKl9IbDxKNX+Jn5Nl7iApbSl0h5YRRjCiO/B0m4XC4rf
	z4CPwqsFNhuklia9wkrmoJmfE4BBR16x1f4e0R72Xk1UjwRkQo/guAYfltYXQpeLMt0G
	bh04MntkJOejbFOa9sgjD5hc0/ySF/Vd5w6aTrBIFuaWqBuSFy+JQ0aVDFIv1KdcPUdf
	8aGCPvD1jmfCWnFB5bO+WwnapTXNbxuPXWEF5oVtAzSP5fnI3fqbam9ARP6nLTgu3Fq3
	Wggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DlFIrOuwDH7I5D7BHCWcDMTLdmQF97NLYdZb/lu4iPg=;
	b=Boqr+J9l0PH0Xo6zco8eK5nLpKYaZWbpS/9qzVtbfRnBsD5C+Ndlgd94M33T85dp7T
	SHUyPfxqesaNr+q8ROAH8GXSmKVs/lggwAUD0wJ1rXTSHg0riUAXSvsU37YwnNYCDe3X
	AMA/ugXf2vK/WCu7npXG83wMHqHgivfJTM4V5sv2Bo6UkgVGIZfwS/sQmFVdLHpSnxAH
	PMX1qVU9063PFcR97Su0ecpfRwippU0bh2Lq2Qr4AXECKFvSkxPxdzKGJSKNgeFJpGwb
	QzbUCDFysPG39gyahGXSv1W/R6j56JG/YaV/206NbHN9294Ot8Uclz/j0Afrfrq9EZGZ
	iBuQ==
X-Gm-Message-State: APjAAAXiAKSXAikj267etR7Nz8/6UeOy9Dz6FaBNcryyG0YFndw0aU/r
	VINJU52VH9RUB1zjfpLenQY3TQQP
X-Google-Smtp-Source: APXvYqzde1NXbxCAnKf4wdld2/RhFbpX7fVttRWym/yvs2xqjhndUA+Cm1ygsM2sS3A+adW9FCm2dQ==
X-Received: by 2002:aa7:90ce:: with SMTP id k14mr40222356pfk.239.1558815442116;
	Sat, 25 May 2019 13:17:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8c20:a770:5243:e558])
	by smtp.gmail.com with ESMTPSA id
	i27sm10832553pfk.162.2019.05.25.13.17.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 May 2019 13:17:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 May 2019 13:17:19 -0700
Message-Id: <1558815440-18048-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 1/2] ntp: upgrade 4.2.8p12 -> 4.2.8p13
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
X-List-Received-Date: Sat, 25 May 2019 20:17:21 -0000

From: Andrej Valek <andrej.valek@siemens.com>

License has been changed due to reformatting, no new stuff added.

Bug fix only update include security fixes:
CVE-2019-8936

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p12.bb => ntp_4.2.8p13.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p12.bb => ntp_4.2.8p13.bb} (96%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
similarity index 96%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
index 289d264..dc18a60 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
@@ -6,7 +6,7 @@ or satellite receiver or modem."
 HOMEPAGE = "http://support.ntp.org"
 SECTION = "net"
 LICENSE = "NTP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=e877a1d567a6a58996d2b66e3e387003"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4cee33257467509e498f4cd9a6a4bd53"
 
 DEPENDS = "libevent"
 
@@ -25,8 +25,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "1522d66574bae14abb2622746dad2bdc"
-SRC_URI[sha256sum] = "709b222b5013d77d26bfff532b5ea470a8039497ef29d09363931c036cb30454"
+SRC_URI[md5sum] = "ea040ab9b4ca656b5229b89d6b822f13"
+SRC_URI[sha256sum] = "288772cecfcd9a53694ffab108d1825a31ba77f3a8466b0401baeca3bc232a38"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.7.4


