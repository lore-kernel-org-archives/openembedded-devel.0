Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6r5F-000656-2T
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 22:40:57 +0200
Received: by mail-ww0-f43.google.com with SMTP id 15so1326729wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=R09jHrw/S8EzFeB7pEw55UzdDgr+wzQWzObnR99j+/I=;
	b=T2IIBWVTS+n57YQUksD1bNt8xM10pCyWGR9uEKzS4uKHa01JxN50k3aRKTgC5aqInl
	s2bpNvY3PSoMm10zYKW3KpLZpepPpVQndvEo4CCklMD7RhF4CVe8tz7x7e55U2HxbAQM
	jDHNJTC+p12f4Sc70CFKH3iuXOSXLHPwNg0GY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=RHXp4lARrXmoqp+bPZiOIoFKkmrbbjA5lt7LHWq95hjP1tDfpQi/M4wR6PEVDCzmHE
	VOzUJmGO6OjPlgTgMy5Bfhq9OzJU7M/VCmrxIz/ZyTAUpSHCukt7U9TRQMh62mDAi2QM
	YTz1TuOCIJG9P1bKxze4c7QfmAsO2L2a4ST/c=
Received: by 10.227.132.67 with SMTP id a3mr1470701wbt.198.1287175229092; Fri,
	15 Oct 2010 13:40:29 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Fri, 15 Oct 2010 13:40:08 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFAD2F@dlee06.ent.ti.com>
References: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
	<1287174748-29216-2-git-send-email-Chase.Maupin@ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFAD2F@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 15 Oct 2010 13:40:08 -0700
X-Google-Sender-Auth: 017uNXsnC7cRG45rJob6GPA4yAE
Message-ID: <AANLkTin_F8nBggY0H1tzCtxyVwKw5VsnDV9RR4+j39XF@mail.gmail.com>
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
Subject: Re: [PATCH 2/2] Fix class OVERRIDES order
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
X-List-Received-Date: Fri, 15 Oct 2010 20:40:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 15, 2010 at 1:36 PM, Maupin, Chase <chase.maupin@ti.com> wrote:

> > -----Original Message-----
> > From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> > Sent: Friday, October 15, 2010 3:32 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Maupin, Chase
> > Subject: [PATCH 2/2] Fix class OVERRIDES order
> >
> > * Changed the OVERRIDES settings in the classes to use the new
> >   ordering.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>
> I was a little unsure of these which is why I put them in a separate patch.
>  Should the virtclass overrides be high or low priority?  Please feel free
> to correct me, but I wanted to make sure that we didn't override "local"


I personally think low is best, otherwise virtclass-native would override,
say, something specific to a certain architecture -- but architecture
specifics still apply to a native recipe, as we are still building for that
architecture.  Others may disagree, though, and I'm certainly open to
alternative views on the subject.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

