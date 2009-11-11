Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N863s-00054H-NW
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 06:48:11 +0100
Received: by ywh7 with SMTP id 7so723743ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 21:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4n9ejxqVKbOEDotm6K8KS/Dmzfmk3v37xLIiZ4IvG/0=;
	b=WFMnFzh4Vku3A/n6pP12lfPMpvJHMBIKwzm9bpcFa2GjSr6OttX/NoEShUs5hdKRQF
	w3fYhFFO8hHFGJqGMoAp04vh9DNTIapW+Lwrk/ghGE2JfnWbdiGE73IBXUzP7io/A8mE
	0v6LWEqpQXcHBfZwgfCH48nf3WSB5yGIM6xgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qc1IgLvkkIc2nJswRD3iZIVwgcX5TdS/fvhT7BQDrwn3iFkAVqsX/MIvPul8Eaq+gp
	5t2iU0A0AB0dqvBolKXIvwYoSxVij6FuAoWpqKwDGX4lyzeaUzDDxXsCJ9wWT/fdx1EI
	qDseSMxt/pvoB4s8fyN+XchVE7dLMw2T7iQa8=
MIME-Version: 1.0
Received: by 10.101.61.20 with SMTP id o20mr1137752ank.166.1257918410425; Tue, 
	10 Nov 2009 21:46:50 -0800 (PST)
In-Reply-To: <200911110206.20901.holger+oe@freyther.de>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
Date: Wed, 11 Nov 2009 06:46:50 +0100
Message-ID: <ac9c93b10911102146p32f140b3g83005736bb9b441e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Wed, 11 Nov 2009 05:48:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/11 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Tuesday 10 November 2009 17:55:40 Phil Blundell wrote:
>> The current checksums.ini arrangement has a number of issues:
>>
>> =A0- single monolithic file is a rich source of merge conflicts
>> =A0- concrete URIs require many duplicate entries for different mirrors
>> =A0- can be annoying for folks using overlays and/or collections
>> =A0- storing the checksum separately from the rest of the .bb file makes
>> cherry-picking harder than it needs to be
>> =A0- large amount of churn in checksums.ini can make it hard to spot cas=
es
>> where checksums were changed rather than just added.
>>
>> It was proposed that, rather than storing checksums centrally in
>> checksums.ini, they should be placed in the individual .bb file to which
>> the checksum relates. =A0Bitbake already has a certain level of support
>> for reading checksums from SRC_URI and it would seem natural to try to
>> make use of that.
>
> *sigh*
>
> SRC_URI =3D "http://example.org/${PN}-${PV}.tar,bz2"
>
> how do you want to handle these? What happens if you place a checksum in =
the
> inc file? Do you want to propose removing SRC_URI from .ini files and put=
 them
> back to the .bb files?

While I think the monolithic checksums.ini file has its problems (I've
cursed more than once that someone changed the fiel just wwhen I had
changed it), I think Holger has a point with ${PN}-{$PV}
One now needs to explicitly add the checksum to the recipe.

Would it be better to have a separate checksums.ini file in the
directory with the packages (and I know that for some dirs like perl
this still can become substantial)..
With some machinery we could even generate the checksum automatically
if a new package or version is added (NOT if the checksum is alreayd
there and is changed).

How about that?

Frans.


