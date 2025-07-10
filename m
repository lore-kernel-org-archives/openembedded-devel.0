Return-Path: <denis.osterland@diehl.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26B8C83F1F
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 10:38:12 +0000 (UTC)
Received: from enterprise02.smtp.diehl.com (enterprise02.smtp.diehl.com [193.201.238.220])
 by mx.groups.io with SMTP id smtpd.web11.5520.1752143883192388673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 03:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@diehl.com header.s=default header.b=tc8lKRrS;
 spf=pass (domain: diehl.com, ip: 193.201.238.220, mailfrom: prvs=2790347bc=denis.osterland@diehl.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1752143883; x=1783679883;
  h=from:to:cc:subject:message-id:mime-version:date;
  bh=gcx3qs4H1fSefqCkdiWzs37eQIXOogtuAaFAghb8W98=;
  b=tc8lKRrSeQORnEP0l6ihPTPgJkx9iu0xCikGQsjS34zPjH0Ld+f+rP+J
   iWK4ipsK0oODdw9/Iuhb+eXazfyDvVlEsjN7OZz2T/72KX2bmtw8WwTEF
   VZCKfDjr1AC7TyGcwHDC4EoGFHJ+pjIz9FIGpFaGlrhc5lGYCqFc+PO3d
   tjKcbJhvLYZfLCu7DYc86qPnAUfF9ajRrfo9fBcnfDwES0/bAIBNnMvq6
   aIUugpVeNi9f4b5+FsxNLl8tiIdpgi6DHr3NPc42R+hcPH50bDzwot3T4
   gTXnGe9HWAXf77Rzt7nIUyTTk52Gi+qA1E5dP/BZFTmxajaE30FYjE6pu
   Q==;
X-CSE-ConnectionGUID: tQJs4I7ARhaY9KXrh1OC6Q==
X-CSE-MsgGUID: gmwQVgJqTVaBklr3H4EGpA==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:n2o3yqKRZqUgWoitFE+R4JIlxSXFcZb7ZxGr2PjLsTHJhXpii2xUn
 yZGBjeZcuLKOTG2fMQ1MdropA5D+8PleuQTC1818HwrVy1RwSauLYqTdUuqMnPKcpSZFElp5
 p1GZteQfZlrHnGFqkr9bOPvpygkiazZTOqiV+KUaikoHFY+Enh8ghg/w7Uy3Ndm34PR72+ls
 Mvqp8zUMUOk3DgzKmEf8P3GsxJguv3upSkV1rAbTakjUAj2ySFOXPrzXJ2ZL2fkWtsTWee7T
 qDY07Ci5XjY8BFrAdPim7fhNxdUS+GLNlDfzyYJVqLn3kUfr2lj2PxrcaYWZRgNhzvRzoohx
 I139sQ6oc8HPrHQgLZaFB5TCDk4JrJH46TcIHe598eTiFbHfH2rxP51SUg/NoYT9+oqRD8Q+
 KxddGhTP1XSjbu8hby3ELhljJt4IcfmN9sFhxlcIUri4YAbrerrGOOSjeJw3CssnpIJWv/fb
 owCdjt0dw/BbBsJMVdQAZMk2buh2XemLG0I7QjLr/dyvzjex0l4jeSyddGMcdDST8sMwU3Dq
 jr7l1gVeSr2QuFzsxLetCrEu8fPgT/jCsVVH6e8sOV1gUaI3W0cDlsdVRywreH80UOzBo9RJ
 xBRp3t1/e1urUGmC4mnUxf9+yTe5RcXVtQNGLdhsDzl9kav2OrvO4R+ZmUHMLQbnM8qWSR4k
 RiChdevHiNuq6aOSH2bsLyU6ji+IW0YfDAMPXAPEU4IvYK/5d04gxmKHts5Gevt0tevQTivy
 mvSp3Vmut0vYbUwO9OGESrv2HT0zqX0czPZxjk7f0qv5VgmOdWsbtGjuQmGsfhNJtqQEVXQ5
 ykOwsTFvLkDUM3UxH2GTdtWEeDy7Z5pEtF+bX1HQsN9rWT9oxZPWagKvVmS8W8wap5slQfBO
 RGV4UUJoscOYBNGVIcvC6qpEcMm0KP8ItrsU/HQf7Jmb4N4HOO91HgGiXW4gSa0ziDArYllY
 c3GKZn1VS5DYUha5GHeq9k1gOZDKh8WlTu7qaDTl3yPzbeYbXiJfrYJWHPmRvw59q6NvDLO+
 N9ZMcaQoz0HOAEpSnCKmWK7BQliwUkTXfgameQOHgKwClMO9FUaNhPk6ehJl7qJPUhivrygE
 nmVAie0wbdk7JHNAV3ihntLMNsDUXvjxJ6S0ONF0VuAghAejYiTAKg3a6IVZuUGq8VZzfdFH
 to1YcXZJd8Rc2GSk9gdRcGVQI1KeBG5jg2RZ3Djaz8lZ9hsRgHJ/pnveQ6HGCsmV3Lx5ZF4+
 u3mj1iBKXYAb10K4ML+ZP+pzkj3umMBlfh2Vk3ECtVSdUXotoNtLkQdi9dueZlSeUuZmWDyO
 wC+DhIHnNfCgZYJztDjhqSe9Kf1PsRmNx8Pd4XcxfPsXcXAxUK5yI0GU+aFeBjSUWr1/OOpY
 uA95/bkPfsKmVxHv4ZxH/NnwLwz4/PrpqRG1UJjBHjNYlGhB79sL3XA2tNA3pCh3ZcA4U3mA
 ATWqp8DYu/h1N7ZLWP97TENNoyrvcz4UBGLhRjpCC0WPBNKwYc=
IronPort-HdrOrdr: A9a23:DEHY56uwkWEBsl+s0CLBe4Df7skD7dV00zEX/kB9WHVpm62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGSLhILBFupfBODZsl7d8kPFl9J15O
 NbXIVVTPXoFDFB/LrHCAnTKadc/PC3tJqGqM2b5VFXdi1OQ5xBySA8KivzKDwMeOFFb6BJa6
 Z1MKB81kSdkXd8VLXLOpEcNdKzw+EiDPjdEGY77xhM0njosRqYrITUPjK/xRkkXzZG0d4ZgB
 L4e1yQ3NTEjxmjoCWsrlPu0w==
X-Talos-CUID: 9a23:bAuQNW5G+XwszhWYWNss6Hc2AZwELVTnzH7hcmyIE2Ywb5bLcArF
X-Talos-MUID: 9a23:zOcWygYfvqIgJ+BTuDrzvQ9tFt5U3a2EC0QXyrValuacHHkl
X-IronPort-AV: E=Sophos;i="6.16,300,1744063200"; 
   d="p7s'346?scan'346,208,346";a="120686273"
From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [oe] [meta-oe] [PATCH v2] libp11: version bump 0.4.13 -> 0.4.16
Message-ID: <3f38d9736d7e41d6a9072981898fceef@diehl.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----4D53A0AD8205C6CEEE3B29670BF1B626"
Date: Thu, 10 Jul 2025 12:38:01 +0200 (CEST)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 10:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118406

This is an S/MIME signed message

------4D53A0AD8205C6CEEE3B29670BF1B626
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

This version comes with a pkcs11 provider called 'pkcs11prov'.
Configure modules directory for native build for the provider.
Install provider to target.

Signed-off-by: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
---
v1 -> v2:
 add provider to FILES

 .../{libp11_0.4.13.bb => libp11_0.4.16.bb}      | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.13.bb => libp11_0.4.16.bb} (60%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb b/meta-oe/recipes-support/libp11/libp11_0.4.16.bb
similarity index 60%
rename from meta-oe/recipes-support/libp11/libp11_0.4.13.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.16.bb
index 807d079a05..2bd589be8a 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.13.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.16.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https"
 
-SRCREV = "6d669183c7b241ce47ecce28744837ad92814f5c"
+SRCREV = "b9c2de288833e38a391ee3cb106f965a40153629"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 
@@ -19,13 +19,22 @@ UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-static"
-EXTRA_OECONF:append:class-native = " --with-enginesdir=${RECIPE_SYSROOT_NATIVE}/usr/lib/engines-3"
+EXTRA_OECONF:append:class-native = "\
+    --with-enginesdir=${RECIPE_SYSROOT_NATIVE}/usr/lib/engines-3 \
+    --with-modulesdir=${RECIPE_SYSROOT_NATIVE}/usr/lib/ossl-modules \
+"
 
 do_install:append () {
     rm -rf ${D}${docdir}/${BPN}
 }
 
-FILES:${PN} += "${libdir}/engines*/pkcs11.so"
-FILES:${PN}-dev += "${libdir}/engines*/libpkcs11${SOLIBSDEV}"
+FILES:${PN} += "\
+    ${libdir}/engines*/pkcs11.so \
+    ${libdir}/ossl-modules/pkcs11prov.so \
+"
+FILES:${PN}-dev += "\
+    ${libdir}/engines*/libpkcs11${SOLIBSDEV} \
+    ${libdir}/ossl-modules/libpkcs11${SOLIBSDEV} \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.47.2

------4D53A0AD8205C6CEEE3B29670BF1B626
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

------4D53A0AD8205C6CEEE3B29670BF1B626--


