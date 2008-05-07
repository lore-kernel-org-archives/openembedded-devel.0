Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JtmM7-0000ai-3m
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 18:18:59 +0200
Received: by an-out-0708.google.com with SMTP id b38so79510ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2008 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=QInGWZj0C8V8oSXqvd2E6uKy8kxZhhQCHJmno1sHyfY=;
	b=hrq3nvEfuBxJk92HI5xKQ7zq5BbDBYjrmbMqBVM18NdjI5wM2MRGaFdKz1U9HhK7mPmKmEcjPoomeHxPH9uzX3erEXXc6hy5DOP9PgUtpDCrJuee83wXqNiGxY/MjpQ6b44oLGKyAvdgFRwPrrfP49sioCTy5i1xn+1noK5HTp4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=XiIiEUXvd+OLSQrMVy11M6iBmI6k3ENYX0Oiqnnaom4VqAoCbS7E0QY3uTY1tTV7RiTH74r5gq/DbaxnT0NIxN0JHkmg9Ds8aXtWL2s+pidBD9TgVklHTsAWnsjc7DJus3CIOlzSBNkR37UfiBEHJQaz6/2tpUEYGnk0udrQsk4=
Received: by 10.100.232.13 with SMTP id e13mr2997051anh.89.1210177099028;
	Wed, 07 May 2008 09:18:19 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 7 May 2008 09:18:18 -0700 (PDT)
Message-ID: <c384c5ea0805070918g55d59baamad7c66acf8fe7877@mail.gmail.com>
Date: Wed, 7 May 2008 18:18:18 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fvseuj$6jt$1@ger.gmane.org>
MIME-Version: 1.0
References: <fvpr9t$4vh$1@ger.gmane.org> <fvq5c7$alo$1@ger.gmane.org>
	<fvrtn6$93p$1@ger.gmane.org> <fvs0bo$h8r$1@ger.gmane.org>
	<fvs8g9$de9$1@ger.gmane.org> <4821B0B5.6060701@balister.org>
	<fvseuj$6jt$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: bp flag added to bug tracker (org.openembedded.stable)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 16:19:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On Wed, May 7, 2008 at 4:39 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:
>  > Can you remind me what the stable branch mailing list is?
>
>  You should really ask koen ;-)  I didn't know about it until this
>  morning either and had to google for it.  Since I already did:
>
1) Stuff had been discussed on multiple mailing lists (oe/angstrom).
2) There is that news item trying to be seen on www.openembedded.org.

Summary: stable is mostly for having a set of metadata that works
within a set of parameters, and the ability to fix any outstanding
bugs in there. Mostly useful for basing off product development (third
parties to us). Also, third parties and newbies can be pointed to
stable.

> > Pplease remember we are all very busy and have a great deal of trouble
>  > keeping up with all of our responsibilities.
>
>  I'm 100% with you there.  Which is exactly why IMHO it makes so much
>  sense to move away the review process from mailing lists into something
>  we *all* already use and where we can collaborate better.  A bug tracker
>  is just so much more appropriate than a mailing list to manage the workflow.
>
Intention is that we should really prevent (heavy) breakage on the
stable branch and reviews are necessary to have more eyes on commits.

Yes, we could do this in the bugtracker. I'm OK with that but we need
to define a proper workflow.

>  But, I guess that is neither up to you or me to decide, since we are
>  both mostly by-standers.
>
Frankly me too, as at this moment I'm not using stable, simply because
I did not base new products off 'stable' yet. So my personal interest
is not so much in the current stable tree, but in the process of
getting the next stable tree base point. (I have to spend my limited
time wisely, like everybody else, and that means putting some effort
in a future stable tree instead of the current, for me.)

Despite everyone's limited time, I think OE is gaining momentum again
on getting our workflow and new ideas going, and I would like to thank
everyone on OpenEmbedded for that.

In response to Richard:

When we have a stabilized .dev tree, we could branch off a stable
tree, but not to often please.

The plan was for 2008.12 but responding to RP: maybe we should
consider a 2008.6 base?

Regards,

Leon.


