Return-Path: <kergoth@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE48736B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 15:24:17 +0000 (UTC)
Received: by ykcf206 with SMTP id f206so82884557ykc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Sep 2015 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=eemJbhlqS1H0v4Cds8uB6tdkVtNQAWmrtd3Kj/s8i3k=;
	b=PzNHIYq0L5dIyXrMMl9628xmR1WhGofeDSSp834BP+tCSiHBScRC4f5kwO6xt4aw2n
	eOjUw8myNVi23FXa9my29FDaNkHpvk+ooIkcApM3jC4VA2zBUCNpo7sNL41HkNLEERZi
	z0EY4Qr/xapIIBdHmFtFOtGKzpraxAuo5OZNym5sVPDZN+LZzz78LYgObE8gtc44ULRL
	zeNNDTQTaZPmTlFLRguO/v1IO8U6MNNWVTql/tCPNE/PlllVRkrVImiOhQZsEvo+tHEr
	UlzTF7uCBWjhm2VkYtPODKtLBVbEQ7x/qCnmi/obmWweEgwZUMeJsAPhEl2d4KO79J8J
	onXQ==
X-Received: by 10.170.211.8 with SMTP id c8mr20827171ykf.9.1441639457727; Mon,
	07 Sep 2015 08:24:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Mon, 7 Sep 2015 08:23:58 -0700 (PDT)
In-Reply-To: <20150907150906.GA2457@jama>
References: <55ED5556.2020904@topic.nl> <55ED8405.6050709@linux.intel.com>
	<20150907150906.GA2457@jama>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 7 Sep 2015 08:23:58 -0700
X-Google-Sender-Auth: 9kpyAmmSdIVcWfPGiZcH4efO6e0
Message-ID: <CABcZANkvf694zOjjkyMcCdgmuM4Jamb5SPYMhkorm2Q_48BOAQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Where is libunique?
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
X-List-Received-Date: Mon, 07 Sep 2015 15:24:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 7, 2015 at 8:09 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Sep 07, 2015 at 03:33:09PM +0300, Alexander Kanavin wrote:
> > On 09/07/2015 12:13 PM, Mike Looijmans wrote:
> > > Current meta-openembedded master fails to build with errors like this:
> > >
> > > ERROR: Nothing PROVIDES 'libunique' (but
> > > .../meta-oe/meta-gnome/recipes-gnome/gnome-disk-utility/
> gnome-disk-utility_2.32.0.bb
> > > DEPENDS on or otherwise requires it).
> > >
> > > Searching for 'unique' in meta-openembedded and openembedded-core
> > > reveiled nothing that would provide it, there's no recipe with 'unique'
> > > in its name, nor any recipe that mentions the word 'unique' provides
> it,
> > > even though I found various recipes that DEPEND on it.
> > >
> > > Where is libunique?
> >
> > You should check not just the current state of master branches of
> > various layers, but also their commit history.
> >
> > libunique was just removed from oe-core and a patch was sent to add it
> > to meta-oe. There is no way to keep the removal/addition perfectly in
> > sync because the two layers are kept in separate repos and have
> > different maintainers.
>
> This case can be prevented by adding it to meta-oe before it's removed
> from oe-core (just like when someone is migrating recipes from meta-oe
> to oe-core, they are first added to oe-core and then removed from
> meta-oe).
>

Indeed, it should always be added before it's removed, then the worst case
is duplication rather than the recipe missing.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

