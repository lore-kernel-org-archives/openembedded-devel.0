Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5C6786D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:21:56 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id j64so9439612otj.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 08:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=itA0JN+vPHXL+00UzlHPL9ytwuxA5cYIQa1clkSL96Y=;
	b=lVaRGTgw5MSC+AHR0oqfEzFvH5FMLhdCV99d36XIhbOI+VZqrAI9OIRsoaRTq4EYGy
	EaCjhb8PxQu5g95qDBZnGwAyvv2J/+ykbbW6IBW1PN48qyygZF/m3yHbJj0JXweWhD42
	U5PnTCbeHIkPZ+dXTgMlrXENNUvGZcD9l/gtxGplarnJ8qauOsy26pOuo1MrLgwo60U7
	OhhlZ4WElImvaCSDB+K6j702cVxtH7uzXy537M7P20mnaixU2DGqfGZe5uqiUokSx6k2
	MkRTYOIuZACrfK6Enp2UE3C1gORprrQr/i+LKOjylDN9TiVx7JA5j///YgGRjUPVykn+
	DWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=itA0JN+vPHXL+00UzlHPL9ytwuxA5cYIQa1clkSL96Y=;
	b=p20E0ueUMeZhfKWQVB24NnZuAtQ9hQjHytDO2aDr5ZFhNQa/a4cvt5aNWZA8uPAvZx
	jv/dwQW9Oywmc1X4PIIGCa4jw3RZFOHDQ3juRyrItiMUhp9Al7dNYdF4Y7qXzGtq3Yg7
	AJ4OhW99nXlTL6Tljt0BFKkwh1AbJAGhERA3jz007e8edR6R+CMChL7Tjx67zn48EhsT
	EOCZ0e1UGij41HtyE5CjZT3oNNcsbsT/cFkmf2Ll8yXE6APet1LXUTND2gWHwWQey/mF
	7sX2e1edB+yPSfxiA0vNrxv+eaj2Ea4PCIxJP5mlsIQCMKXdKUG7dNDAfaqtlkqd+2Na
	BZ0A==
X-Gm-Message-State: AJaThX5X2EwVlNS/djJtVNLPX86fXDFz/7Ss1NIFl38ZsST3K9Vh9cse
	5T/mghWOMzGCfVf+JDPBpZf1Df8H
X-Google-Smtp-Source: AGs4zMZa2ZCj9EOpjkAf7H99jBrb/fkIP+c3KaK1BaoUEY+EAFPQwYmIJlAemwYVMSRfDTlX49eo8Q==
X-Received: by 10.157.56.93 with SMTP id r29mr8541309otd.244.1512145317047;
	Fri, 01 Dec 2017 08:21:57 -0800 (PST)
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com.
	[74.125.82.173])
	by smtp.gmail.com with ESMTPSA id d8sm2853711oig.42.2017.12.01.08.21.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 08:21:55 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f173.google.com with SMTP id v21so9476059oth.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 08:21:55 -0800 (PST)
X-Received: by 10.157.65.213 with SMTP id v21mr8765922oti.392.1512145315213;
	Fri, 01 Dec 2017 08:21:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Fri, 1 Dec 2017 08:21:54 -0800 (PST)
In-Reply-To: <CAMKF1sp8GeD-4c1ungSZeWDhhQ2cbMrmRGd2+MJBrDFZKK4ggQ@mail.gmail.com>
References: <20171201124658.19036-1-otavio@ossystems.com.br>
	<CAMKF1sp8GeD-4c1ungSZeWDhhQ2cbMrmRGd2+MJBrDFZKK4ggQ@mail.gmail.com>
Date: Fri, 1 Dec 2017 14:21:54 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqtN+q7bvd3N-W8crWrymFRO17dOhYVtPbm2k=CdLVXEg@mail.gmail.com>
Message-ID: <CAP9ODKqtN+q7bvd3N-W8crWrymFRO17dOhYVtPbm2k=CdLVXEg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe PATCH v2 1/2] nghttp2: Move to meta-networking
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
X-List-Received-Date: Fri, 01 Dec 2017 16:21:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Dec 1, 2017 at 4:46 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> The nghttp2 depends on c-ares which is provided by meta-networking
>> layer, so it should be moved there as well.
>
> perhaps meta-webserver is better suited for this recipe.

The root reason to move to meta-networking is because it requires
c-ares. If meta-webserver already depends on meta-networking I can
move it there otherwise we will have a hard dependency.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

