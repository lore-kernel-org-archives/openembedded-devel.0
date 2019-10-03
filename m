Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8AE79AE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 12:07:43 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id a1so4872228ioc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Oct 2019 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Zwn3Zqk0ACemE/c4hKb0KK+jaPrB5dlw++H8fkiYWYE=;
	b=ZdfnOdtT0KXfGhrTAsCedz/JulaQCf7TP5vaWH6rpuYhop9iNUQ2/4V8iUUDeJHTrg
	OwvS6PV4XbwNtzg64plzfcGkuYC0ZM5PNE+YgUjFuaMuL4kwiGYXnkCN6PSQGBfGfev2
	JEr7lJWYZPJfUIFZt0XdxVL1/j3j3YueDu8axxMnybEpsgWUtcw8W6XxyKIlsAVBM3jy
	81bnrALF43dQo0NBPPOZgspAgJ6x0zRcoy6McdC1BtavHPGtkZCo8RsGZHKIumY9LBjI
	H1MU3I8ihiejTCwYjq+s7c7rjHA5Fjpo2KM3shpVg9CPxoEFCOImRxNeYT/IRZ5jaQhp
	Mg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Zwn3Zqk0ACemE/c4hKb0KK+jaPrB5dlw++H8fkiYWYE=;
	b=nwx7/NNSRKuZG1t7ZfDCJwz6kDfw4XvU3nVK/OdXaVZaJ/q7RBhSBftOaRxL/36ja8
	eY1h6VkbAv7Q3227pYHHHTHakCSw4940mdjEVYTsqsDFOE56iIMSqmh/S9ZJqsAz7eKZ
	nNjT1sffCrksEHIF2rlo6uxFqnAmVoUXUhI6Q+i9+iWR4K1LX7yj4CcFmnDb9YwrNu/g
	7NBxtpwugv4/wKZ2LfwZR/ez1X5mRBndOa+uhNbphEp228uoPdaLRisXrELbnqeggkvf
	YOBZjbe/Y0WK1+sTJPGWLhyUGh6NvogxzrdfoG6yhrp7zlh473Cs9UoV8/wHy7b+zunf
	O1Ug==
X-Gm-Message-State: APjAAAWo9KSklpiWTosp2RkxFxj7v8pA1No4zG499ddxdo+776+kCKZi
	FgNrJxf9xUDXSehfxMBESFECb+kGkBwgd1F+8Ce9awen
X-Google-Smtp-Source: APXvYqwdgucbJAb0UpV/aQm0DbCkt1QHrwBhQxLM4LVIy9xIZAoTTfKU+l4j8M4nx1ygxYU5zHM6SbiqxDcdhgpX1lY=
X-Received: by 2002:a02:cc53:: with SMTP id i19mr9197627jaq.10.1570104464817; 
	Thu, 03 Oct 2019 05:07:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP;
	Thu, 3 Oct 2019 05:07:44 -0700 (PDT)
In-Reply-To: <CADkTA4OLZiHoT8UBrVK+aMa0hkMXUakvQ0ZgOL1icQbjWRHN=A@mail.gmail.com>
References: <CAA=hcWTEWCO=5CvTR8idSAGq=1LQgFpZxTSE3da8M4YgmLzpPA@mail.gmail.com>
	<CADkTA4OLZiHoT8UBrVK+aMa0hkMXUakvQ0ZgOL1icQbjWRHN=A@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 3 Oct 2019 22:07:44 +1000
Message-ID: <CAA=hcWQs81DPCv+10XZ9fgcfdpyyMLroxbv47zSbAMXjT_YzNg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Kernel 5.3 fails to compile No rules to make zImage
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
X-List-Received-Date: Thu, 03 Oct 2019 12:07:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Bruce,

On 10/1/19, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Tue, Oct 1, 2019 at 7:22 AM JH <jupiter.hce@gmail.com> wrote:
>>
>> Hi,
>>
>> I am building kernel 5.3 on imx6 but failed in do_compile, is anyone
>> able to compile kernel 5.3?
>
> I don't build for the im6, but linux-yocto-dev has been building and
> booting for v5.3 throughout the entire -rc and release cycle for that
> version.

Could you share the SRC_URI for git download, the SRCREV please?

Thank you Bruce.

Kind regards,

- jh

