Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id C27A17D23C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:54:21 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id s15so3541571wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/IUnI5maKp49lSwlKvZ6+JEbtYtIc7twmqSGCJXflXA=;
	b=miuYXidBsfUARYTwu/bF2kC5AlKc5cI8VeiJDAREpK4Rik2NtQ07TsM/NzIfmKaicb
	JV9hKOyEYdsBzJNXZHA+GENE869pfwW3gU6ak/WX2HCbs5JcUe9iihr3MPf8IV31FxDX
	Rt0zo6YAORTSQueAO+MuUSd4Ql/1bxdJIdmlfzXKH97RRH1bxMvcW726WHc8LqBE1J0t
	YmfDHo/ADEvuE+uRycqhE79MUhcHbfcGQb/X+hVD9IduHCWXAzrBvImWsrPXLjWnVbUE
	j6HSS1LlNv9KDsB0IikKEcl1T4ami1ptWFgxL451UeaAfHYz3kZjaeGDxb4V7uVUWUYN
	anPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/IUnI5maKp49lSwlKvZ6+JEbtYtIc7twmqSGCJXflXA=;
	b=iqb9gno7CEROGJ9qzfYRw7FoLsIspg2tK5uQuKlp04CYeU/qkIDGC/YmQz3y0kY2WR
	IHhxe/SbTPkqQnnDuqsX3qygLaIrxdSvgkXb53rvgeh0xm6xHF0q2PdL3SU9CKAwSWeq
	LzCN2anx0kGuIbZwIZq3PN14BjUAqynmDuPkqGdc10fnkBc4sjmpkTWlg9XMXIZpDTSd
	LHUzjQIFiCvIjrysDaG69Bd+UIiM45r9Kw6CTiURxJGu2fOJHkFjGA/kXbXt5B6QSy1P
	dAM6KkkhdQtJS3lNiekaWcSj6MvxmXQ55tq2+TWAAAWFO8WJiTR38/b4nyEpskCgzewt
	9vvA==
X-Gm-Message-State: APjAAAUjORrpwrwkbI8V5zMpHgnK63tFeSL6kGCVWUMndNeHrecU2GqC
	XRBEYmVWfVSwsoIcLYQLvqUvcVax
X-Google-Smtp-Source: APXvYqznnL0iZ6qNwjvK7JzRAHemxRgjuco37XBYhU37Q1n6Vh2dwInSw8fXQDToQQs/x/DBKdCUVg==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr4897838wrk.318.1555602862360; 
	Thu, 18 Apr 2019 08:54:22 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id o5sm2075962wmc.16.2019.04.18.08.54.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 08:54:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Apr 2019 17:54:07 +0200
Message-Id: <20190418155408.10418-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190418155408.10418-1-schnitzeltony@gmail.com>
References: <20190418155408.10418-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] samba: install bundled libs into seperate packages
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
X-List-Received-Date: Thu, 18 Apr 2019 15:54:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Otherwise bundled libraries find their way into samba
-> that causes several packages to rdepend on samba package
-> samba package rdepends on samba-base (and others) installing daemons
   smbd & nmbd autostarted by default. This is unwanted / not necessary:
   * NetBIOS (nmbd) can cause a security problems
   * slow boot: times reported by systemd-analyse reduced from ~16s -> ~8s

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-connectivity/samba/samba_4.8.4.bb          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
index e86ed96a5..aa8087131 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
@@ -107,6 +107,16 @@ SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODU
 #
 SAMBA4_LIBS="heimdal,cmocka,ldb,pyldb-util,NONE"
 
+# interim packages: As long as ldb/pyldb-util are in SAMBA4_LIBS we need to pack
+# bundled libraries in seperate packages. Otherwise they are auto-packed in
+# package 'samba' which RDEPENDS on lots of packages not wanted e.g autostarting
+# nmbd/smbd daemons
+# Once 'ldb,pyldb-util' are removed from SAMBA4_LIBS the bundled packages can
+# be removed again.
+PACKAGES =+ "${PN}-bundled-ldb ${PN}-bundled-pyldb-util"
+FILES_${PN}-bundled-ldb = "${libdir}/samba/libldb${SOLIBS}"
+FILES_${PN}-bundled-pyldb-util = "${libdir}/samba/libpyldb-util${SOLIBS}"
+
 EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
                  --with-sockets-dir=/run/samba \
-- 
2.20.1


