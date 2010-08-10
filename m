Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oivsf-00049r-Aj
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 22:57:06 +0200
Received: by wwb34 with SMTP id 34so535198wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 13:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ZFIlVX++LAKQWM7J4mj1KEtudxZY054Tj/e4NdElcy0=;
	b=r0PlE4gTYU4pji9bRuFvD48rPgAaNRdn7QvSUcBUEx2ww3vphvx1HwTApiTjkZ11UZ
	LJOrSyqUDCuaqg9V0pz2/2ubo4PGNL21JXf/RzWhAf2mAtGoOzrTMp6LSp6PBHtZ9gRL
	wvumL4o1C5GFxT7MZ8BRzjw5ek8gNuphNO3Ic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=XQsA08GMWFMt88mCNrWR5fXIwCe71CkReuXAOio7KoLmGTY0Qc2onsIoPT03kfK3yG
	Esd7ravOjMNQukJ4DX5oq0TFHrhIWxykf6sgBAEa63T4a58TfzDfuKcJDHe1L5iqmNYh
	aIrd/v7y7P5O/aiFe5A9bo+4u0fSehUvFUxck=
Received: by 10.216.138.65 with SMTP id z43mr15667456wei.12.1281473814203; 
	Tue, 10 Aug 2010 13:56:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.68 with HTTP; Tue, 10 Aug 2010 13:56:34 -0700 (PDT)
In-Reply-To: <i3se2n$gj7$1@dough.gmane.org>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world> 
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com> 
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com> 
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com> 
	<i3se2n$gj7$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Aug 2010 13:56:34 -0700
X-Google-Sender-Auth: kM6UOft_B44wWZKnR7pt80CbBSE
Message-ID: <AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
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
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Tue, 10 Aug 2010 20:57:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 10, 2010 at 1:50 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 10-08-10 01:15, Graham Gower wrote:
> > On 10 August 2010 04:31, Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> wrote:
> >> 2010/8/9 Chris Larson <clarson@kergoth.com>:
> >>> On Mon, Aug 9, 2010 at 6:26 AM, Hauser, Wolfgang (external) <
> >>> Wolfgang.Hauser.external@eads.com> wrote:
> >>>
> >>>> Hello,
> >>>>
> >>>> I want to change some used versions of packages, so I added a
> >>>> PREFERRED_VERSION_<package>="xxx" for the packages I want to have a
> >>>> special(newer) version to be used.
> >>>>
> >>>> But e. g. for busybox the version defined in the used <distro>.conf is
> >>>> used instead of my setting in local.conf.
> >>>>
> >>>> Should local.conf not overrule <distro/machine>.conf ??
> >>>
> >>>
> >>> Conceptually, local should override everything, as it's the "most
> specific"
> >>> information available, but from a technical standpoint, we can't parse
> the
> >>> machine and distro configs until local.conf is parsed, as that's
> usually
> >>> where the MACHINE and DISTRO are set.  You can use a 'local' override
> to get
> >>> around it, or you can ask the distro/machine maintainer to use ?=
> >>> assignments (set only if unset).
> >>>
> >>> PREFERRED_VERSION_<package>_local = "xxx" is how you use the override.
> >>
> >> The real solution woud be to either temporary store the
> >> PREFERRED_VERSION and apply it later on.
> >> Alternately we could parse local.conf twice, the first time ignoring
> >> the PREFERRED lines, and the 2nd time only looking at these.
> >> Yet another solution could be to split local.conf into two pieces, one
> >> with settings like MACHINE and DISTRO, the other one with the
> >> overrides.
> >
> > Wouldn't it be far simpler to fix the distro conf file(s)? E.g. apply
> > something like this:
> > s/^PREFERRED_VERSION_\([a-z]*\) =/PREFERRED_VERSION_\1 ?=/
>
> What's the point of setting a preferred version at all if you make it a
> weak assignment?
> The distro nearly always knows better and if you want to use a different
> version, sending a patch to change that version for review isn't exactly
> rocket science.


How about having decent usability?  The user asking for something and not
getting it is completely unintuitive.  If the user doesn't know what they
want, they won't request a specific version.  If they do request it, they
should get it, anything else is an OE usability issue.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

