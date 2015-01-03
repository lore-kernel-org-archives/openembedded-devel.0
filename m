Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 18217727DA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 23:21:02 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so26092921pad.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jan 2015 15:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=CHgje1breaTyHK27sA+Snq5//otbRbJmyzPEgMu0Pb0=;
	b=pll97amuQzYKtTaV/lNMyYLVCJSB/DPJzLOhF4iw/dhWL8iCZz5ctpI78ABjz6EdKe
	XvruZG47E9FjMdneXY2dp7TEilxIJemi5viRY0vWYwX3IoD5fWmr4DzfWunG9Pci3U8U
	chnJMNNTM1zfd1rjqnQCoOM4hqAOUBVK3eF4m77/RwTmJxkfYENDMqTj5q0HNM638v3z
	cgeElBJmjjgB8leq+6chZs9L0FI9SX7hjfDFlxybc1+9EvcVoJJE746uj7iLTOmth1Hi
	aiqyjJCQdfOMiA7psrTixd2SbFks/Ji0tN8aEYxyOeo9coMkc70Z8LojPJHc8XTh+Uuc
	4P3g==
X-Received: by 10.70.45.39 with SMTP id j7mr134239005pdm.169.1420327263763;
	Sat, 03 Jan 2015 15:21:03 -0800 (PST)
Received: from [192.168.43.239] (mobile-166-171-249-123.mycingular.net.
	[166.171.249.123]) by mx.google.com with ESMTPSA id
	wf5sm50658142pab.40.2015.01.03.15.21.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Jan 2015 15:21:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1420326829-43562-1-git-send-email-liezhi.yang@windriver.com>
Date: Sat, 3 Jan 2015 15:21:02 -0800
Message-Id: <E1F36200-A2A9-419D-8B12-1324D2F493DE@gmail.com>
References: <1420326829-43562-1-git-send-email-liezhi.yang@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Subject: Re: [meta-networking] [PATCH] dnrd: fix SRC_URI
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
X-List-Received-Date: Sat, 03 Jan 2015 23:21:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Jan 3, 2015, at 3:13 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
> -SRC_URI =3D =
"http://ncu.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz =
\
> +SRC_URI =3D =
"http://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BP}.tar.gz =
\

while at it, can we use SOURCEFORGE_MIRROR as well ?=

