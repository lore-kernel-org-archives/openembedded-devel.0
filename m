Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.1601.1604605801449488795
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 11:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gfr4aZ/K;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: rosbrookn@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id g19so1297494qvy.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 11:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rR318AKlkj6tq0IWqyZL7JjZUXFAPdLPd6Whb6WYlvE=;
        b=gfr4aZ/K6bDK4pBRTsEybiW7nxUi3siZHNMvLQYZe4plRRsZ1Nzza7dMZeeR+HvbHV
         rU/ExTL9kO4hLwberfOA8UpFtXqzGixaah6o5mm/8iAhaLq2HMhJMhe9N6EjxOudk5Hs
         ar/Io2+XGiBxZIIdSDx07rWn+Xz91KfdE9AIflhZfBWqxjcsBkTeKv10DK/smWV228Jl
         XgXk5IHVBjDBVw+zuKK8j+wrzLy6lf+BGEwRK648i5HGZFElzszqnNRRj7T5Hszd3PY5
         7qEVkUGHbX4z5GfLUkFupeEJfunCe35rOwuOEODDMhiMJa/HUkCSYzw/d3DvQLaUEsn4
         H1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rR318AKlkj6tq0IWqyZL7JjZUXFAPdLPd6Whb6WYlvE=;
        b=YyF8b1kRCtUANzojo/8iexQHOOOPfIwoywpgj4ZqptXt5X+62ZzQhdBUUgh+BStxG3
         CvDQa99y1yi6Uy1twuqAf96hMiJSuXbTYH0GOPZTca60ABqyqFsRLCkVntkd1+5/coAH
         dwME3KdF6CaVf1r2Metq/RXWShXIuZpcNPu7f2mQKgEjRRaM11Cnb1CpLg+W5uIQy8U4
         1P5BHlvjI2j2OeYAlj/mOIZj/qOQuOhRFkVZNb1VfLJ1dI1Uf37nc/GZLYIfUXMLPzTe
         xd8YkSdynyFFJV0yD7bC/IFHgb4xyM3annyrZrl4MWPX0yYWK7lhhv6N6fsMoq2si/3l
         T+hg==
X-Gm-Message-State: AOAM531+uGVhYn5dhB4hMi9txC47hP8t6+5M2fT04qnU1QHZf/DfjFh1
	gmW7hmVnJc1pJPHeo1S6gS24kSB522Cy9Q==
X-Google-Smtp-Source: ABdhPJzA852AcdBvHdN7bfM6QkWVaPK9hl+iSBmchYxPt3Z/yC7pt4Oap+spz6rI2dfZvsRs/fumTw==
X-Received: by 2002:a0c:f3d0:: with SMTP id f16mr3955053qvm.42.1604605800242;
        Thu, 05 Nov 2020 11:50:00 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id q27sm1694224qki.60.2020.11.05.11.49.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 11:49:59 -0800 (PST)
From: "Nick Rosbrook" <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH 2/2] strongswan: add some PACKAGECONFIG options for EAP
Date: Thu,  5 Nov 2020 14:49:53 -0500
Message-Id: <4941002037351503fa2164149722ebca8cef9b58.1604605168.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1604605168.git.rosbrookn@ainfosec.com>
References: <cover.1604605168.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add options for eap-identity and eap-mschapv2 plugins.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index 59641cb83..075982c77 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -32,6 +32,8 @@ PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
 PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
 PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,${PN}-plugin-curl"
+PACKAGECONFIG[eap-identity] = "--enable-eap-identity,--disable-eap-identity,,${PN}-plugin-eap-identity"
+PACKAGECONFIG[eap-mschapv2] = "--enable-eap-mschapv2,--disable-eap-mschapv2,,${PN}-plugin-eap-mschapv2"
 PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
 PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,${PN}-plugin-ldap"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,${PN}-plugin-mysql"
-- 
2.17.1

