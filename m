Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Lp3hs-00086j-Ic
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 18:54:30 +0200
Received: by yx-out-1718.google.com with SMTP id 3so87640yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6qPIltXo8PvGY184/VQ9Kj0RHxjt8Q/un0mkgRPxZic=;
	b=kcs4UfkUZ9Adnk/B1RUjRaUi+stZ1IenPwD4jqw0VJIu4sgyYmpA5xqlFMYcZEpQ/K
	YntALoXkzjxLpE2qY6V61Xic7AUBb2KHtmOJBZIs30ZkJwzmpflXoxLkY8zJ0eXHVvgz
	+WCF6bNCvO2CDVZvqq0fVWSBdxQG4mNx97yQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=LmHSuQnOOAq9F2NSxZrcOjxrPIagj8nb5tCssVNFw8gwwSfHxYFl6EMK6eiO9c72R6
	DWlYihb/Cc+F/6oUZKqCC7/Kjnb5o/YmJzJakT8k7s84yFSUdlhXv5r1TrNHNpfRRWtF
	xIKnpV9s+4BpaKoPQigJVJIdakv+aRlDEvzkM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.42.12 with SMTP id u12mr1957939ybj.167.1238604727963; Wed, 
	01 Apr 2009 09:52:07 -0700 (PDT)
In-Reply-To: <49D395AF.1090706@irobot.com>
References: <49CD3BFF.2030902@irobot.com>
	<b6ebd0a50903271402r632461b0q962666a6b2ccd50c@mail.gmail.com>
	<49D395AF.1090706@irobot.com>
Date: Wed, 1 Apr 2009 09:52:07 -0700
X-Google-Sender-Auth: a7304d8add649d4d
Message-ID: <b6ebd0a50904010952n6ce5b7b2g793f79ada1e6dcc1@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.157
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Wed, 01 Apr 2009 16:54:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2009 at 9:26 AM, Tim Harvey <tharvey@irobot.com> wrote:
> Chris Larson wrote:
>>
>> Be very careful with this. =C2=A0Specifically, be sure to thoroughly tes=
t
>> installing bash onto a system that currently has busybox, and the
>> upgrade paths for both busybox and bash. =C2=A0You never want to get int=
o a
>> state, due to pre/post rm/install script execution order, where
>> /bin/sh doesn't exist. =C2=A0If that happens, you won't be able to execu=
te
>> the next script to fix it :)
>>
>
> in my case, I have both bash and busybox installed and I want bash to tak=
e
> priority as the /bin/sh which it otherwise does not.
>
> attempting to remove the package that contains your shell is something yo=
u
> need to be careful as anyway.
>
> This seems to me to be a prime example of where alternatives should be us=
ed?

You missed my point, it seems.  I was talking about
update-alternatives.  Depending on how update-alternatives is
implemented, there could be issues similar to what I mentioned in the
previous email.  Consider: if it uses system(), which calls /bin/sh,
to remove the old /bin/sh link, and then calls system() again to
create the new, it will fail.  Speculation, but again, it's something
you always need to keep in mind if you're messing with /bin/sh in any
way.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


