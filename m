Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id A7BA5600E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 06:07:35 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id j5so1398847pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 22:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aeHxq1eeEVyxgoZAGQWT0+VmXOZRM436SqqELpuB4Cg=;
	b=pAelX6MfvcLMkAZYVx3JCKrgYvNfA+VnCv+hH2I7TKyjOTsdNv+7Nz8hn7LfHmPjqj
	Oa5A+NFGa+vK3E0AWNF6Gi7cqe4b+EBE0UwQncDjy0vajAjejaL4+rP9AcrMQLojJZ/S
	g+c4YnZqWyDHWGQoHnpXnoN2O6ljfQ8/gePeBH/Tok3K3y2ptv0iSjM5KAITyuK103Sw
	BoFePxxnaSc/9//EJtgvvZ5iC2dFD01FNmg9mag97TuqsTD0so0DPtYzdynt0UsL5Ff7
	neerRBe1gvObEuVg07ueoxo55QQg5yhJXsFlpUvkGjQV5QsvtJ4LJ2VoSjt4I3CBc2cS
	RObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aeHxq1eeEVyxgoZAGQWT0+VmXOZRM436SqqELpuB4Cg=;
	b=sJz+if6YqEOPc5WExhn/CeRcVaIzJsmszyaJgavTf85tus9xGdnLcg5TT48t5bSLvz
	4qxCVFslAURk0TNGcBcooFZh9xjMRcmm9Xn1s1QVqTWkBi47T1Ls9mUQkXB92vURcRVL
	DAr2v5FBtFAsDcZyESBYGsx4frRlWU31M5NsbzIPLlgsaiLd1jfAbhKP932/e3dlTJ5d
	qwDC0NUd8NRTOYq0XcWzIwVBGZ7PkAG/g9bGmv1kHjCsDbBmyTQ5rCb/R8fVqG0RWIye
	x7PRx4xuEiVZybK5RMKNseV4EmTjMs9P2yTS6LK1il19HqhhNR7Xt9MKMPdRbjC7E/eP
	ldMw==
X-Gm-Message-State: AHQUAuY4fiJriFssyM7G3XyJwHB3aHYTGmO3NhfOVuH0m73eD1cqI66J
	5DA7sYOFNmLrEgK2REZmlpkn2HNt
X-Google-Smtp-Source: AHgI3Ia1g87A31fnOisNOOteGixZNAWiw2gtp6q+1GZ8RhTLaSO4kuHFD7L2HkVij3BnxlPz07C0QA==
X-Received: by 2002:a63:1e12:: with SMTP id e18mr8842549pge.76.1550297256259; 
	Fri, 15 Feb 2019 22:07:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	c4sm18192039pfm.151.2019.02.15.22.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 22:07:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2019 22:07:28 -0800
Message-Id: <20190216060728.13170-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] snort: Strip out DEBUG_PREFIX_MAP options and --sysroot
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
X-List-Received-Date: Sat, 16 Feb 2019 06:07:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
index a99138d3d4..29581afe1b 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.11.1.bb
@@ -72,7 +72,7 @@ do_install_append() {
     mkdir -p ${D}${localstatedir}/log/snort
     install -d ${D}/var/log/snort
 
-    sed -i 's/-fdebug-prefix-map[^ ]*//g; s#${STAGING_DIR_TARGET}##g' ${D}${libdir}/pkgconfig/*.pc
+    sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
 }
 
 FILES_${PN} += " \
-- 
2.20.1


