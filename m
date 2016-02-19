Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E57D3771FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 13:24:00 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id fy10so50352107pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=/bxS0AQXEze9V6txgvu5NiWWMQTc8K/WV3FulCJoFys=;
	b=w9T0OlgzGK06qENcWszch0l41W/SPIqX5PEkFhU0mwrI2iuTqTMYF9XXgy//Ufj34G
	BNbGJLdA0/JgbmgVlc5FGXYnFqNh1bKg+zmedbf/+9AL3Fp0PUK7dxflq7dc7hf6JHkc
	P3SENbCCEWiXebi3f0Tt+Gy3NAAmBKH1YFg5KveeEjVS1Uexywh8AaZ29DrCQUhW7cxP
	92OGQzf/BnqPSMdEegqohH9xInWckgqv4ZYf8oNvtdgn8aaTPH+rmvzWGjB1yj8ijYO9
	4ZJO/YF78++cq3fp+yEu8WkhNREBk95WucSLuEo40L3iPp68QyVUCyrLot/hggVHkkLu
	vU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=/bxS0AQXEze9V6txgvu5NiWWMQTc8K/WV3FulCJoFys=;
	b=k4pErOlfYb+goWRzu80lP+OYl1uvcw4F1wfQ4NIDPIy9117NEbLhjSROcSE133lcIl
	YLf69+DtE5qzSLji1N76vyFxkqvEnc4l6YDmNW5EdKix70mYbsRqlRCwUV5Sm0bsS0Vx
	OL8w677YIbR+dBPnxL/7GYlf1PsGAkWzQ+HIBogUIsHbnmmS89j8Aufpl57jwa87hlNF
	vpLoZePGASlytB55iSMV1zl494K6eGnBtC8wgPeHVJsiRF7BQnx9r9WW0SyykSXI+wcP
	ZSd12XZEOG2qd1Ucbgjy9RtGzmBXojGlI9hhAWWpVs4rU9TWkjO3WrbsUZ9503jrqlpV
	G4cw==
X-Gm-Message-State: AG10YOTxCfIi04VtnSLG+oJ71Izi+HgNWq2nEmVmc66H+LXK0+ys5uyh2l00xJh2dUzggQ==
X-Received: by 10.67.23.202 with SMTP id ic10mr10755385pad.127.1455888241153; 
	Fri, 19 Feb 2016 05:24:01 -0800 (PST)
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com.
	[209.85.192.172]) by smtp.gmail.com with ESMTPSA id
	t12sm17915221pfa.54.2016.02.19.05.23.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 05:23:59 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f172.google.com with SMTP id x65so51222708pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:23:59 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.67.149 with SMTP id l21mr18125314pfi.112.1455888238771;
	Fri, 19 Feb 2016 05:23:58 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 19 Feb 2016 05:23:58 -0800 (PST)
In-Reply-To: <CABcZANmnO78wfOe6p05MdU_jZ-9SqrQOAzxrqejrLBU2AXUR0Q@mail.gmail.com>
References: <1455815945-9857-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmnO78wfOe6p05MdU_jZ-9SqrQOAzxrqejrLBU2AXUR0Q@mail.gmail.com>
Date: Fri, 19 Feb 2016 11:23:58 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr2p6LispW-Hm-kbUuxJt4ZjSrB3hio9h2=58Jnid8mSg@mail.gmail.com>
Message-ID: <CAP9ODKr2p6LispW-Hm-kbUuxJt4ZjSrB3hio9h2=58Jnid8mSg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] fio: Remove --disable-static from EXTRA_OECONF
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
X-List-Received-Date: Fri, 19 Feb 2016 13:24:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 18, 2016 at 6:43 PM, Christopher Larson <kergoth@gmail.com> wrote:
> I think the convention is to add such workarounds to no-static-libs.inc,
> not the recipe, at this time.

For OE-Core, yes. For Meta-OE? I think the recipe is the easiest to
notice when doing the upgrade.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

