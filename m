Return-Path: <ghidoliemanuele@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BCAC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 07:52:08 +0000 (UTC)
Subject: Re: [meta-OE][scarthgap][PATCH 1/4] jq: Fix CVE-2026-43895
To: openembedded-devel@lists.openembedded.org
From: "Emanuele Ghidoli" <ghidoliemanuele@gmail.com>
X-Originating-Location: Milan, Lombardy, IT (87.5.153.198)
X-Originating-Platform: Linux Firefox 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 03 Aug 2026 00:52:03 -0700
References: <20260721093938.3983571-1-dkelaiya@cisco.com>
In-Reply-To: <20260721093938.3983571-1-dkelaiya@cisco.com>
Message-ID: <1187398.1785743523654423541@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="eWXIT6RKYWyW9DMrTZ0A"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 07:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128673

--eWXIT6RKYWyW9DMrTZ0A
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Our build fails unless I revert this patch.

The error is:

echo "NOT building parser.c!"
NOT building parser.c!
...
cc1: fatal error: src/parser.c: No such file or directory
compilation terminated.
make[2]: *** [Makefile:1051: src/parser.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory '/home/emanuele/tdx/oe/bsp7/build/tmp/work/corte=
xa55-tdx-linux/jq/1.7.1/build'
make[1]: *** [Makefile:1183: all-recursive] Error 1
make[1]: Leaving directory '/home/emanuele/tdx/oe/bsp7/build/tmp/work/corte=
xa55-tdx-linux/jq/1.7.1/build'
make: *** [Makefile:814: all] Error 2

Emanuele Ghidoli

--eWXIT6RKYWyW9DMrTZ0A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>Our build fails unless I revert this patch.</div>
<div>&nbsp;</div>
<div>The error is:</div>
<div>&nbsp;</div>
<div>echo "NOT building parser.c!"<br />NOT building parser.c!<br />...<br =
/>cc1: fatal error: src/parser.c: No such file or directory<br />compilatio=
n terminated.<br />make[2]: *** [Makefile:1051: src/parser.lo] Error 1<br /=
>make[2]: *** Waiting for unfinished jobs....<br />make[2]: Leaving directo=
ry '/home/emanuele/tdx/oe/bsp7/build/tmp/work/cortexa55-tdx-linux/jq/1.7.1/=
build'<br />make[1]: *** [Makefile:1183: all-recursive] Error 1<br />make[1=
]: Leaving directory '/home/emanuele/tdx/oe/bsp7/build/tmp/work/cortexa55-t=
dx-linux/jq/1.7.1/build'<br />make: *** [Makefile:814: all] Error 2</div>
<div>&nbsp;</div>
<div>Emanuele Ghidoli</div>

--eWXIT6RKYWyW9DMrTZ0A--

