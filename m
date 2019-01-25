Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0317C393
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 14:29:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p4so10514608wrt.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 06:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uIcZO43boTv3jDuE9yFC3Er0Mm2VKeLPIdREYyEEWv4=;
	b=y4MLF6sqzsPsAPcoO6lj07ySwCjpUOcH3CaARQPuBsyszh8VsCm1R0nKYelsSlv4W5
	bd7A9YX3DL5Eim/qSLNyImLhqWAjThXN1PJA7bIDxfQcfVo31hKeoKwOuAxBwrZRZwE4
	mzMXrIx+VbbDS4isb3+g4nBDC7HFJsBor8Za5m1aR8vxJkjGbqpTFnnDrbaJq927q7JS
	Ys4L9I+PbN7Sj0aDTVTnk/Q07jSXotQDGqHDtw6LG7XvVTEAndSIIVf+R5np48eB47dM
	cSgLZCjAO8sIZxhhEPSVhVvdbaLa4MFHHrZZ2nFwQ6ymtsDg2NB0lwKQxGK3sbi1fs+E
	A+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uIcZO43boTv3jDuE9yFC3Er0Mm2VKeLPIdREYyEEWv4=;
	b=hZlgBuD6UEd2MganpBWkliXPS44XpX8udh+wD1atNR7UDw/8cT3vsVtdnXhlwllFRY
	5Z5sb7CLhsdcAWPzmU3biK+JptyVWu0u8tPgFVHVpBN7cyYac+b6gDoW7xL/OuVPWFW+
	ciztdCGE8dnqo1SJ/XdjgI5M8BVnYsuIZRtn2Xnamc7ipPwppFZMa2btXL3OJ7IZejnn
	58C6ScA4TXZ3ROxviPeSPWAJHNxLp6hD/dUEnv/R+pdSsQVCD6AY2tduhm0AmfvMEVQd
	V32FNL7UCZHtuwBwlvKQG4LUVXgUgJIwzFPocoFiRPggOYrjIM341+6nu46ALrNYApo9
	9QpQ==
X-Gm-Message-State: AJcUukeB68KEQvDYYt22T0aXvAMK4ntSFH+gbW1OiL3NJobThzIg57zS
	Utc10SIuCPIyixvR6hfEZ2poxYtUhBs=
X-Google-Smtp-Source: ALg8bN7O0+qszLFRiumn6ZTdny8dgdtghxKC5PaLeL6Ff+Lf9ZIwYv0jLdqKRPqVKeJYpRmZsAiB0A==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr12030507wru.45.1548426588634; 
	Fri, 25 Jan 2019 06:29:48 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k7sm91490354wrl.51.2019.01.25.06.29.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 06:29:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2019 14:29:44 +0000
Message-Id: <20190125142944.23200-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] efivar: recommend required kernel module
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
X-List-Received-Date: Fri, 25 Jan 2019 14:29:48 -0000

The library to modify EFI variables is useless without access to efivarfs, so
recommend the kernel package that has contains this module.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-bsp/efivar/efivar_37.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/efivar/efivar_37.bb b/meta-oe/recipes-bsp/efivar/efivar_37.bb
index a0387164d0..8a56e7adcc 100644
--- a/meta-oe/recipes-bsp/efivar/efivar_37.bb
+++ b/meta-oe/recipes-bsp/efivar/efivar_37.bb
@@ -41,3 +41,5 @@ do_install_class-native() {
 }
 
 BBCLASSEXTEND = "native"
+
+RRECOMMENDS_${PN} = "kernel-module-efivarfs"
-- 
2.11.0


