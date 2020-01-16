Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id D76137F960
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 07:13:29 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i6so9781138pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 23:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KKSOxfIUn07dEtHQM7D+H09l/+FjByFex8p/aHIvJXI=;
	b=bmEXgBga+C+SSo8mUjWg7MtJUTub2sZKBrp8dheWorsBMDcxYHt6x2Mwr6FltOHFOA
	N0fh+3E8IZ3Z3m85w71Xv4GHre4fVESceWhPofx8eZxgn5EVspiWxxQy7rViNpnkrjbZ
	MnRNvZ5HM0VJvORs+FZBwct86OFxVRRmJ0tToBK3vP5zjD2fhCAKH7SyAMjpx4cm31uO
	8wI2G0UmcPa0GD3ddbZIb8IEA9ar43n96ORuG1YfE9+vaxTSzxZOQX6hmJRd5rFekM6m
	St9zymumfE1FurDQBjwzhMxg9RcXRVsw5tT4OVUimRddhtfiNA/7iMo/hjHcV1wJMK1X
	XQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KKSOxfIUn07dEtHQM7D+H09l/+FjByFex8p/aHIvJXI=;
	b=QSMC3W+dFf79KtyfPs7EpEKuF59UhuHK0Z7evj7FjT/ltSMYmqbbtauODcNuVbsbAn
	D38u11U5zqtGk5xv9B+Kelo13FozCVmXaBxHKiPvjnaUc5e1ODly2+F/L6gGSKC6zZPh
	0cttf5Y2zJCt4w+4hljwC0EpUihN8O8dc/1h2fge3umqpOBql93RU1K1msBc5gZAd72P
	cYXqV/g8cpnar/9TkrMPiE/nRyVsTMMbof57gGyBc+Wd3ymiqMO9c7muLvnBKua/yFEP
	qbTE4O3a9bAE/B6YVpwCVOf2lFIPRrPxGG1WFFGsZG/L3NizIp8nbnJXECt8dM7dNwIP
	M63w==
X-Gm-Message-State: APjAAAWvNJ2QMbJWR25KGwQJxqImZEWpE1Pe//rdKl7c6ojbN54gezGQ
	+uyYxeH/lc9bRyYUA22JjfMlhjR84fk=
X-Google-Smtp-Source: APXvYqzOQ65Q6BjJZ+GuTO+xXS9m7Cz4PHyIFEZkAOjvdtkWvL6dqskbBue+aNYRbAu599YbsLbFKg==
X-Received: by 2002:a63:2a8b:: with SMTP id q133mr36631845pgq.72.1579158810517;
	Wed, 15 Jan 2020 23:13:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	c19sm25609357pfc.144.2020.01.15.23.13.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 23:13:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2020 23:13:28 -0800
Message-Id: <20200116071328.2709785-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] sysprof: Correct systemdunitdir location
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
X-List-Received-Date: Thu, 16 Jan 2020 07:13:30 -0000
Content-Transfer-Encoding: 8bit

package sysprof3.service as well

Fix
ERROR: sysprof-3.34.1-r0 do_package: SYSTEMD_SERVICE_sysprof value sysprof2.service does not exist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
index 920bf10d65..1e530efb17 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -22,12 +22,12 @@ PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
 PACKAGECONFIG[libsysprof] = "-Dlibsysprof=true,-Dlibsysprof=false,polkit"
 
 # Enablig this requries yelp
-EXTRA_OEMESON += "-Dhelp=false -Dsystemdunitdir=${systemd_unitdir}"
+EXTRA_OEMESON += "-Dhelp=false -Dsystemdunitdir=${systemd_unitdir}/system"
 
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
 
-SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service sysprof3.service', '', d)}"
 
 FILES_${PN} += " \
                ${datadir}/dbus-1/system-services \
-- 
2.25.0


