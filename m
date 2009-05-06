Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1M1lg0-0001WJ-Ec
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 20:17:04 +0200
Received: by qw-out-1920.google.com with SMTP id 9so190019qwj.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2009 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=WJtPdFp23ugt9iy4z6gKhR/b4pa6k5SDfeWAlUXI6O8=;
	b=EX8LEJOR9Jb8lk9nibkPp9jiawWzberkqDOoyAuk6XftsHOiLKeBakkaO4yrVkVJNW
	ZtDXeIYZ2Kj3+31QEbfotVNHt4gF1j21jHgIsgFWYIzCyhPPFvp6qk2VoVDaWC7sCAF3
	6VKbtzAgIgkSgZw2tbICHqm1MRQIDfgUl63XI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=IUZanAVlOzfTROQrU3N2zwUd78ORhldjcm8sVtlj6aBGq8cCg/pn+id5ZOPRTrNq3q
	/9Bl7va+vljjJzdWmE8aXG6Snbab3l2Ah83Akv7uIK7SmEtinqlTT1RZJANhHkCa65Q4
	jyA5ldqCiy0L7MfNRFr7iSGKlOY4mCjfRK7qo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.12.14 with SMTP id 14mr605175wfl.63.1241633462687; Wed, 06 
	May 2009 11:11:02 -0700 (PDT)
In-Reply-To: <4A01CF95.4000003@balister.org>
References: <4A0196B0.4010202@balister.org>
	<1241626055.16805.134.camel@mill.internal.reciva.com>
	<4A01CF95.4000003@balister.org>
Date: Wed, 6 May 2009 11:11:02 -0700
X-Google-Sender-Auth: c4ea3864c37bed0f
Message-ID: <b6ebd0a50905061111x4bcc369dr91909b50e4b9268@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: FILESPATHPKG question
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
X-List-Received-Date: Wed, 06 May 2009 18:17:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2009 at 10:57 AM, Philip Balister <philip@balister.org> wrot=
e:
> Phil Blundell wrote:
>>
>> On Wed, 2009-05-06 at 09:54 -0400, Philip Balister wrote:
>>>
>>> +FILESPATHPKG =3D "u-boot-git:u-boot:files:."
>>
>>> Ignore the added patch :) Should I go ahead and push the FILESPATHPKG
>>> change? Otherwise all the patches will end up in the files directory ..=
..
>>
>> Wouldn't you be better off just prepending to FILESPATHPKG rather than
>> replacing it? =C2=A0As in, FILESPATHPKG =3D. "u-boot-git:" or something.
>
> I'd taken from a similar patch for uclibc. (That needs acks or comments).
>
> What's the difference between =3D+ ad =3D.? Both work and I see more of t=
he =3D+
> form?

The + operations insert a space separator.  The FILESPATH vars use :
as their separator, not +, so no, they don't "Both work".
=E2=80=94
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


