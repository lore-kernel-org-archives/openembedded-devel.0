Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 543B1601D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 15:04:34 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id i32so80111196uai.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=InZzrIayV9V5PBwTnhNPQ++z+GP/agQDx+IpQu0bUCw=;
	b=YUShuXl/u3wKgXQHJ1QMGdhN3YaR0Y656iPriWaBtAdDjhap/KaK2EObbTGyT/PtoQ
	vUJx2YsVedplcPSyIg8GI6PZw4LXr4ucmMgqaiUHn+oOzjEWFX32jDT4ntSIFj9hzqj7
	UHhrisdPVxh7wBkfEnESGhdQZzmyqq1YxM6qiPyr/gtCFtnys2BO3yUakcI4MViOgfGx
	qrfkV5qYi4lMFHcES88qJFWPQLTB4/neBOA/H6wr/v6yrslvUCty8JMD5G+0FHzdKEsB
	CB0Bj9NLZCxiVyFUuD1LXDkNl3jnbAdpAkzaafd3hzU2isletPMCpWCVZlSdM7Z1Mvit
	Ca0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=InZzrIayV9V5PBwTnhNPQ++z+GP/agQDx+IpQu0bUCw=;
	b=H7B3fDENRvaZYdCpC0QgiyhAqSbQz/d3AXfuphDUQIdKVJUposBrTZO5swb+9uQcQe
	kPSWRa0aw/ULceR3y7GHOs0TwIMpq8Q9K3IKiYviKXQLZtMi9CmY3rPX5QnofGaViJEu
	2n7rzn3SCkijsDU7DhsGkI02/ug3Uklo/F/F/CVI/pnYjdrvzwTvLnz8b9RgL4wZwTku
	FzpEyuKN+tycyP6F++PlpvO72Ln8/sHE0XML94aIO8Kj9cqsKyX/S0c5oiQlfFKUu/v3
	TnuLsBofgoiq6XC6lnGFvHfXFMLpqHtBRHRFgJrMRODXglmiPCT6CuCVeTrhfvfn9LeB
	5WCQ==
X-Gm-Message-State: AE9vXwPL07nLEN/ylBJZjmhTSrxVFz00jTgzsa79k2pIkgwQh0p/fCamvYkWTAZI12gA9j9jIf2Kxe8yG/Ftnw==
X-Received: by 10.31.191.151 with SMTP id p145mr8410868vkf.65.1472483075319;
	Mon, 29 Aug 2016 08:04:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.37.169 with HTTP; Mon, 29 Aug 2016 08:04:34 -0700 (PDT)
Received: by 10.159.37.169 with HTTP; Mon, 29 Aug 2016 08:04:34 -0700 (PDT)
In-Reply-To: <CANwerB1VkihmuBt5cd47NZEQ9wKPJ_Qoqx-7qgQPDprKu-6FEQ@mail.gmail.com>
References: <CADwFkYehX7aM8Oqiu+jv85iOe54J6wUFbKUs7OdENoUsF_rUfA@mail.gmail.com>
	<6715E3FE-34D2-4C89-B54E-76B481EAAF06@gmail.com>
	<CANwerB1VkihmuBt5cd47NZEQ9wKPJ_Qoqx-7qgQPDprKu-6FEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Aug 2016 08:04:34 -0700
Message-ID: <CAMKF1soS6oKdDL+ChsV04qRLdxaThRsSc8McSP1gR0DANrFR1Q@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yi Qingliang <niqingliang2003@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] the QV4 engine will crash result in SIGSEGV
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
X-List-Received-Date: Mon, 29 Aug 2016 15:04:35 -0000
Content-Type: text/plain; charset=UTF-8

On Aug 29, 2016 5:44 AM, "Jonathan Liu" <net147@gmail.com> wrote:
>
> Hi Khem,
>
> On 26 August 2016 at 03:00, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Aug 25, 2016, at 12:45 AM, Yi Qingliang <niqingliang2003@gmail.com>
wrote:
> >>
> >> bug detail:
> >> https://bugs.archlinux.org/task/49723
> >>
> >> patch:
> >>
https://git.archlinux.org/svntogit/packages.git/tree/trunk/qt5-declarative-gcc6.patch?h=packages/qt5-declarative
> >>
> >
> > Thanks for report. Would it be possible for you to cook up a patch for
meta-qt5 layer for this ?
>
> I have fixed this in Qt 5 upstream and submitted a patch for meta-qt5
> to the mailing list.

Thank you

>
> Regards,
> Jonathan

