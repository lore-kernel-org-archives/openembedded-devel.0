Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6dy1-0001U7-Pv
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 08:40:38 +0200
Received: by iwn2 with SMTP id 2so534722iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dJ7JAW2VzjvjeqCi2rtUPgRv1QxXbB2Al19biVZeJpA=;
	b=tjkDDTj+uIqsydP7QLp8p813CB3MgmGs2BTfavyfjLQwckMF1WCHM9c7jnzyfrtK+x
	UxoYKuAPOoO/GGMvE1ceHra82SK6BV6WRuCq1UzneFpohYQkqsPmIVx1vgR5bNOX/eVh
	Z8bZQqMnIHHlwQtcgJjWifRyReGRrS+S2SV60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TNlhPCQd5XPsJu1RkbURuqV0RVEtETYryurzHOJNHJ3lC0b+1P0kTfjPy2EQPHi3LN
	lQ2haIMO8JeAmO+NVjpxKBIefH7z5hrxAuXk3WOV57+kauu1yAO3NSSM8W+VCDgqp8Db
	kQ+lg0UFjbqNaaLNOQFz/h9bM/yTg9MKd+KX8=
MIME-Version: 1.0
Received: by 10.42.243.70 with SMTP id ll6mr174258icb.218.1287124807208; Thu,
	14 Oct 2010 23:40:07 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 14 Oct 2010 23:40:07 -0700 (PDT)
In-Reply-To: <AANLkTi=9A-00vr+NZscVbeiZjbHO7eqaMoQF_pmabBtg@mail.gmail.com>
References: <AANLkTimdcdr2mSBOzaKJ2FTuR=KBbropdvobucfQx5Wx@mail.gmail.com>
	<AANLkTi=9A-00vr+NZscVbeiZjbHO7eqaMoQF_pmabBtg@mail.gmail.com>
Date: Fri, 15 Oct 2010 08:40:07 +0200
Message-ID: <AANLkTim+-eUy6sZXMx7m+fJs8MUz0-1AqNtH8fd5akAE@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Bitbaking while modifying recipes
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
X-List-Received-Date: Fri, 15 Oct 2010 06:40:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/14 Chris Larson <clarson@kergoth.com>:
> On Thu, Oct 14, 2010 at 1:14 PM, Ash Charles <ashcharles@gmail.com> wrote=
:
>
>> Hi,
>>
>> At what point in bitbaking a recipe is it safe to start modifying the
>> recipe without risk of messing up the current bitbake build? =A0I often
>> find myself kicking off a bitbake and then wanting to do some git
>> operations in my openembedded recipes tree. =A0Previously I've resisted
>> the urge to mess around until whatever is being bitbaked is done but I
>> suspect that I'd be fine to make changes as soon as the parse step is
>> completed. =A0Is this correct?
>
>
> Unfortunately not. =A0As things stand today, the upfront parsing phase is=
 only
> used to populate the cache / obtain the info necessary to construct the
> runqueue. =A0The recipes are actually *reparsed* when each task is execut=
ed.
> =A0The time taken by the parse is rather trivial, so its not much of an i=
ssue,
> but I do have a patch in queue from a coworker to make it cache the parse=
d
> recipe until the last task for that recipe is run.
>
> So, basically, continue to resist the urge :)
>
As far as I see it (and this seems not to contradict with what Chris
wrote) it is ok to work on a recipe after the parsing has finished if
it is a recipe that is not being build (either directly or indirectly
through depends).
E.g. if you are building busybox I feel you could still work on a qt
recipe while the busybox build is in progress ((or even on another
version of the busybox recipe (e.g. one with DEFAULT_PREFERENCE =3D
"-1"))

Chris, can you confirm?


