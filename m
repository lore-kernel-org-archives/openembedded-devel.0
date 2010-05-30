Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OIoaD-0005UL-KG
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 21:54:06 +0200
Received: by vws15 with SMTP id 15so741016vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=S0AdRJR4EKc1WNstTd9dPvGGVlY932cTvjyR5KDyK9E=;
	b=ECuXp93mVli/vPQ/xSrSlFW4MVSXSM0O1psfgoqlfz+IPgQTGmXHoiZ/A2ozcS69K4
	/v/R1cZdHkQ6JuVMQAS4f4NpJGpzJ6jucWsqpr0hikCPG2DJFh/2yjVVCI9rsY6/QGHZ
	aESeCyebTx5KzMcZLaQZuxKfDqOw8f6zWefUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=fq5Uuc6454m/a9sQ1ga/DpDb7waCvkltUrO3nzURDzfdf5cE2rtlGvrx6gxiytfDob
	NunsaSUScMSV8lzuR0c+HxlaXks6F/wVnXLCNP/F9Eh3TW8NfJqlG+Htk9QBMKLAGHVA
	liDSGz8mOlDvBCtul4HkJGUVSPnieHmAU81dU=
Received: by 10.224.78.131 with SMTP id l3mr1243256qak.277.1275248992422; Sun, 
	30 May 2010 12:49:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Sun, 30 May 2010 12:49:32 -0700 (PDT)
In-Reply-To: <A24693684029E5489D1D202277BE894455A0F300@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com> 
	<AANLkTinePogltaKgN7CaqFVzw4PpDXSkE-f7H18PINOB@mail.gmail.com> 
	<A24693684029E5489D1D202277BE894455A0F300@dlee02.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 30 May 2010 12:49:32 -0700
X-Google-Sender-Auth: vHM6Vwfiga1eCcKucfrMLLW6EdQ
Message-ID: <AANLkTinA1ZTsklvgjWbc87f9a5CgSXpbCth47yVKiPq-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Sun, 30 May 2010 19:54:06 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 30, 2010 at 12:26 PM, Ambrose, Martin <martin@ti.com> wrote:

> On Sun, May 30, 2010 at 11:16:16, Chris Larson wrote:
>
> > On Sun, May 30, 2010 at 8:07 AM, Ambrose, Martin <martin@ti.com> wrote:
> ...
>
> > > Are there any recipes/examples which use these classes?
> >
> > I expect they'd be most useful in development, so no, I don't know of any
> > examples in an OE tree today.
>
> Makes sense.
>
> > It's pretty straightforward.  Add inherit
> > srctree, point S at your local source tree (or put the recipe inside the
> > sourcetree, it defaults to the dir the recipe is in), and it'll build
> from
> > that local tree rather than doing the fetch+unpack+patch process.
>
> Ack. I now think of the class as providing a 'skip' to the
> fetch+unpack+patch
> steps but everything afterwards is then vanilla OE.
>

Yeah, that's the idea, and is the only reason the class needs to exist --
otherwise you could just point S to a local directory in the recipe and not
need it.  Aside: the way it does so is quite the hack, we need to figure out
a better way to manipulate the task graph like this.

Ideally I could have a single set of recipes which, through some command
> line switches,
> would either build in-tree using local sources or out-of-tree using a
> tarball.
> But maybe this really requires separate recipes with commonality factored
> into includes.


It would be possible to add a variable to toggle the behavior of the class,
but it isn't there today.  Note, you *should* be able to use an amend.inc
(w/ INHERIT += amend) to switch an existing recipe in an existing overlay
without modifying the recipe itself, which I could being quite useful to
temporarily switch it over and then back again, but I haven't tested that
myself.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

