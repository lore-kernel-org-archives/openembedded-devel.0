Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S4pCm-0004oE-P0
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 08:53:08 +0100
Received: by lagw12 with SMTP id w12so5913321lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2012 23:44:33 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.147.1 as permitted sender)
	client-ip=10.152.147.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.147.1 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.147.1])
	by 10.152.147.1 with SMTP id tg1mr21586085lab.22.1331019873279
	(num_hops = 1); Mon, 05 Mar 2012 23:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=saETZZ0kvPLoQjv3SIYZHhJ7Q3x7ihAvtcD3d7eMFW4=;
	b=COUn4mlzNPAyPX2/LGscuzBywCoP7ZMDDIAWfpx6s85EBLuHuIf0D+P0OxR8CoWS9w
	x6oSPyolG9NAGTzs5I1iamV6ODKoVYP18venaoKi1tYLLQtd4/L6akVFo5O4TFEUb4Cb
	yH7siIEoHfYjUx8lquVVor9jJkn6nP0ntL1K5cU/zVh9nnAyfg2EC/3eOOkBQUDEbVjS
	STWWDoKm6K5hz385xJ6EWtqKeWBoaXsYxHKAuzUTIgY2x6YlLlHAaP1TVPgmwVmbJ8H0
	8rzSXagim3ydPCck5OWA7FSLGTRnbXqgn68d9uqE/C/xghnJNs6LJgxuPtd1BXa2ts7+
	6gdw==
MIME-Version: 1.0
Received: by 10.152.147.1 with SMTP id tg1mr17634032lab.22.1331019873184; Mon,
	05 Mar 2012 23:44:33 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Mon, 5 Mar 2012 23:44:33 -0800 (PST)
In-Reply-To: <1330969051-9867-2-git-send-email-koen@dominion.thruhere.net>
References: <1330969051-9867-1-git-send-email-koen@dominion.thruhere.net>
	<1330969051-9867-2-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 6 Mar 2012 08:44:33 +0100
Message-ID: <CALbNGRTaEhMRFr2iCjwDSdioiYYfRTqC7Bg2+8jd1h__8icjbg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 2/3] systemd: update to latest git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 07:53:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 6:37 PM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> This is in preparation for the v44 release.
>
> * drop 2 patches that aren't needed anymore
> * fix more endianness problems
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> =A0.../0001-docs-fix-build-without-xsltproc.patch =A0 =A0 | =A0 41 ------=
--------------
> =A0.../0001-systemd-journald-fix-endianess-bug.patch =A0| =A0 29 --------=
------
> =A0meta-oe/recipes-core/systemd/systemd_git.bb =A0 =A0 =A0 =A0| =A0 13 ++=
+---
> =A03 files changed, 6 insertions(+), 77 deletions(-)
> =A0delete mode 100644 meta-oe/recipes-core/systemd/systemd/0001-docs-fix-=
build-without-xsltproc.patch
> =A0delete mode 100644 meta-oe/recipes-core/systemd/systemd/0001-systemd-j=
ournald-fix-endianess-bug.patch
>
I wanted to give this a try. From scratch I get

| configure: error: Package requirements ( libkmod >=3D 5 ) were not met:
|
| No package 'libkmod' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables KMOD_CFLAGS
| and KMOD_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| ERROR: oe_runconf failed
NOTE: package systemd-git-r20: task do_configure: Failed

Cheers

Andreas


