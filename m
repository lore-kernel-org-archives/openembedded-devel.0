Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id B409A7F879
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2019 02:08:54 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w2so9307931qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 19:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aTkKFRf6e1+6L9fYh6EJCf87/cPcotDVTWxgg5ym5nQ=;
	b=jXdeJHhiuWcmj8ZfnFMbbwoAFQzPB8hZNi++V7cWr83VeQkROshmQo4C04zyl10Cai
	f4IvfqpTfkLJ58ZYelgl9WS6NfudhgbhLjvZ/K7QPN+CnKDg8atBQpMfCfPPcbPgKyBl
	kuEDwWz6bk/VD1ST7NvwqA2XXylDK321IcpCrmS++KATBU6OUcEMf4zZWI/i5O57EXgq
	sFZvFn5SEQ7jdkBFTvbZtQAQJjB/N83FRrFHKfx+yzn9tyVC69EBwyG+qXgj3W9Ktlw8
	ybzkNpp8pwXNzyxuh1o2xXzD+dDeV4vBNKJtxCKLx0kDPCnFn/2oEv6sGJOTwauaMBLm
	2xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aTkKFRf6e1+6L9fYh6EJCf87/cPcotDVTWxgg5ym5nQ=;
	b=X/HssVXqaTmLK2CdU57MEwzFBs4+DM3vQTSUMWMdwxt6NVa6Irgz39GsVC4kgLH5JK
	fjJvVWzq6c7U6h5cpI1q7Z4svigcx+LB1Aogb0mUjD9SUhOKrM0KqymJm4BMfngpXUG+
	+u1Xui3bRJoW15HPFJkaMQwDHhJATjgbTfwa8k+fe/039Glk2W0mtUvMjKCvxHJ8b2q8
	8UyUygj/p2HlSJhZOIAh7FHd6sBX1YRzzP1bDuL+FiHgEs9rOLi1AX7UJXPk4+SX6ufS
	HZ6+OGCGgwVHv8EwRmr7y3v8G6mq+j0fkSP45WPCeeHa8N1UEdK+mQM/99fkDIwkwrvL
	nPeA==
X-Gm-Message-State: APjAAAVUIBzq65c20J76TCDC2IeU//j5xkCMkjCi/NcAc07dEkYwM3hc
	S2hDTe8OHEL1Ov+Z0mCuWMEc9FnV2jw3gXX+680=
X-Google-Smtp-Source: APXvYqw1j/3TiallkPwuvB3i6PgNIw7/Wnrea0oUUIoHK/TktvsxcMdRDpX/rM3L6KEgAb8+7ToDkdl7W+nb13k3rQc=
X-Received: by 2002:a37:84c3:: with SMTP id g186mr6665742qkd.71.1569031735514; 
	Fri, 20 Sep 2019 19:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
	<1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
	<1568988163-30013-5-git-send-email-vincent.prince.external@saftbatteries.com>
	<CAMKF1sqYb7N6przffF7zTfxKMQd_NA+t97zGcTmXBk_93DzW0Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqYb7N6przffF7zTfxKMQd_NA+t97zGcTmXBk_93DzW0Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Sep 2019 19:08:29 -0700
Message-ID: <CAMKF1sqWfa2snLdNyVcQegkU5RqFRWYccPKn0u=3U4hjfb6Hyg@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH v2 4/4] mongodb: bump to version 4.2.0+git18ce5c9
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
X-List-Received-Date: Sat, 21 Sep 2019 02:08:54 -0000
Content-Type: text/plain; charset="UTF-8"

maybe just disable it on all libc-musl

