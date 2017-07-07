Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 38D9A77CF8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jul 2017 01:40:19 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z45so4312916wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jul 2017 18:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IjDQCrvqoEnaNJjW0ENX3xld048Z6pfRw+392EVa1Hw=;
	b=EtAuwkw7UldzR4nKJXb8v0rcuBwPwYTkYR7H+d7ESsqWiZDmVLTtCUmhJPRqOBmeC0
	6+ZIkiBXlBHsX7zRe60z4/ExBIKQLDI/zvOY+OVhJnAiecKrEfqnxAaaqOcLqakwbTxF
	Ph3pXW9HzTplloLNHl/UeW6rFj6h/ClofRWAviDshH8pPmzg0qJp8oYgv15cPqRhHpMh
	L7dowRiNQEHk+v5bssbgNpiwBlGsRRfgvrBUZ2WUVihPInRbtcwJZ8NUFTaRXepuJBRo
	EpQaqi8JFMSM472iJUaNfj4iieBqsdARbcqpfc60cjc8lPIdgeHF7IAmYiNlrPaR2BZc
	dj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IjDQCrvqoEnaNJjW0ENX3xld048Z6pfRw+392EVa1Hw=;
	b=tSV60pCzHfzADMhItNUvzeqkm8NZWziFOK/pHmyPSsTvdefqtCrF9VhQg89timZ8fS
	Ul1/VtCHEsJGg/W3rvZAQsQITYqsSKiD0umXQAabKAdA9RzGabk1Bso7kI2oFL8CU8pk
	Z3ogWfJiMdNZuW2+n6Uj0oC1HcjzNiw55FEGfa1YcAhdrm86JItakOIpwVRa4z86X03v
	VX9ApSz2ZctMvit9yA/7j8L3HRMU4l47hxqb1U4wv8lqCqpgU6ptg2rJ42UO7NNjrZgI
	SvTvKBjl+DddMKhkd0J9VBAn9XAEjFmIVGe1xjFFKiar93iY4vPYI80dRuaVP81+gASv
	x8jg==
X-Gm-Message-State: AIVw112ZNPGePLgfjSf2NO9oACyqdKt6sec74qCEM1+ILoP2ifExOJ61
	KmjIRyDUOPzw0/2meiCcSTAOc4xlNg==
X-Received: by 10.28.113.214 with SMTP id d83mr444564wmi.62.1499391621035;
	Thu, 06 Jul 2017 18:40:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.170 with HTTP; Thu, 6 Jul 2017 18:40:20 -0700 (PDT)
In-Reply-To: <e70b1f31-ce4f-52d0-27da-70c4d96bafc2@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
	<CAJTo0LZrjeVU+Dz6qZBX-6VGdXVP3yxhXoEj=W1wrswCXBYzMA@mail.gmail.com>
	<e70b1f31-ce4f-52d0-27da-70c4d96bafc2@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 6 Jul 2017 18:40:20 -0700
Message-ID: <CAJ86T=WwcFYPBqTznrVAAy4pCDp5se0CdGtFLJ1D9DHNv7sGLA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/10] Fix compile errors if distro feature openssl-no-weak-ciphers exists
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
X-List-Received-Date: Fri, 07 Jul 2017 01:40:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2017 at 5:48 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2017=E5=B9=B407=E6=9C=8806=E6=97=A5 23:30, Burton, Ross wrote:
>>
>> On 5 July 2017 at 09:11, <kai.kang@windriver.com
>> <mailto:kai.kang@windriver.com>> wrote:
>>
>>     Patches to add distro feature openssl-no-weak-ciphers have been
>>     sent to oe-core.
>>
>> FWIW I'm still not very keen on a distro feature for this.
>
> How about use a global variable rather than a distro feature and check
> whether it has been set?

Does there need to be a bitbake variable at all? Can't other packages
detect which ciphers are supported by openssl by checking the openssl
headers etc in sysroot?

> Thanks,
> Kai
>
>> Ross
> --
> Regards,
> Neil | Kai Kang
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

