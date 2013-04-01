Received: from mail-bk0-f41.google.com ([209.85.214.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1UMel7-0002oi-7j
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 15:26:49 +0200
Received: by mail-bk0-f41.google.com with SMTP id i18so915298bkv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=7BEIve6BD2jyHKUimH5sp0R1UDBFtFcUSKAiQ7DXhyQ=;
	b=sxCG7kNQOpzduqRVFpxKWPybuAmexBoqh+4vjrp++2a9IEoy+st8nFE91baLjEkUIY
	uKRrwJIjTpXTC+HqQ0kKMwG+r4S+cjCFq2+6/dO67Mkqsn9+oHWrczn4/9JKIb3NaViZ
	xVkr4Dij/TKjkBvkNSOWlRmU1xiLAHGmnWcyjiudKxvHKmDviulBbBtAVhP+J8wS+1/W
	F094rsW9tmJ0M3cv1UDb4X1kIVZSxhBtrUwcTOjlH+IdeATnxinkd+UKsKR207BdfUVU
	+r7/ZHf+M1KM1sBLEh82g2cqvVX2IFoCLZ4dQG8iFEIWGpw28wgmU9MD1MSyAqpNvlRi
	KCEg==
X-Received: by 10.205.26.200 with SMTP id rn8mr5068903bkb.13.1364821780589;
	Mon, 01 Apr 2013 06:09:40 -0700 (PDT)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Mon, 1 Apr 2013 06:09:20 -0700 (PDT)
In-Reply-To: <5156DB73.4040507@emagii.com>
References: <5156DB73.4040507@emagii.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Mon, 1 Apr 2013 22:09:20 +0900
X-Google-Sender-Auth: 3zxTqcjaQ0Xb7O6dH5xYI37GYw0
Message-ID: <CAPESJy7rbqQhi4kfEmLOuwLLogQoSXO9iSx0UD=B8sOu41R6mA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Finding out the IMAGE_BASENAME of the image beeing built
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2013 13:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Ulf,

I couldn't find the reason your recipe is stand alone,
because it doesn't generate image by itself. Does it?

My idea is written under the quote. How is it?


Let me go back to your question in first mail.

2013/3/30 Ulf Samuelsson <openembedded@emagii.com>:
> Trying create a programming script recipe and need to find out the
> IMAGE_BASENAME of the bitbake target
> so I can get the filename of the image
>
> ${MACHINE}-${IMAGE_BASENAME}.ubi
>
> I.E: if I do
>
> $ MACHINE=beagleboard  bitbake some-image
>
> and "some-image_1.0.bb" contains
>
> IMAGE_BASENAME = "renamed-image"
>
> Then the resulting image will be
>
>     "beagleboard-renamed-image.ubi"
>
> How get this info from another recipe?

----  your-image.bb ---- from here ----
include some-image.bb

 ((( use  ${IMAGE_BASENAME} and ${MACHINE} for your process )))

 ((( after that, redefine IMAGE_BASENAME and other variables if necessary. )))

---- your-image.bb ---- to here ----

-- 
Takeshi Hamasaki


