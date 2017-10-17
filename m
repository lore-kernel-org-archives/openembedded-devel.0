Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id BE52E7833B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:01:05 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 17so2005223pfn.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hsAzFEF8mR5rLaDT0DbUie/tzoe792Hu+5+vmkN0Bgo=;
	b=JY6Jdfcm2gJUWQVSACZRO/xY8FsS8+CDllNffPm0OThrsMVgP59uy59jypN3WSkPKs
	wkCxUt7mXngdTrG4r+Qj2lMWEktoUOV0HGki2GQwtmAqd290oFkneOCSu1OZQxRAqODN
	UBCBDk3kS+vwbIAt26lS4aSr3tATaDFy/frI4uIdPPE6pNgC5x7A+OCx2iwwd2BlwQfb
	zV2aMVsNxiTuZcpo/PAvWTHOUcCxf2H1qoDEhw3LYphb60c0mVln/Xhlqv8kMbNdj1KO
	FR6FQVe817wk/2aBnDlsKFsEQ0ygnyo4crh/yPCt4w3Zas5BoL3HL1RUITtmLjGMXpAa
	Cliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hsAzFEF8mR5rLaDT0DbUie/tzoe792Hu+5+vmkN0Bgo=;
	b=gmnp6a/x4dTVsed9tuJe9+r4TqEbZjBBO1FS1xTFdGp84oWykbYMT+/vnKwcA+IUt3
	TnTlOZmJL6bZ7+rtAtx97jagbdP/el1zXzqN8SQb8JVa4AvV7vxGkdlM0NrI6kNr0BIg
	mAs2VhxG9jfog+XuKTt0lD3tpHWt+rBHk8ceehXuZcS6x188uYs5Cc3qqDDND7X9JHfR
	vYWI1GqlfhAgoZ1ShSde8DICL3A7Y6UL5cV0H1k4dcEObABPjPb2ve6I9DCoQZjmJD7b
	NUbxy5dg1rh2IWr1yTRK/9p1CG6aLbAE/KUeL0MQRDOLjZNaGaffqqXj9Fzqtqosp/CK
	SaJQ==
X-Gm-Message-State: AMCzsaV3TXsjX5X7lsr9lM9g96lhMi3KkGylJMpAX2VFe0U6UKKZgqGd
	CtdBvmd1ePX0VoA3E9p7e3ZiJWXXKMQk6vzn/Fg=
X-Google-Smtp-Source: ABhQp+RiLf2LLGMzBMYj6IKWgP1Zam0E/jb6lU3GAh1kq0QoTbf/BaTeL5IXo8Ky0TAJHT44DnbF0EDkN6gX55Xhrds=
X-Received: by 10.84.175.3 with SMTP id s3mr10012722plb.440.1508266867031;
	Tue, 17 Oct 2017 12:01:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 12:00:36 -0700 (PDT)
In-Reply-To: <CAJ86T=Vf_0_QYFPwFK+LO+m8yq=T5iVRQZCeHxsgPu--cYaL5w@mail.gmail.com>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
	<CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
	<CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
	<CAMKF1sqfVVcvf6Hz9tPF7xobT-P64z16mbTQNQ9+t=-kSwo2-A@mail.gmail.com>
	<20171017172327.5aipmv2frrjsszbk@mentor.com>
	<CAMKF1sr7gGo3LVcOKsp6f6FJFeNLVZHQCt+0MLwCTRMCz9F1Ww@mail.gmail.com>
	<CAJ86T=Vf_0_QYFPwFK+LO+m8yq=T5iVRQZCeHxsgPu--cYaL5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 12:00:36 -0700
Message-ID: <CAMKF1sp=ZB7d3CsnK-0+fM2uuc_MDHs46t8YriuS8CiztZJFxQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Tue, 17 Oct 2017 19:01:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 11:01 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Oct 17, 2017 at 10:23 AM, Joe MacDonald
> <Joe_MacDonald@mentor.com> wrote:
>> [Re: [oe] [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware] On 17.10.17 (Tue 10:01) Khem Raj wrote:
>>> I do world builds on master-next with musl on qemumips and rpi3
>>> continuously, with a known set of failures, if a new one shows up
>>> I tend to report.
>>
>> I obviously haven't been building with musl either, but if it's not that
>> difficult to add to my autobuilder configuration, I'd be happy to.  Is
>> https://github.com/kraj/meta-musl/blob/master/README.md the best source
>> for how to get started with a musl build?
>
> Going slightly off topic, but even though sources can be patched to
> fix build issues due to musl's lack of nss.h, it doesn't really make
> any sense to build nss modules for musl, since these modules can only
> ever be used by glibc.
>
> e.g. we have musl patches in recipes such as nss-myhostname, but the
> real fix is probably just to not build the recipe at all for musl.
>
> In this particular case I don't know whether mDNSResponder is tied
> tightly to nss or whether the nss module is an optional add-on but
> that should probably be determined before coming up with fix.

yes musl does not have nss and its intentional. Although mDNS can be
implemented external to libc which I believe is a good thing. I would be
happy if the patches to add these recipes relying on nss just added musl
to incompatible hosts for immediate OE concerns. Eventually, it could have
a different fix upstream for the given component, if they want to make
nss support conditional or otherwise, its best left to component

