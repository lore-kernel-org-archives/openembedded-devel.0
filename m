Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id D31DE6025F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 18:44:05 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 3so196223067oih.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 10:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=wsob9E3RRpwZmo973e+nvpwShrwT/FOC8OfGb/9xCTk=;
	b=Fv/w9VHIGJyShccTM05o6+4ErPaePo7P96RLQLxyg3gd7lXXoRVcoPq3JdPjdiLrG8
	vGYgkZdxh6fmvXDEqFax2t3o1fWkHTy34m4QSEMryBWtBZZu2+bOi1DOm0r5stVQSaSi
	RUe63neOfQ0reL18xFFXccU/jrOgauPs37VL2EvfMPa4VTaTFCzQS/OEAGI668f2qA7v
	cThEv08X0EsP6U9xj7+fvzr+1oMZ1E6dH2Rh2X5P3HTacH/s7XjMA75ywlDEnL8fV2pX
	9k8kN2xDgD0VqmTsW4UtHE6+zFL90hx63KYxtNLeDweN74/9b2ys85ZtatnwT0HKr7aZ
	r2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=wsob9E3RRpwZmo973e+nvpwShrwT/FOC8OfGb/9xCTk=;
	b=FgBFmf4t7DQ/HXH29Wn9b2Hs+fQYRLOmSGpYqDbyhnXwGw/vyisQlN68fyB8ElSMUV
	ZuMHqIZAaDYqe6YT5tyzPLzxdgCWWSf9jih0Z9aBj0lXgVoesasPSfQQrfoecCNrcOkA
	Ay60iZB58r2gRZvSx4ti7qPSMy1yDFVWifoKzrux2yeKCdqvEAossndTVGwloSNvnsoS
	QcKViYKRP8s5TyUgq/hfmsk7xhm+/8H1yAmD3D1V6Gc5o+/WOt9k3ZuJL8q0G2iOd+1N
	p4zEXmuXza6flFGdWqwufdWHYb4nHB+vlZv+2wF/OWluDKou+stJavucAf5r1cdsmYmc
	aODA==
X-Gm-Message-State: AIkVDXJS0MleOFSIz+9yxiHsDYdSBj1Ox21V6m39k+ORBhY5Fc03l0Iq/ryZ+urTU821QV3lBBtUpnnnGjfLnA==
X-Received: by 10.157.60.99 with SMTP id j32mr21802690ote.70.1482950647228;
	Wed, 28 Dec 2016 10:44:07 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.19.10 with HTTP; Wed, 28 Dec 2016 10:43:46 -0800 (PST)
In-Reply-To: <1482949868-19842-1-git-send-email-moritz.fischer@ettus.com>
References: <1482949868-19842-1-git-send-email-moritz.fischer@ettus.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 28 Dec 2016 11:43:46 -0700
X-Google-Sender-Auth: DzT0GHjm9kDQI6lo7ZAQrZOrIdI
Message-ID: <CABcZANm34+wJ7=ibqjNNhUpW3XjV2mwNAOy1Gh6bMhxU_Q=GQA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: mdf@kernel.org, Philip Balister <philip@opensdr.com>
Subject: Re: [PATCH] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 28 Dec 2016 18:44:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2016 at 11:31 AM, Moritz Fischer <moritz.fischer@ettus.com>
wrote:

> Add a recipe to build 'ectool', a utility to interact with the embedded
> controller on Google's Chromebooks (and other platforms using it).
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>

Thanks for your contribution, they=E2=80=99re always appreciated. In the fu=
ture,
try to keep in mind that the subject line needs a correct prefix for oe
commit message standards (prefix with recipe name, not recipes subdir
name), and the email subject should mention which layer you want it applied
to (though one can determine it based on context, best practice is to
include it). I=E2=80=99ll leave it to the layer maintainer to determine whe=
ther you
need to re-send or just keep it in mind for future patches.

Thanks again,
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

