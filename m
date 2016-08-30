Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1E594601B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:02:53 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id l203so6270832oib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 18:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=BHji/WndoeWg4QKnwaxA7ysFmzJ3HcBAqtCY0LvIftg=;
	b=foyqOQfxO+njKmAf/XateJfJoNupINHvh250Xmb9IG5bNyPF9mI4OKXvjQkaXK8QYc
	XnmdXuZAhVCzugk5pYBoUZxfVsRBrIF1gHjaiVbbGQivml+icBdHYsbMNNuEzyc/JHKC
	rh8WYzKT5aiSgcb5yL7DXA4oPkAXfRpgkoLDyNKLqTLSx5GzDJ9T+jZIBfF766j6D8Ei
	ec/9slNeeL2IeWkWyl/2stk4wXYRK6OamE9/jRokZB5/ropxhnOVR9gxN5AsWNhRaSDG
	CpJInWmrDVrwpLqhZlxiKkNyVnyuFdT7pDb+tzu9+T44tObtroH4GLQgEM95j41Z1VPZ
	LGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=BHji/WndoeWg4QKnwaxA7ysFmzJ3HcBAqtCY0LvIftg=;
	b=M89qu5DL4KleioVykcOw1wef1AG8HZzXwAIfcE03+8CSVjBDWEFInNZQM1smcJYJgk
	EApQjMnyUGa72/Xlx4pDK2lK2EBH9FZlgOt0iidfAkY9J3OIEgtaq61FuZEDXgFNJHAE
	SKQePmZghiaUWsRnolUntSNopm9zjxYCfxSx6g/OsXuUcujcV7oFjk85fU2TpXJIAX01
	VKOpnAzytqe5/su/KJS+JVHSk2YzykXlIjqVLcFyA08CX4HnMmipxSZ8tlf+4uKEYK06
	iiPXTNw0RujJwNCAz16CFWwzvMzxQaktnlL/tmS8BSuT3cr0QFM3AtMP3m6+L1ZuLeId
	I+XA==
X-Gm-Message-State: AE9vXwO6qXEnSKcEhKVKHsVcaO2Ly3Nws+85tBZqc8UDUPOAJu5vjVRcqIL9lZkCMXJa5TRhRgyhLnSB1LDwTQ==
X-Received: by 10.202.84.195 with SMTP id i186mr871236oib.200.1472518974153;
	Mon, 29 Aug 2016 18:02:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.44.7 with HTTP; Mon, 29 Aug 2016 18:02:33 -0700 (PDT)
In-Reply-To: <20160829205253.17988-1-Martin.Jansa@gmail.com>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 29 Aug 2016 18:02:33 -0700
X-Google-Sender-Auth: 0uDH0XX2erZRWkfBkp20OMn0MEY
Message-ID: <CABcZAN=MKN8uaXcCecR9f7Rv2NAXzFutN3q9qsTKkOnjzjAQHQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] geany-plugins: include GPLv3 in the main LICENSE
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
X-List-Received-Date: Tue, 30 Aug 2016 01:02:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 1:52 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * since last changes in oe-core LICENSE variable needs to list all
> licenses used
>   by individual packages otherwise bitbake warning like this is shown:
>   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-
> plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses
> (GPLv3) that are not listed in LICENSE
>   as possible improvement you can set LICENSE to GPLv2 to all plugins
>   which are GPLv2-only, because now they will "inherit" both GPLv2 &
>   GPLv3 which sucks as described here:
>   https://www.mail-archive.com/openembedded-core@lists.
> openembedded.org/msg81645.html
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>

Would be nice if we had a general way to change the inherited LICENSE as
used by the binary packages. Adding a single indirection to package.bbclass
to default to LICENSE_DEFAULT rather than LICENSE and defaulting
LICENSE_DEFAULT to LICENSE would do (or similar), then this recipe could
set LICENSE_DEFAULT to GPLv2.

In the meantime..

We have a bbappend in meta-mentor for this on a branch which handles it for
this recipe reasonably, I think:
https://github.com/MentorEmbedded/meta-mentor/pull/843/commits/d852857
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

