Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.4288.1605275017681782318
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2020 05:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 797DB2000F
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 13:43:35 +0000 (UTC)
Date: Fri, 13 Nov 2020 14:43:33 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-mono] Build error on the latest version of mono.
Message-ID: <20201113144333.64d57b47@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

Got this error when trying to build mono:
| ./include/private/gc_atomic_ops.h:105:11: fatal error: atomic_ops.h: No
such file or directory=20
|   105 | # include "atomic_ops.h"

I am on Dunfell version of OE.
The last commit bring this error:
89f6d12 (HEAD -> dunfell, origin/dunfell) mono: add support for mono-6.10.0=
.104

I have never dive into mono building, could someone give me a hint to solve
that issue.

Regards,

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
