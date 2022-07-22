Return-Path: <mgrosshauser@gmx.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D665C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 19:39:58 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web09.12120.1658518797200835886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 12:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=HFjTo5kB;
 spf=pass (domain: gmx.net, ip: 212.227.17.21, mailfrom: mgrosshauser@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1658518794;
	bh=h3UBHY9ca+qZuL4LxDeWWg7Yhju5PRaZRqqul9neocM=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=HFjTo5kBBsEZ2eFvIqsJaaecYE9Jt6HkaihRwew2GJxjqOnkHclv85E+cHDXfeXjj
	 UAPMhC970aEOHx2EJO3Mk+l0C5dNYqFNrb+PjiywNTeUEve5D6nKEuGZRz1OvA4kjX
	 7tmDTEZfbSDLsjTkH0R48yEqWoWSzfIEQ/yip0AI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.200.100] ([80.109.177.11]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzuB-1neFlt2e47-00dah8; Fri, 22
 Jul 2022 21:39:54 +0200
Message-ID: <9b5881cf-15b1-b401-c6bd-5f9232fd0d4c@gmx.net>
Date: Fri, 22 Jul 2022 21:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?Q?Martin_Gro=c3=9fhauser?= <mgrosshauser@gmx.net>
From: =?UTF-8?Q?Martin_Gro=c3=9fhauser?= <mgrosshauser@gmx.net>
Subject: [meta-python][PATCH] Add runtime dependencies for python3-supervisor
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ywZLaKAPN+tEaZIR94wzSOJsEL6T9KAiZvpGIICnh3CoFi/Pmnq
 /3orX6qDmOYTpAloXYGuVMEcYq1affSncmLQErYch+GJ9lbHkAsEe/WX9KLHGK2eIcgZ+Au
 JO2XsIAtzYAhznHzazu3dQnO3f3X2bTnj3dnIQtnrnlY3qwf0aLIfylOw9ibsaj//W8ffvD
 t69GP09YNE3TuKSNXlfdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bYQgFsuknqU=:pyMWipfpHVBJz5J1A0OsQl
 A25t1ZTKy7YRynIKLjEO8Z0LAov1RMVCl6+LY+c9npP2JLHAbEssPWDIFmlXjCSFWLUHdRPGv
 02SEC7dyCvPMgwcOvZr8PxJt5hg47MXN0lch6ykoD2aT7r7h+dbEI9mwzhVYgN9MrIsbAqI86
 13WGDnwdZPpHBOPx+33wRZGk+pxjaXZH5fyVWP7SVJbD/K1tm26pgzxFucEfV6c4x5ijYCNsx
 MevPPRjwJn0N4JXzU6Hj0mCZ0rblET6Yh+rqqaNA2iDWHzbo9T8rTCXFQ/r3KctEM4WszaNY4
 UguRaeu089KBGr9eVAaXMtM7kBftnHAURsz2fpsvyXgcoeeg9xaMkUvh56PGAeXrP6lG6VNto
 NDlsOBGE0l7PayhS84tWYLHk1mfAfci97RatGEzsY97rNlhGMqOTDfPYnQ0EZxgca2N2V2Eh9
 xxgOz49H2n8uqG8nA6M5xPkvE/qgGB4jrrNJtQprMlq+V4+TifZXuexgwrCBT/769/W20xKGc
 HBsYKwwmmlzwMNmXmkg8+KSSlsdF4vKJYkGaHAXGfGJ0zcQ7JYOzHpgthjavNTxiKuFGZH5j6
 nb8q7+op0tqGXuburkdfoQst7Ziy8Fvos/ZzOUFOi/7CH9zhfbEUlCiot9kuXgEZqXach1Vuw
 1MkV8Tiuz4a3Yk1MJpWudC+ojqFAsrPpIpnluiNypyfCRrLrmzt+kKBkPl7jGonoz59cXlBrh
 AcmGBLGlxSMRTTsQYxz4yKOCBJBPMkLiVuIAhXPC2mk+7SifslrmLs8ltBP/pZX6/kZXGazoE
 GpIymr7McfKq4ETa0aQ/tII/3LopeGZ4fPcceyNlISVPSDo+7MWLXSsu4F5Ki+wN7hO/l8MyH
 PjjW1jnBwCqfSQWgOzIp7lcSBH5V7UwOt7RZOa5FfCLtq39ls3yeI2wJd4KxFMGzLp/dZXwaX
 ehx6XCpCz5/DiPK6msSk+Z3JG8JBPKLLIQ20MTgZ/DxAHjpSx0qOLNpNn+iy9zO5+Zknht3BL
 8RqVdyo8qA2qk3q8NVEy5kj3jBRYK+/NEybhSOPjeqzhsDjOlH66Y9+F4kJMP2DctpAoHy8S6
 fpP8O5MG8NV91teF9HXvvwGs+HWmZpk/DE7QbBESaM03z++c0gZ9grgGw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 19:39:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97956

Running supervisord without these fails with import errors. smtpd might lo=
ok strange, but provides required asynchat.py.
=2D--
  .../recipes-devtools/python/python3-supervisor_4.2.4.bb      | 5 +++++
  1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.=
bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
index fdd8a76cf..7da29e39b 100644
=2D-- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
@@ -13,6 +13,11 @@ PYPI_PACKAGE =3D "supervisor"
  inherit pypi systemd setuptools3
  RDEPENDS:${PN} =3D "\
      ${PYTHON_PN}-meld3 \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-xmlrpc \
+    ${PYTHON_PN}-resource \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-smtpd \
  "

  SRC_URI +=3D "file://supervisord.conf \
=2D-
2.25.1


