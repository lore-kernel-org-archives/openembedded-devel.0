Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3851A7FD9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 15:38:26 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 5so2959514qtz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y/DUFzYPo6kylgQx3Myko4bffeHL3LjIcDHTjbOeOFE=;
	b=IubDc/pmZxXYwah/BXcU4+LjZ9YowjuGgyOLi8Z1hbojJtyi+oxzTalX3ScrZ2c0+j
	nNYQn0dXEs8AUgj45UDGlRR4DTmkgfRyefaPZ7ZrOFdQTA4Oopq1lrZOHnwhDRhMPFSS
	PRaB9TKgYVij/YP7fy0e21AWqzB5cZ2uTC+hM5ljspOOduBQnRiQ7UtI9cRvt3d+7d0C
	R7MGDL/6ROY95zPTlysQtAh5vLrK9UPiuVdU6EVbvTQa8kGCKgIyo/TdeTn5sMaIOeON
	/ftmZd7E8KX30hSgaRdmY7UMfMHt0xdIP3VbOpX0sXR2AOkFzPZmFImNO2YEXssiHfca
	gbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y/DUFzYPo6kylgQx3Myko4bffeHL3LjIcDHTjbOeOFE=;
	b=U3RReR8spxb1Lmnttt0VaSYMmY5aSNEuhaYnaZIqBakA/n15LlXCclXlJT6PjfDQi1
	49kTPuN4qRa4ApTty/4Vwwp9hH8V3ee9VPQ0K2yKOx8eI9j3g7eVyLlOUy8k5PODSXJw
	C6Rseb6CNbmNLl+I5o7T+mZpSu9v5cASVJ/CeVxit3TZ7pV3OtUe91Xsl2Dcl2qw4W/o
	QaFMgbIo5CXP6LZpJnLz9oXPz2Dx+4nSbCzzJM0g3Ul9pSLE+0yIPqhuuaq/GX9aCvSn
	oNsew8TOXsT1/TriEFeo1MMQ0Tefzl3YeljVWfhTf0Ci2gU4pZR+8fUqhH5U1OQXgkb8
	2t+g==
X-Gm-Message-State: APjAAAXSNFZyG3mWazTKqf2rz+A3eJ2tV/cDvmsk4fj2UrhvlqxQgvNL
	GPkOm9nbtLPIDLFKcTzN+HbwrFAleuFe7qwbit4=
X-Google-Smtp-Source: APXvYqzrYVKgBDhhe/ElRiyh6P50OYVVG8+YzF+zKs2O2vCQOGlTxjvuXkRuc0mcFd3PkxKhuWu7w6f7Xb1q0+6PA5Y=
X-Received: by 2002:ac8:5257:: with SMTP id y23mr5040890qtn.88.1579621106557; 
	Tue, 21 Jan 2020 07:38:26 -0800 (PST)
MIME-Version: 1.0
References: <20200121012416.544541-1-raj.khem@gmail.com>
	<CALbNGRTgzwTink2p8Ffxr4pnGJfVfpRsyrbbrV1QO68noVVi2g@mail.gmail.com>
In-Reply-To: <CALbNGRTgzwTink2p8Ffxr4pnGJfVfpRsyrbbrV1QO68noVVi2g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 07:38:15 -0800
Message-ID: <CAMKF1sr0JSv1xxWai3sfpmbE8=W2pF6AccMo7vVtVXky6O1bGw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: Upgrade to 60.9.0
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
X-List-Received-Date: Tue, 21 Jan 2020 15:38:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 11:13 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Tue, Jan 21, 2020 at 2:24 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Use firefox ESR src_uri instead of gentoo pre-generated image
> > Pre-generate old configure script
> > Ask for python 2.7 specifically during build
> ^This is what configure.py already does
>
> Although I wanted to finish python3 first (yes there is progress) I
> sent  out similar with autoconf-2.13 and some clean-up. Are you
> working on this either?  If yes I can do something else.


I am not doing py3 piece so please continue with that

>
>
> Andreas
>

