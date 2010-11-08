Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PFY6s-0001l9-0n
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 21:14:34 +0100
Received: by wwb31 with SMTP id 31so68482wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 12:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=PxjZbpq1fSJ+9nGMnG9I7q7j91MGnDoue6nTXhQW30Y=;
	b=xYDoYv6+gw60QN0d/zplYwppNFyUBgENE4BhCP+rWWU/kNuIblROdKajPKJrX5ELgH
	tRjgoTPgqS1ndlihG8Pv+aqdnWvXz/LAYYRAz8aQRM4AX2AtGflncVWGXAOzHoxF1V3Y
	kNTzT2lY+ugh0wQGHpDxh+EZu4lHN0S5Q6yrQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=pQYtuDVRbLRM3eavUxOz1wUzPJtCwXcsgpVZGbf94XMFnFzqkpPoADy4Bnj1j7C8m6
	9ZqKPvGJQZedFyG/LkE2mE/uq/6vgzbXDFPX1zb7tCAVa5v3vY7UrDXSCM5cl3ekzynT
	6b4qTj1qtXkbIzQYsQjV5Kc//tfSaeffn+14M=
Received: by 10.227.128.211 with SMTP id l19mr5773898wbs.73.1289247216527;
	Mon, 08 Nov 2010 12:13:36 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Mon, 8 Nov 2010 12:13:16 -0800 (PST)
In-Reply-To: <AANLkTi=Rk8Fm_Xq08J89J-s4bx=QQeTHfMan4HZknYWs@mail.gmail.com>
References: <4CD731A8.3020809@gmail.com>
	<AANLkTi=Rk8Fm_Xq08J89J-s4bx=QQeTHfMan4HZknYWs@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 8 Nov 2010 13:13:16 -0700
X-Google-Sender-Auth: _i_ppfWSPnJzDfaytEdyD29f3EQ
Message-ID: <AANLkTik+oB38Va=uFXksXwFVmPur_AGKBNpC4EfDCjrt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake weirdness during -k world
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Nov 2010 20:14:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 8, 2010 at 12:22 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Nov 7, 2010 at 3:09 PM, Graham Gower <graham.gower@gmail.com>
> wrote:
> > I have a 1gb world.log file after running:
> > bitbake -k world | tee world.log
> >
>
> I have this very same problem too and its recent enough. We should be
> able to find which commit is causing it (bisect bitbake)
>

Yes, please do a bisect to isolate the problem if possible.  Haven't run
into this one yet.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

