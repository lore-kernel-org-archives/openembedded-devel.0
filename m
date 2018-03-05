Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8BD78A89
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 03:01:27 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id x1so4745211pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 19:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DX+nhIXMCLsX74e0sEWOhJeHd0qOvuQjRrPDQuwou/M=;
	b=sPqCaSE8qnSToEeU1vLpl3/0KnrwBELOMLhlBBiNyl/8NdhhtxUlkI2e+2X/MdBiRN
	aIdNtiDGYbcbXylP9YtIMZyn6hOpTWiQxRXb26dxWHOMgIl67qqywx1K+GuSS42+Y/Y/
	sFsR5Vvd7lfe4AN15iSn/cpx6yH5WdZEasV3IyEq90t2LRe9aHAk2TuAKE/B8bzDN02p
	YxoLOiws+l/amrnrwv1XRa8B0hIoFTtUqam0DkyRR2sOAoy1ufDcjKtFuNS74oUjmCeq
	w9p7+5sIV/+XJiZtMTE3aB2YVTKo/48V7h8UOj/pa0igQGQnH43vr1D9PFxdoc2jVviO
	goaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DX+nhIXMCLsX74e0sEWOhJeHd0qOvuQjRrPDQuwou/M=;
	b=mybTYbzERCR1dgsPC+K+/rJpT/KdfX9DlGjmEh50uO4VgnNqlb39BMQDwG4T0v8sLC
	M8hMPIllSBDd9aUDRAzY0n2JYwTV3Hhwd+DP6QHzoV8rBJ0Je2/sQSbnhfpjIQLGd+lI
	kQJjdltMuEYSUDD+xmo0ASx3GO0vtklwGT+1TmvASBCvH+xQiFGTc312IueubsNwNDSA
	1K9Jx+h0zjtbsSdxRBoqwEQ5g9TN4eFaNxoVEOElcuHONG3naPU5k3lFik6kd0lMg5R/
	QYPwlRe/2p35bjc80ktm1+CmKAQNwrFuUnb3WEGHFyxlVGNFKaFoYhKibg8AmczTU6Nm
	ftYg==
X-Gm-Message-State: APf1xPD4p5ik8i3D116aUDk0+7re3lrEFkslSWMQBTfHWDhYXkLKbMJi
	WyahzO4hb0GX/HmIMyrsNjStNA==
X-Google-Smtp-Source: AG47ELuiF730mPcR1Q5y24PERfjenB2noJ5riYfDeSWhOqcMnalcfkeqUDTx2gqXy+Gi91ztOUzoNg==
X-Received: by 10.98.153.157 with SMTP id t29mr13904287pfk.201.1520218888463; 
	Sun, 04 Mar 2018 19:01:28 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	t85sm24136961pfg.159.2018.03.04.19.01.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 19:01:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 19:01:16 -0800
Message-Id: <20180305030116.1901-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305030116.1901-1-raj.khem@gmail.com>
References: <20180305030116.1901-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 2/2] ebtables: Fix duplicate definition errors due to netinet/ether.h
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
X-List-Received-Date: Mon, 05 Mar 2018 03:01:27 -0000

Make the patch musl specific as it is regressing glibc 2.27

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Drop the new patch since it was reverting existing patch partially
- Apply the regressing patch conditionally to musl builds alone

 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index d5e7341a0..e4adafd3c 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -29,9 +29,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://0007-extensions-Use-stdint-types.patch \
            file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch \
            file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch \
-           file://0010-Adjust-header-include-sequence.patch \
            "
 
+SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
+
 SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
 SRC_URI[sha256sum] = "dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d"
 
-- 
2.16.2


