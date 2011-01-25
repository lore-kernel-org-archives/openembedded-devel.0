Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PhnVY-0004De-DT
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 19:20:48 +0100
Received: by wyb40 with SMTP id 40so74984wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 10:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3nxnHBVJ6xlJjK64dcxVX0hjNqEnGAja3JY6dvZtQO8=;
	b=X34n9gfcBgDjtMePJMhyP80VTBvGxStXUbwGn8H1fkrobd02dD84B3UkU4vxFyRbfz
	WsjkFuWBJr+YVO7IHP9ntcRLflOIjBThDxs2SNQd831SU2gnhNgc2ZuJISbN1F3oIA5X
	SBetVzlS7cxD5EPNdL9JQoggnGjF8iPGJGGsY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=RQTtDx1EdvWaYT3j0iTdLXC67J7DboZyAIPPeug37ZRLdjOdRsmv7sWt4f0j6AVj4m
	cCGmJLW9rgq0MpRJL+hdyhuJRHQPADZ2Gex3bspzVhYr7iJ+4A9nadccdhDiaYtptph7
	zAte5vHJcBKAAfYg0cgM7lntY4q1LEPlXncYw=
Received: by 10.216.155.75 with SMTP id i53mr4043139wek.27.1295979597512; Tue,
	25 Jan 2011 10:19:57 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.254.91 with HTTP; Tue, 25 Jan 2011 10:19:34 -0800 (PST)
In-Reply-To: <4D3F0E15.7050904@mentor.com>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
	<ihmaqm$eho$1@dough.gmane.org>
	<AANLkTi=hWbJ_Y_m6kxMfCMdQti+xvAZZ-snK1UuqKLxY@mail.gmail.com>
	<4D3F0E15.7050904@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 25 Jan 2011 11:19:34 -0700
X-Google-Sender-Auth: KAiiokzsusBRXuTs2awffAFNZRo
Message-ID: <AANLkTi=ABs-jwjo=q5xGrKxvmYaLe05ePEtOez57E7ms@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Tue, 25 Jan 2011 18:20:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2011 at 10:53 AM, Tom Rini <tom_rini@mentor.com> wrote:
>>> * start an integration branch
>>> =C2=A0o remove bitbake
>>
>> Not sure what you mean with that. Which BB do you propose to use?
>
> Chris Larson has been doing a lot of work (and Richard has been confirmin=
g,
> testing, etc, etc) to try and keep poky's bitbake changes in sync with
> master when at all possible (the delta has gotten very very small, iirc).

I would personally like to see yocto use upstream bitbake with git
submodules or similar, rather than maintaining its own bitbake
directory.  I'd also like to see the bitbake sync completed, but it
seems like it's a low priority for Richard at this time.  As you say,
though, the delta is fairly small, considering.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


