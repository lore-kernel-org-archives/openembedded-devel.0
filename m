Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlHPu-00049L-Tv
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 10:21:29 +0200
Received: by gxk2 with SMTP id 2so2434234gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 01:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=92gqp4vFwzLQvbPGHBpDcKIKPnKjYiLGp5ApJBU1A+4=;
	b=TKc4+U6b6JHGxSixwrjz/DVnJ2OHdA5HvfX4cg97NyM2MKUbL53W342pZ8WRKDQ6yC
	SUIkDnWEXkjEI0Qqalo88gOOGsX9ak1o6kkPQp27HJVNXljrX4tGMM7BLP5+c3arhusW
	5BHGe+Z0/mnw8Fez6nhi02lk584itrxFsLz/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fY8AXJiOBnwz4xYZdA47pCoQSSoMjDf+o0jvl3yskzvmxxdGpBiFyNpjt/WP2IPbZ9
	qXf8xgP/0qV/THI2BZ5f3ZdbM1M1B289YTYAuN3bHlf+WLJ5Vn07BOSf/zjX1h7n19LQ
	hjLBwSZLQfko2GNvX6eStKaAhU75i81IVIyIU=
MIME-Version: 1.0
Received: by 10.231.191.6 with SMTP id dk6mr7318787ibb.51.1282033242627; Tue,
	17 Aug 2010 01:20:42 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 01:20:42 -0700 (PDT)
In-Reply-To: <AANLkTikGKtyVsmKKD4A8nuXS5wSGNOvCMb1apeFHPYE0@mail.gmail.com>
References: <1281998751-10781-1-git-send-email-jkridner@beagleboard.org>
	<4C69CD3E.5090007@mentor.com>
	<AANLkTikGKtyVsmKKD4A8nuXS5wSGNOvCMb1apeFHPYE0@mail.gmail.com>
Date: Tue, 17 Aug 2010 10:20:42 +0200
Message-ID: <AANLkTi=YwSNSqe8eSykO_ajEc6dsMBdXFdzBA+to-fEV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] flex: disabled packaged staging of native builds
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
X-List-Received-Date: Tue, 17 Aug 2010 08:21:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
> On Mon, Aug 16, 2010 at 7:43 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> Jason Kridner wrote:
>>>
>>> ---
>>> =A0recipes/flex/flex.inc | =A0 =A04 +++-
>>> =A01 files changed, 3 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/recipes/flex/flex.inc b/recipes/flex/flex.inc
>>> index 49b26e8..5d3f076 100644
>>> --- a/recipes/flex/flex.inc
>>> +++ b/recipes/flex/flex.inc
>>> @@ -4,7 +4,7 @@ LICENSE =3D "BSD"
>>> =A0DEPENDS =3D "gettext"
>>> =A0-INC_PR =3D "r5"
>>> +INC_PR =3D "r6"
>>> =A0S =3D "${WORKDIR}/flex-${PV}"
>>> =A0@@ -16,3 +16,5 @@ inherit autotools gettext
>>> =A0# static-only library; that might be an error
>>> =A0FILES_${PN} +=3D "${libdir}/libfl.a"
>>> +
>>> +PSTAGING_DISABLED_virtclass-native =3D "1"
>>
>> I assume you've ran into 2.3.35 not being relocation happy? =A0Have you =
been
>> able to look at this at all? =A02.3.31 works so it's something 'bad' don=
e
>> upstream. =A0Thanks!
>
> I did, but I didn't look into the details. =A0bison-native wouldn't
> rebuild when I used my flex-native pstage. =A0bitbake -c clean
> flex-native fixed it, so...

After that would rebuilding from pstage cause the error again?
I'm a little bit worried that we inhibit PSTAGING because e.g.
something else is wrong (e.g. a change elsewhere that should have been
resulted in a flex PR bump).

Besides (but this is more a global remark): it would be nice if a
recipe disables something that there is a short description why this
is done. (at least in the commit message, but imho preferably in the
recipe, so in half a year time, people still know why it is done and
can much easier judge if it can be removed).

Frans.


