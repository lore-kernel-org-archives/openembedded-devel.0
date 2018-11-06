Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id E557E79DA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Nov 2018 20:12:08 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id c25-v6so11896190oiy.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Nov 2018 12:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q3MxS+hTc6hEcirvVW0C8aeCxcSHkafSK/wppenDxcM=;
	b=H9NelxD/lTkBB0HNlLlyq9ylNXrdPN7Yyr1MSy/jwAQvH9dMk1Lxy/yTmY0Q+e8uTs
	qbtCHZGwQX+4QE5oHNEf/D90dcdvHyMx4CeGtP/KZIa6O2xCHq5+EADInvQIG1BbSeY2
	fSpge6n028iCm3Sn3sGJKX4BK1zeyBKveiwneW0lUoleJ8ZiVXq178l+4ZTqRBubLH7l
	z7BXgj/dLDid1caIzeWW54AQclNid5w9mfSwibxQWrhTam8Er4Rb40G7m5C0U5GZiv1u
	Z3vvzh2iiqeXwQ3hSMigppCEikRJtBpxQzp6umzkg95QUYibtDUnmXp7Yrlf+oeqy/RJ
	nqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q3MxS+hTc6hEcirvVW0C8aeCxcSHkafSK/wppenDxcM=;
	b=nV5KrfZnLYRalkvbYcvqpFxmem1JbcSWBPBfsUlf5rCC/dooAdQelwjlxFUQvzZR9H
	Ac9j83RhWGmz//KMANYVnvxMdczpmVrmUzto0GcfqFfvWhlfUTD11TTCIg7QZuaF2P6E
	n5pobYdNnx9OwUv/6HThLgQFPnDQetcvEkHmUdmuarXGR03Qb9iEghAML4aVqigtcPnC
	5ZlX2ysjvlBOL9MQ4xUMKK1QZlp9Y3Yfz6ot0EF17g5g9K8/gCx9Ij4IC6+me7vHY7Tq
	ettoBHMxnnXXRpiLdlio9/iSe6S6G4Y1fJWARQDhAnPzahtWBizrkXtbTrIp2s9cP46u
	QbNQ==
X-Gm-Message-State: AGRZ1gIuWtlMUNQDBu3ohHNVaPihoM9msPSasaQ/JLyDs1sSjcupP21F
	uqnf54vDIq/hSI9yOsUf+zyoCjt5xiLhgaaLhNc=
X-Google-Smtp-Source: AJdET5ewOyQhy28nilvbmWcdFdL48JGs/eGLXlEECWTFmKxXKy/+bF+xf+esFmQGdtdRHVAYO7uX2P8sCQqjxXjeCDw=
X-Received: by 2002:aca:e691:: with SMTP id
	d139-v6mr11796691oih.232.1541535129853; 
	Tue, 06 Nov 2018 12:12:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Nov 2018 21:11:57 +0100
Message-ID: <CANNYZj_L9gAfEFRMY7324CZJNvmQTFqmh_GGHFitE+P=6+LKZQ@mail.gmail.com>
To: brendank310@gmail.com
Cc: schnitzeltony@googlemail.com,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 00/16] Add gnome-shell support
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
X-List-Received-Date: Tue, 06 Nov 2018 20:12:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 17:41, brendank310 <brendank310@gmail.com> wrote:
> This adds gnome3/gnome-shell support (and required dependencies)
> to meta-gnome.

It may be somewhat far-fetched, but how about taking this into oe-core
and retiring matchbox and sato?

Alex

