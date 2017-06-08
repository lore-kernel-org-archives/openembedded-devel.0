Return-Path: <acfoltzer@galois.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 54EDF71C14
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 17:50:47 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id f192so11138736yba.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 10:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=galois-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eDzaGU/NaeGymVeLWGBiRZjzcN145X8wdpjaXSW093Y=;
	b=AzJb52vNASofkLg6n543CSuqgULDmpLxUm71/F28vdogYbcEAAL3y09RPGSHOO8Rnn
	rVBr4S63caxexMkxAbt9Fjkq/HyokEYnCYvujw6G8dSucs3ay54f0H3BxSxlDKBBlfUz
	hT3IeBHDhrrNITBGBw0TAenux1kEIVZZ3X03PFRrzEJQBD+cs+eXF4MzVRfHSl+PizmE
	jcjlhxNrawownbOiMCy5ZgWJuxiQ/4vwDFmSYkIGURyDeSEgtd0NMZl5O6Xp14iNORJy
	qT3VCQh3qCSV3Dbwd1gzAm40mw/yDtNW1wuzF1sWv4J/b47H/wVheg0jtm4ob/V3e4rI
	5QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eDzaGU/NaeGymVeLWGBiRZjzcN145X8wdpjaXSW093Y=;
	b=rwjRBbkP637EQmOYp6e0rtxy7dvjI0Dcip5HHbpQqgTbL2god7VoJyb6Ag8d6Q44s0
	zHsMInTII+h0Lg4+NNpPOyGVdsVZwljb7eL+JcmNnVRGvPVqRs4VNJxe9vMxnBRQYmqS
	fWbV65qMhxq0AGRSxAu/rpvKxaxQlsUTdSMXOL+stoAr/QtkQeSSW1DMOu+V0OhMYMnC
	yJkDKZBnhqqnbFc4Cmmh4y2m6vcExcw9JHNte3RpkYR0EiUUVSvle6XSdekya4mOyP2U
	/iei20dZeIITm7d1rDmN/W98RnFRBCedOuGGDC1q3WzSfLCdsqnlSpg6qy15/umDZPCk
	LVGw==
X-Gm-Message-State: AODbwcBkn4cWEv36BnTwzAIToPLS2znpVFHrJW9lHuGYkmBp+2oyoN3v
	RXZ5JbeG5qMC3L3Mr+dSuN6ROIYyOhb5
X-Received: by 10.37.171.230 with SMTP id v93mr12230784ybi.242.1496944248267; 
	Thu, 08 Jun 2017 10:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <a96952a133614ffc9779d8a7ce912f8e@XBOX02.axis.com>
	<20170608173414.29852-1-acfoltzer@galois.com>
	<20170608173414.29852-2-acfoltzer@galois.com>
	<CAMKF1spMa3eYd92zWOB_ktdwMCqUvgy+odVYzNY3K4kHDnoBJQ@mail.gmail.com>
In-Reply-To: <CAMKF1spMa3eYd92zWOB_ktdwMCqUvgy+odVYzNY3K4kHDnoBJQ@mail.gmail.com>
From: Adam Foltzer <acfoltzer@galois.com>
Date: Thu, 08 Jun 2017 17:50:37 +0000
Message-ID: <CADnrctHC-eQoGKZQ9x=tR2whZrWnZBcxE=Ph2_sq0A7cTtAsvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] meson: add LDFLAGS to bbclass C/C++ link arguments
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
X-List-Received-Date: Thu, 08 Jun 2017 17:50:47 -0000
Content-Type: text/plain; charset="UTF-8"

Apologies, this line was inadvertently committed. It was a fix I tried
before learning that adding TARGET_CC_ARCH was the solution to linking the
wrong ld.so.

On Thu, Jun 8, 2017 at 10:45 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jun 8, 2017 at 10:34 AM, Adam C. Foltzer <acfoltzer@galois.com>
> wrote:
> > -cpu = '${TARGET_ARCH}'
> > +cpu = '${TUNE_PKGARCH}'
>
> what is this change for ?
>

