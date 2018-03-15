Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 415CA788E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 21:49:06 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id y203so5682129ywg.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OZRbvML3fVGhVqTSR4DCdvZxtqh6fGyjzUNAr8zfgG4=;
	b=fYMWXxNV4WmD3TYD71oOQj6ybd8cDDZJoQLeh8w020T5P/qFi80h5rWCNLaSL7tAAv
	DGzz+FhbQ3M44fmUNeHpKd9g5uUp3Wmt6SsLRm1hpcdvpK8hEhzW4yuBQHM4qP+78P+8
	wJQdb+jDERBzmGNFjK9gszjNnNAV382uwrCTSOD5pzjJZG0UjRjtGQj65WgKHHCAOYyZ
	ngGYu3uPik4WWdiKwxmvVg38xBCvY4a/h2IKGA+Rk27LPLId7UlYXOd4K5cgAb0Bsdcv
	xyWUaOvzY1+G5OzLCBXpp5xbzUmkSAXJ6f+69LuLGHpLypmWjaOmcs7KA6k63q+gfZj/
	jJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OZRbvML3fVGhVqTSR4DCdvZxtqh6fGyjzUNAr8zfgG4=;
	b=rjaPdi0ackWc5bYvwE8J0c26DDFRLp06hW5Mx2HTjxMw43DnDV/UG2fbc1mVUampkD
	f2bdSCgGPP+IpsOWyRQEl9Jmc/LdwrqTK634iEr0NGmEZ1CKcY7KDZu+kxjKxQwoChoq
	2mZ2Yvllg29aj1/E/Q6HiQw7MYyYlaRLeHP9sp19k13FGa3ZcVkVoV4Fes7gyR9Za/OT
	vvEBaNKd2M5i0rnfldBPeDlU0ViyFFrNRDHkjgMdVsBwwQTIZsbDaQWNSveNp6eBwXKI
	LfyKVO5ciNrjR5Y/svWjGWptaTXeqEZIDI4ef+iE4vnlcYdGRWPiXLJrFtm8EKD03vdW
	1J0g==
X-Gm-Message-State: AElRT7FvE2GcSUJCLssHxzUMTotFK5BbKNwWvsvSgPFV4vlYvxobt5I+
	gn0JopVRuX1XmHvyGws56qhCRLzDe7koiahUfHw=
X-Google-Smtp-Source: AG47ELuhKn5klFdT7MONhBIUkTXXRRyCrxn8IUAVKfAt92858qBIBlcMrp45zb0lqrS2vSaudBpBnOvJs69y+UwLUw4=
X-Received: by 2002:a25:be8c:: with SMTP id
	i12-v6mr7210309ybk.185.1521150548065; 
	Thu, 15 Mar 2018 14:49:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 15 Mar 2018 14:49:07
	-0700 (PDT)
In-Reply-To: <118584e1-07e0-d3fb-e25d-e6c4cf053e22@gmail.com>
References: <118584e1-07e0-d3fb-e25d-e6c4cf053e22@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 15 Mar 2018 22:49:07 +0100
Message-ID: <CALbNGRQXEV7ufvTQ-pYdhKhA4GWhvMvZQs6XaV40s0SWSFZMWA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, Failed tasks 2018-03-13
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
X-List-Received-Date: Thu, 15 Mar 2018 21:49:07 -0000
Content-Type: text/plain; charset="UTF-8"

> === qemux86_64 (1) ===
>     * meta-openembedded/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb:do_compile
^ This one has chances to get with the patch I sent out - we'll see
next world build hopefully

Andreas

