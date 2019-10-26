Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id CAA607FBC0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 00:33:51 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q1so4407709ion.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jHI6vUCCShSjmycRq4ikNkaEBkz6M9Fh6GK1OOAsFZk=;
	b=ilqY8n7tZbc06FZ8+7L8zEQ3Twl0hnU718F0y/RFy3CQpYDoy5n8TWwTkMLYXwmCta
	T3LoxFhrAGSuGAWhif2ErWFIk695QltPDEZpgvKrJaeBRrRoIK5SiVb6O3M4Di7DmIcz
	Yow67nTJqI4NeUar9YoZ5W2IyUMf7qxt/dG2ccL8QhfhK88VwJUgXTcEDg2kVd6LMO+9
	09g0g9W2xPduIhaFDfut7wsnx+MV2StQeoLkgM7FMgUhsbMtW+bdNwvQc/TNY8XZc4wy
	C7Sd4pHd6q2bvb3gYihRI4nLYm0rbXBe1cfmEXY34Ah3GS3ofChnBIEq0qiNhmYkcDOw
	IpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jHI6vUCCShSjmycRq4ikNkaEBkz6M9Fh6GK1OOAsFZk=;
	b=C1GkmaZpEkqMjTeYqs6LaWaVvRNVbs+yoX7eeD4uTV5gZm5w4PXXmzkiwLmpTd6qgV
	ffB/5Bh9o2HhrnoZLFgEPG9bKOrmlhpSEAl3uEDbP6pbiCdzZWlzaikN6ZkYwEfPrZf2
	OeRdtpHYr5hcYB21JBRb2QjaD69MvafpCRvohrUl4mq8H4PgPpkIRFjtiwgTqEmVUW7W
	/Luh6fUUeV0lxzBSnPmm1m/y2MP/NNkR+1iv1GoOCJyv90mxKOqFIQTXCB4LFfoLaAq6
	0K1KNnyw6YVa8n4Gu+JQVZazH1eZmfSg5AMXMvTGmXuwYB3/qO7noNc1P/pYh/4e2LUX
	obkA==
X-Gm-Message-State: APjAAAUSeususr59asxgoP9ivMBENXunW6S6fQ4VrNI/uqgMwvp/OhSy
	6GVYwtD3f5bpp+NoXZAXkZh6HilPEw4jExa/kIE=
X-Google-Smtp-Source: APXvYqx5x1OQRE7D5O0pQlVk32oPxNG3Pr8mdL/hVC/2CFIDuGXh/FVeAVz8d0Gb3YKARaL019eDVl2ZPFCDuNRQ3Qs=
X-Received: by 2002:a6b:7514:: with SMTP id l20mr6932637ioh.267.1572050032690; 
	Fri, 25 Oct 2019 17:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
	<20191025072113.11172-15-schnitzeltony@gmail.com>
	<CAMKF1so2PpCg4ot6g1wjAs9sneFRypXU0qaGbxR-hQ3zo1wjqg@mail.gmail.com>
	<CALbNGRRMfw8B8M6OLoU07tSuu4cy_QLXLjApTL4acMKLyMBeBg@mail.gmail.com>
In-Reply-To: <CALbNGRRMfw8B8M6OLoU07tSuu4cy_QLXLjApTL4acMKLyMBeBg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 26 Oct 2019 02:33:41 +0200
Message-ID: <CALbNGRRQZza-E0jxi9T=1B3yZ5RoT-cWCG5Wpepxg_xCjgyqjA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 14/15] colord: initial add 1.4.4
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
X-List-Received-Date: Sat, 26 Oct 2019 00:33:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2019 at 12:48 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Fri, Oct 25, 2019 at 11:37 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Native build fails
> >
> > https://errors.yoctoproject.org/Errors/Details/274649/
> >
> Smells like gold...
Think I found it - and it was not gold. V2 will fix it (I hope)

Andreas

