Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SFhiT-0001qB-IP
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 10:06:49 +0200
Received: by wibhj13 with SMTP id hj13so1148802wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 00:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=rIF+Ex7KDBxGbmYj3eAVbQWQtdKu/do5bXkjmPJSLXA=;
	b=QyXV2OXnEndutuqGthwXDjRApG5cqHnQTcYYbgfY7jrhUzvii5a3oTBjNojWIFOAjL
	006rTrGLA7Swge/tk4MM9oaM5isxL7YgWrwkeJsMTxy7GHtkTn1qkbyVhLHt3rojA1wA
	BqQKcAyzcsrnzOeACqgBv2D/M4N8QoBb2dLL8kydaQMmF90BoN9BmWz42ei9aqgHIKEI
	5PCKbClA+QifJpAMH56tTMo4SWpc8vbEVjDzONhkvmZs5BrZ9k1GyYU5KfS/neWtNgqF
	xLX0o/5J/KZxah845onmdqrVVHN/jlBOoFxilwihzpPw80TM5a/+5y2FmlI3MUhlmTXc
	E+xQ==
MIME-Version: 1.0
Received: by 10.180.102.100 with SMTP id fn4mr2357030wib.1.1333612658287; Thu,
	05 Apr 2012 00:57:38 -0700 (PDT)
Received: by 10.223.104.68 with HTTP; Thu, 5 Apr 2012 00:57:38 -0700 (PDT)
In-Reply-To: <CAE4k23-WKaczsEDCBohBAPpiDf9D+bk05qEPBU+qOeJ07=Fqzw@mail.gmail.com>
References: <20120402210435.GA10553@hermes>
	<CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
	<20120404195704.GA16410@hermes>
	<20120404200036.GI4181@jama.jama.net>
	<CAK18fxEqNka=VKjpF0yD-iExz6pBVpJuUvSCEhxtQfwmP8Qiig@mail.gmail.com>
	<CAE4k23-WKaczsEDCBohBAPpiDf9D+bk05qEPBU+qOeJ07=Fqzw@mail.gmail.com>
Date: Thu, 5 Apr 2012 09:57:38 +0200
Message-ID: <CAGiJk9f_J_o2zkQk5TGBPHUvEt4SLVUQ=uvAY=C9j+o-B9=3dQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package build failure
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
X-List-Received-Date: Thu, 05 Apr 2012 08:06:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/5 Anders Darander <anders.darander@gmail.com>:
> On Thu, Apr 5, 2012 at 09:33, Andrei Gherzan <andrei@gherzan.ro> wrote:
>> Or you can specify a tag in =C2=A0src_uri. Something like SRC_URI =3D
>> "git://bla.git;protocol=3Dgit;tag=3Dmytag"
>
> Yes, you can, but please use SRCREV instead. (And let SRCREV point to
> the commit that corresponds to the tagged commmit). If you use tags,
> git will try to reach to server to verify the tag, while SRCREV lets
> you build completely offline.
>
> /Anders

Yes you are right, this is done because git tags can be moved.

Usually I would assume that it only checks the revision while fetching.
But currently it seems like "git ls-remote" (the tool that checks the
remote revision) is executed at _every_ task of a tagged recipe (and
also once while parsing).
So if you have 10-20 recipes from the same git server that use tags,
building them could generate heavy load on the server.

Still wonders me why it has to check for the revision at do_package
and fails me if the server is unreachable / busy.
(git-ls-remote unable to look up anongit.kde.org/...)


Was looking for this "issue" in the fetcher/git code, but I couldn't
find it at the first look..

--=20
Regards
Samuel


