Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 10FD4710B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 08:53:29 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id gd6so9158357lab.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 00:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=9631rrwEC3VsSEYk27Lrwa+QrFslPoX5AxXq5u8Fzw8=;
	b=Uc/Chu8mPt1SIsFMwEtCyumzeWVonM/wHWta26UMh1gZlVNMYjVIKFLB2FAdJxKJVz
	R+/480ZhklAutM4m97A43xbAMdpUgRXUbk2I+hza/kSo3JQ3cJsT1Ch0yQdq29P9q4JH
	V/1MAkgzZHxHRPK4fNhPhkX2mIYoGEBy92M9dPUZwP6zP/10tTpg+4ynO5BVEMP/Wogo
	Cn5xmhCCmSVrIL3yFYbkEGDnSCdZcB5bv/4m8cJSG7hZ4936reYuE9pT7AscmQSs7FCC
	cSBhn2BFIXg9Swzk6R263WvlCk0J9c37PbKxCgtacunAkRSAyYEvDL3Bi2RSTGYlgBq0
	zS1Q==
X-Gm-Message-State: ALoCoQnMVdrRMv3FxEwZywxVtGGmaxD1rReaSBLeCo8aluib2qrOek0yfhjMrkTFdPh6WKdi04yr
X-Received: by 10.152.88.4 with SMTP id bc4mr4271293lab.5.1418633609464;
	Mon, 15 Dec 2014 00:53:29 -0800 (PST)
Received: from ad.chargestorm.se (81-232-163-241-no29.business.telia.com.
	[81.232.163.241])
	by mx.google.com with ESMTPSA id g2sm2515061lbd.35.2014.12.15.00.53.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Dec 2014 00:53:28 -0800 (PST)
Date: Mon, 15 Dec 2014 09:52:41 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141215085241.GA17265@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <548D4051.5080504@tames.com>
	<CAPbeDCkN02Rsk8a92t_vApn5i6FCG2VRK+x0fUwWjx0ZOYsKXA@mail.gmail.com>
	<EB25247B-D2D2-4EB0-853E-F6B752960F5D@tames.com>
MIME-Version: 1.0
In-Reply-To: <EB25247B-D2D2-4EB0-853E-F6B752960F5D@tames.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Cross canadian gcc configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Dec 2014 08:53:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Alfonso Tam=E9s <alfonso@tames.com> [141214 18:22]:

> Thanks Jakob, I am indeed sourcing the environment script. I suppose it i=
s lacking something.

But are you calling the compiler using $CC?

Cheers,
Anders


> > On Dec 14, 2014, at 7:30 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> > The sysroot is poisoned by intention. Try sourcing the environment scri=
pt
> > from the SDK, and use $CC instead of invoking the compiler binary direc=
tly.

> > See git commit 04b725511a505c582a3abdf63d096967f0320779 in
> > openembedded-core.

> > Jacob
--=20
Anders Darander
ChargeStorm AB / eStorm AB

