Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NezSr-00063k-2D
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 00:25:56 +0100
Received: by pzk14 with SMTP id 14so798094pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 15:23:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.8.32 with SMTP id 32mr352622wfh.161.1265757798231; Tue, 09 
	Feb 2010 15:23:18 -0800 (PST)
In-Reply-To: <87wrym82f6.wl%peter@chubb.wattle.id.au>
References: <C791CD9B.22735%jgrant@vml.com>
	<18e217241002080848t193add2drd5603d0c252ee509@mail.gmail.com>
	<4B71D7F0.6070706@cbnco.com> <87wrym82f6.wl%peter@chubb.wattle.id.au>
Date: Tue, 9 Feb 2010 15:23:18 -0800
Message-ID: <18e217241002091523t40aa24d4qd0dfc8576b014a40@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.184
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Working with OEMs
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
X-List-Received-Date: Tue, 09 Feb 2010 23:25:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 9, 2010 at 2:33 PM, Peter Chubb <peter.chubb@nicta.com.au>wrote:

> We are also attempting to use BitBake +OE for development.  We have a
> several packagaes (a hypervisor, a kernel patched to use that
> hypervisor, some libraries that act as glue between the two, and some
> bits for bootloading) that are under active development, and build
> several customised root images baseed on micro to run on top.
>
> Problems we've faced are that bitbake doesn't keep track of
> interpackage dependencies except by PR, so the normal `test think edit
> build test ...' cycle is complicated by having to remember to remove
> the packages we want rebuilt from the various caches that oe
> maintains.
>
>
> Setting BB_STAMP_POLICY="full" helps for this.
>

I was never able to make that trick work.I always ran into a problem where
it gave me a circular dependency with some of the native tools... (quilt if
I remember)

anyhow, I created a patch to bitbake just last week I posted it. I created a
variable BB_STAMP_BLACKLIST which creates a list of recipes which should be
checked for time stamp dependencies between recipes... It seems to work
well, and is maybe a little less checking (faster?) if you know that there
are a few apis you can just list those recieps...

mike

