Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F71B7DAFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 09:33:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id o18so1907376wrv.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2019 02:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VVGKpcNe7+NqDJaMWnNamO4on9xv++iBmzPQtWb4sxI=;
	b=Rlq6qU36q19BEdhMaIaZrE4SlrnU6G4MdOyCtdi9rEOANqSZToav6B7OcVKiNPxAhY
	UBVjyapHEt+07xoyYbedDCD1JBSnh1WzicXnHnWIPxsSVg+9c/ZlzFIfXsCHOs1TZ/yD
	2+1Fi1I5/mRhuA6R1hVUXBIEht4OB70J7QC9yKZovCnwo8ZH6bQt13KltW7gW7xtzbdd
	3gx/oCPvtEG3Q5SQBlgAywadzaZHFnBNsiEvJW/016bhxOP+gf7HRQya+Yz04lMIjlS4
	1HCEcIOiYy/KGUFIo1Ahan8VVkatcm/pTMsom54kqwpT3TN+P/rucvYMM0PFwJG+hMVK
	AHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VVGKpcNe7+NqDJaMWnNamO4on9xv++iBmzPQtWb4sxI=;
	b=CHLg40PgRtJEGq7spcTIQzLSKaiugLaz/38SSgE8iLxQN3DnhP39/5OU5KGmoJ/ueq
	oougnml1/Ity9fcGPS/kGkQObkitOcD4jBIL+OF+aKNezlWRgmbVPzSF59W/a66gx8hd
	9rkDv7xKSEm0nXtI8Feeo+BdLaKtWDkjxFooFomC3WiXBVy9FpjmQb5BmmzKMnE7oqaC
	NbUJ4mnZXbu8aBacD+f6r+ygIIrqFksvbjwsQD1tH8iePNgf/pnkGIMTTFW+p5SCzmPp
	Jh3lNVMhGEjlUa72ppSyuRZZik0BzwsKSSJTNvo25XNbUNb7+1yQ92R3DMyo7lY85pqo
	SqpQ==
X-Gm-Message-State: APjAAAU1iWfMHYLUXgV/+5UwOBNU9ZdoiMnOAH1hRfn+hN3qPEClfs01
	3DBbG74jgato3bOE0TXW449LNpDH
X-Google-Smtp-Source: APXvYqySaPUvxwykl6LeoYdCfiMOEMzMz0olqn2U/HfNNq9ZJcUYa+1GIrEy550JzOrH7og/xIjHLA==
X-Received: by 2002:adf:fc0d:: with SMTP id i13mr2003842wrr.354.1570613596644; 
	Wed, 09 Oct 2019 02:33:16 -0700 (PDT)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	y19sm1655053wmi.13.2019.10.09.02.33.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 02:33:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2019 11:29:48 +0200
Message-Id: <20191009092948.11277-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] polkit-group-rules: Fix error in do_rootfs for rpm package-manager
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
X-List-Received-Date: Wed, 09 Oct 2019 09:33:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* An issue in meta-mortsgna was reported. Discussion is found at [1]
* We do similar in meta-gnome's gvfs for same reason [2]
* This is a bugfix which should apply and work for many release-branches

Fixes:
| Error: Transaction check error:
|   file /etc/polkit-1/rules.d conflicts between attempted installs of polkit-group-rule-datetime-1.0-r0.cortexa7t2hf_neon_vfpv4 and polkit-0.115-r0.cortexa7t2hf_neon_vfpv4

[1] https://github.com/schnitzeltony/meta-mortsgna/issues/11
[2] https://github.com/openembedded/meta-openembedded/blob/fd1a0c9210b162ccb147e933984c755d32899efc/meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb#L72

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
index 06ab10642..8ced8abe5 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
@@ -8,6 +8,6 @@ inherit useradd
 
 do_install_prepend() {
     install -m 700 -d ${D}${sysconfdir}/polkit-1/rules.d
-    chown polkitd:polkitd ${D}${sysconfdir}/polkit-1/rules.d
+    chown polkitd:root ${D}/${sysconfdir}/polkit-1/rules.d
 }
 USERADD_PARAM_${PN}_prepend = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;"
-- 
2.21.0


