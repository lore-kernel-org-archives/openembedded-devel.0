Return-Path: <chewi@aura-online.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id C9BDA6FA94
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:49:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by gateway2.nyi.internal (Postfix) with ESMTP id DD1952067D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 10:49:27 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 28 Aug 2014 10:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:subject:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=smtpout; bh=FNp3WFS9ddbHOa9m0F0Nzo
	DpHG0=; b=XZoXyFJHhFXsfaX0ANdPHdpjxW2vzzaFXzNl/WdRvxrNsRTqJPfX1d
	8rNVXenNwNk0VNd/8dhblGWc2CgwWWfYMJHe90au51ENgej4dcyzDYHH33Dlj27K
	UEX9ppLSWELeVaXBUMMsR+lgXL789kdCtyxEBid4kOIPDB8gBGi6M=
X-Sasl-enc: GU2C3jy6TdTbNjKv1hCav5hwevarL711RUYXBwNfIav3 1409237367
Received: from red.yakaraplc.local (unknown [213.123.185.55])
	by mail.messagingengine.com (Postfix) with ESMTPA id 800BB680163
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 10:49:27 -0400 (EDT)
Date: Thu, 28 Aug 2014 15:49:25 +0100
From: James Le Cuirot <chewi@aura-online.co.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828154925.6d63a0dc@red.yakaraplc.local>
In-Reply-To: <20140828142759.GD16066@jama>
References: <20140827223659.1fb55fb4@symphony.aura-online.co.uk>
	<20140828074208.GG13139@haswell> <20140828092944.GB16066@jama>
	<20140828103826.3b133eb0@red.yakaraplc.local>
	<20140828142759.GD16066@jama>
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [meta-webserver] nginx 1.7.4 cross-compiling patches
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
X-List-Received-Date: Thu, 28 Aug 2014 14:49:29 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 Aug 2014 16:27:59 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Aug 28, 2014 at 10:38:26AM +0100, James Le Cuirot wrote:
> > On Thu, 28 Aug 2014 11:29:44 +0200
> > Martin Jansa <martin.jansa@gmail.com> wrote:
> > 
> > > On Thu, Aug 28, 2014 at 12:42:08AM -0700, Khem Raj wrote:
> > > > On 14-08-27 22:36:59, James Le Cuirot wrote:  
> > > > > Hello,
> > > > > 
> > > > > I was trying to cross-compile nginx 1.7.4 on Gentoo and found
> > > > > your nginx-cross.patch. It almost applied, despite being
> > > > > prepared against 1.0.11. I recreated it and everything worked
> > > > > except that the --with-endian option is not actually
> > > > > effective. I have attached the new nginx-cross.patch as well
> > > > > as a --with-endian fix. Hope this helps. As I don't use
> > > > > OpenEmbedded, I'll leave updating the nginx package to you.  
> > > > 
> > > > thanks for the patch. I hope it will appear in patchwork and
> > > > can be picked by someone doing package upgrade  
> > > 
> > > It's not correctly picked by patchwork
> > > http://patchwork.openembedded.org/patch/79247/
> > > 
> > > James: Please resend with git send-email as README suggests
> > > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> > 
> > Hi Martin. I was going to but I figured that wouldn't really make
> > sense unless the package script was updated as well. If it were
> > just merged as-is, it would break the package. Would you still like
> > it submitted in this form anyway?
> 
> Please submit it together with upgrade from 1.4.4. to newer 1.7.4
> version.

As I already stated, I don't use and have never used OpenEmbedded. I
just picked the existing patch up for use with Gentoo and was being
courteous by providing my improvements. I don't have time to update and
test a package for a distro I have never used. Sorry.

