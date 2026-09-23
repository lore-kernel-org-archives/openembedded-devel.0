Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1069DC9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:18 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4184.1790160134074231087
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZqkbuRjL;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc74520b20bso248530a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160133; x=1790764933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPXG1iL1QSayKU3dSCpJ53msntwPv1/Iqr8mVa076AA=;
        b=ZqkbuRjL7x7AK1xwQRnCJAkujk3vnywNuZStEH7/fjwt8prwPWt4E/Ydopp3xn2IUn
         nqZE1pp2whI6LF3gWh+1/0WcHc7gSjnqm+Y+RGWVwAWxgGJVruRy1FSdD8io5D73a4/y
         8jetPP+vUXtNe6Kb4rvttkLz2HIY4Jy6S9Ov9yE57QdRG3dh3EGdZQvufPzBQbHGfdmG
         /QR+0KEbFyLPPqn8Q1BY/huI9qQ0X/gP2DQExaI2CaPd4pBrS2tnmKgedTj6gaRSRMQO
         l0yD9QzS6CUDk+ow1YFGfDCQJ+EBNxYVb4KE45HM20tKNhvnaWIvQ83yf1KJeU32Sp18
         uvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160133; x=1790764933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WPXG1iL1QSayKU3dSCpJ53msntwPv1/Iqr8mVa076AA=;
        b=rKakV/BqlxpKq12vu/UyzCcNlpPWbFvrgt/FXB+3QU1fP+X0P1xb2pXQXB+gulv4e3
         XfvzVUqpKaalpxiNuBUd3px2tof5t9yIcC+KVt14Yb/Hlqa+8sw1HNo+NEyDT+M4W0V/
         /7EgvHmWXqcFOgpaxJKqXqA1m/N7bcZ5+XYIOn0O9PpL92MUpmajVnrMoXbVk50OdMA2
         WVdMjjavwueGQFVPN1pWDzXvGs5RLepfTrPYjMM9am8/adoibXtPL14svsVoGZkomRZG
         KfMfVXV1y0lcy/xVD8Nh8Ltj78v0/+SPM5Vm4KlzB0YlN1yeq+oIXCrVkh6BQQnUIDU4
         6FOw==
X-Gm-Message-State: AFuF++nBn4SleYe4F+PqRYyZzHam0E5fpgVGXmFaTPt5aAE7y0ntezrf
	d5GhD1o8PCITWKrU6CTTQgQluo+XMqJ/n6SNKGWYwW+8uCGdXV7YeQuRrks/rw==
X-Gm-Gg: AYBFou2ZdAOBAqu8QqEKHt7bMXfWdhMiQIaesMYiG1oiMbt6lP+4WrL590mTRoKBQ5N
	DXYy9FKVRTVTC7oWUfNiJ5Dpd/sDyqtcqa4F7CZ5LYXm510KjZ9naap8oL3oBUHJANP5tv2tXwC
	MDD1WsCDIQ6WOGkfffiP6LIsGkoBG+IzDj3XIf8COrBe7kpjMaOyitQBO2lXare7r7H1xwWGzEg
	eqE8pLPZ0GxMZWRvM8xgZl24iciGW8FGZ1fyGJEEqojBmBU06An2zTeoVcIEoPJ0HP7YP6s9HkY
	M1Li0r+9XEFR4zFhoSjAqXGpB2oyDhSsXqLQ7sMj2T7avKrU7CgkBpv76DXeU9V70TZA2+OYtnK
	qedKYLnPfsEaj5aTluWTCsPsohijodVw3u0HqSF42BTNXALJLYIHCaCFb/9WXeUDqubzHOMQmiU
	3Uyncbz5InCKTPdJG77zcAnaco8kEHUV8lYtueUcPPbCW5EoMUNEuZWMLccrbfuMTW/K7PKjapa
	c3sZzTmBvc5J0Tu6jhwRgw=
X-Received: by 2002:a05:6a21:1398:b0:3dd:a196:ffcd with SMTP id adf61e73a8af0-3ddf8354fd9mr1560845637.29.1790160133430;
        Wed, 23 Sep 2026 03:42:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 34/42] mariadb: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:48 +1200
Message-ID: <20260923104056.457360-34-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130221

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
mariadb:mariadb is the active NVD dictionary CPE and configuration identity,
and is also used by CNA affected data for the packaged MariaDB source.
Deprecated mariadb_project records describe a separate Node.js connector.

This changes the generated product identity to an exact CPE, but the
frozen sbom-cve-check database leaves the 420-entry CVE report unchanged,
with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 099991739cb0805e63a11076d268dc7a99da8d1b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
index b1d1355e2b..71c91f0b2f 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
@@ -1,5 +1,7 @@
 require mariadb.inc
 
+CVE_PRODUCT = "mariadb:mariadb"
+
 inherit ptest
 inherit useradd
 

