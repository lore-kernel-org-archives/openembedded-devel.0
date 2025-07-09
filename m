Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC5CC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 14:35:35 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.web10.17345.1752071731444343484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 07:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=LNL7zhPH;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=27886354c=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1752071731; x=1783607731;
  h=from:to:subject:message-id:mime-version:date;
  bh=E7XbNgjlqCF9LovzfOUaMH1MvYU8fFnqCVYoP2qKpP8=;
  b=LNL7zhPHpwFU40XTfHFNeweNQss2OK+yzPUL5QrydT48dQvF86Lgp90y
   bJdHHNW9T7CuacKZH/+4LJWcMgMXZrkYQFq9B5kElbbUEpAc25yHxENRm
   8Irv7xYH74oJRS+XRTRF9iP3vvAx/yEF10ZrwNuMdzQPtcYrENhIvCSG9
   WjeKzql7esDod1qr37ctibSn5fqopH0HcU34Wyv23ZbPVakt223MrhEBB
   URXAkEYgj9J47KBvndpJIJBYR2aMU0WJbr+LaejH+ZgiwAdGXk4dF+RFe
   kHnq8FhKu2sc1xkbl7Qva0dQopR4kFhbNZubGyS3UI56Tzx5yB78I5gr8
   A==;
X-CSE-ConnectionGUID: dVSVy++tQMS3vzHQTUV/bw==
X-CSE-MsgGUID: QPAY+K3bTYm1LsjLowCo+A==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:o5c8R6+Lj2DUUTugM5vmDrUDpXmTJUtcMsCJ2f8bNWPdYAtShnVHk
 jtMCC3fZaGVKn+1IIo1b5D1rB1Y6NKQjINT/DAc7nRsSn8MsZXebTjyBh6rZSjKd8fIRx444
 5hBNdPJdZ9pFyCM/E/yOLTt/Sgl3/rWSLOmVbXOa3h/SFBtQnp+2Bs9xuAyi9ZhiIPhCQnlV
 b/aqtXHPF6u0iJ1NWRT86GIs0wqp/X9vjoEo0YzDRxulAa2ey49UspEdcldVkfQQpVIBrz9A
 O/Cxfei4WLC5AwsBdXjmba8e0wQB+SMNFfXgSIHHvT9jxIH+nFv2+NqPqBMLBtdh2rTk94pm
 Y8ducSKCl+j1mXimPgBS0sfVCZ1JrUA46DGOmOksMOViUbGNGDtzPMpC0oteIQR8e18DG0Ts
 KJGJWBIMkjd1qfnyuuxD+dg3JUqJpawMY0SsSl68Fnl4Y0dreb+r9/ivpkAtAoYhtxSBaSZI
 MMYYHx0cxXbeAZONVFRA5J5leaywyX2LDMB9wLF4PBp6TWWkFx82/3kbYaKP9fTTskNlEjB+
 Wmd8zzEai32T+dzvwdpiFr3wLenoAv7RJ4KRvr//eRuxkaMx3cIExwZUx2wob6yhlb7AN9Sd
 hEa9nZr8PlppAn3F9TwGk3irHTB5URGANNbHuNn41vWkpe83+riPYRyc9I7QIdg7KcLbTw2y
 kfb2JTiHzgpq6KUUmmG97iS6ziyfiMZNSoPNHAKFVQOv5zu/tpvy07EQ90mQKPvh5itRTuqm
 znVpXNmjOhLsKY3O96AESb6b0iE/d6RJjMI2zg7fl5JzyspOIf9NtL05FbVvakbdY+SEVPc7
 ScJkJWXvbgDBp2EyHDUELQGEY/y6qfeOlUwo7LN87oJqm7xoS7zJei8xBkkeS+F5+5dIWeBj
 Hf74F0XvNkLeiP3McebWqrpY+wy16/sCN/5Yf7da9tKc/BZeRSOlM1UTRf4M1vFzg51z8nTB
 b/BKZzxVSlCWfw7pNaLb7x1PYEDl3lWKVz7FciTIySPidK2eHOTQLEZB1qCBshRxL+Eugjc7
 +FEPMKMzRhFOMWmCsUA2ddORbyiBSFT6aHe86S7RMbaSuZVMDhJ58vq/F8UU9cNc5K5NAv/1
 irVtkdwkDITjJBcQOmAQigLhLjHBf6ToZ+nVMCF0JnBN3ULOO6SAKkjm5QfcYccyv0gjuJNa
 sJeZdegO8hydHPN5GFIBXX9hNQKmBWDiQecNCW6OGJ5dJl6X0rF+9Lkek3k8yxm4iif7JN48
 +fmj1OdGMFZL+hhJJ++hPaHw163vGNbn/luUlHMK99fUEnt/YhubSf2i5fbJulVc02el2XDj
 Fz+7REwnNHkkswWq9P1tKXdi5yrN+xhNU0ZNjyOhVqxHWyAloa5+qdHSOuOcDXXWW/49anna
 ehLwvXUNPwcgE0MtJJxFbtux68y69bj4bhAwWxZ8G7jNgztWukmeynAhJIV3kFQ+oJkVcKNc
 hrn0rFn1X+hYasJzHZ5yNIZU9m+
IronPort-HdrOrdr: A9a23:sNwHV6oqi70tgbJdyj/Gm0UaV5sZL9V00zEX/kB9WHVpm62j5q
 eTdZEgvyMc5wx+ZJhNo7G90cq7MBfhHPxOkOss1N6ZNWGM1QfGEGgF1+vfKlbbakjDH4BmpM
 RdWpk7J+y1KnVByezewCWeLpIB7Z2q14qStd7ipk0dMj1CWuVO3kNfJzzeMmAefnghObMJUL
 Wsou1rnX6EVUs6S4CWIUZtZZm+m/T70L3WJTkqPVoC0ifLrR7A0s+DLzGomjguFxRj+/MHy0
 aAqirCj5/Tys2T+1vy5iv1wq4TvuDA5Ptlbfb88fQ9G3HCu0KOSb4kfYajkhAT5M+Cz3oRsO
 OkmWZbA+1Dr1zhOkaZm1/X9U3E/nIDzECK8y7kvVLT5fXjQjQ0EsxAgp8cXCf4xiMbzaFB+Z
 MO5nmesZVPCxPGgWDa3PjnEz9Xtmfcmwtdrccjy0VFV40QcblQqpFaxlpcFNMsED/z6IU8VM
 VoBqjnlYdrmWnxVQGqgoCq+q3eYkgO
X-Talos-CUID: 9a23:kliBU2A8z2Fqvkb6EyVZz3AFWYM5S1jml2nCA3aENFguQqLAHA==
X-Talos-MUID: 9a23:Rag2xQmJ+RtuoDtAS2n5dnpbDO5ZoIf1Anw8lMwioMugMjNbPHS02WE=
X-IronPort-AV: E=Sophos;i="6.16,298,1744063200"; 
   d="p7s'346?scan'346,208,346";a="120596132"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libp11: version bump 0.4.13 -> 0.4.16
Message-ID: <3c8dd1aa0e7a4abcbb93c151a7e671f1@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----6B979EB42204BF5FD30F3663E41DB10E"
Date: Wed,  9 Jul 2025 16:35:29 +0200 (CEST)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 14:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118351

This is an S/MIME signed message

------6B979EB42204BF5FD30F3663E41DB10E
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

This version comes with a pkcs11 provider called 'pkcs11prov'.
Configure modules directory for native build for the provider.

Signed-off-by: Denis Osterland-Heim <denis.osterland@diehl.com>
---
 .../libp11/{libp11_0.4.13.bb => libp11_0.4.16.bb}          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.13.bb => libp11_0.4.16.bb} (77%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb b/meta-oe/recipes-support/libp11/libp11_0.4.16.bb
similarity index 77%
rename from meta-oe/recipes-support/libp11/libp11_0.4.13.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.16.bb
index 807d079a05..0f62abbf96 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.16.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https"
 
-SRCREV = "6d669183c7b241ce47ecce28744837ad92814f5c"
+SRCREV = "b9c2de288833e38a391ee3cb106f965a40153629"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 
@@ -19,7 +19,10 @@ UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-static"
-EXTRA_OECONF:append:class-native = " --with-enginesdir=${RECIPE_SYSROOT_NATIVE}/usr/lib/engines-3"
+EXTRA_OECONF:append:class-native = "\
+    --with-enginesdir=${RECIPE_SYSROOT_NATIVE}/usr/lib/engines-3 \
+    --with-modulesdir=${RECIPE_SYSROOT_NATIVE}/usr/lib/ossl-modules \
+"
 
 do_install:append () {
     rm -rf ${D}${docdir}/${BPN}
-- 
2.47.2

------6B979EB42204BF5FD30F3663E41DB10E
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIXkgYJKoZIhvcNAQcCoIIXgzCCF38CAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgghPaMIIGpTCCBI2gAwIBAgIUPseeE9qJ+oSdbny5LvEHTpzUCAIw
DQYJKoZIhvcNAQELBQAwUzELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2ln
biBBRzEtMCsGA1UEAxMkU3dpc3NTaWduIFJTQSBTTUlNRSBSb290IENBIDIwMjIg
LSAxMB4XDTI0MDUyODA4NDExMFoXDTM2MDUyODA4NDExMFowUjELMAkGA1UEBhMC
Q0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEsMCoGA1UEAwwjU3dpc3NTaWduIFJT
QSBTTUlNRSBNViBJQ0EgMjAyNCAtIDEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
ggIKAoICAQC6Dz+IfbUsaCl0cWcbnNS1BIaKrdka8ev1Kc1G6OCYH4PMtkZmC6Zo
nnh/Dl5bOuiH+pMq1fj4BSEkRYTuOGtsWelcf6UNA11KL//zh1enaaNayqqRaCSE
JTZH+JFb0UJWwO+qGVb1RfHnPXYrI6n8w1chCxL9AibzvsDPR6I37iUwiNo4p6Uo
aPNAmIncpDIGgTGodkOjjPPbGwYjg58eINT63rqMQASJxUnPPIa0gZRix0NY7A6U
z8Iv98RbbQy7ZEDvHdLFeVmzl/5TXKbQExfnEpyOjjifWoJ+FeKkEj4O9Ohd/2fg
HQ6Y+DYwLFbHZPTmDvHQoOSS//V2NBkdnGTsfIcziIH1hypFxR/hqexJ+Da7Z7uN
jBh2ligdXNHDGMeq640X2WVx0sfSZljxbeknrr3KFfzqfealPps1UI68Q+1iBLl/
Ep8aZeRmzwCK+ibAPQpKfbxsjd8cBe8FcXaOWU4DjP6YmYy0xMC4vHXr3ZgrHqL9
8D56InfiYbrBMZp1UKDSzlz/rjXWRmrXnsY5gFU705KWrJu2guSYCrc4InG3Pj+E
mPmE6Eosikk2wg90nYFxJDM/9dPJnyIw6IdkV6qdrv9h7VKrpLrl22qETWC4/Xfi
JU7YsY6HFKnpAElKu8t6rUnU5GcwgWjcB+zBfQD1Kt59jlLob2PcDwIDAQABo4IB
cDCCAWwwXAYIKwYBBQUHAQEEUDBOMEwGCCsGAQUFBzAChkBodHRwOi8vYWlhLnN3
aXNzc2lnbi5jaC9haXItNGE3ZjE3ODgtMjZiNS00OGVjLWE1NDctYzFjZDBiZjE3
YzNkMBIGA1UdEwEB/wQIMAYBAf8CAQAwQAYDVR0gBDkwNzAJBgdngQwBBQEBMAkG
B2eBDAEFAQIwCQYHZ4EMAQUBAzAIBgYEAI96AQMwCgYIYIV0AVkCAQswUQYDVR0f
BEowSDBGoESgQoZAaHR0cDovL2NybC5zd2lzc3NpZ24uY2gvY2RwLTNlZTU1ZmQ0
LTU5MzgtNDFlZS04MmRiLTMyMjNhY2VmNWMyMzATBgNVHSUEDDAKBggrBgEFBQcD
BDAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0OBBYEFL+0FkGip5/XTYUBCqFcvtvF0uWU
MB8GA1UdIwQYMBaAFMwurYmMg+NAoyVppeqSfdI3OsfGMA0GCSqGSIb3DQEBCwUA
A4ICAQBGpYYvkjNsVP7geKv1jY+KtUNmyx8vlCoOo8tZ5Cc76175ocrVs50lZit+
nHWXe9Lqnuu1fMo+0jEpgC9dqy6cCxAEgNH5kwbFxXFPHOB/kxMdWubZ1xwcOP2l
B4ns7Ps9RUGOIcpfuAp2KLYwavjO58g+6FVGhY3R6VAhmNRO6bHhz0wQRwKAZNo2
GMwYMmxW63mI4bz1JYvCSeZtqZhyxTMDOwEUDdYkxrz3g5gQUoMnrrak1kGRdpFB
Eefok8aK8ngfwwIgefNBF9BnzoRhlIVrm3//zboqShj4IXqMEUgScWNz2WTjqKaU
uhLk+MyynNqrbp6EeFZ0BPgA7AfVWevRf4OOCxrH6S4FJtMKmuczZ0wqebTML7Ax
VtkSqeT7/NBDTh8D8j+HVvHwMi4s+cunS3DMdXE9yzuixlcjfsD/2aS17quE23Qf
nNESdDy5TUs5Wlm1ClYQ+L1cZGwSwAyqMs9RNg57+gtJu5Uhjn+FGVLndGQgzIor
/+ynq6KEzN2rhGzLpPHpwUdDoX+YnNlrZpdx/IOgknaSGznJ/mQzA6PjffNS0Fx3
pqd41QO0uX5HWDFEa/gG0Uo7faymzXFcFb9AKCrKR5Xrd0W+f2U2z/hvC843i9q2
8CoJ7xRMt0wF8Sun9U278iaLgPNNyCNDJorz9NmIomvT45XK7jCCBe4wggPWoAMC
AQICEACzBRGxFrSgVlEdfGgfh30wDQYJKoZIhvcNAQELBQAwRTELMAkGA1UEBhMC
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
bIRutw/gmkT7b9aP2Wmm3PtjnasrM+RdDlfGKqHkeCR2zkeRDDP2BE2LKc9CFGJB
PysNjZSVlp5/fxb8atVwVk+TphIHuHjeP+3z/ykiDr64Yq2yjyNlXrWVg2yxju4M
LdX8wfkCx/uAIlYLACinK+/RATAYz1f3Y+kJ81CQbfFpnFZBRhxjDfj65zxMrWsJ
ydnoGsZUHt7zXFOQvw7JrFL/X5s7hBv/3uy107vBwcA8Hyw9m3DH/ChBMen6gyy+
CkNXalP9AOZ66CoEgIE8PfsrzfBVjVxQq2+iQLNlJ8a1r6URPNd5h1YZILBy6yTK
8tUs5MbM2CjbXAylEC1P02GFKhh/aN0gW5RTRk3vpA64KPQ/ckvUTmHVWONUE9cj
iE1/MVDuc+tMfQus2HBQ0LH+EKaVZmsA1OEKujelRFleMEpBBWS0fQ+zT2Y4bfPZ
RB5iQLGLf9hSacG+ib5cid44OL6s9kjzE5+Yy70LNcoHwIaQzqoc6t7sFNVDecMc
tTbrs+raTu/cOMSc45aEDKXjhYw46cyuLwnY9DauweK3K89jUrCNqNqPwQke6QID
AQABo4ICCzCCAgcwgbIGCCsGAQUFBwEBBIGlMIGiMEwGCCsGAQUFBzAChkBodHRw
Oi8vYWlhLnN3aXNzc2lnbi5jaC9haXItMjZhNzFjMDktNDdlYi00NTVhLTliMjgt
NGJkNzJkZjA5MjhkMFIGCCsGAQUFBzABhkZodHRwOi8vb2NzcC5zd2lzc3NpZ24u
Y2gvc2lnbi9vY3MtYWFjY2NlZDUtNjZlOC00MDY5LTliMWItZmQyOWFiNzNlZmVj
MHIGA1UdIARrMGkwCQYHZ4EMAQUBATAIBgYEAI96AQMwUgYIYIV0AVkCAQswRjBE
BggrBgEFBQcCARY4aHR0cHM6Ly9yZXBvc2l0b3J5LnN3aXNzc2lnbi5jb20vU3dp
c3NTaWduX0NQU19TTUlNRS5wZGYwUQYDVR0fBEowSDBGoESgQoZAaHR0cDovL2Ny
bC5zd2lzc3NpZ24uY2gvY2RwLWU5N2YwN2M0LWU2MzQtNGNlYy04ZTJhLTA0YjIw
YTdhMzBjNTATBgNVHSUEDDAKBggrBgEFBQcDBDAOBgNVHQ8BAf8EBAMCBaAwJAYD
VR0RBB0wG4EZZGVuaXMub3N0ZXJsYW5kQGRpZWhsLmNvbTAdBgNVHQ4EFgQUcDNC
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

------6B979EB42204BF5FD30F3663E41DB10E--


