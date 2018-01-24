Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0657803F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 15:27:08 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id b129so1613714ywa.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 07:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=7BL/6JAUFmpDQnjLGHVNMk8DPDp8m8keLYVdMeZOKDI=;
	b=oaMRpY4fY60Yg+cI5ALZWE+kkp7/RC5vUe5dcqHPXHYii7mFJbHSO6tJEsjo+jIHaY
	cFTEfZ859AKof922c2bVlnxbGK1atvReN4oz33chGHC/+Bxt3Cxr/Fj8D6C51JlxtbCN
	EzcSF2KttUdalG4jozP2vL/Tle17MXA8ci55JMNqIj7sncAOPkUqltZZN9ckYaXB0LBu
	M6IduL2MNK+pBK736p+G2PuH8YgGqvZyyxZbKb68CR+fKEHrcsIGXKaDTP4EOE3m8DhN
	XWeyftnLVPMiZjnfcz3FKDDLej+UF1FXrH4gjHO1UDxJtOPgtl736Jk5Krx2yhtiqyuv
	OSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=7BL/6JAUFmpDQnjLGHVNMk8DPDp8m8keLYVdMeZOKDI=;
	b=h6sE3FJMKg1uFSeojtFXhgVn99ovYbvCngMq2VQOJDYxRO1MO5d2ZyXqo8Gx0zO2iY
	tl4rj7quRHPO+cGoPecbpjFQvwyJWy5n6g926LVka5JWKqVJegwBlKK/5ETK0uKOPg00
	z7QDIrURCo6c5U3f9WyKkuMEJp00i2Yy87nXe4uhd7ypBR2I71GdCiDgtgxsziM6d3Dl
	c6ray6332INEpA9GD3iEtx8RmtoeX+/2E4Y0E8IX173JprornBwvhYuPvjqz9WZF6Tg9
	oNhRuKcNMQP2tsvhi1qwtMUnfhQ0cXUihtsHyiD5HqtApyqiAvyC73GYzjOOBp0OVfzT
	XMlQ==
X-Gm-Message-State: AKwxyted78qpcRYD2VXrhJbbN8/ghSYrSRRGjlDj0GZNG2SKVxer1TCa
	qs8GuyN0fSHuMGXRnt5MaHdYITQn7Lt6QaiJt2A=
X-Google-Smtp-Source: AH8x224t3/rVD2N8fFOMHWnSrt15mOLJnKeSdabIz9iggDLzaWsxUEk2MFSAxCooXo9LqJz3NbU/DfR1cUg1XxVBx0U=
X-Received: by 10.129.222.12 with SMTP id k12mr5503180ywj.225.1516807630054;
	Wed, 24 Jan 2018 07:27:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.199.133 with HTTP; Wed, 24 Jan 2018 07:27:09 -0800 (PST)
In-Reply-To: <20171130081026.25414-1-schnitzeltony@gmail.com>
References: <20171130081026.25414-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 24 Jan 2018 16:27:09 +0100
Message-ID: <CALbNGRSuQkYnh22ChTz3g9HcZrjRbf0FzQJrUbZwES-Jm21Cog@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] qwt-qt5: rewrite completely
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
X-List-Received-Date: Wed, 24 Jan 2018 15:27:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 9:10 AM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> * install pkgconfig
> * fix examples
> * DESCRIPTION -> SUMMARY
> * overall cleanup
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>

Is it possible to get this into rocko?

Andreas

