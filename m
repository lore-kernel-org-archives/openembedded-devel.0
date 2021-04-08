Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.228.1617899797838217633
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e+eanLEu;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so2849380oty.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Ue+8AQCTsXYv38P1X0OG2uRFiIHNsG0nxTcszQTxIyE=;
        b=e+eanLEu/TqNHfoJUWwwEAcLpWji6HHaU2SiiNbZnhcuclh3x6xjspX4aQAa5erWZU
         z8vlN8uSjCy1JYWwN6sgBmNimRohEXE9mOlj6zRl0vgzjb3FddAb+hg6TPZ8vb6cUQy3
         qP4Ux/3COWW5/AJeMQfFfjAp4uX1z0v2c2PqLiNgDJnkBVOM4Nn8E4RVkoPoxUocHfqH
         y7R5gfcLampFfuGQTxkHbumM02YBACMlVkRu1wB+f1GtyTD9XePGS7SniMGh2M+NX3T3
         HEaOcByS9ecVmDYiSA7sqp0QqSlSkeDOzCbED5wQfWNlWpv0SOMN7+Cv79gmuqAAAeyi
         xU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Ue+8AQCTsXYv38P1X0OG2uRFiIHNsG0nxTcszQTxIyE=;
        b=PvYMok87BAdSw7mK1qwUeNgx/MZuVFc26XoKtnO4/SnXv9F033GcVUwNORDiXMw+VZ
         WKqrBq+JBtHMYO6S9FS7l92Cz68QL2oEWCGSmDcg9p2mZbGr+R66Qq/q3kPbNO1skrWQ
         vB9qdP3tnXmU3cXzVJrCgGMBiCXPVLu5yLNW+k1IIoQOT5PFRNzvl5OJG57iQsAzvmK4
         XGS5Xx55eElW55aYMjGDqqmEQdjc9N2DKfV1dS5ans2JMHjKlYKNyUpnDNisZ4CRvOo6
         yk/5vy7/G4vSeUyk/K7IPmoMF8HgQp+oRAavR0mXrdCAr/ozKZtw0TVjTDPfmY7JtEgf
         J/9A==
X-Gm-Message-State: AOAM530XyCCIzr2gqwgaxBhSyK4Sc0UqIs85al/1+91noF+bnB6Er4BE
	+EXNJHn76D8zdKFEYpK1+dMpIHEvirU=
X-Google-Smtp-Source: ABdhPJzuiHLlGuyL5N6vQDMVCgQ5F+kDC2nazB2z+PitW3unE8BbzWuSENVvp/JS2O81splt9OdbgQ==
X-Received: by 2002:a9d:2ae1:: with SMTP id e88mr8140096otb.265.1617899796990;
        Thu, 08 Apr 2021 09:36:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 26/64] fetchmail: upgrade 6.4.17 -> 6.4.18
Date: Thu,  8 Apr 2021 09:35:33 -0700
Message-Id: <de95c60482bdafcc178d932bc40cb4ec3aaf273a.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d399c6043c1e30d5d06e81fc2771ee7fa1143c2a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fetchmail/{fetchmail_6.4.17.bb => fetchmail_6.4.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.17.bb => fetchmail_6.4.18.bb} (91%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
similarity index 91%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
index 7c513f62b64..7254a4713a6 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.17.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
@@ -12,7 +12,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a41bcdf11b41aa0682b259aee4717c617c15dadd43fa008b2ed38b770f4d50c6"
+SRC_URI[sha256sum] = "302dc9bcdc6927dedf375d2baaead2347557faa70d98b1da83f2409fa6fb259f"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.17.1

