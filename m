Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0016A73B9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 15:51:54 +0000 (UTC)
Received: by pdbcz9 with SMTP id cz9so224989777pdb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=hKUolHP1Q1gbfgDoU6+acCLnKpDcq/IMEbeUASDqaE4=;
	b=LvKCX6DFI/+Uch/urfjhHs1oUjBdWuqbMydgJ0U4B3P0IpR0JTQByOP4H5k5NABHdZ
	33vOzhAatrKsOACj6xBL5l42PI9uZQiWxluPtryHdn7DCrrE10ke2GF5S0lDvhfM4PBf
	JFzlttZM69lWlmF0JZDiE34vU5KGK7ljV/OTQSTYXlSfNTsdxiTlHIJMyO7IBjvnRkvh
	gl4Sj8JUPmZWb1uLNVq4E0CRZUdwiEMIXsfjIPg7ru9KyrCHcGK7FyLKFpwAvlVqWFV8
	l/1AadM1eHQfjRtdPJZxJFMVCFqO/hAgehvodOz+kbxMD2SiXUw0rDp4xyJbG2QomYGx
	Ffow==
X-Received: by 10.70.21.236 with SMTP id y12mr8927370pde.154.1427212315354;
	Tue, 24 Mar 2015 08:51:55 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ec48:5597:def8:2ec7?
	([2601:9:3580:84c:ec48:5597:def8:2ec7])
	by mx.google.com with ESMTPSA id 5sm4570419pdg.45.2015.03.24.08.51.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Mar 2015 08:51:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKoFdepGX7OZu8XxMQVr-ssUCG_Ndyyj6GROOACViiMhEw@mail.gmail.com>
Date: Tue, 24 Mar 2015 08:51:53 -0700
Message-Id: <8A51FBCF-FD07-4A7A-9829-14964E58A121@gmail.com>
References: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>
	<CAMKF1sqm5ARrWih-TgnzFXgEGXR97o=iUU_xR-fvp_bLC=SyEQ@mail.gmail.com>
	<CAP9ODKoFdepGX7OZu8XxMQVr-ssUCG_Ndyyj6GROOACViiMhEw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: meta-browser][PATCH V2] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Tue, 24 Mar 2015 15:51:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 24, 2015, at 4:56 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
>=20
> I'd prefer to do it once and avoid adding another recipe and handle
> same problems we had solved there. Also this allows for example the
> use of i.MX patches on meta-fsl-arm.

My usecase is not i.MX moreover I do not have i.MX h/w to test as well, =
current set work fine for the architectures I need it for, if someone =
wants to help in testing on other machines, its welcome. however as I =
said, it will be in subsequent work to unite both recipes due to the =
overhead as explained in last email.=

