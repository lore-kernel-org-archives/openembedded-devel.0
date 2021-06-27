Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.2668.1624825355926636514
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQPO/HbI;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id e22so13479117pgv.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RYHa07Dv3X0K+3K9PbzXznc60XtIma7KCtx9E+6refI=;
        b=YQPO/HbI0rmxPZt3v9tkOVmt14b7SMwFl0lS8Vl44AEIE60TK4Bu7Vwf7qDPWwc7VD
         Xqk20WB9Pxhm691wDYtmiJcYrQwSozRvOXqhSg+vyUrbWpbUJ/HTbpnPghhknkC+KJ6B
         H9zMSqpbqMPRkTaDi1Z39LcN1/2WHzGRiG/SUZ5qn57qTIEoMhuJ7T+UQ2dnVU7i84lj
         lZqFt/ktoBCjbLaY3v8rplAVwF/HpIbqlJ2egbrFK1huNTsi2Zbn+rQbTyvgSnRYD5n5
         miY7EVWapN8m+qfZMM9WG5FdO0esaboT8/uupDbSpBlWOL7niDwJ09hyoy8r0wsYN2Yu
         uKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RYHa07Dv3X0K+3K9PbzXznc60XtIma7KCtx9E+6refI=;
        b=EtIUMwfA2PyrNlrf5SrcAK/SO8L/mvSPQazyQItRZMNuneC4K6F4F2PSfYtVlr0KMZ
         XWeJovREdlhhJPXfzxfSyxfezDJ1PNKtkRB3f0mtP5sz8FMPurk7WCir/3dA8ymWt2r3
         aN4fTdM7+KTi6HpqFCmcKhWPN50r+TE+ap1MKG9w6oxsxNmPFHS9AqMbaM9DGWopGMjO
         XwbfOp+v2q9W0bUYaochEY1DokMStba1hyKk5ZT1cUnSpkvm0Lm1L1ADwpTBOEgD1Ant
         KdKsiG5Y6tJvA42xmLGVsB8j56w17w+W60CBVynodxa+fU9E1azD3mI4UGOuC3RDUmf0
         lxwQ==
X-Gm-Message-State: AOAM5307f6ojOahff4lVS8F6K/WFcys6dj6sRtiVvQN0rH+gHk8SOjyU
	Dg4Hiy6wT+lp8cLsJzUNN6H1FJN/LrAcJg==
X-Google-Smtp-Source: ABdhPJzpelgGUuYytEIvrE9hPkA6sCRYeEF3/AHveEWN6wxayX50XCs0b6LnzyhJe+bVxD5BU2XtLQ==
X-Received: by 2002:a63:f955:: with SMTP id q21mr20266246pgk.448.1624825355399;
        Sun, 27 Jun 2021 13:22:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:35 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 19/20] python3-django: Upgrade 3.2.3 -> 3.2.4
Date: Sun, 27 Jun 2021 13:22:14 -0700
Message-Id: <f0812a84c9cc84aadde1778d1bdc31c6f69c8357.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.2.4:

- CVE-2021-33203: Potential directory traversal via admindocs
- CVE-2021-33571: Possible indeterminate SSRF, RFI, and LFI attacks
  since validators accepted leading zeros in IPv4 addresses
- Fixed a bug in Django 3.2 where a final catch-all view in the
  admin didn't respect the server-provided value of SCRIPT_NAME
  when redirecting unauthenticated users to the login page.
- Fixed a bug in Django 3.2 where a system check would crash on an
  abstract model
- Prevented unnecessary initialization of unused caches following
  a regression in Django 3.2
- Fixed a crash in Django 3.2 that could occur when running
  mod_wsgi with the recommended settings while the Windows
  colorama library was installed
- Fixed a bug in Django 3.2 that would trigger the auto-reloader
  for template changes when directory paths were specified with
  strings
- Fixed a regression in Django 3.2 that caused a crash of
  auto-reloader with AttributeError, e.g. inside a Conda
  environment
- Fixed a regression in Django 3.2 that caused a loss of precision
  for operations with DecimalField on MySQL

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 624e3e18982775d2ea88e55e16d179420f0575fc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-django_3.2.3.bb => python3-django_3.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.3.bb => python3-django_3.2.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.3.bb b/meta-python/recipes-devtools/python/python3-django_3.2.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.4.bb
index 7a9611ca12..52504885e5 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.4.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "13ac78dbfd189532cad8f383a27e58e18b3d33f80009ceb476d7fcbfc5dcebd8"
+SRC_URI[sha256sum] = "66c9d8db8cc6fe938a28b7887c1596e42d522e27618562517cc8929eb7e7f296"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.17.1

