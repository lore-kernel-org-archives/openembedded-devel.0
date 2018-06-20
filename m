Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0629D7551E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 13:38:13 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 76-v6so5411901itx.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vimVN693pjKKTiz52phcV3ftP2LgK4850u2gb8zbuG0=;
	b=uGbbyVusWiClf3zzMwnSxTNt8yzSw0cCvIu4gVQrsJ87vljjtMld8rC4ns9vzM044R
	jsVk47wtT8vRvAp15X4hEv4hm7tyHT0M8xW2JZVh3pDUC4XbnjvFLqEHMP3ncF6haaKw
	JPdgSUUCJWTjolMQcw+pbkh3Vbb7Z41gFpQsClonbSUAqAQQ4Xu6AZtO47bx2dAStfDy
	BWphX71tvPhPCgjugXhRFB1Z3pS17VS3OfSFr32GXFWkSkBVKWn1V4LokYBs/5AprY43
	eOggTNGevgPK5qRdV3+gc6T+n9gCb+2v/cYo5MZpLXA0STwuIPzF3Ij8RJFFJtAy717Y
	Rc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vimVN693pjKKTiz52phcV3ftP2LgK4850u2gb8zbuG0=;
	b=rtAyxYpxtVjFtoT9+iCWHWEX2Q0G7doy/kBWE/wA3VFBIxl3EVGxonwl7yQCY2rpG/
	7rIrJuDzoQKNnc2XqY1x+wFZHlCpoC2ZITi7CfY3mDQoriJtjq16ycvfXUkIwW2+2Ahp
	j98gCgIFTRWnH4/w4IrRZrZWM0hjEUAG9g0G6dbhlkbIKCpOMd0joMh/+cIpWh8kcaP8
	V1muSD2NB3++jFE/b2zfqYYbx0VqiZr6buwPry7cRIsgGBis8/+kLdXMAgckT/7Yww06
	q/uQ+FcGfCoIy6NKMtpLY/G/ajbvywQGEfqQWAeWSCrjwIWntNWU2dyN0DuMdlAYZ8Gz
	1a/g==
X-Gm-Message-State: APt69E0zhZ64KSK2PpwRsFCdRrglrl/QcaV5oE+QWpGcxUI2bZ9OrZO+
	LuoCOPJAK/4Ong0R8acz2wUGZuZ/W0zAwwMXqGE=
X-Google-Smtp-Source: ADUXVKJ9b+ZxP17AeZpaCxdeBe8ObK0tzK1JeHoBZGdpPCIOqXfrCTYTA8M9770GVZy4hKRDz3d2V6d21xh38ibu3WY=
X-Received: by 2002:a24:7686:: with SMTP id
	z128-v6mr1614502itb.34.1529501894961; 
	Wed, 20 Jun 2018 06:38:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:9745:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 06:38:14
	-0700 (PDT)
In-Reply-To: <20180620121927.GB3257@jama>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
	<d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
	<20180620112953.GA3257@jama>
	<CABXoSoU8YpM1XNNDW7r=9vjhNtuJGwsT9Z+BCHvv7pBA=dy7wg@mail.gmail.com>
	<20180620121927.GB3257@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Wed, 20 Jun 2018 16:38:14 +0300
Message-ID: <CABXoSoWvCwcAm-PJWJ=U0bUu2+eGPowALT3OwEmr+SQQ-R+h1g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Wed, 20 Jun 2018 13:38:14 -0000
Content-Type: text/plain; charset="UTF-8"

no, sorry, I mixed AUTOREV with something else.

On 20 June 2018 at 15:19, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jun 20, 2018 at 02:57:39PM +0300, Samuli Piippo wrote:
>> On 20 June 2018 at 14:29, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > 3) we cannot use nobranch=1, because that breaks AUTOREV
>>
>> How does it break AUTOREV?
>> We are using nobranch=1 when testing non-released Qt versions and
>> haven't seen issues with it.
>
> And are you using AUTOREV? How is it supposed to know which branch to
> track?
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

