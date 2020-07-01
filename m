Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.10714.1593562046740643661
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VyAnNzxC;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id w2so9954277pgg.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NgwHGTVSmK7642pF1gIN5pyfLm+awKOkwopVr30bQ/U=;
        b=VyAnNzxCsUdmdlg6ObzGkT90bV56j2k0XgyaG77oNK76wkuW4HFCGQs10VlgRDtDrD
         JBpkfNISkAjmKN82jzKM3xXqcE7SPW6C4zirlgUlKP3ZLw6iHJWZdQ/e9dJOuLAuiJbL
         GwKJd0J0+9/v6CxSAQJhCHg/G+3oXg7RBS9ijV6sNyB2nudbjprufn368cvPQW7+VF5e
         OUEGczxaDszMLjXLUwZFL2MmBH/LMVe/9QW7b2TRLLDf8/pX1NCUkUOSSbdI3xVd2EJH
         WC6fxnZ7fhv4j7OXrtlVoRMSVIK4oTZarj3ZPIUckiCsg5GaYKqMAgK74k185ZCP3iUp
         KGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NgwHGTVSmK7642pF1gIN5pyfLm+awKOkwopVr30bQ/U=;
        b=U0YCALSluMpX7ZwLuaPgcAVgM/DjsGI5sVGhaVpX1BT1tt3CIuchz9imOie425+ltt
         l/MiSnvuxrDwhFfmjOUFmME2XWMIxniZDqNOf0CpSAGH6DtsuktB7HlvDLug0BRJ1Bwa
         rsqBqjZSQOLSbR4j/DLNHxDkjOVWI8AmarrHAR0xZo/iUPn3270jUzGQj150QF3emKOi
         Q+pfJcUINPMQsu9gzd+3GbtEZXTpv72KADonR4E7e0DJj7AOKSsdpspyCuB69G1Xg4f0
         pZnZKLBFFCKgMvO3KSKQAp/aqo1vihn2j5HFEhIH+QuKQ3sbh61WoMCihSiD7aDZQmVi
         jZ+g==
X-Gm-Message-State: AOAM532qvOaVTb9B4axVsfoV8HtXMrGtaTiRXAGFgh/bphX/65zRYsho
	2CqgKJTYgqlxhCYh5XplcBS6mWWyBGw=
X-Google-Smtp-Source: ABdhPJyJV3+kQWhZkProSAAJk1OKLjHKNwkrHI9awR9gZBqDPU6Fj65IjZib7b7uINZ2CkOZ1Qg+nQ==
X-Received: by 2002:a62:2ad0:: with SMTP id q199mr12098392pfq.229.1593562045922;
        Tue, 30 Jun 2020 17:07:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:25 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
Date: Tue, 30 Jun 2020 17:06:48 -0700
Message-Id: <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

See full changelog https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 65e124eef373680726ac045677cbec7d9080a289)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../jsoncpp/{jsoncpp_1.9.2.bb => jsoncpp_1.9.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb => jsoncpp_1.9.3.bb} (93%)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
similarity index 93%
rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
index a88410f2ff..97c6361ad8 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
-SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
+SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

