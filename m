Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH1nn-0004Qp-30
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 01:13:31 +0200
Received: by gyc15 with SMTP id 15so3211742gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 16:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=pkNJvu8Wp4EHSnpqGvgjg9vwOBr9oNLy8sWqo8EOHIc=;
	b=Itos3hfaRHZE9HHfIZVTlIqeAKzimPVFSNexvPzKZqawDtlPflbRdHYeNtzK3g2AMP
	gyA8yNVOFgTZSEgeyGbleOBbVGfrNPKadf4ndw+M8Te2na2bomM6rdr2lc5VvRzuWHA6
	e64JENdZV4RvxmoO4YrK4pzmIpzTo+ysTTOa4=
Received: by 10.68.73.103 with SMTP id k7mr13669050pbv.30.1319152058067; Thu,
	20 Oct 2011 16:07:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 16:07:08 -0700 (PDT)
In-Reply-To: <CAFu+nvFu_Mz1MoXuFW3YZM8L_6u3F2mwGjwGK8Xm7vKmjLpyRQ@mail.gmail.com>
References: <CAFu+nvF2BM344-+5wHCobJshpU=TtuaxD0_WR2CPisNSev0pnQ@mail.gmail.com>
	<20111020205523.GT26170@denix.org>
	<CAFu+nvFu_Mz1MoXuFW3YZM8L_6u3F2mwGjwGK8Xm7vKmjLpyRQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 16:07:08 -0700
Message-ID: <CAMKF1srwo9Wpf7kf_4ki0+aXdXKRJPMnN_8tn6BbAMRp2H-TnA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: DEPLOY_DIR and package_stagefile_shell
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
X-List-Received-Date: Thu, 20 Oct 2011 23:13:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 2:11 PM, George C. Huntington, III
<george.huntingtoniii@gmail.com> wrote:
> On Thu, Oct 20, 2011 at 4:55 PM, Denys Dmytriyenko <denis@denix.org> wrot=
e:
>
>> On Wed, Oct 19, 2011 at 05:39:45PM -0400, George C. Huntington, III wrot=
e:
>> > It appears that if you override DEPLOY_DIR to make the DEPLOY director=
y
>> > outside of TMPDIR, then recipes that call package_stagefile_shell fail=
.
>> the
>> > sed magic in package_stagefile_shell assumes that the path will be in
>> > TMPDIR. =C2=A0Should the package_stagefile_shell be fixed, or should t=
he
>> recipes
>> > that call it with ${DEPLOY_DIR_IMAGE} be changed. =C2=A0the u-boot.inc=
 and the
>> > linux.inc have this problem.
>>
>> Well, it's an old issue - I first faced it over 3 years ago[1]. I had it
>> "fixed" or worked around, by modifying the sed magic. Then it got broken
>> again
>> and there wasn't any good fixes available since then. That's the way
>> packaged
>> staging works, as pstage had to be relative to deploy dir, which both
>> reside
>> in TMPDIR by default.
>>
>> At one point I even disabled packaged staging in Arago in order to allow
>> re-defining DEPLOY_DIR, but later on it got mandated and I just gave in =
to
>> not
>> being able to move DEPLOY_DIR outside of TMPDIR. :)
>>
>> Either way it's a moot point now with oe-core and shared state...
>>
>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/19300
>>
>> --
>> Denys
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> That kind of sucks for people who have to use the 2011.03-maintenance bra=
nch

I understand but like any other software new features come in new
releases and this problem has been fixed
from design point of view so this could be your motivation to upgrade
to newer oe-core based release.


