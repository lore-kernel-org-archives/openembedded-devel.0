Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 21E0D7FA13
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 20:20:48 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id x1so16215704iop.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 12:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wvkhmphbjhQ0fYwPUHjEoFlyYqsE00wh6G7OKVYBZ7s=;
	b=CWAowDloyg37VWOzwemwdg8gN9beHNvtGxLjzDVdkrBcqommI1BpTl38qaM3/uiZao
	XI0wFFqHPL9zZUCD/2ntaYqowWhJjFEu+jzh2A6WhADdFInJp17yHjilp5m1oS0tRxTY
	GFDmYgLFKEbsFyQhqos5cAuzq3xyiiupxR0W21X+SfzTZATb253LLuOe33kr9hcNm2Fy
	OWzPt+8B6PM9tuLByGCVRUqu7Tx55daibDNg5becuzGbKAvytp1AmZhgo7Z6TvrOHkd/
	VW9e4em5+aTgp0N9WczhQ322twT1BAYMQxeFaPX6sVeBDx3C2J2MoS9uURKPcv2Fq8pa
	S/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wvkhmphbjhQ0fYwPUHjEoFlyYqsE00wh6G7OKVYBZ7s=;
	b=BQTytMUM8v56zv7KtO06s/mptXFMs5p0HlDThfqSUz+UzpIYn0sc59MNh0ZdmVsNgE
	OCrbXEcBPtyZSGa9/ndXbats18ga8CynoGaKLytoQMiXULMI3UqL/R1TFovYK/2iOuvG
	TygTFOskUCxM5i5kWFb4qrmtQuNBfF4MkbR2Xz9DijVla6N1UwVOqPKYIb692lA1F18x
	pUZcqMa2GXHRLAipHw3dEKyig3Fxl56P5NlICBPlJ7I3OgNhT1//gxIsrDIeE0f3dH3X
	6Go16yXUpVEZ9qhDOeGCkDxSJ8i92dZcfskQajv8i5P5FPiJOLr32SRLOUapkov3pEFZ
	rJ2g==
X-Gm-Message-State: APjAAAWswThEIbCtg3aTubWISP4g1n8+8oxn21PjHD4eWhL+FC4u4q0q
	FaMi2IIVlpzYYRRlNskvwrnEJ1VNBnw4CLZT0Dc=
X-Google-Smtp-Source: APXvYqz3/ZPnlatH39zMHwHBvTv+7y14T0y6YLRcOJVPy7AxsEIwngVclsmEmNRX6bRvvHvqSWevX6kdzoVj9QyyRXs=
X-Received: by 2002:a5d:9ecc:: with SMTP id a12mr23204169ioe.267.1575922849180;
	Mon, 09 Dec 2019 12:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20191209185527.208054-1-raj.khem@gmail.com>
In-Reply-To: <20191209185527.208054-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 9 Dec 2019 21:20:37 +0100
Message-ID: <CALbNGRRHBMyCrM9qYW7+hKtSBYLCeam4cDWC5PCBp7FWHZ_OWw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] libdc1394: Update to 2.2.6 release
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
X-List-Received-Date: Mon, 09 Dec 2019 20:20:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2019 at 7:55 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Use tarball fetcher and drop autotools-brokensep
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Did a incremental build test - no issues

Acked-By: Andreas M=C3=BCller <schnitzeltony@gmail.com>

