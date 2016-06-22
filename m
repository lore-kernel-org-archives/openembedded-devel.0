Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC68065CB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 13:50:54 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id t7so7892510vkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=BrFZxIOIlWVllv6fJYH17zU6wjqjmBle8btB2qpyR+U=;
	b=olJFRUSQPlxKpryb++cXKlGsaqt6M2MBUM2Qr1enwoDEdBfJ6cu2J4Z5nWK7fwVhAQ
	hNQHFaKEry4ntg3I/hkePECCArDDMM+ElTCLxy7c2saitISxfh+ibXt+XMBnVcSQwjSR
	Ggn4dcUON6B1STv3whklk4LGNKtpHA79sLNy4tKTcOx0UcuujmDfcS+HdKEdIwMrZxC8
	8WTc/BfCHt99V9jcwmHZSQ8FD7+Xvy6Bg5BO6Oqi+Cd1bfK3gYLaKLCqyNnTRvOc88rm
	K1AynJgvg5UJK3jtnsq1Hdw/kYJQ7VT+SuVbYBXaiOwDLzaGkNpsbCRDC4GIUIwTcOBs
	d7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=BrFZxIOIlWVllv6fJYH17zU6wjqjmBle8btB2qpyR+U=;
	b=NL+AeW6EtcNDf0fHk+5CYdZ8K6RgIqwyoHfakDqUFW8RCIeZ1haM71tg72LUik5/kp
	rAqaVDsqJZz48h5BddfJKFQtp7R5+OPsi2xzc4rLAda6n0TPo+hZ5y7RWiukYIJXRMeZ
	d288kMJ8vvKL0rjgrBCz0XM5q3yMBUE/+3bMzFMHKBwYBMW5JNT9lOWRrbYYfUDM/Cqi
	42F5QoEI0IdjCP1lo+KgL3RATJEPNfRTOyIOO/GFrCw2KthvseTVJOHuVDqTvPUltpQ+
	7TU8vDP2uJTrmjeYnSmknpgvaYSNBuy5oz+lpC6VtDrx8N6MJhwNYo8rAlp/P9wpdOCC
	aMCQ==
X-Gm-Message-State: ALyK8tI9oHFpMKIttCSEnUlz6hEBFh42hm6eGS4fi/jOqqKsye9IMssmrl0EBUZZmCkf1w==
X-Received: by 10.159.39.38 with SMTP id a35mr12027598uaa.92.1466603454875;
	Wed, 22 Jun 2016 06:50:54 -0700 (PDT)
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com.
	[209.85.213.49])
	by smtp.gmail.com with ESMTPSA id 73sm9811831uau.2.2016.06.22.06.50.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jun 2016 06:50:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f49.google.com with SMTP id d185so62654555vkg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 06:50:53 -0700 (PDT)
X-Received: by 10.176.7.102 with SMTP id h93mr10159140uah.70.1466603453342;
	Wed, 22 Jun 2016 06:50:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Wed, 22 Jun 2016 06:50:52 -0700 (PDT)
In-Reply-To: <1466593012-16243-1-git-send-email-frederico.cadete@awtce.be>
References: <1466593012-16243-1-git-send-email-frederico.cadete@awtce.be>
Date: Wed, 22 Jun 2016 10:50:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqwQEaf-8BH-CeWrv6h=kdXe0gEcm+YMzqbNec4REeGJg@mail.gmail.com>
Message-ID: <CAP9ODKqwQEaf-8BH-CeWrv6h=kdXe0gEcm+YMzqbNec4REeGJg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] gtest: fix installation in multilib
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
X-List-Received-Date: Wed, 22 Jun 2016 13:50:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 22, 2016 at 7:56 AM, Frederico Cadete
<frederico.cadete@awtce.be> wrote:
> The installation and pkgconfig patches have to be reworked to consider
> the install directories from OE.

Missed Signed-off-by; other than that, it is acked-by me :)



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

