Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id AAA137199E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jan 2017 21:17:34 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id 96so97624849uaq.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jan 2017 13:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=XoZLSWnKBQ2XUhxXRhxB+/bwt389wckIR/IOrNtyzZM=;
	b=QOh9RhNZMfXN2/sNW8gmIROmWAglAe8dGX/gbDuGrbXgh25qOMSvmavkEd4OVLwttu
	0cjC7WpPSXnkK3VE8Cpl5sn8GKYD0ynCe0nOQrT8zrp0K0qPr5kUPyas1nDFNyQr9cqm
	RF2JZY2MvkTMkVPt7wZAKgXTFfU1L+Epnmp7fnfV96A16Dpjz7hACd4hPOJcC/al8lVQ
	3nb4Of0KI8T2xpQbwxet1iFLc5Bi3tEVqizktdfUTUHOvb+SeRqBRr+UX7Wk7ZivYbps
	7VHni6Ti6u7mOBXNBlh3KkOXK6rjxYn+YCDA2E2aqW0EdLS/v9syf2cuGRtYPpGRySkB
	l88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=XoZLSWnKBQ2XUhxXRhxB+/bwt389wckIR/IOrNtyzZM=;
	b=uYttV644SxdexuBcXz4zyS7XI3VTH8zuyur8mjwDKeZHE2BVD5yfiz7gL2dG31Uh2t
	CgNJVQB7YEEVoIcNWzOM2Cj79rDi08rK02Cb0F6AdQMBO1uC5yHmdwb6HAExgaNXpyD8
	qg9oTY86Qlv+usW9l0+EYDqiiObqsMq+VOBEmSPpn6jBZ3rs403BTLLgnhmVj9Au30tu
	y27IfMzJ0q8lE40LGHR7yYJGgH/UembZgMSAnXgbowc4sR4NkTyXcHs8+3iWxfrVWmqr
	h+zHL55JPsUPCwrtD5jARGdzfFmpA//qzZx4gYgwJyEK56Zy79H2XZrUn/l8nhBIrZ2U
	8Sbw==
X-Gm-Message-State: AIkVDXKauCDCmH63531hFutQX/gPHG3DV3P8jbVWG4OKHZ5ASPe7Vq177BhZQA0yOf17UwtWrJDAtOQX8M5MWA==
X-Received: by 10.176.83.153 with SMTP id k25mr11734192uaa.141.1485119854950; 
	Sun, 22 Jan 2017 13:17:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Sun, 22 Jan 2017 13:17:04 -0800 (PST)
In-Reply-To: <37E7CB14-F61B-4421-8E21-7F190EC293EB@gmail.com>
References: <37E7CB14-F61B-4421-8E21-7F190EC293EB@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Jan 2017 13:17:04 -0800
Message-ID: <CAMKF1srGJ855_wA70ELLZJ104PPxbs9tK-Jzj4PJfwZefFEiRg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Python pty module
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
X-List-Received-Date: Sun, 22 Jan 2017 21:17:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 10:04 AM, Christian Lox <torcolato@gmail.com> wrote=
:
> Hi all.
>
> Hope this is the correct list to ask such questions=E2=80=A6.
>
> I am in need of the python pty module but have no idea what I have to bit=
bake to get it.
>
> Any hint highly appreciated!

Add following to your image bb

IMAGE_INSTALL +=3D "python-terminal"

>
> Thanks
> Christian
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

