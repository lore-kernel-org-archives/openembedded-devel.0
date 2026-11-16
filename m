Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22458.1794808939061173427
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dkM9uDj2;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37628596783so5121370eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808938; x=1795413738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hh8H6d0C+hhfjrV0dVQFgyBEXHl7pGl1Gv7noeUtWjA=;
        b=dkM9uDj2z290/8gLutCJotFzR++FYyXdHVrfWe9J64zCFDuOv+15yLkl+NKYJv150M
         Y4ADGxtGuqK7WfhpeDTCEiFByPNyU3737yTROvJfHDfw1hrtGP+eHRhLdLVzdGOLny6R
         XeT+r2XHj59Vssjhw5kF3fSSIOzf2jkkzAi8TzNEJVEm9fdkI3gqC2iKIzCd19lVtjlC
         L6yiECESYBVAGvv+laOTPqGt0ZfmOv+Gs8YkQl6Ek4qKsBQaPI7IHwwiP6NdBNefg/sM
         h0qF5kfswYNFUUFOF7F4q5M+R1OHDuXFthGnaB9/shaKIP6pjqDI7GCYVVZI4MGaXh6N
         UOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808938; x=1795413738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hh8H6d0C+hhfjrV0dVQFgyBEXHl7pGl1Gv7noeUtWjA=;
        b=PVoWPMJqW1WdLhzpexWtoHxIT+O+MOKVeGBcgjl8sXKrFI0mauOVDerP7/6Z9qf/PD
         kzByjDErrvLjxSWipHAQdRlRLu5G4Gj9Gl0/w5ZkXG1hVb25n0R1xshPqCbRhlJQLrf6
         gyVOCkKZdI3rs6v9WoT07ZKthNmaaTGMnAGm8uddMN7S2mXIHnoVF/bysV4vsyqHjFc1
         nNdFIiHU/AmPgEqyY7kH1HhK5el6F3rkllWo/kbPestrwyzDoQxbTx8qV9XOH7PKbfQ+
         Brahtch+z1mm8dKEkGrwHMIxD7zDjEY1iImsWgjE8uDvD3T/w7eHIdl6Bxvw71u2M5ms
         RrGQ==
X-Gm-Message-State: APuU4Z/BI8A6++qda+p1Eyu+wtGn4hx9N3fsilcKgN9mgRSjdokHQ5z5
	WxL3Ih7plTtA/Iy2w8N4EeaU73s20FA5ozbIGi0Zxu7P4LtKaW+p3YSxob54pt6x
X-Gm-Gg: AYBFou1StP/WcfV4GzMRS+9/aIQFVHUq+/MkLL46GnYOSdqlGoX/Dwlh73OSYVAhoBI
	4NFHLdYA7YwMswtjOl+dKrjgkJDRCTuM8TqUm7ge8v7vEU78U3yKrp4OTfclYq7ozCqxyoQxm1F
	ZKSROIQnPVG6PPXmenfakCfqS71aaZk42feF2RNvd3CQjMFDZcIhMdFdPCLvfz2eTPXvf6Ga1vg
	Kurf2fzrUEjnrTr3B6r8o5Q+IyoqGDxG/6v5n1i5hrFBr81lSOh5nldgDevzHMAlngRNfAqBXKw
	4Cqax9JFzgomDUW+WCERm6AwiIhaWWqBgoQab2qOfR0Mv2N1EoVZ1bYt0H1LK8+ub0grERnQhxm
	+mdl2gxazf9ohJnOFwR/lGIsvHwEkOl0UEheWP6CRfjdhZArmRKJn731grJiK7zLypLtYHVPNRC
	okY1/7yQxYpG4Ler31csf3DYW93W2FAJdTL4zcuMCWBACpKspl1L5zwU13qXPfzsUx4yM7UoXSM
	qsH9iOxq6x9FowZprEb6KoA+UJDtMgaMRMxFMWAwjeQ33qWfdWia5NOcbTQVm2geAMt1wPc0G1/
	Nqy8BGq42Gmx7Ogo61N8ywFVYMWEPTilIF43X55Al3+dMQKSup+LBxgHFpafq9uJwpTf2WL+OaM
	b2zVEe3GbzjuDVWLeANnVBIAn0GojaRTfclF0QD5FQ+n7lR4pevUOhk23wtSlutt99yvvSE++g9
	yQii5o+RzTjBciGfxPO4RDFxvvaeRanmVze+zb1KsGyLO4awERWraQb/n5CSecb4uw8okJ8KfNu
	YytloekKhCWpR66746Uv41FkPkStCgZZsQB+s0Qu52lH9I5UKbO1UPgwa2fklqwmM84wVM+uyNB
	EuXf
X-Received: by 2002:a05:7300:8248:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37966960b23mr9745683eec.21.1794808938005;
        Sun, 15 Nov 2026 22:02:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 06/30] libcompress-raw-lzma-perl: upgrade 2.221 -> 2.225
Date: Sun, 15 Nov 2026 22:01:44 -0800
Message-ID: <20261116060209.2916444-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132404
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...aw-lzma-perl_2.221.bb => libcompress-raw-lzma-perl_2.225.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.221.bb => libcompress-raw-lzma-perl_2.225.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.225.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.225.bb
index e854eec4bb..131a713d28 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.225.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=dcf5ec9168367166aae
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e8b2d17c7f29b3e4f286cc3d3f5353df8e811615c42298eedad7cdbfec4aed7f"
+SRC_URI[sha256sum] = "1292b126d831822f6b45c6c02c4fc69cc5ffbf6dc8f2515ff4f301cfcfcf684d"
 
 DEPENDS += "xz"
 
