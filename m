Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 523C17729C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 19:11:17 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id yy13so86556454pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 11:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=zdimkH9XF1O/2hhLAnmw6tSU08oGPdeEhGGuWbw265o=;
	b=zsBzoO7w1M5ApgQ0vp18vHLRkdxbLCcQewAMtXyJ6LAbJb0mFG/WJ7jHWslHBxw4p2
	P8fX6vLvyxGg6jNtLODO4g6Ql3lkfRjwNKUMxQMXhYP7N2WTiNtq4zHBFyH7lwFNG5Xo
	Jf1zjjEuiLALngvmP0BR0Ie6yVPfvxfPJ3QPACRDKeqi0zigPEUxqwsPBmGZHxWgGL30
	e6hY1fdPRobiMh1qMRSvkM1kKIJBaKJaPlZBkNRY60wP6JsynJ9YkM3lRukrSm9I4iwQ
	0+6gQOsqgdH5IDlR8Mo1tx2DhQ6/Pppice1QrO2IwO9+4xG/t4xEI/SJGPxpbvgmtSrw
	uAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=zdimkH9XF1O/2hhLAnmw6tSU08oGPdeEhGGuWbw265o=;
	b=Oef4VHwCmJ5jrc5nkW3HeBkp4QP0jv6BIMLqRW0VjWqO+nf/zXQaFKIs4inVoSz6NC
	FQs82NJy6MUL/Jyz/2iCkRSqTojwLW5gtRBAZpvt15ME+lSSKRzd3wGeuNKxazCiR9O0
	pePtsTUogk0d0EPjvG6Cgo5MDr3gS6SuY9h391pEkWj7YQxLUiCRgTS0/IyAdCc9zv1H
	hzjerza63ghtsgZ6VQwyZYsfAASgoPWnyMcmfBxdtGViKaNjhGBEMGpXveRpbNWJwxMr
	NlN0RneZ5/prEwD7SXqlnQRV3R2raXXWBrXr+RP4Izs+L+Fe0kf6+CTG7DxIGcLV0f/i
	bXYg==
X-Gm-Message-State: AG10YOTSbv2WTb+LWGDPyUEhRMGHYr+4a+Yzy2nGsGnlf/isFyCb4vvrkU19B/8+7iM2pA==
X-Received: by 10.66.162.164 with SMTP id yb4mr40812686pab.94.1454353878728;
	Mon, 01 Feb 2016 11:11:18 -0800 (PST)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	v2sm44927494pfi.93.2016.02.01.11.11.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 11:11:17 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f50.google.com with SMTP id uo6so88304551pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 11:11:16 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.227.73 with SMTP id ry9mr40662486pac.120.1454353876342;
	Mon, 01 Feb 2016 11:11:16 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 1 Feb 2016 11:11:16 -0800 (PST)
In-Reply-To: <1454350624-1149-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1454350624-1149-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Mon, 1 Feb 2016 17:11:16 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpU9V5BcbfxZaKHt17a4D4DnZs4hoo0qmj6XZUwNObEcA@mail.gmail.com>
Message-ID: <CAP9ODKpU9V5BcbfxZaKHt17a4D4DnZs4hoo0qmj6XZUwNObEcA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-networking][PATCH] lldpd: Update to version 0.9.0
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
X-List-Received-Date: Mon, 01 Feb 2016 19:11:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 4:17 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> The new release has following changes since version 0.7.19:
>
> - client: fix segfault when displaying some information
> - build: add some integration tests
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

