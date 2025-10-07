Return-Path: <andrew.bradford@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF9CCCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 16:59:15 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.24178.1759856347304404596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 09:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IG4dRb5X;
 spf=pass (domain: konsulko.com, ip: 209.85.160.170, mailfrom: andrew.bradford@konsulko.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4e6d9573c2aso30794521cf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759856346; x=1760461146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+juwruzUWgJ0O9edCkliKiA0gWICUb244QBNR1fH80M=;
        b=IG4dRb5X5N1bxMtgs0XxZHeSD13OEHrYRKfwQbqJeFkPI9vcN22IpPeD2QVCtS3sys
         ut9oTQS7m4ppNMlXLcuQz2AqYZS/5xKWdHaVWTeMD4uPQvUC14R+L9Jm8249+5XpOIxf
         9J68ckQo9FrTK2VVSeKqBxNnc3r6BouB5SCzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759856346; x=1760461146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+juwruzUWgJ0O9edCkliKiA0gWICUb244QBNR1fH80M=;
        b=kNfrZ4qHHbivlLEyOhwKPle7HOaMsBGePiyUAkn0X3I84ENM1QqGAh3BLx/8NGhe2q
         xlDkR58qLk7NSXtrRxdsl9QyCXhGwJoO74jb6ilpgOmVZHtrTnI4uwWaPiq/POH73Rxd
         pgBPRHvVvakS3ZTQotRk+v49Gg6HGJ0WwonX1y+nJIsDOjiC4+7dihRQdkb7Do6+00Al
         O31p6f+Ez9MPjh+zOKMH82df8lkB+Dz2So17ljm1TTTxBnlNAlyjaMjq/3RGfTMKrUbK
         +CAIgMupq4SWdzt+bcU2R6felofOs51tCjeizyAerEXNs5r28Y6RmwxRggEFV3qIeO7i
         qTzg==
X-Gm-Message-State: AOJu0YynmpagH+Zr5fDKuFhHYw3bu6UttmeuEOhF2qseFoXIxyDqnjkd
	8ENFnsylgoS1aLSsjbZgrHr3vnIoZPIat1eMfJwOcYm6xX7XF8qSgJ0yF+NrTc/CC4eYUOLW2l+
	OXCgQ
X-Gm-Gg: ASbGncvhvKgm72VCn5rHTdae4Wy7rxrhax8/z63Du8iNcroqra/eZ57rGxNdO6vsBHf
	UQSsNkAfxjIXmJc36TPQPqBtT/BNy+wIfmEA3fhm9/GNcq/kjx68qMP4dkW76eJILM7Gi5rolOZ
	8ilD8oBoWkS82yXHCGcnUYm3alS2/ll9aT/Tt2yjvQWTM9mzgqV4ff1LI+C0j5qycMB7uvexD1/
	Cffza0PhJd5/6csERy6ZFndgSbYUy9CMIdNDPZieOsqxIBqcP98RYLIoBQbAkJGQINU/8RJD9pk
	j9kadHQ920aRIIJILRhsnMUNRG1bkt1zqQmn8fixc6egim2LgaObdRO/1Lywzd7RfNOd5ckk6Pk
	UruMexW02BP1PXDb0k8Dp3DSAHXcWYr9dlYT07zFM9zOqcCZFo9dRik2Q23iSCk7WIjvRp6LBNN
	h2bc2yHY91ugHOneva2r4O3pCQtM8l+Nk=
X-Google-Smtp-Source: AGHT+IG2VeXJobcWyFpT9APfghiavlIF+qf08CNWw6aNBXgvGx/5eqXlkj+jKKVqgBl16UyT2lY7Iw==
X-Received: by 2002:ac8:5a50:0:b0:4b7:a7b6:eafc with SMTP id d75a77b69052e-4e6eacceb49mr4504671cf.13.1759856346111;
        Tue, 07 Oct 2025 09:59:06 -0700 (PDT)
Received: from roo.pinmux.com (74-36-219-48.vng01.roch.ny.frontiernet.net. [74.36.219.48])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-877711296b6sm1579873785a.14.2025.10.07.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:59:05 -0700 (PDT)
From: Andrew Bradford <andrew.bradford@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrew Bradford <andrew.bradford@konsulko.com>
Subject: [meta-networking][PATCH] samba: Add PACKAGECONFIG[ad-dc] python3-markdown RDEPENDS
Date: Tue,  7 Oct 2025 12:58:19 -0400
Message-Id: <20251007165819.4073472-1-andrew.bradford@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 16:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120341

For Samba's Active Directory Domain Controller functionality, it needs
to have python3-markdown listed as an RDEPENDS as well as a DEPENDS.

When trying to provision a domain with samba-tool without this change
then it will error out like:

$ samba-tool domain provision --realm=EXAMPLE.COM --domain=EXAMPLE \
	--adminpass='YourPassword123!' --server-role=dc \
	--dns-backend=SAMBA_INTERNAL --use-rfc2307
<snip>
Temporarily overriding 'dsdb:schema update allowed' setting
ERROR(<class 'ModuleNotFoundError'>): uncaught exception - No module named 'markdown'
  File "/usr/lib/python3.13/site-packages/samba/netcmd/init.py", line 279, in _run
	return self.run(*args, **kwargs)
		   ~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/site-packages/samba/netcmd/domain/provision.py", line 343, in run
	result = provision(self.logger,
					   session, smbconf=smbconf, targetdir=targetdir,
	...<16 lines>...
					   backend_store=backend_store,
					   backend_store_size=backend_store_size)
  File "/usr/lib/python3.13/site-packages/samba/provision/init.py", line 2404, in provision
	raise e
  File "/usr/lib/python3.13/site-packages/samba/provision/init.py", line 2394, in provision
	forest = ForestUpdate(samdb, fix=True)
  File "/usr/lib/python3.13/site-packages/samba/forest_update.py", line 212, in init
	from samba.ms_forest_updates_markdown import read_ms_markdown
  File "/usr/lib/python3.13/site-packages/samba/ms_forest_updates_markdown.py", line 27, in <module>
	import markdown

Signed-off-by: Andrew Bradford <andrew.bradford@konsulko.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.19.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
index 0213d131e5..a0ef63c958 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
@@ -93,7 +93,7 @@ PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[gpgme] = "--with-gpgme,--without-gpgme,gpgme"
 PACKAGECONFIG[lmdb] = ",--without-ldb-lmdb,lmdb"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
-PACKAGECONFIG[ad-dc] = "--with-experimental-mit-ad-dc,--without-ad-dc,python3-markdown python3-dnspython,"
+PACKAGECONFIG[ad-dc] = "--with-experimental-mit-ad-dc,--without-ad-dc,python3-markdown python3-dnspython,python3-markdown"
 PACKAGECONFIG[mitkrb5] = "--with-system-mitkrb5 --with-system-mitkdc=/usr/sbin/krb5kdc,,krb5,"
 
 SAMBA4_IDMAP_MODULES = "idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"

