Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10274.1795753050063587128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gyjuJwsH;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b546061d58so17751997c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753049; x=1796357849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1Phir2NPEIwoRAqmdNxbVfbWPv9EwqIl6TMH/rPseE=;
        b=gyjuJwsHUVGbsgnuaihVzpWcI2R52DRR6U4EjIUeRHPlNuxMu7sBfEbh64XOWnJvGx
         CTFoqHtbA7PSJ6hNPT58bjUP0ysRmXfFLkMcB50scKjfnlb72fKZMS/s5+52O6waEcTa
         ifPm3bardWZT2Dg5geApd7DMir/G3ei2c4RM5F4nekJBJqbv1ANqHJCAMhw3kTn1jz6O
         GvS9ctYPAyP8J9XOAIKMIn84+i6uwD5WxL+xvW+j59ZRoZMXpltJj+VxLzizCxaFfCt4
         L49cpWptB66Lj/5RkL2lZjDlutNk1Wbd+1vZpKFlmozLuN9Gx86AJJv5uruXuGoW2Awh
         BhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753049; x=1796357849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1Phir2NPEIwoRAqmdNxbVfbWPv9EwqIl6TMH/rPseE=;
        b=xs1iub4E13ye4HWdbdVGSURl4S21m2AWEsG8R4fQGT9sLTQnupEnI9koDu8kPrSlkb
         5/PccytT3CCwLh8MsharU3j1yamjZBafC8x1nCJ3Mnm5GqWKdGJqodUH/CpbAOGGm7rw
         KsgXDClbumQNd/TdoNXeKNQqMuyVnoWaGtoJo4DvdYCU3jgKb11vk8+C7rYb6vhwomTB
         sNuSbc47VPkYv8PHiy53SWYIbfjy6e4FOjxRejJ4Sc3bFyprrd5a/rnHfUdjjYtImxBT
         GBcMvn4oZnryGiPm9xSUgssPTKuXALljzdJ64TNPYLl0p9KsKO2aiMGfEeDliBgnUTB4
         PcCA==
X-Gm-Message-State: APuU4Z+wccp3MybtVFx3kUkLN7DOwX45QuFDGrytbcc/wPWGDVqUGQXA
	79MhWePpnbriHyrvH0xi3aT8eboLbYGhL7xeRnAuUcagpt0kaN4QIizRQmieQyEg
X-Gm-Gg: AZFdTZcCQ+czYIyFkjDobXXsDbdtUbvd3IeMwowLdqEIfwrSUrVG9KT+PJo6yimFwL4
	/q3tja0Uq4zUhvKiTSjPNuYDxDr1SdgORh7i+2eb+UxZODyEOylZw3C0HXQBM+2nrPwIfCV9LXY
	HWxrzMFdJ4gbidrQtjf9mM28BB/3UYUea5HiIMdpy+XbLNoBuNV0y24nkCVKFLLgv+fuWByU6G9
	h4ybR0XO5TAGQGWeGcqLGahjlyesb6PSe6Ymqo12Oq/Yc/iUPRnulGyU4sMKRd+M5ZRy+zpKSfH
	eJBnZae/hKqb8MDpPNj6uZjIrL/BCMfEAdETYRmuY5B1VepXGgcauB47o4sU+irNlkU29kRmiuD
	sY9uBKQlvoh//Ru8RRnD8RLIn9QPojtUYqw/gaEfusn1LyejTyK0VIOPB77KvwA4D7Ansd1IeDV
	cIlCFskrAKeJ5uvvhe7U+ev+MPGPp+ni/3wmI/NoyBRDf1h/WVjOS/TeuN9pIUsjnntJ6G4xXqD
	fcwNMAPeJJ6TzBeVIMgoyZfgVNBwBz3F7Rl7XbbUMUUnmVo2A/XJtaSYyoy5QTlz5/d4n3ZGqt6
	T+/gS+XQm6fu8AzoxP7l0psGOLmi/CnkjyaJUVEBpbtqNVpoRiAIdz72JoBkTuPJe6okmOao8PJ
	Pza0qvDa7ejy/0awC4KMbWRMmmHua/pz5jasjPhurkgAlz3Yd9yZ35k3pX1sxjNCsysxbzVr9iz
	FGsHuJ0jFEO0Eo+cWvPy0f65mGsGSR5u9mCafalO/l6z1L1iWFp/RL5rPl+cLqZy7ISqidhM4cJ
	KKLFpD8nv80Im+lcfh2lLVHWWjRkuIYzQ3T6AQWxn9Ox4Ueh/kapd3H1zRLPgSpPUGc47AfbYTa
	8D9E
X-Received: by 2002:a05:7023:a81:b0:190:b2de:1549 with SMTP id a92af1059eb24-1b5567f695bmr24659441c88.1.1795753049365;
        Thu, 26 Nov 2026 20:17:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 10/35] snort3: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:50 -0800
Message-ID: <20261127041715.1776485-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133262
Content-Type: text/plain; charset="utf-8"

The default tag regex picked BUILD_248 as version 248. Only match the
four-component X.Y.Z.W release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
index 0d972b8aed..a364ed1371 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
@@ -15,6 +15,8 @@ SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master;tag=$
 
 SRCREV = "14aeb09f5a0856812dbe08ead3c21f99e8860aa0"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+){3})$"
+
 PACKAGES =+ "${PN}-scripts"
 
 inherit cmake pkgconfig
