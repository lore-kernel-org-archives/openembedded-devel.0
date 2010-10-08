Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P4LK1-0001yQ-Er
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 00:21:58 +0200
Received: by wyf23 with SMTP id 23so1329149wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 15:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=4Cq/wgSljif2sGgpIbmvlgYQj6F7BegJBl3Ai0FnirQ=;
	b=FQJR07Er8ek680IY7Eyk29hoytR5/Z+xtaMgyQ3ZlACmgS1YlUUPVDwqvP6cQrE1XX
	D5/0fyoXToxFwHmhavBIDcSL6PAG4ZctWy2NODUGD0pkhkxtxoPR3MePHOf+DsHh8FQG
	Rvr81aC3uHya7w+3US9mn02nFdXebwlKTYIN4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=qQkvXrcNR9y3dq4nvkI9Ag3+pTCN+KcNZE9VFFfCGUwLDi8C5ZK65qNg3om5jNSU48
	mKDtfDLUduI70GmKaCkcHullcimktPCEYNOSR1f+H1WF7Ljdm7Z2g6AbDDjRhqwPP2om
	DKO9qb1I3OoOyLWBq6jyKlmKfYLOgrnzfGk6E=
Received: by 10.216.132.166 with SMTP id o38mr2867688wei.16.1286576483723;
	Fri, 08 Oct 2010 15:21:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Fri, 8 Oct 2010 15:21:03 -0700 (PDT)
In-Reply-To: <AANLkTi=_1X_2nbgdX26Et6jd0mRxNSAKbbjkcx-iJNjC@mail.gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
	<i8jufe$299$1@dough.gmane.org>
	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
	<AANLkTi=_1X_2nbgdX26Et6jd0mRxNSAKbbjkcx-iJNjC@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 8 Oct 2010 15:21:03 -0700
X-Google-Sender-Auth: vCjW3Br6EByuCtYX4B8Lz-y2CC8
Message-ID: <AANLkTikLT9ZRLbnbGQ17AN5u0TiXdweP7HKH-QuLBH_E@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Fri, 08 Oct 2010 22:21:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 8, 2010 at 1:48 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/10/7 Khem Raj <raj.khem@gmail.com>:
> > On Thu, Oct 7, 2010 at 12:56 AM, Koen Kooi <k.kooi@student.utwente.nl>
> wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 07-10-10 03:46, Khem Raj wrote:
> >>> Hi
> >>>
> >>> Following set of patches is v2 of the patches adding support for
> getting libtool 2.4 into
> >>> openemebedded. I have so far built minimal-image for two machines
> successfully using old
> >>> and new libtool.
> >>>
> >>> The libtool sysroot feature knob is added through LIBTOOL_HAS_SYSROOT
> variable. If this is
> >>> set to "yes" then you ought to use libtool > 2.4 by default its set to
> "no" which means
> >>> the current behavior remains.
> >>>
> >>> The big change that libtool 2.4 brings is sysroot support and I have
> added
> >>> support to use this feature. It should make our life easier.
> >>>
> >>> This needs a lot of testing.
> >>>
> >>> Please cherry pick the patch bundle and give it a try in yout
> environment
> >>
> >> Can you apply these to a branch so we can add fixes there if needed?
> >
> > I can do that. However now that backward compatibility is left intact I
> think
> > it would not be that bad to merge it into master and fix things on
> > master. the libtool
> > 2.4 would have DEFAULT_PREFERENCE = "-1" by default it wont be picked by
> anyone.
> > with the number of developers we have it will get better testing before
> we
> > accumulate too many changes on a branch. Secondly there might be changes
> like
> > gnutls one where the patch is only valid for new libtool and should be
> tested
> > in old and new way. If there is any breakage introduced in existing build
> will
> > be caught quickly. Where as on branch resources might be divided and it
> may
> > not progress so well. I am just weighing efforts Vs. risk here and
> > risk seems low
> >
> > Thanks
> > -Khem
> >
> >>
>
> Personally I'm in favour of merging into head. That way it gets
> accepted easier and faster.
>

Agreed, I am as well.  As the new libtool is opt-in, I don't see the harm,
and it'll ensure that any issues which crop up with the compatibility get
fixed asap.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

