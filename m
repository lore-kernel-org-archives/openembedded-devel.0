Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id DADE97934A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 23:04:52 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id z25-v6so1150315pgu.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 16:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=csRVd28eWLvZ3Jvr3WMNf40WMVfeZXT0xmaBDsp0GPs=;
	b=N2d1CLyAxIEF7A/bAvipGTJebWGm2HZUvzuz+LnqtUl0IURjep48K7cgwrRskBrpDn
	cImfQ9JB84nYTqPFmRvU20DlPCk919+6pYpg47ddUEmAd8T4cpHS3fTRpUk+b9kki8rp
	bqqC0foUmlZA6LrCnkIcB+I4Q0Uv9SsiaQCxY3beVHP/PftIUzcMI99GX7M0RmzYSKYF
	yoflTCsxzV+DWNhM2sqrRKcx+7+cJkRf3lRcWFwzck/9g469r/UCuK/lpo1iRf6Q11Ag
	3oG5THT8duCFKX+nEP9hhp5JShi0XnxO0S/P12R13svSIKW13zqzWGSqbISDbNTiIHs2
	KMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=csRVd28eWLvZ3Jvr3WMNf40WMVfeZXT0xmaBDsp0GPs=;
	b=mrYwPmo0GodX4mB9nG9JPAZQ7hKySLqrbopLT5qa0gvmciPAikxUufJvaEKgIZGKhI
	LpM5WFvX/AgOf1EqDHcVfsiKqUEDWXQvKzwZUI88RFVS2JwksT+PqwUq0mYgE3VYaxLE
	ocB8GLmYvZFAVJ/h7wr/kzNidAfZZnHYZabIRtDsR5a65UVHlsJQxi3Ff4yrAeL3Z0PV
	p41koezymdgXwy/Tu+51Yt0tX6+u3MpV6GSpDifX2TPa5s3BMb9ssCq1V/9LKgUAiYKM
	4Izg0RS/4Dhkkog2WeObh0VCvCj4WO3d/sT4j0pYTtHcJIZalG1XI4CDkefJziukCnPS
	EZ0A==
X-Gm-Message-State: AOUpUlF03YWkHJGF2bKu7ojBsOFkwhnhhsKioMImuU0n6i0PxjgZ2xF2
	IFiVT5eXeY5c52jZO0XVaWyEmrz6
X-Google-Smtp-Source: AA+uWPx1KhbNSA8rlGhCLwG1tbaeEk5iO8EkYxoWkg2q+TX2VUxQnNIL5Vkl7vCGFNRhjxTEZCuwoQ==
X-Received: by 2002:a62:d74f:: with SMTP id
	v15-v6mr14123873pfl.257.1534719893415; 
	Sun, 19 Aug 2018 16:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	m15-v6sm14241217pfk.149.2018.08.19.16.04.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 16:04:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2018 16:04:43 -0700
Message-Id: <20180819230444.42440-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-networking][PATCH 1/2] dlm: Build fence only when pacemaker recipe is available
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
X-List-Received-Date: Sun, 19 Aug 2018 23:04:53 -0000

pacemaker is not in meta-networking, and therefore dlm fails
to build when meta-cgl is not included, this changeset makes
the pacemaker dependency to be optional, and disabled by default
so users who have pacemaker in the bbfiles should enable pacemaker
support via a bbappend or setting it in config metadata

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-extended/dlm/dlm_4.0.7.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
index f7f7e188c5..18843a61f8 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.0.7.bb
@@ -20,17 +20,24 @@ UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
 LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
 
-DEPENDS = "corosync systemd pacemaker"
+DEPENDS = "corosync systemd"
 
 inherit pkgconfig systemd distro_features_check
 
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[pacemaker] = ",,pacemaker"
+
 SYSTEMD_SERVICE_${PN} = "dlm.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
 export EXTRA_OEMAKE = ""
 
+DONTBUILD = "${@bb.utils.contains('PACKAGECONFIG', 'pacemaker', '', 'fence', d)}"
+
 do_compile_prepend() {
     sed -i "s/libsystemd-daemon/libsystemd/g" ${S}/dlm_controld/Makefile
+    sed -i -e "s/ ${DONTBUILD}//g" ${S}/Makefile
 }
 
 do_compile () {
-- 
2.18.0


