Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id C057077269
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:37:40 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id b62so29397660iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CWFiGYlf55cSTmbKIPk5zEqtCIpafdajM2ZdGYKJ8zA=;
	b=Wdm8iLvBwUfvYpWAj46d+ZIufFxAwflR77UAfXRgZFCQ6P4l56+XXRmo4K7hA4bV1C
	LnbIlJf1WQBk0LGGBmjogtnBRgsJNb/ELZP3AX+MROwfu8muES+xzweqkDzQDvequOgQ
	e5moy8FhisGKPIBUisSbllh4gMjfurxkqEtlmZk0/5Cv47YtQKkFm16jewdv3zv8+B7Y
	Fqsed8/mVPsor4jZGiyBzz1H7WvorUn09L5yv6ZQVpznRGk2eK+F7MSZybjpErcvDFLh
	QwZzKM0QOmWASzKV99w7c4GhcEJV4zX5j2m78jx35so7U9BQ21xrPC8S+ZgccoU5M0VS
	S2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CWFiGYlf55cSTmbKIPk5zEqtCIpafdajM2ZdGYKJ8zA=;
	b=KKzYhELokJk4ThatiQOjPuCS029ju8m1Xv/92MJSMRBAPBrGYn3qQkaIzUpydAbrjf
	oVhHawpeWpHFYvbFfr8p2vUdEAhsOFHuvcBPeuTGN94P/hTWuJzY/Qg+87lhMPIggB8Y
	DtxKFE+qOvbrCiAec3OqPh7O7khQL7N5IANheN/zt+yOT/ehNAR+9b1Ns77EkMt/Kq/m
	gR8A23Ll/Cpns/0DhZwlIUzn/OyshY5/G67jzx3cc9cS2QWSYIBdGiTPWG1AqCK0CtI0
	ArF1HOV2imzXYHHpO49y9f/Tjk7AFmYMTd4M76RYUp11+5FRTnm1EfKgyNGGlvuip6qS
	CyVA==
X-Gm-Message-State: AEkooutFa3rstwyU+YYb5Cz9cceTZa4GEQT1XtdwoxfdJEsBlQTSr4rJ1nZLJCY31p7LhLdG9yUfhI69eSpNxZJ1
X-Received: by 10.107.154.196 with SMTP id c187mr18528119ioe.99.1471019860773; 
	Fri, 12 Aug 2016 09:37:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 12 Aug 2016 09:37:20 -0700 (PDT)
In-Reply-To: <57f8c9eb-057b-e2c0-df16-826a6662dcc8@smile.fr>
References: <bef7bc37-7691-5631-d232-80ffc0e29e26@smile.fr>
	<CAJTo0LYzmcMhA22cdJX5mS1n30tN1G9XSD3LV+-CpEVOQC=OQA@mail.gmail.com>
	<57f8c9eb-057b-e2c0-df16-826a6662dcc8@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Aug 2016 17:37:20 +0100
Message-ID: <CAJTo0LZf4wJUOURKH1A6P_BynqyhR6yaRzW7hYhdF9pGxc0w4g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [Jethro] Can't compile gcc-cross when gcc-6 is the host compiler
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
X-List-Received-Date: Fri, 12 Aug 2016 16:37:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 August 2016 at 14:38, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> (which I think is what you meant) and it did indeed solve the problem.
>

Cool. If you can rebase this to master and submit it as a proper patch then
that would be much appreciated.

Ross

