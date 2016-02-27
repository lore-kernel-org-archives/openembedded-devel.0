Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7C43677329
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 22:03:53 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id y8so56649007igp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2016 14:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=7LBjTnErNI3ur9T8refEC6sznCO8XASPWs3C7aJN1kg=;
	b=DWRQj1nA5Qer2nnnzZpkqrs3ei/BKCwodS6ifmLeo0QP9KhrB4HxTFsOhLfn63Kn/Q
	0DvtTSn3xHmffIhnBKh9i/o4zv0j6962x8ubr0x/cug5tHu5Yw8d9BfAS9Inh2PZIOYJ
	XHpy2+lDp7mEhkBMaORyeX1zrDiHTY3TUGDJaurHExNFDMyyqfBfVUEcg4AlVGYZBIqm
	8KXyVcIAe7UFx6BJkf0jxFAt5PIurbVKBBTC2bu64d7QZ3tZgHf1rrbgKqKgZpF7TKpa
	NvjPU3uIEX1+7Yj0JhbQwYy3RPoZqiBp0fusoFB813Lhu8XZdFr6DXjRVv1kPOQh/DEu
	RfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=7LBjTnErNI3ur9T8refEC6sznCO8XASPWs3C7aJN1kg=;
	b=jtY102qTPVQaEetnRSyiSSckNVjfoTMx4xlFB23Wstpp0i1gKKatTvQzGOW7W2dY8q
	/3dXe5xsRmTrV0COu3/6l7tU7yKiNGLD7gOoClVIGDJ5JdUXfGRe4K8gxs7eMmy85ihU
	7CM//+CxqidektzwLSQLC9hCuDIoSEe0EE1+JdYqvx7EPoM+d7uItGIfYPZMSKX/ssQv
	jLcBzlNHz+Vr9JAAx2mvyCkoRC71IMdxub+rrxwNqy2FCXy2svyObyqlTTq99gcs5UOU
	l94c7nVtWHn/0kTB8v3hvAAGZvao7agnKGJI2Wp2IalJtRns9X/JAm7Ic8OJGnjFy2gc
	1WSQ==
X-Gm-Message-State: AD7BkJIG4zp0GwgPivPioVl0AtVTxkCjqV02H4P3Hg9STNa0cXKPZpNKZtS77FwlTYvYB3cQOTPcnFPvE083MQ==
MIME-Version: 1.0
X-Received: by 10.50.43.226 with SMTP id z2mr4016536igl.78.1456610634718; Sat,
	27 Feb 2016 14:03:54 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Sat, 27 Feb 2016 14:03:54 -0800 (PST)
In-Reply-To: <20160227214159.GC2554@jama>
References: <1456608134-4063-1-git-send-email-schnitzeltony@googlemail.com>
	<20160227214159.GC2554@jama>
Date: Sat, 27 Feb 2016 23:03:54 +0100
Message-ID: <CALbNGRRVX9P+ijQmP7qx03-u1ShE8tbG89dq01Z5Z2Uu2wQVAw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] ne10: fix parsing
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
X-List-Received-Date: Sat, 27 Feb 2016 22:03:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 27, 2016 at 10:41 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Sat, Feb 27, 2016 at 10:22:14PM +0100, Andreas M=C3=BCller wrote:
>> ERROR: ParseError at /home/superandy/data/oe-core/sources/meta-openembed=
ded/meta-oe/recipes-support/ne10/ne10_1.2.1.bb:41: unparsed line: 'in .text=
 [textrel]'      | ETA:  00:00:13
>
> Thanks.
>
> Lesson learned, don't drink and push (unless the patch is from someone
> else who fixed your mistake).
>
> Cheers,

:))

