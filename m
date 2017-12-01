Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id B71B171AD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 14:47:10 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id v41so6376148plg.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=na5s5Tbg9KA2dRpSzA+wUrcJ7Yj3ogJ7lzar4qnFZWg=;
	b=eeR4sUT2/JP3RoYTWRHm5yzPItuZFNo989oFEIxpHZZWZeMuv9gjIiVNvWiacaZkf2
	xYUSoGTmKxndW9xg+btaSr4yTWLd/WchzE7JBSpCQEbk6WfSYqrluuwXCr28QEKOwThi
	qchrjC6OOxYh93TJk6fa74yRYJZmbv11Du+D5AQaUMTpP1lcOpyQVQfRFVRGjC2Cg21a
	JzVMoe+QalY40Fxw171ZsjtGZFVCRcfmhwjRq8vmXv+Fy0zSydfDQCDchjOW0XuEp7vh
	P4ItnlTTAdVML65ZLt7pZpsPF0SS1HksfFHsk7aJh4Sp8Fz1pyZTXuKT7dW6PuIyGI/b
	8D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=na5s5Tbg9KA2dRpSzA+wUrcJ7Yj3ogJ7lzar4qnFZWg=;
	b=D9qCCke2wxw/q8LWfL3JsFcpugfUOapjiuZf/5TrDCwZ5oBsSGdTQ2TgMhhN944Rop
	cUib5XUMR4k9kJhfzhinc9fQXyTPRTahZyoJZycXgs3hX6r1vGzHly/5aRt3yI8F2OZG
	38Kw0lSM7fYSseyl/SBwWtQEJMPKcSF2dpvh7brzVQIQhPtqMKjEkr4VDaIus4lsg89T
	Bb+2CJRBcYDpcqfRbnMxclWj8iUtHZ90UVuy/d7gpqBH17Afsfb5LP+oszJoRDHAAzJZ
	OrxBMYyECMEevIGgM7juOZBdPryQMc55WnnPnfZyL9GYJU4AlWjpoiI8p/3b8oF1IwnK
	J35w==
X-Gm-Message-State: AJaThX52moQuCxmpDTVmOChXIeWCZOyaWNqaLGTS4vYoGv6tBNPqfnd5
	8UEdWCAH59x5H2vFv9y3l5Z8LA83iFpuUaiSmcg=
X-Google-Smtp-Source: AGs4zMbfi3o0X9CnpIy+B5OKhZIgVUD8AAXx8+XIXjF78zr+BdB0A/+/Um0pW9MOPRFqUzBD0iBKiC4J2juRgCJwQYo=
X-Received: by 10.84.197.35 with SMTP id m32mr6346323pld.255.1512139631697;
	Fri, 01 Dec 2017 06:47:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Fri, 1 Dec 2017 06:46:41 -0800 (PST)
In-Reply-To: <1512125321-16818-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1512125321-16818-1-git-send-email-s.mueller-klieser@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2017 06:46:41 -0800
Message-ID: <CAMKF1sq_bpdNvfeSB_kGEJEZcvTsLdPvdj907MeUdyf0mQHz=A@mail.gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dfu-utils-native: fix do_deploy sstate handling
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
X-List-Received-Date: Fri, 01 Dec 2017 14:47:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2017 at 2:48 AM, Stefan M=C3=BCller-Klieser
<s.mueller-klieser@phytec.de> wrote:
> We need to install to the sstate input dir and not the output dir, so
> sstate handling will work correctly.
>

how can we validate this fix ? do you have steps

> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
> ---
>  meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb b/me=
ta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
> index 7a7a662..aeca23b 100644
> --- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
> +++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
> @@ -8,9 +8,8 @@ SRC_URI +=3D "file://0001-Revert-Makefile.am-Drop-static-=
dfu-util.patch"
>
>  do_deploy[sstate-outputdirs] =3D "${DEPLOY_DIR_TOOLS}"
>  do_deploy() {
> -    install -d ${DEPLOY_DIR_TOOLS}
> -    install -m 0755 src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${P=
V}
> -    rm -f ${DEPLOY_DIR_TOOLS}/dfu-util
> -    ln -sf ./dfu-util-${PV} ${DEPLOY_DIR_TOOLS}/dfu-util
> +    install -m 0755 src/dfu-util_static ${DEPLOYDIR}/dfu-util-${PV}
> +    rm -f ${DEPLOYDIR}/dfu-util
> +    ln -sf ./dfu-util-${PV} ${DEPLOYDIR}/dfu-util
>  }
>  addtask deploy before do_package after do_install
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

