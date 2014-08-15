Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 299BD70E49
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 19:41:15 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id 29so2629325yhl.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 12:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=igF7cKR9dUPsVOShtYK5fVSR8gutxE7gi+jc7w50Fac=;
	b=jAlz/kkdkgpEuHiUm1FTnothnFEKTEdJFP2AunsOccaHPG56pol3G2NdxRdDyqkPBr
	m5XW9PsQq/5FQhhDMPq/CxL+bwSUO5VLl2Z1E0DJm5QE7pNEQZSC3B9BlQZX0ia56aHD
	pQ1M4AnnI69MqP2UIC7dkr1W3jcU1qrlF7pr5pIfadiKvFojrUL/V2nTIOYx0JiQGFL3
	2Tnko2nEBi08ZifgVLFa7gTDmXz1CHQYV8SzuspJJxuD2r8X+Z6/44/oFemnTQWsQ/tQ
	RlN+lYs/Tq+tfUlug+urRST04Ro0lW5uj0oz0dWf/zmpW0bxL+dHjDw+HP89DivhFUwb
	akxA==
MIME-Version: 1.0
X-Received: by 10.236.199.13 with SMTP id w13mr29635513yhn.105.1408131676449; 
	Fri, 15 Aug 2014 12:41:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Fri, 15 Aug 2014 12:41:16 -0700 (PDT)
In-Reply-To: <20140815193824.GI22747@jama>
References: <CAP9ODKpr3f2MkPgO-3sYR7ik1OvTG_NPm+8wNdu7w5yd1w-NAg@mail.gmail.com>
	<20140815193824.GI22747@jama>
Date: Fri, 15 Aug 2014 16:41:16 -0300
X-Google-Sender-Auth: 3_1dlylluBhRfrNy08xWMaSeFtg
Message-ID: <CAP9ODKq3D2nY0n8J69M-Vi8U0edaAL+eGCRfXWVR9QGKufn=3g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [for-daisy] php 5.4.14: use pkg-config for libxml2 detection
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
X-List-Received-Date: Fri, 15 Aug 2014 19:41:17 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 15, 2014 at 4:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Isn't daisy still using libxml2-config?
>
> binconfig-disabled was introduced only in master
> (5870bd272b0b077d0826fb900b251884c1c05061) so this would need some
> explanation why is it ineeded in daisy.

php-native fails to build as it end detecting host libxml2, instead of
sysroot one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

