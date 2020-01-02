Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 06EDD7F9A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:34:21 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id k6so31906655qki.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 09:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6EaGwWn1VVfqThMKoxCXWjVtGf96JKXFMEMRh3xtjeQ=;
	b=Yn3YEWPHbPo/XjICjcvaXMsUEuDend3P358h3k7ZfdpL4SN0me7JrgiM24H93Q+qpf
	cilCf00TBjXPEcGO6BR2z9tdrjM2GoFu5wQ/7QaJTnyf9lbfIvECHHbHtcPkn6rbaZ1D
	LgK8t8tf2Awn6xYEHTTAK7RrLLEsOQ4tbKMVuvS79QKmmxY2jSBe5dT0ymArJiXSPk4F
	8X7RG4y0+bl6Vt2AK+DkgT0LM1Ailrmx0W2FU+eME5FBSRXcrRIpfj4LTSK6WTDvSLpF
	oOdd/CeBlzfqYSc3asc+Gll8lTjUus9q9r6F9ZXDD8lvZQzwsxgcFvuVLYLY2+e5nVng
	dW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6EaGwWn1VVfqThMKoxCXWjVtGf96JKXFMEMRh3xtjeQ=;
	b=IEL00dTlh2AhxO67LkLUo5wLW3VpFxcagauO3c7aaArQHTjn0XbrbsoQhu1O5WTlvT
	6fAhAF7xRFtTNFAJXr/MM3uYMD/ZM9eaCJxJYrXTWa2I8z/sCibr9GIqwKWMAxEPAV8E
	+wA+BRKHO6yHsTqo0/3qcdHpxCKxtPJOYQUXbNACGfuA7HHd9RIAH2lbeHlChkbmB8wy
	WWvA00zaJl/A1wAWQEumoYZPsbO0pVdn1LPYHPuI4HmogN5Cn1Get2Pb1Wx8CrCSZg4L
	Ld/iFEQMNmfLCQGJY7fH2ASMLZk9YUrOPVlqiljiiSWnvhtX8c44bvTtKFxeLj/AsI7t
	wCeg==
X-Gm-Message-State: APjAAAW4kg+OCgIqZXR4syJbh/V/s19Kt2Sf3+LLDt1FZkm+R/+uN1Fl
	Q8hMAXPmKS9/+z6aKaXOCREii8X5QS9smtD19TjR9tgx
X-Google-Smtp-Source: APXvYqxfOBmrcBp2zTvp/vVzyUOc72/nh0Lu9U7DGsmz8CUBY6LStg7HjNKV/Yx/ggfY0k1jx0J2AGe4sGroGUHxU9c=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr69465035qkh.9.1577986462575; 
	Thu, 02 Jan 2020 09:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20200102061330.480482-1-raj.khem@gmail.com>
	<20200102061330.480482-4-raj.khem@gmail.com>
	<20200102110803.GB11760@localhost>
In-Reply-To: <20200102110803.GB11760@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2020 09:33:54 -0800
Message-ID: <CAMKF1sqVkpSjeBbctBbjTP45yTuo4xPmJYBPetB2frASw4V=mw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/6] hddtemp: Fix build with latest gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 17:34:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 2, 2020 at 3:08 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Jan 01, 2020 at 10:13:28PM -0800, Khem Raj wrote:
> >...
> >  ...ame-to-configure.ac-and-use-external.patch | 14743 ++++++++++++++++
>
> It should not be necessary to remove intl/ in the diff.
>
> Removing intl from SUBDIRS and AC_CONFIG_FILES should be sufficient and
> keep the patch at a readable size.
>

right perhaps better, I was playing with distroclean targets and
thought it will be better to clean it out
I will send a v2 for the relevant patches in this series.

> cu
> Adrian

