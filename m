Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 67D10782DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:23:59 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id p9so1810111pgc.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IdBlHy22ElBI9d22ElZ477ExxrL6kItHrx6xqhdbt1Y=;
	b=gvykFULR0cWmXLz99sMcygeXOl4uZ7Tdxb3WYAGTznkHzyP8OK8yaqS8D+L/jRiudz
	s5Ibi3Umdertrs0ZpvsrznaX3NOuOnICCDsr0J8XrG9jxV/H4/SrM2XtJ4h/Hs9kbWxp
	lGs5Qi50xZOPSKz04dYr3iEuLA3/vEzn1M0NaHcEK60d4Dzr3jrX0o7fqo937PXPupjz
	IqB9KfETkSmOGZEslFve4U2ZJp4yyEmjBpnaAMyfIg51QAguR+riXOqLeCTxRZr+m0HG
	AJ14mDZwfOnSFk6IgxTqVltDcxfbwuAQGjKvLD9uan3yhy+IcTOhbji14bFSyFLU6khw
	PuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IdBlHy22ElBI9d22ElZ477ExxrL6kItHrx6xqhdbt1Y=;
	b=W3mMyEAR1rhoIhRkKJ5UQCqErwws79eItZzU1GWMi5MHMtHjkgK6xXzlQiDTYuBOOV
	3hr5ilWAPitDE66mPoSlMER3SVDKtMyzERvti7mVlawfUDgLvndSSM3s4uqP7su4DB7v
	Or1QQifnl3DZ1iq0+s4ANiZmCAPLCr17e0clIzRuPWirF5K84ARN+92H4UFFVCi9hIA1
	/ECWf0ASVDgaPCT79hEmb+htuoDXflcc4rtjUii1L9Qf8oDketekHT+T5lQvm0AOGaY+
	tcmc2S3FSSKfW8uwY7+xMuAxsqSoJY/D4tiiXQsNNMal13NMqFypkErcnrXfnG4Gxqm8
	9Pfw==
X-Gm-Message-State: AMCzsaXbhNbUpXZEEZ2c+XzfYR507aSLlImMQXEP1NXVjgF+p4QACgo0
	ZrMioJaLMWU+BGzbP/OObmIaqmVjCVI0WqfUNqU=
X-Google-Smtp-Source: ABhQp+T9YKea3kmzg9NCUeAZ9P7Re5krDyda8sXl6xPFRIjTSNrE6pvUc0VZYNhbxu50Zo7WjIjW+qxaLlkFn8Svsxk=
X-Received: by 10.98.166.205 with SMTP id r74mr2151686pfl.285.1508257440414;
	Tue, 17 Oct 2017 09:24:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 09:23:29 -0700 (PDT)
In-Reply-To: <20171017051134.GC9221@denix.org>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 09:23:29 -0700
Message-ID: <CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Tue, 17 Oct 2017 16:23:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 10:11 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Oct 16, 2017 at 09:19:25PM -0700, Khem Raj wrote:
>> On Wed, Oct 4, 2017 at 1:20 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > The following improvements have been made over the recipe that was in
>> > meta-intel-iot-middleware (a layer which is no longer actively
>> > maintained):
>> >
>> > * Upgrade to latest upstream version (765.50.9)
>> > * Fix compilation failures by passing CC and LD
>> > * Fix "no GNU hash in the ELF binary" issue
>> > * Point S at the correct source subdirectory so that "make clean" works
>> > * Fix lack of soname on libdns_sd.so leading to missing RDEPENDS QA error
>> > * Add SUMMARY
>> >
>>
>>
>> This has been accepted into master but it fails to build with musl
>
> Is musl a requirement for meta-oe?

We have fixed it to a point where we have around 10-12 recipes which
don't compile
with musl, and it would be better to keep this level as such and
especially when we
know its failing. its a requirement for oe-core

