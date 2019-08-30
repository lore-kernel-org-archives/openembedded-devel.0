Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBFF6C1BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 08:51:38 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id u185so8684208iod.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ziLbYtT5g1eSGpr9SaIbHukX+rOCWwgltwwwOrjtZ1M=;
	b=aQRKi1g82t4+XXAmMeuPV0kXLM/dkMxmGxScUbLrkfO1N85PV6U0tilH/S2gCzFfRC
	R/P9GPATlcW3gCCukAPO6Tk3uQdrmYdxKTrq09K5/uiCRQ9mHSw8Eo5gY4zgPJg5zR/q
	LwYVA/S9dZaqyeEUIflvQQ7jdhKexyCzkixX8RBUv4qmIyVDcprpzdv665/SGejM4CvO
	eBMe+4Vp35EBERn+24hk2Px/KIyQeUpUzO6oCVbteCc0pl1KrgaEcvy0QzRvsYOYs1Gn
	AwwgUg5o/qrOHANZSC05jF2bnXAhgofcY6DwKqk5qLVI0wTftzrMSIkKf/OaMz8wQERJ
	avIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ziLbYtT5g1eSGpr9SaIbHukX+rOCWwgltwwwOrjtZ1M=;
	b=nY0bh6dEZ/JuIP9fCsueqIfSGYg+F9S+pehzcqCCjMC85gfb8yFot6d1dysLfQ/91j
	D8DrOBug+s8zYVVC0S6Bf9GqXXILvoypDeeJqmEVF0ITMwg/GVZnyoM0mXc1AOTA5iPL
	PTO/rheOpTk16F6XFN9AfKc+OH4pPOa3z9GKhKKSDoEybeiZGX/mkySxPYQJ+yXGhnoB
	c/vPEbDH5y7IX/6rNdVjCIKQDae3rHVD9oQFl4WOHUpoLNQqtjDjck5OM9mieKEN4ckR
	lZYgXC8+KfUCwrrko7HF7OwmyaWXGoHDqhiWy/8k2HYtXjDSm3TmbDzrJrWjqISnHuYB
	+g4w==
X-Gm-Message-State: APjAAAX2/OUPdjtkNhuHKsD3lWznMp7NOZJcUjgL365pMGCBX1lrbT5l
	9Q5vFOTUwvQhrPD2mEUgfhAD1kEGVFyzudLKoac=
X-Google-Smtp-Source: APXvYqzeqCrxloYSr0QETz+KqGopVpl/8SHO4fX/1kL0azgCa7G6ermKSAaBS/ag54WH9DOnuo5nt0Yt7nkGQa6zCy8=
X-Received: by 2002:a05:6638:73d:: with SMTP id
	j29mr11162917jad.21.1567155099873; 
	Fri, 30 Aug 2019 01:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
	<20190817111825.GA2828@localhost>
	<CALbNGRSBQv22cpj+T+KBS-1oOhpUomXBN78FHhFw52=pGEOp9A@mail.gmail.com>
	<efd5c05c-1275-8077-84e1-f17fff05f8f6@gmail.com>
In-Reply-To: <efd5c05c-1275-8077-84e1-f17fff05f8f6@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 30 Aug 2019 10:51:28 +0200
Message-ID: <CALbNGRQnxLXFXoSkPxWnFZJHWWdDvVP_=i9-ybYOVGzirty6Uw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [warrior][PATCH 0/4] vlc adjustments
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
X-List-Received-Date: Fri, 30 Aug 2019 08:51:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 4:16 PM akuster808 <akuster808@gmail.com> wrote:
> > Ping
>
> in stable/warrior-nmut for testing.
>
Thanks

Andreas

