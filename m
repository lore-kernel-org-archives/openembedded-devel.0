Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1617F7708E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 13:44:38 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id yy13so50616346pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=bkLgPHT4logKr9El8eknF1DVgF0ZTGH7SNALq0HwBO0=;
	b=H8qzrKt3BIVhTrRH2RrPnugUr1AWRCVMRx0si7mmFo+fSaziqh6kkmRknR/ed6teQn
	bco5F/Aa5B/2T6V55xrwk3RgnDBT5VUNitsevhjoE8kypJwkpWqU8ZGBcVhHUoiVMMrI
	L31abzDesRaWbhYjth/OBGnD61BzHX+dJkOP/5Hqgtw/epO9Vpw+5vN5Oz9aF+KicJVE
	EGIfKXYXA0nMma8j+hEd9okTGTrlis+JLZU847BUMZtioow1AzxWDZ8EwZSfSF7bneme
	xwuuGGA/bQCYvoirOxpFXnnUmxz05mXKOJJXgwFuUTtGm+sIVuEZJfbCZFkiPOku8bza
	UGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=bkLgPHT4logKr9El8eknF1DVgF0ZTGH7SNALq0HwBO0=;
	b=SMbWYLcXDDUF/f+NuLqhI+F6hvvqXIcrRVMSaSGMVHFe29nd8pBs3bJyRjvsDGisbu
	Coh+6AW1VQPglVAFmyRth7EJ2bpXoiBIqQuYjLILZujXgek5XC0IliJB9zZTuuqYIwtc
	yhmY23e1D2OvPfWyEpG2BAnuIsiSatm2pbGmXivzIVegHYKO69ydGV8MkxiVafRJgnAa
	KTUn28DED0Y8XLccK4O5EgeMFP/iGc0mp7a0LuBf+meW+h8qdcxEkb63qrTfD/8cDOoI
	gyomsRpVUeMJ8TEBclJOuwLdIfBmN6Di82Yghlt6dMQtrZ3isBNNzMZ/YEm8xoGKJKYk
	VXvw==
X-Gm-Message-State: AG10YOSp5Oz4Pjnqh35/YBEtNdG+7AVkz8Nw9/j0g1cggOoiMHfh9Gmx739UHDiIHvokzw==
X-Received: by 10.66.251.65 with SMTP id zi1mr18173645pac.133.1455889479561;
	Fri, 19 Feb 2016 05:44:39 -0800 (PST)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182])
	by smtp.gmail.com with ESMTPSA id ti6sm2341704pab.4.2016.02.19.05.44.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 05:44:37 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id q63so51451641pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:44:37 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.11.88 with SMTP id t85mr15040921pfi.98.1455889477222;
	Fri, 19 Feb 2016 05:44:37 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 19 Feb 2016 05:44:37 -0800 (PST)
In-Reply-To: <00e901d16b08$cbe296b0$63a7c410$@gmail.com>
References: <00e901d16b08$cbe296b0$63a7c410$@gmail.com>
Date: Fri, 19 Feb 2016 11:44:37 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqEBBAfmYR67JRFRyuUQ5VhB7-1pR__tMbB8pdWun815A@mail.gmail.com>
Message-ID: <CAP9ODKqEBBAfmYR67JRFRyuUQ5VhB7-1pR__tMbB8pdWun815A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-python] Python Flask recipes + cve-searching during package creation
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
X-List-Received-Date: Fri, 19 Feb 2016 13:44:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 19, 2016 at 9:29 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
...
> Unfortunately I'm unable to get access to the meta-python-flask layer. As
> stated in the commit message, I don't know if all dependencies are fulfilled
> for the flask recipes are fulfilled when building these recipes into images.
> If you have already done these work, I would really like to benefit from
> your work and not doing it again.
...

Could you try:

git clone http://code.ossystems.com.br/meta-python-flask

It should just work ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

