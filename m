Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6203.1794553751671612087
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 23:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=d6Fjt8RN;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout05.t-online.de (Postfix) with SMTP id 5DE832A6E
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 08:09:09 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRlPF-2cQxBQ0; Fri, 13 Nov 2026 08:09:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh: fetch 0.12.2 from the stable-0.12 branch
Date: Fri, 13 Nov 2026 08:08:59 +0100
Message-ID: <20261113070859.2481642-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794553745-017F987C-E179611F/0/0 CLEAN NORMAL
X-TOI-MSGID: 59f255eb-209e-441b-b914-bf63c44249e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794553749; i=f_l_k@t-online.de;
	bh=cwIsCQw7mYz8KuIPjmH4ElsIBxrLhKQTxWlWJLtE5Z4=;
	h=From:To:Subject:Date;
	b=d6Fjt8RNOAExTaRdDYUdalgzlMIh4vKK0qGJC4ADsmquUftaKk3DdzCkAvgkEdoPh
	 ykxp0ps48lu9tZ9QsDUnPg3WkikMTNAFuwC2VcZczi2r4Y5g9jhU8/Py9/jBBxtLLR
	 0rkNh4A5lyXfptvaoAqdiQcfD2+4+fSf2AjZcj339BfWBFHv/BJcRs8DXb2iwacceQ
	 XwC1cWZL48sMqhQ1AJY3Ho4yPOSqv8a6snI4tKbHj1aTnUqlPk0ymeUuI5u8WeVK1i
	 czdPy2fb/dE0b1tOWUMKVVxwcQD4ysQNNXyttDmPhh1SPSoeCsdgm3vzWh0lMuTKFm
	 s+0IySN6vbTEw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 07:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132225
Content-Type: text/plain; charset="utf-8"

The libssh-0.12.2 tag is on stable-0.12, not on stable-0.11, so the
fetcher could not find the revision on the given branch. Tested by
building libssh for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/libssh/libssh_0.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.12.2.bb b/meta-oe/re=
cipes-support/libssh/libssh_0.12.2.bb
index 0aaeaf2a0a..7126559901 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.12.2.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.12.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddabb4958b830e5=
df11d2b0ed8ea255a0"
=20
 DEPENDS =3D "zlib openssl"
=20
-SRC_URI =3D "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;b=
ranch=3Dstable-0.11;tag=3D${BPN}-${PV} \
+SRC_URI =3D "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;b=
ranch=3Dstable-0.12;tag=3D${BPN}-${PV} \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-comma=
nds.patch \
            file://run-ptest \
           "
--=20
2.56.0

