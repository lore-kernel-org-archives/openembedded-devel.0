Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5761.1795051227303520186
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 17:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iUThaqOC;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: colinmca242@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso825285a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 17:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795051225; cv=none;
        d=google.com; s=arc-20260327;
        b=eZ06oS+FdqFNbqOUDiKnv/Os3dVDz2W7ukRg4IPxI4gYq+HaJ2IW4o7r2KyPQYiEGQ
         F8kGFVVsjYqL5ORQx+8bksnZqAKt//fj1De+Zw5+onMJhD6d7qd+Kgu9j0dl40vS+Nta
         ICfs5Te4swdRJusv/3wO0HDTdv3MpMlVzpFz8fjxvvu6WktOh4AmpAB5nRoElb2tLfRz
         8PoYF2Jmta7X9jczrST1dFlNI/18hysBoN4+jkh/nxI8gFNOFgIZIkaAwF0nOT8dJ252
         0CqXYJzVNQh0NwONLHlEkgrtlEblW9g58hz2+zFgSoXU7uMJs+xNdh9+ay7lG2PCrlEC
         J5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=1yCrsdzD1mr5mU/PRfZ58iIZZMYdWeTE3FoRP1k4TJM=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=UJ1YAU7vzFv0wQeKmKYFOM7xsGVHKcn9APyh5ghL8eY2c3cDuVvj1lvCXKgmUb8mLf
         dLBMJ2GYdZKxSnVDPmmoBVhjjEecsAtjOYu3HRGcV3FBblAYVEz9MW1uwT7LZWJXNyL2
         Eo9rLD4GsLuK+yefkg3bl7Y/2DwEvWWiatKhXQSkbj6qJesIVItOnk6S6HzJXk91K6oA
         +dS71kQLxhQ6n8MDA7IFeSuZpuemHLV5tni+6aMc7k+KEm1Mvrwg71ybDup3L1G4f9Yr
         DsHFw9WfK7TRRX5ogDqvOWFPXKiLe/i+6dWCJrAwxzVgPooTCH9YDqqOrZasVfNRIBWR
         PopA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051225; x=1795656025; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yCrsdzD1mr5mU/PRfZ58iIZZMYdWeTE3FoRP1k4TJM=;
        b=iUThaqOC7j2j5g9WzxxI4RcqN7NjHI4NQ7bfVLlL+lcHXQn6YXdfs4cLVGjmNQHnKs
         Q62NrDkRhtJUF4DwPdspvlnZwjQErYdFL9qMO2k4aisrDv5DMA7oVjFU3JkYkHCeBtz9
         bgQ9JyL4f+Xpt1yjgrozU1PxpSm5Y/dI6+/ybJb5yTUXurbY8vLh1v7P7sDPZC1QssWY
         /xZSBeCP/DBAmG7PQxQbmBOsB2CeoPqWeQkDQsXQS7JHS2ehCku6JpbOE6krUd7gcx74
         yj/Q3Syw4scMUe5IhqQ46qdq9hCe/cCQuleri39PN8zyqDIkPJ5YLYIa7baL1ZXdoWZj
         R4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051225; x=1795656025;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1yCrsdzD1mr5mU/PRfZ58iIZZMYdWeTE3FoRP1k4TJM=;
        b=zfpKt5JYYAptcUTuvAlb0Nm42LMcIxl1y9sRSfalJt+uCeu4MBK8i0r19WrE7qEzXs
         SzkXYr+TowArLlxA7LTaVxcT9vO9Me8WmIeDV2Tl3pr704NvujRwAcvw+Pda4XLdbnwv
         9xmWmj1epeVpPZigfo8By00VZLbCAASVK+eT/RxeHGGWT0MAsdNMk9gjOrTaaOgKH7KK
         jtiJfTDm/Val8yHnuuXS9k9RVK2yD08boNJsYQ3Jf1tmAhDFG6GbJyALD4nIAF4REZL+
         QmsZfr7eAD0P4mtFAAQ5Vj2DPHSQ/PAnE/ui9uSAM+aUh7ZjbtcxU7eCrM79ZHUz7fib
         5lIA==
X-Gm-Message-State: APuU4Z+m5N/rpPIOOX+J0UW2Chrt+BrP1VrEqpSRAUkd1fhymz8mG8an
	Mbtd29LFaUuF/l7AU+J5jXlE3iCRN+DIf4kh4Njux1b518Kb2VBD2ah/97WDOyBwNto2R7TatWL
	R9Vy+DwNSufowHewy82Sic18YzfNWNgHxgN/v
X-Gm-Gg: AYBFou12jAFt+fy7u+k4I2asZuh1Ls/BLaACbLwaOqMpWouQRixhU2JZ6Pm+03IiUqS
	zhQFOO/oMYGSe2zFj1KxMYWSSouzlTlbar5fdyhs9xVNA2nz1x41WqWyzunbyRNJ/weh5ZqVB1c
	5++kWAMvH1EGOsdPVq4USSN884p+a7HwcS+ULGqjCDsSw0GSlxnRFfFVnFgXi2P4jtsOsFbDcHR
	RHMzIg5tfgT4kQ4hxa6jeJX3IzP68Xj+WpkMqZEiadolc6VVYUy5I9JzODFD/XpG/7/XqPasCDf
	bngoGQxHmbgJG306S6tNlu/zgIaTH9jgbPFWaLpkXZClfKk4RcB179tUaeocolkJRnXl2Of0HAA
	2mD5Dh5WkBdmrQNyROsjVtZrlk8m96A/Rg9Y2PzAwETYEfSERBrpiZEUQYmLWBmqdDOpfNg==
X-Received: by 2002:a05:6402:320c:b0:6b8:7fca:9291 with SMTP id
 4fb4d7f45d1cf-6ba1321844bmr165299a12.4.1795051225480; Wed, 18 Nov 2026
 17:20:25 -0800 (PST)
MIME-Version: 1.0
From: Colin <colinmca242@gmail.com>
Date: Wed, 18 Nov 2026 19:20:14 -0600
X-Gm-Features: AclHuK-8jtbvoe43wb7A_oE9Fw54YrdmEYuBtaseIleyiOYTRB5FGjV0Lg1l0pE
Message-ID: <CAAyLwgTzTe9iz=v1rjuD-fdTZMUR_xUV0FZVPOpANhZHqxzjXQ@mail.gmail.com>
Subject: OpenEmbedded Workshop 2027
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 01:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132664

Hello everyone,

Mark your calendars: the annual OpenEmbedded Workshop will take place
on February 1, 2027, in Brussels the day after FOSDEM. We=E2=80=99ll be at
Silversquare Bailli (Avenue Louise 231), the same venue as last year.

## Call for Proposals

The CFP is open. If you have something to share, please submit a proposal a=
t:
https://pretalx.com/openembedded-workshop-2027/cfp

## Tickets

Tickets are now on sale at:
https://pretix.eu/OpenEmbedded/OEW27/

Early-bird tickets are 75 EUR until December 31, 2026 (or until the
first ten are sold), then 100 EUR for regular admission. There is also
a business ticket if your employer is covering the cost.

## Sponsorship

We=E2=80=99re still looking for sponsors for lunch and for the after-event
social hour. We also have a supporter sponsorship tier, which includes
a ticket and recognition for being a sponsor. If you or your employer
would like to get involved, contact board@openembedded.org or me
directly for details.

Hope to see you there!
Colin
