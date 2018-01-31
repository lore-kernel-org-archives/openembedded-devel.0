Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 00D0B6FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 15:53:39 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id m83so10904479oik.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 07:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=RIzeIixafyb4YXhikH8XxFDWul3Mk04JkbcPmD9paCo=;
	b=PjMPH1/jVhLxYcruNLkzz4RnNVYujl7I6g2O6uAKooS20bjqOm2Ajn5itMORb6WeYq
	hDOqttutsI6FqiCy0Ve++ZXYNeGjPxLgZeW47LoXgHlc8hQIUz62Y1yqJtStkqByU+2+
	7/J7HaVP3jGWTLScMIuPM2cKliqsWPPzFtjxwHDLdRuDl7MWxl566wR6PvKZPLyj/wyD
	NnlPYh2GNQcbidJ4+LxUhoC8rE2Sku3FEYAQ2aFaSQnTiRCp3Q4pTM5m7e8Vs76uzglG
	y/Y088+bYc9fbIyOnU7f52v4nH2xvssUE84BEbM6XR+XXnj55xv2HBY2JOk4TbYapcV0
	kYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=RIzeIixafyb4YXhikH8XxFDWul3Mk04JkbcPmD9paCo=;
	b=PqYM0AKPIfZl7O5Wql6TXtvFCVDpWS7yMVNswQlBo4aYK3HAuBJQMLdAbmEA/te3Px
	COGuZOEeUAGG66MVaC5JVLARObDY45OUFYmS69ggFP/Iscd5nuNaAPQdM7d5ikPnOLzo
	gKjrWRz4bdN0HK5OTzt0Lqj1nd2IZW38/0XSIAayaLjPcsVCbZTJSzSjDCtR39SFWhz4
	7DPPxcqbOQtjU9BPWi+1lqoFzLlklt0GnmGMmIysY73TqMpFk2dGkdhgaztlZunN1Le0
	Q3siM9jRXQETsfaiBuKhErENmvu4F3Qh5aaOgv0mJgdQTr6/mOeUDFyvkggbgrnUzRbA
	hW9g==
X-Gm-Message-State: AKwxytf0Gf2w0xYCwpTjbvH9X1GDjWVatumQVJ9EJwdPsj0A8wtIomcC
	7fJdTxmQ/sArOW4qZd1Qt7prL2yn
X-Google-Smtp-Source: AH8x226oNvQ/xl2KwEI2LOvvGcK0sJjxj0nTFgZflHDxVIq0MgokG4IYutWgUR35Jwvn+14AX1s6JA==
X-Received: by 10.202.95.193 with SMTP id t184mr4801899oib.90.1517414020636;
	Wed, 31 Jan 2018 07:53:40 -0800 (PST)
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com.
	[209.85.218.47]) by smtp.gmail.com with ESMTPSA id
	p57sm3136841otd.13.2018.01.31.07.53.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jan 2018 07:53:39 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f47.google.com with SMTP id l6so4717288oii.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2018 07:53:39 -0800 (PST)
X-Received: by 10.202.65.194 with SMTP id o185mr5065003oia.166.1517414018615; 
	Wed, 31 Jan 2018 07:53:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.13.115 with HTTP; Wed, 31 Jan 2018 07:53:35 -0800 (PST)
In-Reply-To: <CA+chaQdGSCfm2aNj+EXFy+unv4c+D7oBNmz3uWdHUFpjFO_DPg@mail.gmail.com>
References: <20180131152754.25696-1-otavio@ossystems.com.br>
	<CA+chaQdGSCfm2aNj+EXFy+unv4c+D7oBNmz3uWdHUFpjFO_DPg@mail.gmail.com>
Date: Wed, 31 Jan 2018 13:53:35 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq3xOnxc3PjpkbFWgsS8R2xvZgZy+yb3tJ9ST7p3SsjAg@mail.gmail.com>
Message-ID: <CAP9ODKq3xOnxc3PjpkbFWgsS8R2xvZgZy+yb3tJ9ST7p3SsjAg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [global meta-oe PATCH] Stop using base_conditional utility method
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
X-List-Received-Date: Wed, 31 Jan 2018 15:53:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 31, 2018 at 1:37 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> FWIW: I've sent the same change yesterday.

Great; it was not merged yet it seems as I got parse errors :-(  Armin?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

