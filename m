Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id EA2ED7F8A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:13:59 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r1so12411214pgj.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JWxDx4dHkv0ydlFoal1PVy9WD+grD0ntlqwloc7mrm4=;
	b=dGebc+eiB16/flltMyCP/WiPMUw6RoASgPb312+zoV0hjNTqX+NiMMzpL9xGlpAB3X
	ZzKknzWjEk0lzJswNpapLAut3BnKRs2sLmADqdx2dKgxgkEW3HDNapgYGVl+idXzmSv/
	VmoVWicS8SfcqW+ag12j7ADHs6Chm9g0TMviz/rUaBKJMrbTXSgrltw4hfV/EBqyJ25p
	Inq9ZSv/DhsD64dE7lPxOOrjXzqNpqZUsNhL9MjKEnBTL0fNgoxOlWpaXq7D2KaHXGeA
	gXM4ErQNoHP7hdNlM7k3yh9pLNn286cSNUJ2LJ6IWPKkN0h4HktjRWT+1d+0gStoXVdO
	YOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JWxDx4dHkv0ydlFoal1PVy9WD+grD0ntlqwloc7mrm4=;
	b=HACCWk6FL9W2LwQBfYjHieBv69HVPHdCGTA7MIduN0mCgB7OZw8tA4L5A8EO87BZX0
	mDPKUsC3P8YkPOXXuH937x4V/YPODPZGiS/IYcN++2VodcfOKe4m7poNrbyMKYyv1pFL
	d1ENB2YA4DMJl2aoyQQjzNp0CbwAqqZY49GYGdik0yeBQWbzC+aQQ3Ap7Iq9PW5lY+Ft
	AS2vNH/fu2lPSY7qyWMYN0csnhctFZ0ykoXgeEOkd+azqwSXOdOqkYijou7UJ+KM0bPf
	wpgnpK1egoFApSne/Pa29ZuqCYS6DWpt9MU4YXPbwcSTQiSrxDD6ikcDGQnBxN85uf4+
	aO3g==
X-Gm-Message-State: APjAAAXskdQNoaIBf5ER7Q5gde5GKxfT+4E3R7N7/fF/g0ILsNu68BD/
	8QD3QOCDvDTNv4cqclU1jkzzBNjD
X-Google-Smtp-Source: APXvYqxSTyV/0iS2Nqd8ST1XmKqTATVr6O8O5QbVaYZDfhd4DJ8yeRqSazsiGzVIil41C9ObL0FCTw==
X-Received: by 2002:a63:5406:: with SMTP id i6mr3734102pgb.1.1571847240751;
	Wed, 23 Oct 2019 09:14:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.14.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:14:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:47 -0700
Message-Id: <626364981cd1ee5facf600b4b5bb9d083971e151.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571847041.git.akuster808@gmail.com>
References: <cover.1571847041.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior 02/10] polkit-group-rules: Fix error in do_rootfs for rpm package-manager
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
X-List-Received-Date: Wed, 23 Oct 2019 16:14:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
index 06ab106..8ced8ab 100644
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
2.7.4


