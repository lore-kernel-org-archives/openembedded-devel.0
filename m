Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id C120978694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:45 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 93-v6so628041plc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=atbX+amAvok87uYg9+DJNxnfViwJnULLTUw+LUMtyQM=;
	b=k124deRthpWhWmDq3jDpCvifq7mvsNItJ9foOWR4uUljVaxVmMDted4H090mc2QFiK
	v7RSnui63u0PYJSZW/CNsISzcUxrAdM/N5J3FfvaS3XvlWN45l1N+ZVJMI4jqha7STfW
	kzbzkJulgtGrMNmHoyS6xqjQha4Jwlhspz4n21WIsBeaKkNbipCi9uuZwpTj17Km6jJD
	UBaesd62x3sBvj7DTOS1MExBE4hTdcUk1ycS2Sl08dcIcUFMHfqFEftju88Serw6nG2K
	fUyaRKJhugYii37oKuY6hglLIIjY1ZXKCSr8gsvMd7jeArmFQQucrtN7SXzBIemXGWR9
	4rPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=atbX+amAvok87uYg9+DJNxnfViwJnULLTUw+LUMtyQM=;
	b=s1ZFWJmx2CiAbs8UihE5MYKdxQ6WEDuF4Kp9OoC2S39yqH0Emqmc2lW+Uj8fsR9r2q
	PhxMX1cyOcjO8/ccb2Rv19BFMOL6BAfOIVBjKdtT9JJIYFpf94zO9iVJqKlcz3r+dnJR
	HFQrDBjMjbsgvKO/Ede8ZQCiYLhCk/IxkHdDp6Py/u51R6r1Kmrkic/Bjk5LS0be71EE
	ruhqzsMiu35tx8MlwesBJuAZWMS1rTgxy5jxMBW5p9N1p1dqgIGXh0nfrCglJcDhFvUS
	yYP02u3CwMiTpQpSrRybz65uZKlv5U3mqD3owYn92chnYoWmyWbr1OaBDqo+Xy3zQtwz
	AJcg==
X-Gm-Message-State: APf1xPCwz2JazRrYcoQHMyPl5+4ttlulCpgkAxBLqEVnuDipbnrpV4LV
	Ww8ErXOIGLI3hyTkMKuMR0Eulw==
X-Google-Smtp-Source: AG47ELvf3mxeIhze2DsVzrGvGPd4lvswEOvsLLf9GuovsK85AlNlykLeduutcY2e+lPOQTDSW7+NEg==
X-Received: by 2002:a17:902:6184:: with SMTP id
	u4-v6mr18660176plj.390.1520395427476; 
	Tue, 06 Mar 2018 20:03:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:22 -0800
Message-Id: <1520395408-19266-19-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 19/25] libvdpau: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:45 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
index 31f4df4..31bcce0 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
@@ -12,7 +12,9 @@ SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit distro_features_check autotools pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_install_append() {
     rm -f ${D}${libdir}/*/*.la
-- 
2.7.4


