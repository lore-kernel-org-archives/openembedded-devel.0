Received: from qw-out-1920.google.com ([74.125.92.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NspJm-0005Dt-Ca
	for openembedded-devel@openembedded.org; Sat, 20 Mar 2010 04:26:27 +0100
Received: by qw-out-1920.google.com with SMTP id 4so4427qwk.6
	for <openembedded-devel@openembedded.org>;
	Fri, 19 Mar 2010 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=ptb4pSxhCZGWPXGrHmaHsg2ppOszVdggEk4Z7mfyIpY=;
	b=Oe05sIUtmktQ3aq2YqPrqSZR+UXMP34Sj/n9Tfy5p7j+7cDWoOuD9RhbSSWpf5Rsae
	udpdiy89wb9OaVFL5Rbm1zcjKn3vU10FHc4XWSZo+6p/sdZocThdIwRap7WVhru8QIhU
	5oVh3zmhIp/mT+ZCsnliPrKJoA16MNVYOG0nE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=WPP/mAHtn/D+5Vy9qdhRAuVpxu7M4fO7G78852AjyBLsKUm9QFpGoKodzAKunCt2IF
	pPe60FBuSqffBfkuLqWSdnnZo9bQEEdisfvn8+mcRGzWmuCoQ1sG+y6YeY4SK17DjTIn
	7mdePmM0P/g8C8+D6dNCk+L7yiR4nXwaWjHM4=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.129.29 with SMTP id m29mr514465qcs.33.1269055358274; Fri, 
	19 Mar 2010 20:22:38 -0700 (PDT)
In-Reply-To: <b6ebd0a51003170817y1f81a222kc691f85c50dd312@mail.gmail.com>
References: <b6ebd0a51003170817y1f81a222kc691f85c50dd312@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Mar 2010 20:22:18 -0700
X-Google-Sender-Auth: 10824a773e684e53
Message-ID: <b6ebd0a51003192022i6b9ba57bw7dbd771fbe7e9a64@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: do_unpack
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
X-List-Received-Date: Sat, 20 Mar 2010 03:27:10 -0000
Content-Type: text/plain; charset=UTF-8

Did anyone have a chance to take a look at the linked commit? :)

On Wed, Mar 17, 2010 at 8:17 AM, Chris Larson <clarson@kergoth.com> wrote:

> Greetings all,
>
> The other day I threw together a proof of concept of do_unpack using the
> python modules for the archives.. sadly, the performance is such that we
> should likely stick to our current method, though it results in a lot of
> extra dependencies.  See
> http://github.com/kergoth/OpenEmbedded/commits/kergoth/unpack.  In the
> process, however, I did do a bit of cleanup / reorg that I think we may want
> to pull in.
> http://github.com/kergoth/OpenEmbedded/commit/3def3ba3d4860983f2d8f082eb528c4b84f83b50 I think it's an improvement, though I admit that the way I pass in the parm
> and env is lame.  I wanted to avoid passing in the datastore or url
> directly, limiting oe_unpack_file's knowledge to the source, destination,
> and options.  Thoughts?
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

