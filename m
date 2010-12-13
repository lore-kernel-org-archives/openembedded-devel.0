Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PS3SD-0005Fk-79
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 09:08:17 +0100
Received: by iyj18 with SMTP id 18so767857iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 00:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=J1tvT7CYzSpL1OEnPLr3Q/4ACjOA6sM9AFrjXf65Sw4=;
	b=cPcIEkuWA16os0Jw47gt+t7i0dk5NrCFcZeXclzEqii/FUQXNAqsMZ9XBUsn0EBxL9
	xZXJiUEvoa+dwksb/mkeLdUlw77H/BHXsCy00CHxzRKTXGbUovb+RSdzoEPoLrHmH+9x
	1SrW+5V3CatX8v0cBYWy+AyS0E+egwXH0f8Nc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ptRqJ9fZJ3dHTZwMkluRYA+c4cZVpDWVF/zPXxPGpN7bg7eKK0BEzxu2Wz9jpv6Yo/
	1Z7gJwwVf8h6C+4QJF0b/6VFrNmyYHDjX05MlNh03pRSLgIYZypEqONAmLYdXCwKrxEc
	QXVyAiYs5byg0dhccgsyMp052J/9u32McVXzs=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr1636584ibv.32.1292227600761; Mon,
	13 Dec 2010 00:06:40 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 13 Dec 2010 00:06:40 -0800 (PST)
In-Reply-To: <AANLkTi=UT-4d=NqVwEgWfh39Ygjp4=xH-vSyTuCA5xXR@mail.gmail.com>
References: <AANLkTi=20woN1TEygXwHwgoOm3_OPp+GLU6JMNpAq3eV@mail.gmail.com>
	<AANLkTi=LseZRJ6e2907nGsPeLz=H8ZfDpmWjaPqM=0FK@mail.gmail.com>
	<AANLkTi=UT-4d=NqVwEgWfh39Ygjp4=xH-vSyTuCA5xXR@mail.gmail.com>
Date: Mon, 13 Dec 2010 09:06:40 +0100
Message-ID: <AANLkTi=kaE3QK7SbtqtigmEouxW-aSfHzqSpzWYwmZAt@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: js compilation oddity
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
X-List-Received-Date: Mon, 13 Dec 2010 08:08:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/12/13 Graham Gower <graham.gower@gmail.com>:
> On 13 December 2010 09:07, Graham Gower <graham.gower@gmail.com> wrote:
>> On 12 December 2010 22:36, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> When compiling js (for beagleboard/minimal) I got this:
>>>
>>> | k_cos.c: In function =EF=BF=BD=EF=BF=BD=EF=BF=BD__kernel_cos=EF=BF=BD=
=EF=BF=BD=EF=BF=BD:
>>> | k_cos.c:125:21: warning: =EF=BF=BD=EF=BF=BD=EF=BF=BDqx=EF=BF=BD=EF=BF=
=BD=EF=BF=BD may be used uninitialized in this function
>>> | Assembler messages:
>>> | Fatal error: can't create Linux_All_DBG.OBJ/k_cos.o: No such file or =
directory
>>> | make[1]: *** [Linux_All_DBG.OBJ/k_cos.o] Error 1
>>>
>>> Full log at:
>>> http://tinderbox.openembedded.net/public/logs/task/13169490.txt
>>>
>>> bitbake -cclean js; bitbake js
>>> resulted in a proper build; so apparently this is not reproducible.
>>>
>>> Anyone an idea ?
>>>
>>> Frans
>>
>> Unicode function names? Would that alter compilation depending on the
>> locale of the build system?
>
> Well I checked the c99 draft and indeed universal characters are
> allowed (section 6.4.3).
>
> But I looked at k_cos.c and these characters are not there. I assume
> you have local modifications. What happens when you remove them?

I don't have local modifications and as I wrote before, when I did a
bitbake -cclean js; bitbake js the problem disappeared.
This was on a fresh pull.

Best regards, Frans


