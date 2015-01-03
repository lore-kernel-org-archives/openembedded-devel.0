Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 468E1727D8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 23:55:23 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so26157075pab.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jan 2015 15:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=woS1sMbjzE0Bxgx80ggkCuVIQ6sJppVLPIE1z+7vgbU=;
	b=Nj/G3MAJCBqw2/cmj20YHvjhS+93ac0WyVAGC6/nypzU15ktaSLTqFoSiPz15nx46v
	+SLK7rXFCWkTLrEynXuW5BWoCRUJw0V9veTCg33eokCMPkVxDAnutOEEYiWLufbp+BzJ
	LGYT8sJBVznej0lmcYDvuLrvfgqST3ztDtjefxZVcUoF1Ub9VNkTjmaLoOCJ18rpmn1d
	LhYGH1UD4H5PX7bf6tKIec5Uh09LP8sOCuvh3E9MFftLL2N0wJZZzjILsGXZqJtCvhhY
	tLaL8pGTTxIRTesVYNuGplU0FJTuh1Yeg14gjMu0WemcNtn1SCPatXdxqHOR5fbYyLKj
	7Itg==
X-Received: by 10.70.55.163 with SMTP id t3mr134623716pdp.8.1420329324223;
	Sat, 03 Jan 2015 15:55:24 -0800 (PST)
Received: from [192.168.43.239] (mobile-166-171-249-123.mycingular.net.
	[166.171.249.123]) by mx.google.com with ESMTPSA id
	nm12sm50305660pdb.64.2015.01.03.15.55.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Jan 2015 15:55:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1420329190-40280-4-git-send-email-liezhi.yang@windriver.com>
Date: Sat, 3 Jan 2015 15:55:22 -0800
Message-Id: <05489F42-2E43-4F4C-BFB9-66FECC72DC73@gmail.com>
References: <1420329190-40280-1-git-send-email-liezhi.yang@windriver.com>
	<1420329190-40280-4-git-send-email-liezhi.yang@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Subject: Re: [meta-oe] [PATCH 4/5] smem: use BPN in SRC_URI
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
X-List-Received-Date: Sat, 03 Jan 2015 23:55:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 3, 2015, at 3:53 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> -SRC_URI =3D "http://www.selenic.com/smem/download/${PN}-${PV}.tar.gz"
> +SRC_URI =3D =
"http://www.selenic.com/smem/download/${BPN}-${PV}.tar.gz=E2=80=9D
                                    ^^^^
why not use BPN here as well ?=

