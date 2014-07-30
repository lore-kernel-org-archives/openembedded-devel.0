Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id C4225701AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 02:29:23 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id c1so2075046igq.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vzzL7u2dYN3FMpQx/hGUnIjZxQwwkmQRUYvSzo9Hw60=;
	b=chvi8FMCqFrvcXyE5Bsd7hOSw8KaubXW+kBtFj4N95bT569rdIwbCqX10+oD56bgDt
	/fxbkBwVhgJG6OhO2qUO5hiKAKPWpOMJ97L5eHo5HzI4qX/NK+GIIfcXyaSoUpylwCj+
	ihIR2B9WveYnU7ELiCKgmv9KiWizvrgOkBsJ0GRiCASDQBrSiCx4qJx2RJRqiwwzbBl7
	7v/9DsvZ5iRWsV6DUH8+s5oh4n/mQNnKZBhpqI7J9E8Fm4oZtq0775cyD0wSwSBz/BXV
	JhDkN0Cl6UnpgWh/CnB8CpS5Ylv36meTDr5u53QH1FITyB5tDGNvROr7j8MLPajGymW4
	Za6w==
X-Received: by 10.50.134.136 with SMTP id pk8mr49431318igb.20.1406687365167;
	Tue, 29 Jul 2014 19:29:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 29 Jul 2014 19:28:55 -0700 (PDT)
In-Reply-To: <CAP9ODKq=mNeFOf_DMTNiiT4Lj0H=zujFyad97=E1K+KGTrr5OQ@mail.gmail.com>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
	<CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
	<CAP9ODKq=mNeFOf_DMTNiiT4Lj0H=zujFyad97=E1K+KGTrr5OQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2014 19:28:55 -0700
Message-ID: <CAMKF1srBNaC9hA8Sq_-jV3qmwn+SM4-nXpmvSBfU3+VftCUEZg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
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
X-List-Received-Date: Wed, 30 Jul 2014 02:29:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 2:51 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> There are customers who don't need to use the Google APIs so they are
> not willing to make an API key and instead they prefer to drop the
> warning and keep using the Chromium as an application platform. We've
> been involved in a couple of projects lately where this happened.
>
> Chromium's upstream advice is to generate an API and use it to deploy;
> I think in the meta-browser's case this is sub-optimal as we'll end
> having several products and customers using our key and not making
> their own ones.

OK then disabling the API key is in essence suppressing the problem. I
am fine if thats
the general usecase but I doubt that

