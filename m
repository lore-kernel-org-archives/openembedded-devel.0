Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBudS-0004eS-B3
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 19:52:22 +0200
Received: by bwz19 with SMTP id 19so162377bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 10:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LD+t9CgegW1xTH/0qyb2yur3pwF8NZHGx6FPXUK6XHc=;
	b=St8fRX3MRjQ+tQgJau0Da6+5b4COwrV5UzJ+wSmT14k/hOaOCRmz3se5msbCkGzAzI
	AzYHTnTY+jx5yzhuJxkXMi20A/7225SMDW4wBu66zFRIvV2A9/L7wWi+Rnno3fxY+Bw/
	PoD67TjpS0L8DfwAATS/cn36oynSdPpgsjX3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QXXJGgbNTol2yt6H+nPwbRg3UcnLfb+9c02ee7yvf8KpQFW+HlWFf2rP2B/cQe5UeP
	faJYnSYXJhuC0M0myK+TMgM7Mor9A9RWdlfNW7sIqLgFT/fAh8Ez24FHjbCJWVPTsfI1
	zuDi+9hBEFmWvA9egG3+v0di1Bop0hr2pTfb0=
MIME-Version: 1.0
Received: by 10.103.226.10 with SMTP id d10mr814286mur.35.1244051002046; Wed, 
	03 Jun 2009 10:43:22 -0700 (PDT)
In-Reply-To: <20090603173600.GM26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603160007.GJ26065@smtp.west.cox.net>
	<h069pd$tf0$1@ger.gmane.org>
	<20090603173600.GM26065@smtp.west.cox.net>
Date: Wed, 3 Jun 2009 20:43:22 +0300
Message-ID: <fce2a370906031043k610f7876t6f1e760052745bf4@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Jun 2009 17:52:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2009 at 8:36 PM, Tom Rini <trini@embeddedalley.com> wrote:
> On Wed, Jun 03, 2009 at 06:53:01PM +0200, Koen Kooi wrote:
>> On 03-06-09 18:00, Tom Rini wrote:
>>> On Wed, Jun 03, 2009 at 06:37:12PM +0300, Ihar Hrachyshka wrote:
>>>> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
>>>> ---
>>>> =C2=A0 recipes/qt4/qt4-embedded.inc | =C2=A0 =C2=A04 ++--
>>>> =C2=A0 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.i=
nc
>>>> index bae52ab..3d986b2 100644
>>>> --- a/recipes/qt4/qt4-embedded.inc
>>>> +++ b/recipes/qt4/qt4-embedded.inc
>>>> @@ -3,7 +3,7 @@ SECTION =3D "libs"
>>>> =C2=A0 LICENSE =3D "GPL QPL"
>>>> =C2=A0 PRIORITY =3D "optional"
>>>> =C2=A0 HOMEPAGE =3D "http://www.trolltech.com"
>>>> -DEPENDS +=3D "tslib"
>>>> +DEPENDS +=3D "directfb tslib"
>>>> =C2=A0 INC_PR =3D "r11"
>>>
>>> So, here's a problem. =C2=A0We both don't allow use flags and we force
>>> directfb stuff to be done in foo-directfb (libxine / synaesthesia seems
>>> to be the exception to this rule) rather than the main foo package.
>>
>> Isn't this just creating a qt-gfxdriver-directfb.so and not impose
>> runtime deps on directfb in ${PN}?
>
> But how much stuff is now going to pick up "Oh, we have directfb" ? =C2=
=A0Or
> are you sure everything is already passing --disable-directfb that might
> default to auto?

If so, we should fix the affected recipes not this one.

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


