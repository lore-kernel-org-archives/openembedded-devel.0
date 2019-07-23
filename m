Return-Path: <andrea.adami@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA097EEBA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 08:09:10 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c2so20272767plz.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 01:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qXCHYMaXdIKv6MQ5y4qDCQNr9uhN2Futqp38jL6DX0A=;
	b=eW0HNBqKCRsSApV4yWj5o2TS9w92hgxX01jd29h9motx/4YgD/A90PtUQG2jFCkff6
	WjnFUAEajAjaDPuHKOhDTW+c+oZMe4+e1HGou5E9TbTk0JQmucbyUt3cGCQfIqP8AQ7n
	kqEFEz6TexZduMDoatUWOcHhiXdHL4EPjvND34HgF+naze9OsBLL2EFHG1Ezz7hVEDot
	Sr9MaV/BzeL4obV/5rQH2dNYM+T/hHSsEijCkpDXpkDKG0ApaQnCp1u+Y2UgDlRbbMqD
	Sod4yWme+WZiJ1497235A3Sgo+4HehJjaurojS39U4XrNjqd44Yppt4XC0PdJEL3qTgD
	1kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qXCHYMaXdIKv6MQ5y4qDCQNr9uhN2Futqp38jL6DX0A=;
	b=gtjZfT/cWd+mAXg7741zySaVNQOgdyZCvmjBkGAQv2eA5IzQzQZapc4mA99pUAQeIl
	woX9dJeNnRhf+eVew6nOqSE74f/MkPdVaDEdcFxgJighuc/DNPiTEYBs/Tpmdtsx/nUi
	6BVxmsBdjUpwcmwBoxwNGZq9E+rxah8LosUyjBA5EOhtiafxEtR/y11Y23EygznQFWOD
	kFSIMI7U8IA88xhMMuN0Havtd8NvYbO3ky2p5hIhbKwky/f9KWYdFDTSlAtq/ZCMJKX0
	xhkgZ/kPJxuCWLKoBeyPJkzvwKu32P4CVH1EYAuSC1gjEtjssQ4EQykDJNAb76lHVZJI
	yqBw==
X-Gm-Message-State: APjAAAWARcn3vmEPNup58g6AKuSPYC4YItA93Ltj7KoxPxgKPW87c49X
	dMYOCvNeL7Mhu57oZLIlPMoBhBq7Z5xG7o3Xze8=
X-Google-Smtp-Source: APXvYqzHU9qt8WjD34woQDxMe92x1QRwXuYNBsQvmJk34VrfHLlx2PWst9hURDUEIJSI1D5F991NCHopARXaaYtIgrI=
X-Received: by 2002:a17:902:a60d:: with SMTP id
	u13mr80080113plq.144.1563869352272; 
	Tue, 23 Jul 2019 01:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190721163919.32659-1-raj.khem@gmail.com>
	<20190721163919.32659-14-raj.khem@gmail.com>
In-Reply-To: <20190721163919.32659-14-raj.khem@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 23 Jul 2019 10:09:00 +0200
Message-ID: <CAAQYJAsLrbp-yP8HnaJfKgbhNRdMsieR6WSnykVzJT0G9M9qUQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 14/14] kexec-tools-klibc: Refresh patch with no code change
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
X-List-Received-Date: Tue, 23 Jul 2019 08:09:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 21, 2019 at 6:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fixes
> kexec-tools-klibc-2.0.18+gitAUTOINC+5750980cdb: Patch log indicates that patches do not apply cleanly. [patch-fuzz]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
 http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Thank you Khem.

I hope to find time to catch-up with next kexec-tools 2.0.20.
(Klibc recipe itself would need more love now that upstream is active again)
Cheers

Acked-by: Andrea Adami <andrea.adami@gmail.com>

