Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A33860124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 17:57:21 +0000 (UTC)
Received: by lbbcs9 with SMTP id cs9so70512414lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2015 09:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3L4oyHD06NTe2br8bGjZPZfuvdO2ptYxb8uOrKL+s/s=;
	b=fSyVoz5vLKpTdPYRKWs2t/jBfFzlcU6r9DlxmZaEkiEEMt9NouPrUP5k2a/5N/kDjq
	rZFo8bP1ETJL2JOA5SKlEGEnsJUt+VE8aDNyx/ZohTwBw36WUIRybgeAPVDzDRNiNoKX
	G5/iMguciH6Laqg9XgqhR4c267vq8nS9iq/mzf46Mzy8cBgerNCyomQLdXny/omNuATo
	/Y8a+iwQrgTWShY5y9BGRZznkgp8c/oPoC2IbCQNDOAeYDiTy5bzBqqslcC/yqnUxnvA
	WdJ9lDWacYnpcoEeg5X+SZFY9TOI42NWhqy5v7zaFl4oiZ03n1TSeUFu09XLVWgdwjVQ
	MwFA==
MIME-Version: 1.0
X-Received: by 10.112.181.102 with SMTP id dv6mr5387110lbc.18.1449511042040;
	Mon, 07 Dec 2015 09:57:22 -0800 (PST)
Received: by 10.25.199.73 with HTTP; Mon, 7 Dec 2015 09:57:21 -0800 (PST)
In-Reply-To: <56655963.9010302@opendreambox.org>
References: <1449449949-9463-1-git-send-email-obi@opendreambox.org>
	<BAF36F5B-C2CD-4F61-B1B4-20115B34FB6C@gmail.com>
	<56655963.9010302@opendreambox.org>
Date: Mon, 7 Dec 2015 09:57:21 -0800
Message-ID: <CANx9H-DR-kiuHu9G=bA4ZDU4Y8muExJULpLLMaaoe6SjpUR9Yw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 07 Dec 2015 17:57:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 2:03 AM, Andreas Oberritter <obi@opendreambox.org>
wrote:

> On 07.12.2015 03:13, Tim Orling wrote:
> > This recipe has unmet dependencies:
>
> Sorry, I mistakenly assumed all of them were part of python-core.
>
> > import crypts
>
> It's "ctypes".
>
Stupid tablet auto-correct ;)

>
> > import ctypes.util
> > import os
> > import platform
> > import re
> > import sys
> > import time
>
> I'll send v2 adding python-ctypes and python-re as runtime dependencies.
>
> Thank you!

> Regards,
> Andreas
>
> > --Tim
> >
> >> On Dec 6, 2015, at 4:59 PM, Andreas Oberritter <obi@opendreambox.org>
> wrote:
> >>
> >> On Python 3.3 or newer, monotonic will be an alias of time.monotonic
> >> from the standard library. On older versions, it will fall back to
> >> an equivalent implementation.
> >>
> >> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >> ---
> >> Tested on fido.
> >>
> >> meta-python/recipes-devtools/python/python-monotonic_0.4.bb | 8
> ++++++++
> >> 1 file changed, 8 insertions(+)
> >> create mode 100644 meta-python/recipes-devtools/python/
> python-monotonic_0.4.bb
> >>
> >> diff --git a/meta-python/recipes-devtools/python/
> python-monotonic_0.4.bb b/meta-python/recipes-devtools/python/
> python-monotonic_0.4.bb
> >> new file mode 100644
> >> index 0000000..3583a7e
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
> >> @@ -0,0 +1,8 @@
> >> +SUMMARY = "An implementation of time.monotonic() for Python 2.0
> through 3.2"
> >> +LICENSE = "Apache-2.0"
> >> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> >> +
> >> +SRC_URI[md5sum] = "1919cc3aff2a1b907fe24c1f801343ef"
> >> +SRC_URI[sha256sum] =
> "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c50570ee8a0592ab6"
> >> +
> >> +inherit pypi
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

