Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 20E2C65CA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 09:57:36 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so3274068wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2014 01:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Ena95B0ngrk4VDoCq+MgHO2uKjMY76ADglQO1XitErc=;
	b=YidLZysZ3J+8JXqRGD7peMU+zic91x03U+2EUPA5RacMUmfIJPXlw/9kBrJq3/TD50
	xARiJZGQ5DXi+atKtc9JOCuFyXs7haYpiGg4l4aodEyPl4URhrHI4X+hU6XXiiMZqH06
	cONGOd+Ca21ySdMFdDk+Qyf2zLpY+mCD296JET0d3IKpmcsB2laRWfN/9syJ62z1own6
	DdTPXizOHgseSGPNAuRWn6ehBQpgm5IuHJrtPKIOxl2Dy1pvF1zQxRmM+ZPBBvMcyHwd
	UnfSZAyhYftNCB2p4EobJc8sdCY6BOHpFQn/jBWWDzE6UWecGRR/tkS/yClcEh6+3PKj
	uKdQ==
X-Gm-Message-State: ALoCoQmgiBTDbmCt10sJ/W+xM+rEW0JShEyD3kU/x3UXKyZSRZSzrPmHnYrqVWHqMUeL/89m/Opt
X-Received: by 10.194.103.230 with SMTP id fz6mr14340048wjb.53.1415354256471; 
	Fri, 07 Nov 2014 01:57:36 -0800 (PST)
Received: from ?IPv6:2001:610:612::7934:af7c:ae9a:7a11?
	([2001:610:612:0:7934:af7c:ae9a:7a11])
	by mx.google.com with ESMTPSA id f7sm1379043wiz.13.2014.11.07.01.57.34
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Nov 2014 01:57:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
Date: Fri, 7 Nov 2014 10:57:33 +0100
Message-Id: <5475F887-48B8-42E6-85D3-7200814EC360@dominion.thruhere.net>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 09:57:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 6 nov. 2014, om 18:42 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
> Hi,
>=20
> So I think it's fair to say that neither GCC nor LLVM are going away =
anytime soon, both having their respective niches.  Because of this I'm =
wondering if we should be adding LLVM to oe-core (taking the meta-oe =
recipes).  GCC will still be the cross-compiler used but LLVM will be =
available out of the box, for example the Gallium LLVM-based Mesa =
drivers can be enabled without requiring meta-oe.
>=20
> Anyone have thoughts/comments/objections?

Having llvm enabled by default in mesa would save me a few distro =
overrides. Just try to enable r600 support and you'll see how painful =
the current situation is.

regards,

Koen=

