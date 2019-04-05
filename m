Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 03A257CF9C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 17:39:49 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id g7so4937729lfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 10:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hx4DRh8vwM0JjHAqCQmbPRq88tjhlVqKAvzZCfdENn4=;
	b=GV1GxKNfYekKs/LyvZXx9ld0U9vC2uvo7ro2B36cz0vxbk7ThdNLzwucwErtSbnf6u
	suZCNdvYQ/EL2y/DUBybxo7TUYYdiF8AumTh4UimamaS5/fR2n5A0xkTXjJjzsBG5k5/
	nZGKspqrdoRqEmioYfycCfI5CvYTDF347Ly6bBECCotdDbnGwFH0O0nGRXBsBZ1516PM
	iSg5xQohzQAd0fJBentR/HbhvTHPXUhecWumGRGNmfjxAGFkk9Z9UrPeL5KiOiwtJrUf
	yB0eyaHwbmk12jr1h1Mx4be7U9INfyHTN9oF95cvr/JqrA20H+dF8OQxYtrACcreWeGr
	plNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hx4DRh8vwM0JjHAqCQmbPRq88tjhlVqKAvzZCfdENn4=;
	b=N/Uj1RKIxaoeDNyob59G7q0H2gqsVu/gVB+joxKyXH5tF4DMdYoTzZZ1ucwBW1Wpnm
	LtnCfr7FiADKgdjTaZl1jSZYYStmK1oFFm1FXceruiLNCX9ou/IPi8+1e0LRxaH+NzBW
	KIR7fjP0TWIHrAxGbcGmmXwn62XaSny10kwCZzDc6/8DLD3hmZg0pnqoeeVcKroc1YZC
	GRJyfhpU7xDrWxvqZk1aJGeHaBW8Ti7NzQ15wdIj/954D3pF79S3HHOsmVcLYmZhpQHU
	KxddhrP11K1oVyqyWUvH1ERE73WeEYA9J0WpBWdE+U5IMrE8hxiqusLL1ZL56GYV+0Cx
	WQNA==
X-Gm-Message-State: APjAAAWEhm76kmUcEsQnHkmO0vdywN6Hb6Kym5W7ZKZE+o4Gs186adwJ
	XgX3BqLAjnNtve/S36idQMvcp84yp0Wzl42ZbOQ=
X-Google-Smtp-Source: APXvYqxlXJfHF9stUKVOoK1rSG3fsgH51G7Ivyc5cLOUX+8w1ZsTdrdpI+LClxznNokEbCvT2V61lH3Mk0C1rLmKjmU=
X-Received: by 2002:a19:f203:: with SMTP id q3mr7368255lfh.78.1554485990670;
	Fri, 05 Apr 2019 10:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190405144039.9121-1-alistair.francis@wdc.com>
	<20190405144039.9121-2-alistair.francis@wdc.com>
	<CAJTo0LbFowNQXRLCmF+CfazbyfeweJqWu5rkAP3_e3WyQEDpLw@mail.gmail.com>
In-Reply-To: <CAJTo0LbFowNQXRLCmF+CfazbyfeweJqWu5rkAP3_e3WyQEDpLw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Apr 2019 10:38:22 -0700
Message-ID: <CAKmqyKNabHhR270P7c=VEcbkDBzLC-_sdxhhfNyM+KkKz7iN3A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 2/6] libfann: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 17:39:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 5, 2019 at 9:29 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 5 Apr 2019 at 15:49, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> > +SRCREV = "${AUTOREV}"
>
> Pick a SHA, don't use autorev.

Fixed in v3.

Alistair

>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

