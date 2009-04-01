Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Lp41w-00009p-MN
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 19:15:24 +0200
Received: by yx-out-1718.google.com with SMTP id 3so94931yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 10:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=aEdLWtz6GjuncS66KAMARtxa/0qKHNqJuMxkhvc0YWc=;
	b=cEmmFoIf4Cf4JA/drYwi2hCgbNjX9E0nScUuAK0mjM5Xwn9bC3O4PHwVy9BYFvItX/
	emj8DyFUDLEtDSEcuGJlGW6em0kbkbDf5W9DDBPmi1lWchQZUL4YwuTXMTIWJFs/U3qB
	4OxidpG8wI7xx7Qe2T9Gl3CUhPe8tVTQ5uOpA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=dY3sDd7Hon3izFeOqh55H8rZvznZIauFmvnYGhovGc+zNz+v3ZrXuj9ffUdACejhz/
	euhXs9AhzfYiKTNjXA+RF1TaJZi18WFTj4gozPXe/ZfWA9ay4HAEc6Ktupkjionx/JNV
	JDTcFIdp+aY9zHokIw2QF1znbHm8b5xVIb3Vg=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.42.6 with SMTP id u6mr4805797ybj.127.1238605972184; Wed, 
	01 Apr 2009 10:12:52 -0700 (PDT)
In-Reply-To: <gr06m3$63e$1@ger.gmane.org>
References: <49CD3BFF.2030902@irobot.com>
	<b6ebd0a50903271402r632461b0q962666a6b2ccd50c@mail.gmail.com>
	<49D395AF.1090706@irobot.com>
	<b6ebd0a50904010952n6ce5b7b2g793f79ada1e6dcc1@mail.gmail.com>
	<gr06m3$63e$1@ger.gmane.org>
Date: Wed, 1 Apr 2009 10:12:51 -0700
X-Google-Sender-Auth: 26e87af0021b1092
Message-ID: <b6ebd0a50904011012p4b401f2ex374e778f80fdea39@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.156
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] bash: add alternative configuration for bin/sh -> /bin/bash
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
X-List-Received-Date: Wed, 01 Apr 2009 17:15:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2009 at 10:01 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 01-04-09 18:52, Chris Larson wrote:
>>
>> On Wed, Apr 1, 2009 at 9:26 AM, Tim Harvey<tharvey@irobot.com> =C2=A0wro=
te:
>>>
>>> Chris Larson wrote:
>>>>
>>>> Be very careful with this. =C2=A0Specifically, be sure to thoroughly t=
est
>>>> installing bash onto a system that currently has busybox, and the
>>>> upgrade paths for both busybox and bash. =C2=A0You never want to get i=
nto a
>>>> state, due to pre/post rm/install script execution order, where
>>>> /bin/sh doesn't exist. =C2=A0If that happens, you won't be able to exe=
cute
>>>> the next script to fix it :)
>>>>
>>>
>>> in my case, I have both bash and busybox installed and I want bash to
>>> take
>>> priority as the /bin/sh which it otherwise does not.
>>>
>>> attempting to remove the package that contains your shell is something
>>> you
>>> need to be careful as anyway.
>>>
>>> This seems to me to be a prime example of where alternatives should be
>>> used?
>>
>> You missed my point, it seems. =C2=A0I was talking about
>> update-alternatives. =C2=A0Depending on how update-alternatives is
>> implemented, there could be issues similar to what I mentioned in the
>> previous email. =C2=A0Consider: if it uses system(), which calls /bin/sh=
,
>> to remove the old /bin/sh link, and then calls system() again to
>> create the new, it will fail. =C2=A0Speculation, but again, it's somethi=
ng
>> you always need to keep in mind if you're messing with /bin/sh in any
>> way.
>
> IIRC our default u-a is a shell script, the other version is a perl scrip=
t.
> Correct me if I'm wrong, it has been some years since I looked at it :)

That reminds me, one of my coworkers pointed me to a C implementation.
 If you grab the chkconfig srpm from centos 5.2, or another redhat
based distribution, you'll find an alternatives.c written by redhat,
whose syntax is the same as debian update-alternatives.  Might be
worth looking at.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


