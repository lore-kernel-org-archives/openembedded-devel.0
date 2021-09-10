Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.14579.1631305585084719688
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Sep 2021 13:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bjQtiYMe;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id dw14so1240734pjb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Sep 2021 13:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2z5BC3aCqNWKSuFByzosAIHXzP1EkeL9OAxelz08YA=;
        b=bjQtiYMeGCzruhyGcW88qaiPVMFqnPW1mlTRL7iApYGR2pNriRdvqPAql8yeO9+6Br
         3wOP+2vidxeKRzOfkjdG7u7mN9ExpHQMSHYK+iVXmh+8/QHGNqeFokxWGOPTysHK1890
         rQpx+mYvVh9HbAc+qcnSzNfGchHf7pxXR0HZzX1gYLT9tZuw9fB6bg1w9lwTuJ1WtPdM
         tECOtKvkyfPJsjTrF1r879JRJ9fMAsm5efjakQqVLAgOMPRsjr254OKltioAwaWgCRAs
         fCC4gfUBR8JdNk1cbIKb2IHZXww2XeHEfxwjfbiRt7yo9J2/1/RfvgWjWuqkkzkUFNSI
         2lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2z5BC3aCqNWKSuFByzosAIHXzP1EkeL9OAxelz08YA=;
        b=lU2PpRgvAH3Vr+TqWL6gqy5+9/KXHA3nDXsub0XC5kfmohp4E6+UaxZNxE/7wDJaBD
         1eB5f6yw/FNn4qqbdf1xZeOLeQdhOLvo0O/U5XC8NI4Ni5S80cYzdNxfG6nN8VsVRl4Q
         Df6Q3lCZcux8Dah/62Hr8bgWQdo7zriIVFRsD1kW6ISwiZJvO/MZekHmtSUD7x15Oj7c
         +S7+G2TAqfdjTW9GmMibHEVoEoe8hgOUXrcyuOsUGk2GgGNSZ/qDg2p/StPFIDEf6HuA
         ZwvTjons0oZTqmjvvHGGFl0YhpMHmE/skXNYEq5USPo6r5DSkRjI/4AN2jdIp+cOn/JK
         pVaA==
X-Gm-Message-State: AOAM530ebi2xKm2Nk5vJ6zrs2jsc8wEas3kOCut7wSazRdtw38gutPpw
	iNGVZ+wK2rMFeN/bTOewZZfc5+tEByY=
X-Google-Smtp-Source: ABdhPJyoU5chPczKiEM/uVaxkPT4OOqh8Nk5lyvEmyXG6B/7WpUoE/YgfTivmbtLa444chItJZtoCw==
X-Received: by 2002:a17:902:a5c2:b0:13a:31dc:8417 with SMTP id t2-20020a170902a5c200b0013a31dc8417mr9308744plq.88.1631305584086;
        Fri, 10 Sep 2021 13:26:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:580b:61a2:a85:3f46])
        by smtp.gmail.com with ESMTPSA id ds15sm5485856pjb.19.2021.09.10.13.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 13:26:23 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] krb5: fix CVE-2021-36222
Date: Fri, 10 Sep 2021 13:26:22 -0700
Message-Id: <20210910202622.2875870-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Zhao <yi.zhao@windriver.com>

Source: https://git.openembedded.org/meta-openembedded
MR: 112165
Type: Security Fix
Disposition: Backport from  https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-connectivity/krb5?id=69087d69d01a4530e2d588036fcbeaf8856b2ff1
ChangeID: e7cdfd1c4530312b4773103cf58d322451af1421
Description:

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
(cherry picked from commit 523f6d834d2fddb0ecc73c6d7d8b1845f65f5279)
[Fixup for Dunfell context]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../krb5/krb5/CVE-2021-36222.patch            | 121 ++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.1.bb  |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
new file mode 100644
index 0000000000..fe871cecb3
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
+ kdc/kdc_preauth_ec.c      |  3 ++-
+ tests/Makefile.in         |  1 +
+ tests/t_cve-2021-36222.py | 46 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 49 insertions(+), 1 deletion(-)
+ create mode 100644 src/tests/t_cve-2021-36222.py
+
+diff --git a/kdc/kdc_preauth_ec.c b/kdc/kdc_preauth_ec.c
+index 7e636b3f9..43a9902cc 100644
+--- a/kdc/kdc_preauth_ec.c
++++ b/kdc/kdc_preauth_ec.c
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
+diff --git a/tests/Makefile.in b/tests/Makefile.in
+index fc6fcc0c3..1a1938306 100644
+--- a/tests/Makefile.in
++++ b/tests/Makefile.in
+@@ -166,6 +166,7 @@ check-pytests: unlockiter s4u2self
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2012-1015.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2013-1416.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/t_cve-2013-1417.py $(PYTESTFLAGS)
++	$(RUNPYTEST) $(srcdir)/t_cve-2021-36222.py $(PYTESTFLAGS)
+ 	$(RM) au.log
+ 	$(RUNPYTEST) $(srcdir)/t_audit.py $(PYTESTFLAGS)
+ 	$(RUNPYTEST) $(srcdir)/jsonwalker.py -d $(srcdir)/au_dict.json \
+diff --git a/tests/t_cve-2021-36222.py b/tests/t_cve-2021-36222.py
+new file mode 100644
+index 000000000..57e04993b
+--- /dev/null
++++ b/tests/t_cve-2021-36222.py
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
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
index 6164c82480..ae58e2df35 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://etc/default/krb5-admin-server \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
+           file://CVE-2021-36222.patch \
 "
 SRC_URI[md5sum] = "417d654c72526ac51466e7fe84608878"
 SRC_URI[sha256sum] = "3706d7ec2eaa773e0e32d3a87bf742ebaecae7d064e190443a3acddfd8afb181"
-- 
2.25.1

