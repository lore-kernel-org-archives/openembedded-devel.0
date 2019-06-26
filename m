Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
	[209.85.167.178])
	by mail.openembedded.org (Postfix) with ESMTP id 113727D43C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 17:54:04 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id s184so2595339oie.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GUwY/m5UT2pdHRA7CRVabSb9DUxPn1AKYrttabNSWb8=;
	b=KlD4DP5OgcfOr5G/DkG7we1U6hx1Huweni0P4FWq5AiYNxCGT3kPcaTqHFdol/J0be
	J25SqpWlrRMJ/B1tFi5qusiXHSj9Uscec8KFEqkc4ajJVEjKhCHCODwdQKMoDYRRloWn
	zApv8sowvn3oQxrnR8mLcipgEuRAygo81b+LaBZ4ekb4WQ+A9nieGkY0mlTI5Cu1Bd/4
	NpOGuHiwRicGhhK20NjAGO8GhhlvKkTQhAOJCyqEtGCe0pwHFjE+m3Sg5W65Kh7BZ14g
	NNDCrcqsUHfrNkysvQlCVCwbzejvX+SYGzg3aJzatsE+FRVbH6oI2h+E4M82KGa3wEYV
	mAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GUwY/m5UT2pdHRA7CRVabSb9DUxPn1AKYrttabNSWb8=;
	b=XK6hVTpDCahy2wy0f/Fak5VH51elh4DqJ3Wrktwh0Gk5ojoS4jKmMoD62G0xA+x0aD
	D0Ahz1ZWliGaEJGl+VpLhMr0y2Ld3EZjiKa72VS71smrYoDnLZqctNaq16oPF5sm8u6x
	3HcN8Ia0zn3cLghBIYSmSghDr03+axChAhEtqlSjTJAWezsUIWCO3d2Dh6dNoRShUGlt
	Vb6LZH96UQXW8tIQmuzbmu1Sq2LGrsIXChbcgtYOMra+4Mohu0T3DpWti/so9/ml5D24
	5Xqcuh1N5Tv4gG4pwvXShzOdQtE2tPVpYuA4b5jESMvydFbooAQ3nNeM4rv0dLJ4gZX2
	J1VA==
X-Gm-Message-State: APjAAAXlET3RrhAn8jxasnl6kx+nFqeApUWBLxQb99q09p4FU1Yl+fRc
	4378u+3H+KY3JSXJrbPsZ7+yHrUatjR9hA==
X-Google-Smtp-Source: APXvYqxzrVS9Vgdk0mGrmSOaVS6vKAuQ/kaZPjuVO9872u3mmfYAPjpTIP+hbk+QAYUlhwLhTRDkog==
X-Received: by 2002:aca:ebc8:: with SMTP id j191mr181909oih.164.1561571645651; 
	Wed, 26 Jun 2019 10:54:05 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
	[209.85.167.172])
	by smtp.gmail.com with ESMTPSA id c2sm442693oto.64.2019.06.26.10.54.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 10:54:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f172.google.com with SMTP id w79so2599465oif.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 10:54:04 -0700 (PDT)
X-Received: by 2002:aca:4e84:: with SMTP id c126mr150215oib.153.1561571644136; 
	Wed, 26 Jun 2019 10:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <6ry31owmw8.fsf@pengutronix.de> <6rv9wswk3t.fsf@pengutronix.de>
In-Reply-To: <6rv9wswk3t.fsf@pengutronix.de>
Date: Wed, 26 Jun 2019 14:53:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKooyOFZb7fYcLGM8QRaJR2skz-xhWX+Epq1DECzNBQbOQ@mail.gmail.com>
Message-ID: <CAP9ODKooyOFZb7fYcLGM8QRaJR2skz-xhWX+Epq1DECzNBQbOQ@mail.gmail.com>
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: Maksim Sisov <msisov@igalia.com>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Denis Carikli <denis@eukrea.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
	=?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>
Subject: Re: [meta-browser] host leaking wayland-scanner?
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
X-List-Received-Date: Wed, 26 Jun 2019 17:54:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ulrich,

On Wed, Jun 26, 2019 at 10:29 AM Ulrich =C3=96lmann <u.oelmann@pengutronix.=
de> wrote:
> Again it's me with another small question regarding meta-browser's
> maintainership - I got the following back from our mail delivery system:
...
> Are Denis Carikli and Eric B=C3=A9nard still actively maintaining meta-
> browser? (Their last commits are from 2012-07-12 and 2013-03-08
> respectively).

They are not.

> As both are listed as maintainers in [6] I would like to
> ask if a patch to update the README file is welcome? Are there other
> maintainers that shall be listed there instead?

Absolutely, please prepare it.

Raphael, Maksim, Khem, Fabio and I are the active people.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

