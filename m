Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 929ED6012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 02:13:51 +0000 (UTC)
Received: by ykba77 with SMTP id a77so179671204ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2015 18:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:references:content-type:in-reply-to:message-id:date:to
	:content-transfer-encoding:mime-version;
	bh=nn1JKdVeN/8yOgWj32oydHMz6dixUsLgAjutSAJJInk=;
	b=iA0zKNOBY8ubbV6myYz/akHhfKcmojDp/sluLfLfqBe28S8BmlCvZet4SWio63Ueqd
	m6FwHAqwOkFjA3OUkb2Eg30TrX43MT3SYwM+qzOEyZ+oT0bEui2FHyYMQR1ACmDImJxn
	quAlVpra2oXxm4POSGgNSmY03q3Fl0QdqRx3Ym8SScaSxzrBmoOFmw5/+xTHStILPfiN
	YKLDk/0idk1ecbbIFGFKIq/Lg8iMBi1tIlYmvomXJTAfGOkoBKift1ajfLgpsFlPKkBT
	xeF46KxFphGfihmrraHmGjpZC+BGJfaVLn5k91PdyrZObC3G2XqA3D+K/ES0kdE2r+Dm
	mWqA==
X-Received: by 10.129.103.85 with SMTP id b82mr23017821ywc.197.1449454431932; 
	Sun, 06 Dec 2015 18:13:51 -0800 (PST)
Received: from [192.168.1.115] (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by smtp.gmail.com with ESMTPSA id
	l23sm17410481ywb.26.2015.12.06.18.13.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Dec 2015 18:13:51 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
References: <1449449949-9463-1-git-send-email-obi@opendreambox.org>
X-Mailer: iPad Mail (13B143)
In-Reply-To: <1449449949-9463-1-git-send-email-obi@opendreambox.org>
Message-Id: <BAF36F5B-C2CD-4F61-B1B4-20115B34FB6C@gmail.com>
Date: Sun, 6 Dec 2015 18:13:55 -0800
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (1.0)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-monotonic: new recipe, version 0.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Dec 2015 02:13:51 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This recipe has unmet dependencies:
import crypts
import ctypes.util
import os
import platform
import re
import sys
import time
--Tim

> On Dec 6, 2015, at 4:59 PM, Andreas Oberritter <obi@opendreambox.org> wrot=
e:
>=20
> On Python 3.3 or newer, monotonic will be an alias of time.monotonic
> from the standard library. On older versions, it will fall back to
> an equivalent implementation.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> Tested on fido.
>=20
> meta-python/recipes-devtools/python/python-monotonic_0.4.bb | 8 ++++++++
> 1 file changed, 8 insertions(+)
> create mode 100644 meta-python/recipes-devtools/python/python-monotonic_0.=
4.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb b=
/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
> new file mode 100644
> index 0000000..3583a7e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
> @@ -0,0 +1,8 @@
> +SUMMARY =3D "An implementation of time.monotonic() for Python 2.0 through=
 3.2"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d803=
14"
> +
> +SRC_URI[md5sum] =3D "1919cc3aff2a1b907fe24c1f801343ef"
> +SRC_URI[sha256sum] =3D "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c5=
0570ee8a0592ab6"
> +
> +inherit pypi
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

