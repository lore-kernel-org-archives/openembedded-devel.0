Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBuQ2-0003yE-Ka
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 19:38:30 +0200
Received: by fxm20 with SMTP id 20so153404fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Hh1n1pSC0LKb4J/ChSlJ+Uiy+GoG9j+fLI6YwQeV1HE=;
	b=gewXaOfu8pqodpBOmH+uhdKDUP2p4qj5BIPjAy3q7ivkq4YyfoVEaSfTuLM3zzKhcB
	eyB6JMxgCgADzousZ9UgQ+iIkzutUHGF+AI+dArlag5I3OSTr1GiWRTv+cDFkPOV0mpu
	ihphQJBxWJcqccuoMVaHRO3uGTJhjwRPyxKSg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sQmZQ6o/MXqxqpb8teTS/Wm+qCgv541cMlL3NgkvcqHcu8AlTqVUe8/07M15c4/At6
	Uip/jZk5Tr34h6hqErw54mRXV5zP9lHVEz8ew6SqRx5qsBO/TkBvndYcirL+iPIIqc3f
	XK3DGVLv73ekUbftsYu6rviJ/zK/uR5Uq5twc=
MIME-Version: 1.0
Received: by 10.103.213.10 with SMTP id p10mr810192muq.17.1244050170292; Wed, 
	03 Jun 2009 10:29:30 -0700 (PDT)
In-Reply-To: <h069pd$tf0$1@ger.gmane.org>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603160007.GJ26065@smtp.west.cox.net>
	<h069pd$tf0$1@ger.gmane.org>
Date: Wed, 3 Jun 2009 20:29:30 +0300
Message-ID: <fce2a370906031029y46a0bbd7wbc358bc5bb16ce0a@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 02/12] qt4-embedded: added directfb plugin
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
X-List-Received-Date: Wed, 03 Jun 2009 17:38:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2009 at 7:53 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> On 03-06-09 18:00, Tom Rini wrote:
>>
>> On Wed, Jun 03, 2009 at 06:37:12PM +0300, Ihar Hrachyshka wrote:
>>>
>>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>>> ---
>>> =C2=A0recipes/qt4/qt4-embedded.inc | =C2=A0 =C2=A04 ++--
>>> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.in=
c
>>> index bae52ab..3d986b2 100644
>>> --- a/recipes/qt4/qt4-embedded.inc
>>> +++ b/recipes/qt4/qt4-embedded.inc
>>> @@ -3,7 +3,7 @@ SECTION =3D "libs"
>>> =C2=A0LICENSE =3D "GPL QPL"
>>> =C2=A0PRIORITY =3D "optional"
>>> =C2=A0HOMEPAGE =3D "http://www.trolltech.com"
>>> -DEPENDS +=3D "tslib"
>>> +DEPENDS +=3D "directfb tslib"
>>> =C2=A0INC_PR =3D "r11"
>>
>> So, here's a problem. =C2=A0We both don't allow use flags and we force
>> directfb stuff to be done in foo-directfb (libxine / synaesthesia seems
>> to be the exception to this rule) rather than the main foo package.
>
> Isn't this just creating a qt-gfxdriver-directfb.so and not impose runtim=
e
> deps on directfb in ${PN}?

Yeap, exactly. I don't see any problem with that. We are building xorg
stuff when baking console-image. So what's the problem with directfb
then?;)

>
> regards,
>
> Koen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


