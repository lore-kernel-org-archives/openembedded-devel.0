Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.6304.1602218378155351255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 21:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aOa6W+Yk;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id w21so1098025plq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 21:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OIDZAgpLf/lEA+Op6pC+e/e0ciTJ/ymHke0dpJj07T8=;
        b=aOa6W+YkEIVGReF9GOxm4TZxW67jIOk5l6pQoMfd3tBGD9Pq/BKCcztvkf43cPZ49p
         BP162m3juooA1+1RPzfAet1dlDNwrrJEfgrwgE9i4tCtDCbFzk1y61B25WD62YcuQTgF
         FBGUWxbZdg6d3KbOgbxCWAuwIRWduwptDbwvg8oTKlb3riZsrIJgf0yr1uTaTcVoxbnh
         AFup2/oEP1En6s131IO0mTXl97fkak0LScAK0P2ZtUudsI+kdz5nXTeDTECBU6//FDpE
         YRqkOlT4OFQHoAapviCh3062JdaSDkvbRVjhEiUoa7MzTNciIZaU7TkKz88sgrKH0U0j
         Xj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OIDZAgpLf/lEA+Op6pC+e/e0ciTJ/ymHke0dpJj07T8=;
        b=Oj6Kdh/RHryH8KvBcBDZKmG42T4yZCtjshyRgiIOTRyXJuDsms+ORjzfHU0lueI7iR
         yptHVMZdAED4GGv57bfEd9f6rc2lVcTOdAd7sVtZDBultqp/ursH3SXYkmFSNNkROAAK
         l3zhKUjuaeDdcwlrbsGfWN33TOvk4ZnPuvqbgI1yX+HHvQpLDUM2OSef4rbHW3YYpnd8
         PcZETLquh1Y+wMWKObRWbLR9KViHUV4d+PZOX7oudlDBzMY+yqXxzOxi1B5A3AEvv3mr
         Y7TZPjce86ZaF4pmgZKpZVfvJOfPeM4JsSpS5dgY4JB6Rspa0yAel7N8GvSid8mkAcPN
         Tv9w==
X-Gm-Message-State: AOAM531TsI4NXhzfn2mZMsIquvfOx9QKEC1wxGQz0H310NQdB5xsoxNn
	s2TXDCgyFbGUGh5LuhPw4r4G43w8q5Y=
X-Google-Smtp-Source: ABdhPJxq9CuYKZKmKrvEZ08r/PHVT58dghS8QbTqYTElrsVdN3kzJBIKzm7YsGwVMzjBzNNViWwGNg==
X-Received: by 2002:a17:902:778e:b029:d2:8046:efe2 with SMTP id o14-20020a170902778eb02900d28046efe2mr10716597pll.44.1602218377557;
        Thu, 08 Oct 2020 21:39:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id v5sm8412183pfu.151.2020.10.08.21.39.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 21:39:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] template-toolkit: add package
Date: Thu,  8 Oct 2020 21:39:34 -0700
Message-Id: <20201009043935.18597-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009043935.18597-1-akuster808@gmail.com>
References: <20201009043935.18597-1-akuster808@gmail.com>

need it for meta-security

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../templatetoolkit/template-toolkit_3.009.bb   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-perl/recipes-extended/templatetoolkit/template-toolkit_3.009.bb

diff --git a/meta-perl/recipes-extended/templatetoolkit/template-toolkit_3.009.bb b/meta-perl/recipes-extended/templatetoolkit/template-toolkit_3.009.bb
new file mode 100644
index 0000000000..79ea10aebf
--- /dev/null
+++ b/meta-perl/recipes-extended/templatetoolkit/template-toolkit_3.009.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Template processing system"
+HOMEPAGE = "http://www.template-toolkit.org/"
+
+LICENSE = "Artisticv1 | GPLv1+"
+LIC_FILES_CHKSUM = " \
+    file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+    file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d \
+" 
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/Template-Toolkit-${PV}.tar.gz"
+SRC_URI[sha256sum] = "d6ad23bbf637a59b5dfd1ac006460dfcb185982e4852cde77150fbd085f1f5b6"
+
+S = "${WORKDIR}/Template-Toolkit-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

