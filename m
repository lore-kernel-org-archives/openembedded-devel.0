Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.26905.1601867970072377509
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lmqnOuoF;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id w21so5861597pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uITza2I/L2SNy+sFGksk3ijo80vPSndUIfpsjRSImiY=;
        b=lmqnOuoFTmjxBkIBy45EsoxuuFS0BhIopv25hfbfMHasMzdp42zp6K7hajlX3p6hg9
         NxNoVgY92+pho/nwcwFQWrcSj9l9qzJDuN3pFrmAbyXgmw+Y5kDr71nobOKIWEDoKeL/
         4qHP+VW4IkvsvHlAZz888L1YUMHUwaVt13UkNiFhw90pOMKzKVCYaXeB/AZrDk3GIOBz
         WARN62eL8+5F/+DcEfiq21RbfO9y23BEUSmVEB4WWvKgfedV9tXEIJjHQ3z6kkaVjVtg
         m4ojgV8D9GfFilH0wvK1BSH8ZgyIlHRP+f8/5zo5o9Z7QFB9ituQetCmmvJ/1aM/TVAU
         ANEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uITza2I/L2SNy+sFGksk3ijo80vPSndUIfpsjRSImiY=;
        b=l0fhKotMaD2XLKpmZs5fLBlLF+kRqR8AXuoO+YdcF98rfRQdKz+Wp5PAbLlJa4SQSu
         0Dz1IVrxo5+nEEDjQUV683WQPppXjqlQ8Hg9aFWKnMRQ2xnl8YCujfv6X/VnKUN56qHJ
         uQIbeDQ4w7ei8O7EdIHUO682UHXpgNWF7gT87T4PyC0SzuYju4IY32sYERo54HV0UbJS
         IW4w6JqSWDpNfmMmXHdq0V3ibcHH3aAXDonIeKTLbEnSD4CbH8jtRlABjpeKKUVWKHtP
         Sj024Tk/dCLPMo+bwOWJwDw+YoZI4dpyY54aHjYSk+f0TGoAx/EPl5oJbBNiTZA5JVUC
         vCBg==
X-Gm-Message-State: AOAM530Ql2lTSjdOkg2Nux5JFy0W5XyfYUL7nnOw/KL7uYswPqrS5ws7
	Sgma3+jP2+p8IV60JscCmsYsWj01SoA=
X-Google-Smtp-Source: ABdhPJxqwPSHA2CgM2qoVyIEDZT6HZ2F7CVKGAI/4B2WbCAEIzuuwiZyMyu2c0+T9lcDcz5ouBkKlw==
X-Received: by 2002:a65:46c6:: with SMTP id n6mr12052297pgr.328.1601867969475;
        Sun, 04 Oct 2020 20:19:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 8/9] crda: rdepends on wireless-regdb-static
Date: Sun,  4 Oct 2020 20:19:18 -0700
Message-Id: <4a69fd88177afa0b439860748258626a23b0329c.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>

From: Robert Yang <liezhi.yang@windriver.com>

The wireless-regdb has been moved to oe-core. According the commit
message:

wireless-regdb-static should be used with kernel >= 4.15.
wireless-regdb can be used with older kernels and is mostly
irrelevant here, but keeping it in meta-networking would
create needless recipe duplication.

it should replace runtime dependency wireless-regdb with
wireless-regdb-static.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ac313b638068aabc88f0fa9d1888380e94100f31)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index b380eaf94e..e59d2f437d 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -35,4 +35,4 @@ do_install() {
     oe_runmake SBINDIR=${sbindir}/ install
 }
 
-RDEPENDS_${PN} = "udev wireless-regdb"
+RDEPENDS_${PN} = "udev wireless-regdb-static"
-- 
2.17.1

