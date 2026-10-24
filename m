Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3745.1792837516455209732
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 03:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dnBr94uz;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso620570a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837516; x=1793442316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKM3tGeG6SnTwuEb9jf19PKX0e5YX1DonedcBjmc+zM=;
        b=dnBr94uzMX9h7xaGTwqx3RCPc/UJ4nka3VIa+OWC6vAC3gdtqdQtAqVZ5e14GRlbtE
         PrNAWhychlB8KwizbIBs5Fdk9unNnWIXiXil6ultp1E/ypnjfbafZm0cyxd2DZ0ap9i0
         pxu+iw7Tedsof59yaL6VapRr6q/qOcbdDnzA74h+WEB6QY5TFwMorLklLTqDGTLAYAIG
         /5Dg7kO7iiZuG5F0vjUdQ/MmCccnxgdLf42NlRF+Nby+LZtEvfOiAhkOjDSowtxV+tMo
         X5nxwVQODtlmfZ87v7UqOKJAeao/ytw8i/5gizADAAGMdPodlzDIQ7bfPfH+lIYfCW6s
         JLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837516; x=1793442316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKM3tGeG6SnTwuEb9jf19PKX0e5YX1DonedcBjmc+zM=;
        b=tEbiv0O5o/Xah4uvnPfPVjiS9Rk/eMHnuKku1lWefZ65P+0z2oOaF58CJmb3/Y91ZJ
         0OtvmNVBc53cUiyxkWb/zLnDiUfJ3mU9v0cD0ErQycHNj5cY0lbFMEPG2hQQRC0yXSHk
         +/gm2WvfufHC3kDa3eaXcxDkBpQIPF2g6Jvfal08+RgQLLeH0FuSf2uJZsvM1UhkQ7Q+
         jTwcGXuehPeVef+Lekbnj/wynChwZfQgA2hqmeNa/Rk7Rm552Px1BbQScOOMU0qf60C6
         g5nDgASItIOWDCKd9XwmNpyveyi2d0ONBgZKdx6CllWuL8PrdFyG5ZlD7pCCRMrIL/AS
         mRNw==
X-Gm-Message-State: AFq9FYJs667orHQnomrXDiMGP9JawmEFmNLT7AavkIaQitKmQKUIDNk3
	D8Y4IN3dT6Ne6K6SD+oCX9/oWEAC5qeROV75N0maql8LVGsVaVMLlu90OWsO13yH
X-Gm-Gg: AYBFou0cp+XpqSw8HN5GE3/WR0Hhqm54Vqx5qld9XIR0KIQXZg7x9lMFROeVvJahIFK
	JX5w8eSgrBdatlKuGMvp+2qglGUQknKY/0OsHB0yoKqFUq+nfq0oFbnGxoic19tP00bR+pl+Djj
	RrMHv9MRz8nW7RT3yqqZ5zhDxXpd/XULrvkJ1Ze4jw2qO4iI/yTTCDdmQb6IKoLakczGuxR+fKn
	CUs4jSBMzjdTKh4iwXXb8uIhrs1y+FZKBv5K1vnrLrmz0sVpNFPE6GpbAY5K7g+rOLPgUnEXqMC
	1Z5TrCWxmeuwxHgtXGAF3aJsiNL3lSjppci3NNJhY6M90rE0GiwwECq1HZBWMeAThsquaZ4Guxb
	xzRb4ad8Ss+nGTy+C62R4tTNwC4ceWutmra0UCZC5AtMPpK43bolkvOxzg5+9v7wfX4sk7moHOS
	gTR7PPirl+caEc8xDK7/onaTu2mmSIR39bAwyHJwjE6GEPlNkkuD0AvkatPt/HXmvOzoxD+agxo
	oktCjYOpRy8jtIe5SZFKNN+na/phLlHbvd0VztzFGLGTekalbnPs8yBESspTrx1HwKFMaCTIAy+
	I3Nsr1T88+Z4OxufkYNG1kFUA6GdPxg=
X-Received: by 2002:a17:903:4b4c:b0:2e5:f62e:2eaa with SMTP id d9443c01a7336-2ea9c88872fmr12038465ad.43.1792837515668;
        Sat, 24 Oct 2026 03:25:15 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm4293935ad.64.2026.10.24.03.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:25:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/7] ntpsec: upgrade 1.2.5 -> 1.2.6
Date: Sat, 24 Oct 2026 23:25:01 +1300
Message-ID: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 10:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131393
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.com/NTPsec/ntpsec/-/blob/NTPsec_1_2_6/NEWS.adoc?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/ntpsec/{ntpsec_1.2.5.bb => ntpsec_1.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.5.bb => ntpsec_1.2.6.bb} (98%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
similarity index 98%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
index 26348f7c4b..832619edc4 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "6fb191cddaf607e7754b1f6915a1a61dc4018b3e4eef3d2ffacec961c9682949"
+SRC_URI[sha256sum] = "8023beb9a0c86a93f0bf94d43fd388c71a6fa54d80bcbd747d899915191bb592"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
