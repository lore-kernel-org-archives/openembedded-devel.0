Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oqv3i-0008KK-Ag
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:41:31 +0200
Received: by iwn2 with SMTP id 2so6985386iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 14:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=glMmeh5endij5T/pEzXuLrSOyM2wub4z+7HHpx8iXDc=;
	b=xbLWCuQC1+K+c+09xjT1J/Q7/qa3C3rtkbmhLvcfVvcQujJKXms/LR+MBFrzAZc/8b
	fIGNKDKu/EJyibDzMTpIy4yk275A1CKFmt2fn2dw3YPz73YrbpsZNg4z8mVtQvlCGfcW
	j8nfMYIX020q1e3L/J3CyrMza9fPEqctUqeqE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=v+AqHN5d1GMM/QXRQppoogS22h1e0Y2e5757JXMq4+TJ1ScjsA8wYD1/uV4W3Jsx94
	2ZRyqISP47mxUJjQihqgAzFbIRWfeuAEVo0844aOs9aqslmrzrxU3vPd+s4qSTaWGFIE
	QmnDRzcR85VoPRUXfFaiZk8wMjdUCoGraDb2o=
Received: by 10.231.14.140 with SMTP id g12mr8613725iba.84.1283377241406; Wed,
	01 Sep 2010 14:40:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Wed, 1 Sep 2010 14:40:20 -0700 (PDT)
In-Reply-To: <AANLkTikE=wDnQPu5txDEL4QdOjfrD3YK1DOphAqvZZ4h@mail.gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-12-git-send-email-raj.khem@gmail.com>
	<i5das3$v2$3@dough.gmane.org>
	<AANLkTikE=wDnQPu5txDEL4QdOjfrD3YK1DOphAqvZZ4h@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Sep 2010 14:40:20 -0700
Message-ID: <AANLkTin3L-dJY_KRx5BjdSPCfU1nr-iTYvkzuE5KNE3B@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 11/23] udev-compat141_141.bb: if machine is not one of spitz akita c70x poodle then it is not needed to RDEPEND'ed on udev-compat-wrapper
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
X-List-Received-Date: Wed, 01 Sep 2010 21:41:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2010 at 11:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Aug 29, 2010 at 2:56 AM, Koen Kooi <k.kooi@student.utwente.nl> wr=
ote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 28-08-10 22:24, Khem Raj wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> =A0recipes/udev/udev-compat141_141.bb | =A0 =A06 +++++-
>>> =A01 files changed, 5 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-com=
pat141_141.bb
>>> index 2411fc6..c39d4cb 100644
>>> --- a/recipes/udev/udev-compat141_141.bb
>>> +++ b/recipes/udev/udev-compat141_141.bb
>>> @@ -15,7 +15,11 @@ PACKAGES =3D "${PN} ${PN}-dbg"
>>> =A0PROVIDES =3D "udev-compat"
>>>
>>> =A0# Need udev with udev-compat-wrapper support and nothing else.
>>> -RDEPENDS_${PN} =3D "udev-compat-wrapper"
>>> +RDEPENDS_${PN}_spitz =3D "udev-compat-wrapper"
>>> +RDEPENDS_${PN}_akita =3D "udev-compat-wrapper"
>>> +RDEPENDS_${PN}_c7x0 =3D "udev-compat-wrapper"
>>> +RDEPENDS_${PN}_poodle =3D "udev-compat-wrapper"
>>> +
>>> =A0# Remove hotplug RPROVIDES
>>> =A0RPROVIDES_${PN} =3D "udev-compat"
>>
>> NAK, this is a generic wrapper to use recent udev on older kernels, not
>> specific to zaurus.
>
> OK then why is this wrapper only rprovided for specific machines and
> not rprovided always for every machine ?
> It seems its does not do what you are saying IIUC.

ping ?


