Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7218C6013D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Mar 2015 17:15:03 +0000 (UTC)
Received: by pdjp10 with SMTP id p10so46223348pdj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Mar 2015 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=I+SstdxsR6krfgZQC+K5Mw0oYk517u25K6MrqdAqms0=;
	b=qEP3DU6zi6hWo/6eA8XrcYysvwPyoVBODMlMHUDLI+Qej3DBBgj2GgSL2TMb+xZ/nx
	nc1tPqIMdED/IfYowJn6xRRxds/tL32e3tbs4XcXybboiU9v6/D6CTyosjjwKq59tq3x
	En+RIWbkTGsiEJfm+deflE3So1ePlvsWVVMduSq3C2lWbSsecCRKepiILm2gIS+s6tqw
	LTT2isngStp+Qe7Rv0zFoi7c2rdGd5XHYTzSDf3ev3FLTSlGDOKgiOhnGmSJCS1j0265
	SgZhFqH43ctf1brbq6VVopWTo67BlZYEAQMBj1zGxkpANNuwycJdKdgBQNdk2PCZkDk4
	YByg==
X-Received: by 10.70.43.203 with SMTP id y11mr35907411pdl.143.1425748505137;
	Sat, 07 Mar 2015 09:15:05 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:8cba:4754:67eb:6b50?
	([2601:9:3580:84c:8cba:4754:67eb:6b50])
	by mx.google.com with ESMTPSA id
	gg1sm12793909pbc.38.2015.03.07.09.15.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 07 Mar 2015 09:15:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAHuHfw4LNW-d7_rDKbGBwaMf-HKthMzO4f0AOY_4ZM3cy0SCw@mail.gmail.com>
Date: Sat, 7 Mar 2015 09:15:08 -0800
Message-Id: <0AFADC05-FB43-4557-9617-3F64743F4B02@gmail.com>
References: <CAAHuHfw4LNW-d7_rDKbGBwaMf-HKthMzO4f0AOY_4ZM3cy0SCw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Subject: Re: ghostscript: build cups filters
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
X-List-Received-Date: Sat, 07 Mar 2015 17:15:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 7, 2015, at 1:59 AM, Life Life <sadlife1990@gmail.com> wrote:
>=20
> Hello,
>=20
> I found this link, to build ghostscript cups filter but it's failed. =
Do you
> have any idea ? I see error on this line
> +RDEPENDS_${PN}-cups =3D ${PN}

change it to RDEPENDS_${PN}-cups =3D "${PN}"

>=20
> =
https://git.congatec.com/yocto/poky/commit/b5ad3773afa99580f11292bcc730d35=
5cae2e39a
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


