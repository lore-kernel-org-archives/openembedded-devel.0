Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id DA34C75F15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 20:49:50 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so37242846qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=EJrqHB9SyVVm10AafVWEaXzHBerV/zVps1nodib2D/I=;
	b=SoGx7QQywVacD8gJzh7bCy35a5slVoxPeNlzuHIrmQJJ+wbBc4nbere06iseVfb6/7
	AviXNyj+dPxQBhSG3vDJk0q1ieZzezzRkjOKB6q7pgZmmPauin3/eEjSRYG4FzyYhZjw
	NSYl2MI3QXL23P0jXw9SpH1Wb+gtaOa+FHojjv+MpII+TcB+CE/YkU5Pbe2JdXID5W0I
	JQA6lVMsAntDgsByvwDFZJTtU9PgN13/bcmZyLacW60jy0NvIqzdy6Q52wBI89oygpZK
	rC2F3qBgfj3Q9N2M5qUL8s/W2eUif8aIm8TaKtf7O/MkensUnd46thfxJeVwd9x6Ox/F
	1kHw==
X-Gm-Message-State: ALoCoQnSnj6790VhO77TyR8tFD5MCYPSnfoz+S63k1d5onBSVcn5eiuNh2WRNRO2w7RJGUbSSL9g
X-Received: by 10.140.88.80 with SMTP id s74mr11463247qgd.59.1436993391184;
	Wed, 15 Jul 2015 13:49:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Jul 2015 13:49:31 -0700 (PDT)
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Jul 2015 21:49:31 +0100
Message-ID: <CAJTo0LZHj+BW7ox-whZy1+6as3Xugm-Q9xKQPpxT6C=uFs7gOQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [RFC] Move libexecdir to $prefix/libexec
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jul 2015 20:49:54 -0000
Content-Type: text/plain; charset=UTF-8

On 23 June 2015 at 15:30, Ross Burton <ross.burton@intel.com> wrote:

> Our default of libexecdir=$libdir/$BPN is contrary to both the FHS[1] and
> GNU
> Coding Standards[2], mainly because the key point is that libexecdir
> should be
> global and not change per-recipe.  The new FHS allows /usr/libexec so this
> series changes the default to that, and fixes up the recipes which need
> fixing.
>

Unless anyone speaks up with a good argument I'd really like to see this
land the moment the current milestone release is actually made...

Ross

