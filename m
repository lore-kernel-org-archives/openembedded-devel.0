Received: from mail-qy0-f189.google.com ([209.85.221.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O1gtc-0003Jd-Aa
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 16:15:21 +0200
Received: by qyk27 with SMTP id 27so9371466qyk.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=OkDfhVExK3a27SOw1McHK0YpiamqMTUIJLp7vn6AHjk=;
	b=Lsyp5HwhplWfHJzNkoyCgrsBDyPZTkbV4ZkXECELf8mP8FeCTtkhcM3Q/7ivYlSbSd
	TpOxKNaP9flBZqMV0MihOtKBXXPu2J27ESVZ/CkNecMTVUODgvn8VSJTbYmASzJkuceB
	hXzvjM7z1Flhcu1tAwyyRwrtGik2G25fbuuu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=iOL2y9Wh4NBT18QeT9dEn+gtqPBxtQb6gXAOclH/GvBqR2F6VtxYYgzkfDIIDJMN7q
	0PLsJRLKjSdaz7G/FjX6qc/tYPM6JE7ZdPxb2o/lAsSv1memZRwdVHfAYBE/+1YMqTYR
	Ic4SrXfImpm4xhRS032ZMkT54AuNKC4tb+knk=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Tue, 13 Apr 2010 07:11:31 -0700 (PDT)
In-Reply-To: <hq1p6s$gnd$1@dough.gmane.org>
References: <hq16p2$e9c$1@dough.gmane.org> <1271158854.15813.137.camel@rex> 
	<hq1p6s$gnd$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 13 Apr 2010 07:11:31 -0700
X-Google-Sender-Auth: b593b3a2f96fb2bf
Received: by 10.229.213.208 with SMTP id gx16mr5895655qcb.35.1271167911946; 
	Tue, 13 Apr 2010 07:11:51 -0700 (PDT)
Message-ID: <k2nb6ebd0a51004130711m88a506do61a70977aebd683a@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.189
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Python 2.6 for bitbake?
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
X-List-Received-Date: Tue, 13 Apr 2010 14:15:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 13, 2010 at 5:48 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 13-04-10 13:40, Richard Purdie wrote:
> > On Tue, 2010-04-13 at 09:33 +0200, Koen Kooi wrote:
> >> I just noticed bitbake master is using python 2.6, which means I can't
> >> use it at work when the official linux is still ubuntu 8.04LTS :(
> >>
> >> Can we please keep bitbake working with 8.04LTS? I suspect not only TI
> >> is on the LTS bandwagon....
> >
> > I thought we'd make the bits that were 2.6 optional? Which bits are
> > breaking and I assume you do have python 2.5 a least?
>
> Ubuntu 8.04LTS has 2.5.2 and it could that I'm blaming the brokenness in
> master on python, but it's broken nevertheless....
> When I finish doing the build I'll send the error message (was something
> with "Exception as e:").
>

I started leveraging 2.6 capabilities in master, as I had thought master
required 2.6.  As far as I know, the 1.10 branch I split off before I
started this set of commits should work fine with 2.5.  Sorry for the
hassle.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

