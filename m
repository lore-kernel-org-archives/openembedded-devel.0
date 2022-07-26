Return-Path: <mgrosshauser@gmx.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F98C43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:17:53 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web09.5777.1658837867347407291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 05:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=jACh+A4W;
 spf=pass (domain: gmx.net, ip: 212.227.17.20, mailfrom: mgrosshauser@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1658837865;
	bh=Dnx7K2PmYqWgT8BsL2K4fo/EDkPLLk7v8TYSnfd1/Eg=;
	h=X-UI-Sender-Class:Date:To:From:Subject;
	b=jACh+A4W3gv4qNYELSuL6Gpc2AJZ5NmMIjekUMHRUrQLXmZFgvpdf3w0kCqtSCpSw
	 B8zgD1bHo7jDPE6pA+uH0T7RU/o+D41ciTOeI2F4Eqz9KVd+7/i6m66Zgbe0Y7IcvD
	 xS7LHLEhmHYAwnoqCQ68NMw7JMUW4BbGBqKPpI24=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.200.100] ([80.109.177.11]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1nX36b0vOm-010qqc for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 14:17:45 +0200
Message-ID: <6b440c19-dd64-b387-9b66-8ceb4f9cff82@gmx.net>
Date: Tue, 26 Jul 2022 14:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?Q?Martin_Gro=c3=9fhauser?= <mgrosshauser@gmx.net>
Subject: [meta-python][PATCH v2] Add runtime dependencies for
 python3-supervisor
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QV9j5ujgBlp2PT+WS+wNFWPNvSQ5urhQlqM7gQ+2+RJ5NJ2g6b8
 0iQQHKyDF4ppfS8J4toGL6CoKATWwowiIqHGNIpQyQaaLLqTDOwgu9gd3Xks+IeoD4vDXj0
 MO9/h0HouxHMFNraOgPepb1VF4a/PyapwEnneWPqB4yt369hMRh/zM9fRD4cJvJokoCb4uI
 SzCKlvxQ/6fvO23UQcN9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JeX8VG1pEXg=:TOqJZaN8kWgpDEh8ZyrIrC
 0BMDAHr+A8Xwvr+guuSKlXDlcBTFtoPJ0Yu88U4QK9JPj8k9SxyuS5ULqsQO+3DrU6ClimQuB
 Ggpu8dSMjFQxbZLF0/wC0U9BHAOg50+e1ul9Igl7uHdn7Pai4yxqRnP6y4FwcTaU2Z5vHAGHe
 IjKhyon+sdAzpLr/pvnYOMqCkiOpFodhbBqzCxsZisAsZtLY3aSTBVdnCuJXb/SavjGexZijC
 CT3LrkwrBOEfw3I41ohn34qXdC8pBX/szMlK2kPKi8DaV35l/bAjLJo9Pvm44x1MIUfv8PMOM
 DMoV02tapgJHRd6G6V460u9XCa1mpI86zuryzqc8+Ae4uBYVe3dM3XswEPkUeYFOOftxBsPKW
 RMgJVhSzyYuQ0P8o3U+zeAm15IOzZKMhEOH/7Ujx7N4z9bEZ9rdU6C/ZsqEv+NEPtmX9Gz5gG
 3kT998L4z4NlwQBQ0/7isWnlGV8ymvsF8xJYgQJQNVapXWyy8Nvr4ASA44TS++gLqOSae/hFA
 rFJM8XPhmR5VnwR2/7YRjzc7x4bF67R2134mQo82o4lW2m4hIJLjanYDMgRorzjX2avzhKsSL
 mGs/nG5kcFguAQRi6mXPSakooRSzBS9BLYQ8WfPXDm08GeVSFmr3AlPR5zc9zBiLMZrvRiYqI
 FiYCVhBWNMCPwqQ46X1YY12gm4OXtEx3YB6gS5valTzl+47PFc+9mixhnaCfappqrooblaHPx
 uQJqtnE5iHZaUS7L2eLFD5nM5DfPYfd+aLzdP1t8rdKxsyvZmici+OOsezVjeQz7cn38Etl3d
 NIbCovEeOF1j6Ggvmfiew5zfkfCT+XBQFZNGlubhgGvFW7OHGpbkANPD1/qj+BDRrGDUzbbMe
 lgdqdHPoDCzX2uUxMUwiP4j0/TQuRMTGkz6QPbIXGKAjCkA5PA3ZEORHctLyU4GlKJWyOJ5aw
 8wB9XvEv2nKugWT5TSOVI0Zcf29h/DbPp7azS4MqlbVsVSVSvyHW3w0hc6Ivej1aJyBcfeEzt
 HvpA0SDBPCPBGJUxSwT3Hu4qK7ORj/CXLp5JMERZhzrabmK4MM5WEFFnT0syF9zX0ZUI9ou/5
 s0gyHw623/6FHjwoVOROHhvCnOuXDpWb71AaWWVmrgbs1Asg2v7jY2iXA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 12:17:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97987

Running supervisord without these fails with import errors. smtpd might lo=
ok strange, but provides required asynchat.py.

Replaced PYTHON_PN with python3 as suggested in previous thread.
=2D--
  .../recipes-devtools/python/python3-supervisor_4.2.4.bb    | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.=
bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
index fdd8a76cf..d67707557 100644
=2D-- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
@@ -12,7 +12,12 @@ SRC_URI[sha256sum] =3D "40dc582ce1eec631c3df79420b187a6=
da276bbd68a4ec0a8f1f123ea61
  PYPI_PACKAGE =3D "supervisor"
  inherit pypi systemd setuptools3
  RDEPENDS:${PN} =3D "\
-    ${PYTHON_PN}-meld3 \
+    python3-meld3 \
+    python3-io \
+    python3-xmlrpc \
+    python3-resource \
+    python3-setuptools \
+    python3-smtpd \
  "

  SRC_URI +=3D "file://supervisord.conf \
=2D-
2.25.1


