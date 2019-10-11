Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 806B67E3BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 08:06:38 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j18so10757268wrq.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=787Au2PP4H79QtksDr8H1bF8UTAT6wGk9Xu5VY44B4Y=;
	b=B1ZKwanHzmQqV31nDssben6x/eP/EsVviZ9fiY4escP9ZSrsarEJYNcKJEYkhiJWpo
	aAJQ2RscVpVeJHuMFuUbgxlAgc9PJ7TXsCiVEL9ijihpn3ZREVjXihk3vXGwyuukLDew
	78JnLm+BOqz61adavAdhh+JbaKvdX2Xrplstl7Coal0fpO2lYVgXq7iOXE1n3nkbQixs
	iXCJwowdQ2r54CQnw8e/+sS7MKyvgRC87ArSOR3p0VAX4e4OzkTzfw/aplHRsPBWUncI
	o3XNhT42D5B8drFzlrBEidpR1ePBaZFw4+oo4xUJRnRBjUJCxu19LAETIFn24j5n5Iyy
	gRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=787Au2PP4H79QtksDr8H1bF8UTAT6wGk9Xu5VY44B4Y=;
	b=OE+Lhvp0jQQzwncCyKWqepCcR3wzCoH5diDifgxPv5d3ATTI7wonMhMzGz1Dtgi/gn
	kvCO4jUeXNc+a+FLulqu4CWN8Z3M1KXTiyPiO3hfC4wuF8WagCzcueCofGiNZknRjM1r
	PpgQel5Pe9KSY7WOO88AjkH8giXVwwhyinsVoHN/6i5JRjhhlaI7CEL/WUB5TIXsnYDK
	TMqSMbKwejXFw/Wm83tauI6JPtj9E5jN5WvptWc6C6Q+yCtG3rsoNAI/ghG8bISwRzXh
	8hQgsnYvFA4Qnn0hV2bQ4IOMaZPU6nIJAk3HABLZOsogbHQ8yswSxwlyb/833AChxfn5
	APJA==
X-Gm-Message-State: APjAAAXq9c2vhwZMBUXWQF6h9QLDsGphgj7BF0xRxLRKrIwL4jjfIOJo
	baiqMXcPT26HK1IqhueAqZDRRoLe
X-Google-Smtp-Source: APXvYqzGYzyInuVUgmVUBJ5E8NXEfSrD0iJ59JnsHwZhOJtgZZ/7X1Net1vAYBN7Xg293hTE5dZn0w==
X-Received: by 2002:a5d:6949:: with SMTP id r9mr8878509wrw.106.1570781199096; 
	Fri, 11 Oct 2019 01:06:39 -0700 (PDT)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	y186sm15431226wmb.41.2019.10.11.01.06.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 01:06:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 10:06:28 +0200
Message-Id: <20191011080629.3136-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011080629.3136-1-schnitzeltony@gmail.com>
References: <20191011080629.3136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [warrior][PATCH 2/3] polkit-group-rules: Fix error in do_rootfs for rpm package-manager
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
X-List-Received-Date: Fri, 11 Oct 2019 08:06:38 -0000
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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a47d38561249411449cc62ba878eb7c36916fe55)
---
Additional hints ontop of original commit message:
* vlc does not support qt4 any more
* without qt backend vlc is not exactly usable

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


