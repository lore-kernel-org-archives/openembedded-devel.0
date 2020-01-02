Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id F0CF77D3AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 16:22:38 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z76so32083022qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZRXdtpBEkLAL7EsT9A8V16tYf9kbZiWvewnPiDO2aZI=;
	b=cSgX+qbSPrvOmM/Ijen6U8cwMZ3vRbsBYJwc7iN0hnvrzg4uTRPQxUDZhuPy7AU4RF
	LUqyWbrd60YFMN+dgJk+K1Meh6a9zBmpn4UwDRJxumwlR9lhEe1uuhqO1iuIHn2+0amF
	kPxSHiDzzadt0blj7bOnLaW4si+z8PlIT91G2Fq3REfYIBLJQ0tGpXfba+ozq+B6+9h6
	XPZTiOMv8wvmE+Ak5xpUDuKXZJ6v8Ry6RDphWvvPccXoQNq3oECooCVaYOWduVix9eHQ
	zmY1IwgKIemOM2DkN+HA91QIDBw5x5gpYWk7OYVytaDlFTzAzuMJ7rWl+bTFf0HfkYfK
	MBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZRXdtpBEkLAL7EsT9A8V16tYf9kbZiWvewnPiDO2aZI=;
	b=umw0pMrDqbPSsHasI49demR9GA3ZCPxzkN1y9aYH88tzrXHYvw68JyodyJdvqkhjL8
	8VbrdAtV7d0MHFTHfQfHpC4QqtgRu8k/g+gkLz+bZOqmelino6YtIq/f735HEfqGIuk3
	7znABH9LG3hDtB0YYsJb9RppqYEZJi4r+RqjmISPI75E5mW3T7xYyoPcNWjDeXeNO0tC
	i39D0d+62k7hergQMf2B1imlutdRsIRPXGL7gqNXQ41EouToxR9ny01kqCprzvT4M0vc
	MEO/8zV/w7AlFRZ4LH+RDoTTQvvTEgH1Xm6ZHjzgF1TgdvP6u3LaUi0S7+k3TowiNyLu
	vMSA==
X-Gm-Message-State: APjAAAVcj5tM7offgRZQhMnspnwlPPNzcc7RXQaa2mYwlY4xD57ofxx3
	7x4tqhGBwc7I5awyjVfOgm/N0awieFjWifBBt4W5zee0
X-Google-Smtp-Source: APXvYqxq9RL8COOJcaph+gIQc6yHzccz2Y3lwZHSKVmiPor8xLv5sp68IC/k6+Ig9/a0yyEj9a6ZQv+qkeslk0+kPrE=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr68287296qkf.337.1577982159482; 
	Thu, 02 Jan 2020 08:22:39 -0800 (PST)
MIME-Version: 1.0
References: <20200102061330.480482-1-raj.khem@gmail.com>
	<20200102061330.480482-3-raj.khem@gmail.com>
	<20200102105520.GA11760@localhost>
In-Reply-To: <20200102105520.GA11760@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jan 2020 08:22:28 -0800
Message-ID: <CAMKF1srXvYy9QT8DvfbH2Pe1hRn9wCkg5n3__O5cMm1HiRTLcw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/6] gtkperf: Fix build with latest gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 16:22:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2020 at 2:55 AM Adrian Bunk <bunk@stusta.de> wrote:

> It might be time to remove gtkperf?
>
> It is a benchmarking tool for the old GTK+2, and with no upstream
> release in 15 years there is not much chance that gtkperf will get
> ported to more recent GTK versions


I think that=E2=80=99s reasonable. I will perhaps prefer to remove it as we=
ll

cu

Adrian
>

