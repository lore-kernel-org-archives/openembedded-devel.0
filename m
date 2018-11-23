Return-Path: <pbasista@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id AFB7E6BA9C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 22:30:16 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id t204so11043369oie.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 14:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+9BCnuvHW7unRvKtjG8OB20mBYYf4H8J4yQ8vxVmChw=;
	b=tFXr7/B74eHFDECQ+nGA5WBB9Da0X+oNndj6ICyKeokKlNb+nEd1C8FItnYtJ5E7za
	ZEW/NMeXPcw5ttPVRa3jUHA8tiEur5LFtepw+tBHuLg1i4jMoYUH/8aGS7g6Lm0v223K
	4mo5Ebpq7y2hb9aVSepktc7mFFViVPnnZRRc22hR6Of7/74YH6OEPDzx5sxcQx5/2CgA
	nuj5WQ6RYvj51MsbjET7SAS2winhOC0wU2UYKw/szA+Ysil/zZtbrnSlg0sRQn8ju768
	BlqoxgUUVBMdISC2l+s9czoQsyWo4nR/GhLiTope4j5djJsqGrHwWDSISfiH4VvCLocJ
	go6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+9BCnuvHW7unRvKtjG8OB20mBYYf4H8J4yQ8vxVmChw=;
	b=O2msFPwKEIbPcAiuO0IxApAJvQX+aLBCCY+6fZucesWmaUa9FL1oCBBR+cxhsWKvGq
	ClsgDWNlGBbhQAWIzUWGEkoMQw6COIouUiozuhsro6Ts7zApBJ0ILF6aYR6CKmmxQBd6
	9CtYqKMhL9OcjhsCucgfZouiRY9EYWhQn1SZ9xiHTzVV2JfVXjd9yVIV5IibdyZrZkhw
	Aon2qnNXqpEz6FumgCRKVopkhp/xKbzQDCiUO7gpeqlb2Y6TsA8zSUWH49VohGhxb2Vk
	Rp3THRiyuH/0AqDHg3BoioDfxrO76i1w0wybMQOIHx/ARuxqM8ROhIYBtL9EaDSOg9+P
	DgeQ==
X-Gm-Message-State: AA+aEWbF0JTh4g+wLOI2K4N9QgK9/q2/pOqjfNaS8HX9MzBb80lroAoA
	X0A9f88zugH5mUO/Cs9k00r8NoAx2o4HEmIs44GPQA==
X-Google-Smtp-Source: AFSGD/UXTsJFH3ptLhIUM1mTsEzKoM8iuoVNy+i9cpIXdn7BJmpGfHnKdEwvnlNVlwK3qPdNc50acLhMmmRKsubX45c=
X-Received: by 2002:aca:bfd6:: with SMTP id p205mr6753429oif.284.1543012217710;
	Fri, 23 Nov 2018 14:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20181118170442.14670-1-pbasista@gmail.com>
	<8d3cef96-99d2-a8ce-6eeb-213942b77047@geanix.com>
	<dfb2174d-cc13-5ff1-1830-9d572cd61c3b@geanix.com>
In-Reply-To: <dfb2174d-cc13-5ff1-1830-9d572cd61c3b@geanix.com>
From: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>
Date: Fri, 23 Nov 2018 23:30:06 +0100
Message-ID: <CA+2FH0Kvcza0-A1TD69aubACChBpnKS7xkp7y5xWhAJ2ABm5jg@mail.gmail.com>
To: martin@geanix.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] Add a working tvheadend recipe
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
X-List-Received-Date: Fri, 23 Nov 2018 22:30:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2018 at 11:03:36AM +0100, Martin Hundeb=C3=B8ll wrote:
> Sorry, I hadn't noticed PATCHv3 on the list when I wrote this.

No worries. Your suggestion about autotools:

> > do_configure() and do_install() look pretty much like the ones from
> > autotools.bbclass. Wouldn't it be prettier to do:

seems useful. I did not realize that such a recipe would be usable
in this case.

So, thank you, I have used something like that in PATCH v4.

Regards
Peter Ba=C5=A1ista

