Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD606E648
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 11:42:18 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so183597914qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 04:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vWaHqUtFIfvSv/qbr5Y5R/JACoBzW7Lf+UHTLGDk15E=;
	b=br13Zygcfk0z521LKHmfo3g+X/eN8DhSmFea1khqb3HCRTZ/w/uL+xS5C2wtNEzRUV
	L88HNiZiuQAXA56wrLftU020ddPV7KkFfrUDN75dNl5LqH5INUUiKhfcAm3UJOPOTKT5
	qYx2BfkRIVIDwme2KoTiSoyGrlr4xC+OchvgvonnSYOtuFcbDxdv9Sebo8xf19wV4eLr
	AxDXMhEQTSoAVfCVpigeF3UIyj85c/QQFOepemZHSX7/JAtceEdJg9BztzmHofDP0lR6
	/ZL2fsvgjTvQzJdsF63DfVr5Rp78V97uTtFofOg7wYj835KxzmQCMUiRwr/v5kw5jcXS
	aJDQ==
X-Gm-Message-State: ALoCoQnMs7CWnND6Ls6N8Q+z+KbNQeKeoDPjylsRBhMsdZf6MuU6UfhPW4O7mDoH2MCbQXAN1W8u
X-Received: by 10.140.231.19 with SMTP id b19mr23953204qhc.22.1436442139000;
	Thu, 09 Jul 2015 04:42:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 04:41:59 -0700 (PDT)
In-Reply-To: <CAALGJZbmg2kqahBp5jFL4mk2N6upacQpmi9bpd3jSf5A-c4T8A@mail.gmail.com>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0La0qFDC36msPioX=-=xsdWrhGSUrKC-9DokxV9Htx003Q@mail.gmail.com>
	<CAALGJZbmg2kqahBp5jFL4mk2N6upacQpmi9bpd3jSf5A-c4T8A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 12:41:59 +0100
Message-ID: <CAJTo0LaQR12MZP05tOSABbaRCAL=tA2boNdjKGJT54oLjAsG4w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 11:42:19 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 11:35, Christian Ege <k4230r6@gmail.com> wrote:

> Another option could be supporting both.
>

I totally endorse having a layer that has the one that isn't in oe-core,
but oe-core should pick one and support it properly.

Ross

