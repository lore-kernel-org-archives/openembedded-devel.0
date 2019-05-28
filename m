Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EF1267E01C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 15:37:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w13so12387308wru.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=cSAVmGt5pHb2HkGfMlF2MSkv5n7EltTfPSxVQrOUF4M=;
	b=D5w8kV8XuFwdDU2G79ESOtiD7aW/v7l3J607vTKdsBwZRX3d9lcHzEJfE2Z6N2V78P
	+JsUZfZewn84bX++smxLCwbgAYmcYUCoDOLuz9LM31CE+imlYHmixGwApoRR/aunh4eG
	QeQe/4qDrPfXaz/G3iBpDDCdl4wzyrZ20CTw3xQbLvDvxt6DDSXKMZaFtTmzR6Fyvp+8
	4kFpkGtXwFKzZ9vxofZR+4NzVwu2MG7rZEeJ+44Kz+dPTI7nRXL1HKIWlW66RRbz7IMC
	i4isrSw/6QKc5VGcIsICpTikWn6HyMPb1Z5fX4qeUO3Fe9d5fxe34mR0X3i13RHF/6Sz
	dnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=cSAVmGt5pHb2HkGfMlF2MSkv5n7EltTfPSxVQrOUF4M=;
	b=RLxImkB6Z11qS+82n26AjLZScckBIqrxyoCFOhWbIvCOdX9rCNu2dsRShu7zRbKn4q
	6NSBMUg99WDApcsE42eFeaL1BsgKXlXLSD1D096eTlOgIgf+WlWHz7Yas9lfod6e9+70
	cap48UK8XG6OfnsWGpwYJB0W0SzUiGc5q8MQ32qigI7p8a6fVWlPR1zq5whr88iQNwak
	9eXVFIS84caVLau1iBFu8bHT60n36vimqJOLRllAqruuySEahYcPrNMC2g7EfuxelCjx
	zI9xMiPJXk8WRMJzUCDCZOV2fEAeqk0fv5b7TCeUTjpsEN25d140Au1UbvhImsmvyg4/
	BWCw==
X-Gm-Message-State: APjAAAUibze/YICivoFm38zhAbG9QANQHWFwvA+/xmo/bm9cU0pqe0lz
	9RDaFip0AGQ6BEuwVeGHRM0VJDPAACU=
X-Google-Smtp-Source: APXvYqwwpl7Z6iuAgRRqbrIrEkfmlT0pNB28xjoN+yponScLYpj1yhQDLRGQwukVnpYqAak6o4aR6Q==
X-Received: by 2002:a5d:440d:: with SMTP id z13mr17027484wrq.263.1559057872261;
	Tue, 28 May 2019 08:37:52 -0700 (PDT)
Received: from [10.100.100.101] (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101]) by smtp.gmail.com with ESMTPSA id
	g11sm11559962wrq.89.2019.05.28.08.37.50
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 08:37:51 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190522131345.10392-1-andrei@gherzan.ro>
	<CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <119819b9-eee8-442e-f4bd-b4005b0a1a6d@gherzan.ro>
Date: Tue, 28 May 2019 16:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srfV74+4jODJtnOtgKwSBtBgznGENOZFOvkp+vZ7BdAoQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Tue, 28 May 2019 15:37:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 28/05/2019 16.13, Khem Raj wrote:
> Hi Andrei
>
> The musl patches need to be forward ported as well. They dont apply
> cleanly anymore on top of this update.

Seems like. So all the contributions now need to go through local musl
and glibc testing? This sounds a little bit of an overhead and might
discourage people in contributing because usually everyone is working on
one libc variant. Just raising it as a concern. As per this specific
case, I'm going to fix it and push a V2.

-- 
Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640 | t: @agherzan


