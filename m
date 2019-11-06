Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9756C0B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 09:08:02 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id s75so21106903ilc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2019 01:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dJZsCji0EYj2Qc6B0v7vlJaLI1W/HPUFvcMsK2RR0Dc=;
	b=tGuQisDS9TN0Pyfnf83WNE8h548BYZ6YJTRriAzy3KL0q+0bgERNQUoeHQ7TwwTT8d
	izTInUnd+QeBbLF6k+iYvielK13tCWPPC6jv8JhwrAf+o3r/SiLMJr5F6JgyifpZ4tOy
	9746FViH1JYUTGxdg9hICDcxLW2Megp4DaK2igJm3J52fhIArtjO5vwvlMZR8pn5SNlh
	Iy9gZcYs8PZtmGKNYBgKhT3ON0M/IcU6rCrbBFo8RiByhmYMPusD4WrIyBdUAq5I3WmX
	F0kMwgKwKgJ8NDqGcXbMHN4wcxocnInfgmCC5zzfxkOQRKszJy0o8hKRXcERuK9cPAwC
	cEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dJZsCji0EYj2Qc6B0v7vlJaLI1W/HPUFvcMsK2RR0Dc=;
	b=cnN27lgxKoiM3YSMlGlAylcU5y/CJKd+VwPzGYl2eTCSIBUQpD7a0U+eLCg6ytvRUO
	G8xkBGrb1AM7s+PyAz8TKwvuUSYt6P/BIlJOUgylzT7OY2kt3HJo7pXJv9dz883j4eSr
	FIYGfw1KDXvtR6o54JrKUhTkJwS0ajcjf5tRTLsGwfi38YKzUZfxfzLAMo2nRtE+sTjy
	qo8pI0eHKYj+nOXxKYg9av56Fw9ZhI8+XTkxzMqJ2b6Rjk2fMmhSS2f95HeqDYa2/gvo
	flUpovxy33HXt59X33aTkFvotg6TzfHB3xfcmkeD/jkj8TuIaPbFkq8PDynYU9gwqoUH
	DCeg==
X-Gm-Message-State: APjAAAUiW4XESjHh1RbqQz984bt8GM5ubn5H07awdvdwl4OcFmFJcMlW
	dQtdZ7mXrfGT6nj5YB2K24Dp6ghl25oJso9saD8=
X-Google-Smtp-Source: APXvYqwHqnvhiOR+6sGCJHCajXc9PGuzk+9An9QVX6N8Pv6OWBUfSoviAwF8+DHp0Hf+rg5fm3fkZw6mhcvkPU51lNQ=
X-Received: by 2002:a92:bb0f:: with SMTP id w15mr1627007ili.224.1573031283461; 
	Wed, 06 Nov 2019 01:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
In-Reply-To: <20191106074935.46751-1-hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 6 Nov 2019 10:07:50 +0100
Message-ID: <CALbNGRSyJYthd3zWWXfVBCzTNXhdNBA9K-MKAGFqHYVEuLNWYg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/8] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Wed, 06 Nov 2019 09:08:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 6, 2019 at 8:59 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Python 2.7 is no longer supported. The 5.0.0 release will be the last
> version targeting Python 2.7. [1]
>
> [1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292c18cf5283de4fdc3e13e56f7
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
* Version going backwards
* Such a patch at times python2 is eol - really?

Andreas

