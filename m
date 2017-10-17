Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2B37978336
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 18:01:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id k4so5593102wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 11:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PCRzKsfABC/XoEXl0dWsf+uBuJ1ggFjB+0OibQPdya0=;
	b=MIPsOoK313kfYHQtmqezms9us5gjXewjxnFQ/hql6Z0tZkM3bmppVXrcL24HCsoq6H
	9gcpp0ujqBVTjhQzJjKjLU9JDGGQfl3jiOE0osiME5Er8VYvoalNCFWWXOLyLDnHwUiw
	H7MTI7W/DcK5E5DDVPM/dGnlSMAnpAa4KiuKDTCIgEko3aBpNz0XohaVygJLOMYBx/lr
	Lv6+ieg0V3/NdTqAChDMHZeIPhggIvWw3zhG9514rbv/ByWaF7KfMTjwLMN7Srz2XDx/
	1GKmi/wn1/7cgAIBn85Xmy/HDXC3NbKJRHaDiZeJ5CQFitOKFiHMH+JTdxC/mYu+MvWE
	Efbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PCRzKsfABC/XoEXl0dWsf+uBuJ1ggFjB+0OibQPdya0=;
	b=BLnzyo13VTSUJ4P1hR42e6eVsR4MD/wR7oBRCBjtG6Ed/83jWG5yhzepQDfcGx02oR
	NaX3kHKNTm830wapkQoqI5hrtP9+YtZcn/zO/5h7mDIy8qyUE4h9bb9+CEoMFnO9Sngh
	hsvyI5MWy9ynES7VPD+Fakmr8Duz6wgRKq60VT4maocms4qX0GGlyxO51FhFG6P26HBf
	J3orLV/gXF6RmwptEKuHkByDSz5qw348HzWthgrZSaX0BD9O0dQVh19VIAM9i2cZtCaf
	sMx7UoVTyfIb9Gu9fwqh2KvmnEOhtJwvZa4nW3Sx2ZhdHgORkav/VUMqCVA7dk/lZcLi
	S/oQ==
X-Gm-Message-State: AMCzsaXu03AJjkpaDQrR7kZlEKUYQUOKtJ69kQn2nPJE3yvi798HRNxS
	RUK1m68upioihbwByZD3AoMG0MEqo3eDroDlOtA=
X-Google-Smtp-Source: ABhQp+Q43yEwwRp4++gVP0gkITVwAIJkE6rCf9e4dAgI/7qnwed7J/VzWYn3aZ5D/tmmrDqCeDATIhb4FtGtbw2YCoo=
X-Received: by 10.28.167.130 with SMTP id q124mr4059179wme.136.1508263262945; 
	Tue, 17 Oct 2017 11:01:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 17 Oct 2017 11:01:02 -0700 (PDT)
In-Reply-To: <CAMKF1sr7gGo3LVcOKsp6f6FJFeNLVZHQCt+0MLwCTRMCz9F1Ww@mail.gmail.com>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
	<CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
	<CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
	<CAMKF1sqfVVcvf6Hz9tPF7xobT-P64z16mbTQNQ9+t=-kSwo2-A@mail.gmail.com>
	<20171017172327.5aipmv2frrjsszbk@mentor.com>
	<CAMKF1sr7gGo3LVcOKsp6f6FJFeNLVZHQCt+0MLwCTRMCz9F1Ww@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 17 Oct 2017 11:01:02 -0700
Message-ID: <CAJ86T=Vf_0_QYFPwFK+LO+m8yq=T5iVRQZCeHxsgPu--cYaL5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware
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
X-List-Received-Date: Tue, 17 Oct 2017 18:01:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 10:23 AM, Joe MacDonald
<Joe_MacDonald@mentor.com> wrote:
> [Re: [oe] [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware] On 17.10.17 (Tue 10:01) Khem Raj wrote:
>> I do world builds on master-next with musl on qemumips and rpi3
>> continuously, with a known set of failures, if a new one shows up
>> I tend to report.
>
> I obviously haven't been building with musl either, but if it's not that
> difficult to add to my autobuilder configuration, I'd be happy to.  Is
> https://github.com/kraj/meta-musl/blob/master/README.md the best source
> for how to get started with a musl build?

Going slightly off topic, but even though sources can be patched to
fix build issues due to musl's lack of nss.h, it doesn't really make
any sense to build nss modules for musl, since these modules can only
ever be used by glibc.

e.g. we have musl patches in recipes such as nss-myhostname, but the
real fix is probably just to not build the recipe at all for musl.

In this particular case I don't know whether mDNSResponder is tied
tightly to nss or whether the nss module is an optional add-on but
that should probably be determined before coming up with fix.

