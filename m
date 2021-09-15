Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.7959.1631714128096969969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EHM0CuHU;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id w7so2758930pgk.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9WxiZxYPFjSHVu9sZbmPIEfKnBQ0EsG8ukBxqU7x2t4=;
        b=EHM0CuHUgAUkqSzjzNtSGh1hakVc/T+XiqaV7ZPHqVfRelnwcaf55mXKoIcCVY7TfO
         YKU+tAvW/cnA/BRHXT81eQRh5lSyX/qWKfwus020OMPfL3jbTkO0VGjLSom0H79PIRav
         XV0g4+BOQBif9Eyv/LEAE2Yu6VKCdjkfKb8gjURhy1U9JRktB+Y9W8oZB0mZRB/ypQtJ
         J5DO7Wan6oBvAiKU3AYusRdtg69O4Ojz5OLqx7zjdVIDGIJRujuc1rOCcW/XURQFh5GD
         mNujm3xGQTxvFwEhHKXoV8FfdoVhxpXCNYOtPnA9hAodv7NPoNOsoX2Lx7o+ldyUawk3
         CzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9WxiZxYPFjSHVu9sZbmPIEfKnBQ0EsG8ukBxqU7x2t4=;
        b=dUJJdtz4jrD93XzORijSTNUXpvwd4+EjSeVRBznpHl+lWxsPlrSiusbADztmp60BD+
         w4hMCu96+r01yvyblONQsmN9GBPqPZirPKYYgXg8DlNBdVP1I9qBICXZD0STlmaPehkI
         yQgz1hZ+Mljl4kx5YVD0UMKI3y/aMwaSh9lFex9e532VXbw895RrgWvx4TtjzsTUCe8V
         G6YKZP4hVsT6euj1frTSV5PE478yiu81YVBInx9mRwk006PG/OGxYcBdPuqyeZ34hWXt
         jlEw4It+TFI0QZQ1PnUMgwOWEUBuNKV3+QMz//ZGnSf3/95YGo8Vr2mb7n0SHANTdNBc
         JWtA==
X-Gm-Message-State: AOAM5327ED3lfcxETBKKCbbbAPrs2D046wvTYwLfOqopbbR4fLofpYaa
	wKaI8UdUZZUXvhvY9vQI+Etc+xvWEfY=
X-Google-Smtp-Source: ABdhPJybBaq2IhLFtzC5QCwDAw761xaqY8mUF6JyaeYmil0aiZddyrkqqNV/G3siNuBaKb6N5IZy8w==
X-Received: by 2002:a65:51c8:: with SMTP id i8mr20325560pgq.451.1631714127146;
        Wed, 15 Sep 2021 06:55:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:26 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 3/9] krb5: fix CVE-2021-36222
Date: Wed, 15 Sep 2021 06:55:14 -0700
Message-Id: <523f6d834d2fddb0ecc73c6d7d8b1845f65f5279.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Zhao <yi.zhao@windriver.com>

CVE-2021-36222:
ec_verify in kdc/kdc_preauth_ec.c in the Key Distribution Center (KDC)
in MIT Kerberos 5 (aka krb5) before 1.18.4 and 1.19.x before 1.19.2
allows remote attackers to cause a NULL pointer dereference and daemon
crash. This occurs because a return value is not properly managed in a
certain situation.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-36222

Patches from:
https://github.com/krb5/krb5/commit/fc98f520caefff2e5ee9a0026fdf5109944b3562

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 620badcbf8a59fbd2cdda6ab01c4ffba1c3ee327)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../krb5/krb5/CVE-2021-36222.patch            | 121 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
new file mode 100644
index 0000000000..fee6e64c15
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
@@ -0,0 +1,121 @@
+From fc98f520caefff2e5ee9a0026fdf5109944b3562 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 7 Jul 2021 11:47:44 +1200
+Subject: [PATCH] Fix KDC null deref on bad encrypted challenge
+
+The function ec_verify() in src/kdc/kdc_preauth_ec.c contains a check
+to avoid further processing if the armor key is NULL.  However, this
+check is bypassed by a call to k5memdup0() which overwrites retval
+with 0 if the allocation succeeds.  If the armor key is NULL, a call
+to krb5_c_fx_cf2_simple() will then dereference it, resulting in a
+crash.  Add a check before the k5memdup0() call to avoid overwriting
+retval.
+
+CVE-2021-36222:
+
+In MIT krb5 releases 1.16 and later, an unauthenticated attacker can
+cause a null dereference in the KDC by sending a request containing a
+PA-ENCRYPTED-CHALLENGE padata element without using FAST.
+
+[ghudson@mit.edu: trimmed patch; added test case; edited commit
+message]
+
+ticket: 9007 (new)
+tags: pullup
+target_version: 1.19-next
+target_version: 1.18-next
+
+CVE: CVE-2021-36222
+
+Upstream-Status: Backport
+[https://github.com/krb5/krb5/commit/fc98f520caefff2e5ee9a0026fdf5109944b3562]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/kdc/kdc_preauth_ec.c      |  3 ++-
+ src/tests/Makefile.in         |  1 +
+ src/tests/t_cve-2021-36222.py | 46 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 src/tests/t_cve-2021-36222.py
+
+diff --git a/src/kdc/kdc_preauth_ec.c b/src/kdc/kdc_preauth_ec.c
+index 7e636b3f9..43a9902cc 100644
+--- a/src/kdc/kdc_preauth_ec.c
++++ b/src/kdc/kdc_preauth_ec.c
+@@ -87,7 +87,8 @@ ec_verify(krb5_context context, krb5_data *req_pkt, krb5_kdc_req *request,
+     }
+ 
+     /* Check for a configured FAST ec auth indicator. */
+-    realmstr = k5memdup0(realm.data, realm.length, &retval);
++    if (retval == 0)
++        realmstr = k5memdup0(realm.data, realm.length, &retval);
+     if (realmstr != NULL)
+         retval = profile_get_string(context->profile, KRB5_CONF_REALMS,
+                                     realmstr,
+diff --git a/src/tests/Makefile.in b/src/tests/Makefile.in
+index fc6fcc0c3..1a1938306 100644
+--- a/src/tests/Makefile.in
++++ b/src/tests/Makefile.in
+@@ -166,6 +166,7 @@ check-pytests: unlockiter s4u2self
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2012-1015.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2013-1416.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2013-1417.py $(PYTESTFLAGS)
++	$(RUNPYTEST) $(srcdir)/t_cve-2021-36222.py $(PYTESTFLAGS)
+ 	$(RM) au.log
+ 	$(RUNPYTEST) $(srcdir)/t_audit.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/jsonwalker.py -d $(srcdir)/au_dict.json \
+diff --git a/src/tests/t_cve-2021-36222.py b/src/tests/t_cve-2021-36222.py
+new file mode 100644
+index 000000000..57e04993b
+--- /dev/null
++++ b/src/tests/t_cve-2021-36222.py
+@@ -0,0 +1,46 @@
++import socket
++from k5test import *
++
++realm = K5Realm()
++
++# CVE-2021-36222 KDC null dereference on encrypted challenge preauth
++# without FAST
++
++s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
++a = (hostname, realm.portbase)
++
++m = ('6A81A0' '30819D'          # [APPLICATION 10] SEQUENCE
++     'A103' '0201' '05'         #  [1] pvno = 5
++     'A203' '0201' '0A'         #  [2] msg-type = 10
++     'A30E' '300C'              #  [3] padata = SEQUENCE OF
++     '300A'                     #   SEQUENCE
++     'A104' '0202' '008A'       #    [1] padata-type = PA-ENCRYPTED-CHALLENGE
++     'A202' '0400'              #    [2] padata-value = ""
++     'A48180' '307E'            #  [4] req-body = SEQUENCE
++     'A007' '0305' '0000000000' #   [0] kdc-options = 0
++     'A120' '301E'              #   [1] cname = SEQUENCE
++     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
++     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
++     '1B06' '6B7262746774'      #     krbtgt
++     '1B0B' '4B5242544553542E434F4D'
++                                #     KRBTEST.COM
++     'A20D' '1B0B' '4B5242544553542E434F4D'
++                                #   [2] realm = KRBTEST.COM
++     'A320' '301E'              #   [3] sname = SEQUENCE
++     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
++     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
++     '1B06' '6B7262746774'      #     krbtgt
++     '1B0B' '4B5242544553542E434F4D'
++                                #     KRBTEST.COM
++     'A511' '180F' '31393934303631303036303331375A'
++                                #   [5] till = 19940610060317Z
++     'A703' '0201' '00'         #   [7] nonce = 0
++     'A808' '3006'              #   [8] etype = SEQUENCE OF
++     '020112' '020111')         #    aes256-cts aes128-cts
++
++s.sendto(bytes.fromhex(m), a)
++
++# Make sure kinit still works.
++realm.kinit(realm.user_princ, password('user'))
++
++success('CVE-2021-36222 regression test')
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 29bcb48b15..e6d9e3d627 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
+           file://CVE-2021-36222.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
 SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
-- 
2.25.1

