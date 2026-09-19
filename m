Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A029EC982DF
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:21:02 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20526.1789856454836540258
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NS5dbOdX;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: raj.khem@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91a931f66so11931095ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856454; x=1790461254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xbWPqfrOoymEncSfH/hbNBGVGyONF6lun8LUcS4wMs=;
        b=NS5dbOdXbYOvRxnzd9y5Ch6Q2rUzlp1HWrDPYVHolVKey9aiybGsiiBjJhQ3YT69SH
         yx+ht+xAIp7Ms4meaUSiAZXXIlbhVUDT1vCtGwWJduB6qOOSYkl6TEY/3o3tpQt32Vob
         SszYhvx98oPP/+Vh9M2EcJwO8tK0prvQBj+ehY/TyefDe48kCSSRHAKOReJ358vCOGvo
         U9170Uy7wSXeVBgtUBzo4A7zaDSssqLQgQP66GUHZ/8l2ldpSWPcgdeCToKpyD4Dw5+4
         mTxAThStYpmnUyBAudwLkwAwKBy1qdkOdT75xAgS02p8Yh3cjG6ZmfRN0ou3Bj1Gd4Mf
         47/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856454; x=1790461254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0xbWPqfrOoymEncSfH/hbNBGVGyONF6lun8LUcS4wMs=;
        b=G+lDx3X0/HK84kK5xo8KrhuFgN97c8QOdE2BPYy7Z/9dXWq/gBEA9c4+qKMF4M0Gin
         D3vxANu7DdUVuscRtZ1TDNF9TeGbtJzkzv1LcRrm2v3zi6rEFy1AGrBG0/mTG9lzkNSd
         bERFVgGYoS2DYx8734agFtOT+qyPFMXIEfNfR+wl4oetQWeBxzzK5O9RK+ccUAIKJN2U
         Kuw6KQ7wG6vnXfcsbp2AOaz1/vICbYapqU/iHlnisuU1g4K8SEBFkEDwqDeDIVG4hqJC
         Qx/WkDTDx70yHr/DVmZaoc7xztKeg5HEbU9yf0OMnNwoYf3sSOpLA2BAaqJmfwDUthGS
         fLdQ==
X-Gm-Message-State: AFuF++nCRr73uQ6vfuWQLI1uymF0rmfwIuRNkkHovsc42WDYZLclea3V
	d7zMYKj2OVOVRVEtL1ac09ShCzXSYnhRA4aJsNugX/XDgMCcfKk00dNr4LeKPw==
X-Gm-Gg: AYBFou101+YVYMcwfK/2YLXABIBxwFMXyUhMrPx/oCbN5HO/TlzyAKdzJzLgKH5/O/y
	s5py5WLaNQO9YuOR1t2saQtoHRV23f3oqFPE6dBvFkT3L56wyCrYF6m40IjLcDXdUAagatPsscS
	Df32CdjdbBB+ZO35hEPGnStmJPK166saMyx/KQrr1wu4AZ71Y201Lz53G0fcYHRrEMTXintODEJ
	AE03GW2HX6ijpOe9LPkK0rOyPaUw7kv26C78Ew5XHIB1cnKUHDXRbMemrghHtW9ImdyNBnJNXwL
	lRXywALkahvEXfcB/2Q2bljKq5KMAcl9taEHri03NS+0cLND0H1HbfHF2R4AuLMhmOSj8q6iZn1
	P+nxKRMhNfX+eQvlUHvAP2Uc00BovhtmPjemFiU5ZhY1RIxqivktf1nTnjTx8oxfZaWVy9RuZUD
	kQcVnq4yJ9UCS3pZsMI9JeP6AQdcv8164TdmmxI1AUNDJdTqglzovXz7i1OFUOXLHN1xFEDAjHz
	5zj/CzkToUhpcfabAWEaHak0GLDbJ66LLjR96dQP7Y3EB2cBA+1aKKEWc2pXtOeG4KbrTp23Ner
	szLtiUcfkT543yGZXerPzLdIlLUI7BCMXFHs46IjtxFDmngsIwkMZaTopMpAZ+WSZoEHjmkkZGP
	YDlOThdXVpg2L+NskYl9eG/IhpvHr+bWo9XQru2vDoa5Qiz95UF3nfL+z
X-Received: by 2002:a17:902:c94b:b0:2dd:ad74:6d1d with SMTP id d9443c01a7336-2ddb1bad1d2mr118329545ad.26.1789856454111;
        Sat, 19 Sep 2026 15:20:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm10494651eec.30.2026.09.19.15.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:20:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 4/7] libauthen-sasl-perl: add libcrypt-urandom-perl to RDEPENDS
Date: Sat, 19 Sep 2026 15:20:41 -0700
Message-ID: <20260919222044.2143524-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
References: <20260919222044.2143524-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130121

Authen::SASL::Perl::DIGEST_MD5 uses Crypt::URandom, which was not
installed, so the DIGEST-MD5 mechanism could not be loaded:

  No SASL mechanism found: DIGEST-MD5

and five ptests failed (digest_md5, negotiations/digest_md5,
server/digest_md5, digest_md5_verified and order).

meta-perl-image-ptest-libauthen-sasl-perl on qemux86-64 now passes
15 tests with none failing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
index c30cfb66b1..4d99672840 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.2000.bb
@@ -9,7 +9,7 @@ LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Authen/SASL/Perl.pm;beginline=1;endline=3;md5=17123315bbcda19f484c07227594a609"
 
 DEPENDS = "perl"
-RDEPENDS:${PN} = "libdigest-hmac-perl"
+RDEPENDS:${PN} = "libcrypt-urandom-perl libdigest-hmac-perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/EH/EHUELS/Authen-SASL-${PV}.tar.gz \
            file://run-ptest \

