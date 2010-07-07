Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OWQAr-0006E4-NO
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 10:40:10 +0200
Received: by iwn34 with SMTP id 34so7607393iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 01:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wJDaFPdx61Yh7vfK9LCYF6AiATDqZGcqAhq49YoHZDM=;
	b=Ic8YBRa4cATg8wB5ur4ic/x3X7WZ2mpgAl7l8kqZduxJ0G4eL43VWRPX7W4/hUP1RT
	1v0inizoZCiX8tv10rFEUiSM27G2vVxt2Tkx/x6Xi+n/SGdznzTVL4yMibi7KxlOxoti
	+DTvccSPMr8VAhwoQX/rD+5C6iuqeePWh90gg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UrCsyC3iFw6bhax0KqbML4vBxKhaZ0fIZYIUF7wgL7t5S/POIhtdP6TeztCf6hGZxH
	T2ci37L8SW3QTFCUA+oW7x5Mp9wXTAVtyTGZ9A/nwZ5TYMvHxo878s4F+wglqc9NpOOQ
	uRW6qbeGg3FCB5KlSWnzGeml/HvmvKZVSoucA=
MIME-Version: 1.0
Received: by 10.42.36.3 with SMTP id s3mr1076159icd.94.1278491719550; Wed, 07 
	Jul 2010 01:35:19 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Wed, 7 Jul 2010 01:35:19 -0700 (PDT)
In-Reply-To: <4C3437D7.8050505@gmx.net>
References: <4C3437D7.8050505@gmx.net>
Date: Wed, 7 Jul 2010 18:05:19 +0930
Message-ID: <AANLkTil5qoWwuPVyu5cNGg2hS4ErYphXMDbfgD8a0EjZ@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] GCC 4.3.1 unbuildable due to unapplyable patches - remove it then?
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
X-List-Received-Date: Wed, 07 Jul 2010 08:40:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 7 July 2010 17:46, Robert Schuster <thebohemian@gmx.net> wrote:
> Hi,
> GCC 4.3.1 does not build for an ARM target because a patch does not fit.
> So I assume that no one is really interested in that version of GCC
> anymore and would remove it then if nobody fixes the patch situation:
>
> http://tinderbox.openembedded.net/public/logs/task/6443736.txt
>
> Regards,
> Robert
>

I am in favour of removing anything that has been unbuildable for a
sufficiently long period of time as to show that no one is using it.

However it looks like this breakage was introduced about 3 weeks ago.
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=65e509aeddd26a6829ee10aa21fa20d6fd3def3e

Is that long enough?

-Graham


