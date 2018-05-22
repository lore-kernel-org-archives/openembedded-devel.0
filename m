Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7C974884
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 01:04:13 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id a3-v6so2152309pgt.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P45c/do8lMHltMIlp6vSL12XgNdmDhty0VSVwGs+O9w=;
	b=iavpuVd1e8eSpVAdEwNdYfA8eoUsYl69a3u3FN7QsNCnv/el+IHTAyjzd5m8nBk7zn
	Ymnr1mphDrcTM0mA+3oM39j26HQ6xeBLgTeyjcqi7UUYNbT/4TgJWwI7BiJJH45Ty194
	V7j/kTL1Tr0Q1SiWLMo/RtLZ61MY4LnKTZ277pdzU8T7XGPumlLz/RZAApWv9Ipre16L
	H6YqRbntk2H4kWQenWkIfIDxo5GsyD9nVZFzr+X2b5N6h6CQgx+4hbVYInOIZZi6HyuL
	DhuesZMZsssXXRyzMhNRytcqy7EDefQ0uMAoQqgO0dlk6LVTyihvyP6qPCB7HHQicOaf
	qIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P45c/do8lMHltMIlp6vSL12XgNdmDhty0VSVwGs+O9w=;
	b=jtVKdjCiQjtP4DKiBmAUGI65HwRQia6MRlqQB6/4XL7ATsUjQJfImPJWt3wSYFq14/
	nhTHfskE2eXETj4f/lBDiSn5c7+cXnsKUWxcMdKBAQsy/MgIm3qD99gbtQmtYZj8xcKJ
	MmbExwZGdLWqS8jUQTgc4CKTjzseVGe4nSdCOXVTTkWMRE8O3nbQXMgOaT2ueBOcVgah
	X+LkLtNXpPRGVnZQUN2MD/rLoHF+6oqH4884sMWH1Is6uksxwLRhUQvI3JAm0PUTQImC
	+Xo/k+seFaIATHOAvsVfAuXFQx91d09E39tiXB6ytUDLE6rUANAcs78kRIcZiXGNGRPF
	EFyg==
X-Gm-Message-State: ALKqPwfrftXJAUAyAu/UNPCfvalGlAOUmyCbVhGecsmkz4g5WO1gcrfz
	mnZyPwS1CVw+ubTCCDE1ONt9QRKGj2flbEN1CwQ=
X-Google-Smtp-Source: AB8JxZpBzvptA/2jgmORDSZU3NaORLHF2PFoCK8oYALq1YEuscpAm2520uDsGrn/dITzURuildKxcbVKQ6WRFfF/FdE=
X-Received: by 2002:a65:6510:: with SMTP id
	x16-v6mr17685862pgv.204.1526951054569; 
	Mon, 21 May 2018 18:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180518075009.4612-1-richard.leitner@skidata.com>
	<50ba6ce942eb43fd86ae092df8e891ad@XBOX02.axis.com>
	<79e4dbc5-15ff-4284-5364-4f625c7f6d72@skidata.com>
	<79bdc07b-5a51-a298-2e08-f7394464276d@skidata.com>
In-Reply-To: <79bdc07b-5a51-a298-2e08-f7394464276d@skidata.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2018 21:04:04 -0400
Message-ID: <CAMKF1spDY=KGC5UZWESKd5esdHZzFMrr=fJA67KBnOs_ZHxxRA@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [meta-oe][PATCH v2] stm32flash: add recipe
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
X-List-Received-Date: Tue, 22 May 2018 01:04:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 21, 2018 at 5:21 PM Richard Leitner <richard.leitner@skidata.com>
wrote:

> Hi again Peter,
>
> On 05/21/2018 11:07 PM, Richard Leitner wrote:
> > Hi,
> >
> > On 05/18/2018 07:20 PM, Peter Kjellerstedt wrote:
> >> We have had our own recipe for stm32flash for a few years, so I
> >> have a couple of comments to improve this recipe.
>
> ...
>
> >
> > Thank you for your feedback. I'm fine with all of these changes and will
> > send a v3 asap!
> >
>
> I just saw that my v2 patch was already merged to master... So do you
> want to send a patch with your improvements yourself? IMHO in the end
> you should be listed as the author of them ;-)
>

No worries I have staged the needed changes

>
> regards;Richard.L
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

