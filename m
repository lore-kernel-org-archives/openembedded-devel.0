Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id B3704773A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 07:02:39 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id u68so22291512uau.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 00:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=WGR7aE3loFqhv6wiEg0F5ZvaoTlIXPQnQtA929QdnfU=;
	b=mmSffCYphBi6LweRjPEKva0foeatAKIqEOprla0bZG/n3xrj+yMGSvQuJPwxstNkPI
	+DM80ElhUA1wsCsyvT/6lsUFL/QPuD6ywFPozJlopGAZPhYjRiOiJgxWw9aEyQ5bBQ6X
	8rxQhfRytdtyg1J+vJ/+nGSO2bQELR3JALbLZTRQprbUWDkFnFmfPa1LP7W5PHqV4Tkq
	71te7uZTU7NBZu4/UWFFMO0tftlAOMeI29kbwEPZ9RvPfxXZeyRbd0DCTlT8cKw/l00v
	GtcDuDps+TX6HQS7xUETNa0g3NJbir/F3gEu1+s+5adGXW724ReOSsyVaC+vUZOR+jL2
	lW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=WGR7aE3loFqhv6wiEg0F5ZvaoTlIXPQnQtA929QdnfU=;
	b=bD+xIo21IO2vuHSf6yQwMQ3VGo5UH04x9uXrgPWrn5AJ5odl24CkFB3Qgw3nU9n56f
	UfXSahAiyZAEsOTF5OofOiiawLeHS2uOv6wImCtSCOarnhO217JgkG2xHh8YCFiqFsr3
	oxlgojeu38S09kOifFgAQ1DZm8cL7gThoVsFC34/ZDmdYAwn9Dnu6n6bEX0zDWSjikRH
	wMeNgRbzfOZ1pmQ+SrXmgASMQRhBO37UNff5zEhCCPXLHj03RPPXkRnr8ipxIt6Eduv0
	LD+7niZ1AAK3VX9ez/BP+oP2oSPvtIRH85uG5bh+RCf2OlzPBw8/SYWdjPRZM5vltUnV
	3mNQ==
X-Gm-Message-State: AE9vXwPxTBlZdzTZKdOvI149PCzppohY3A6c9Q9LxsvY6yZujNZRIplDmbDuZuezhjH/qySa9cAlIoydYNys4Q==
X-Received: by 10.159.37.73 with SMTP id 67mr18562388uaz.5.1473145359596; Tue,
	06 Sep 2016 00:02:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Tue, 6 Sep 2016 00:02:39 -0700 (PDT)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 6 Sep 2016 09:02:39 +0200
Message-ID: <CALbNGRS8C7Cq0sND-gZNM9yFTcMsLW5n8dPhjqcvBatVwJXFKA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: fftw recipes
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
X-List-Received-Date: Tue, 06 Sep 2016 07:02:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

is there a technical reason why we have multiple fftw recipes (fftw /
fftwl / fftwf)?

or

before I start: Any complaints/comments if I

* merge all fftw's into one recipe named fftw splitting in multiple
packages (fftw / fftwl / fftwf / fftwq?)
* replace virtual/fftw by fftw
* make oe-core's alsa-utils fftw PACKAGFCONFIG[fftw] depending in fftw

Feedback welcome

Andreas

