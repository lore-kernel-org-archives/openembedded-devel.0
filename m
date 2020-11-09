Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.16022.1604947078751750031
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 10:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: gpanders.com, ip: 217.70.183.196, mailfrom: greg@gpanders.com)
Received: from sogo15.sd4.0x35.net (sogo15.sd4.0x35.net [10.200.201.65])
	(Authenticated sender: greg@gpanders.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPA id 4DB5FE0003;
	Mon,  9 Nov 2020 18:37:56 +0000 (UTC)
From: "Gregory Anders" <greg@gpanders.com>
In-Reply-To: <CA+chaQeHEc_MQTC7aHuDiTgs+v4T6vEzAuypDg72A3u6kR9M+A@mail.gmail.com>
X-Forward: 127.0.0.1
Date: Mon, 09 Nov 2020 19:37:55 +0100
Cc: "openembedded-devel" <openembedded-devel@lists.openembedded.org>
To: "Martin Jansa" <martin.jansa@gmail.com>
MIME-Version: 1.0
Message-ID: <8f7-5fa98c80-21b-1520e3e0@149205723>
Subject: Re: ?utf-8?q?_=5Boe=5D?==?utf-8?q?_=5Bmeta-oe=5D=5BPATCH=5D?= Add suitesparse
User-Agent: SOGoMail 4.3.2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday, November 09, 2020 10:13 MST, Martin Jansa <martin.jansa@gmai=
l.com> wrote: 
 
> I don't have strong opinion, but when I was adding suitesparse to met=
a-ros
> a while ago, it was a bit easier to build each library separately as =
in:
> https://github.com/ros/meta-ros/commit/1242e0ce3c84a05363fc11244a8a6a=
c0e08de4e9
> not sure if that changed between 5.4 and 5.8. It might be still usefu=
l to
> package them separately.
> 
> If all works fine now with 5.8 I will be happy to drop it from meta-r=
os
> once this is merged in meta-oe.
> 

Granted, I've only tested it against compiling python3-cvxopt, but it s=
eems to work for me. I did have to make a few patches in order to get t=
he compiler and linker flags to pass through to the SuiteSparse build s=
tep and also to correctly generate a versioned .so file for one of the =
libraries, but those were the only issues I ran into.

I do not use meta-ros (and I have to admit that I was ignorant to its e=
xistence before your email), so it would be worth testing my recipe aga=
inst any other recipes in meta-ros that depend on SuiteSparse to ensure=
 it works as expected.

- G

