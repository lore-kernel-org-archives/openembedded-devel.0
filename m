Return-Path: <ryanelkholy@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4D74760088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 10:31:42 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id x7so12809955qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 03:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:references:in-reply-to:to;
	bh=1g+K2Zcidy2cI7DoaqQNtZ2zctVeSpo132rrR3ixDH0=;
	b=0WE2t3qUNpPHDeqVfMZPE/xfpE20tYfkMPQL59zigzGwDtoJQtR+4C/GW3UjdgSZZS
	eKf/Lxb8Z60DPMVeRlU8MNVVP2lUwOCTzFRjYtPCI1dwfRduE5DoRNXFYolq+6ra1BKd
	WYlUR/G28F9YwnhXy/9m4Jm+PnxeyZPvzAVVayCqDkJdX1mkvM0CgGlG2hh3n7ot0KLE
	InNQIy2XnqT9T6IhiPCVM3mx+YWCloqDKaVvpaCTxwEJ3mpIX792caKa+jbKC2gujFaP
	+zuKrRxV+YJYg6nDX4xlMMGLegdOFaYERG0nUSQok9udB34qocAZxlEKQy65d2eLmIay
	fboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:references:in-reply-to:to;
	bh=1g+K2Zcidy2cI7DoaqQNtZ2zctVeSpo132rrR3ixDH0=;
	b=IMUzHpyMin8JJiE9y/qhE5Sc2RGQFUlzgYfFdWO8fFG0YIBEX7z2xtFpLXn7qlwjZb
	V5YIsnewY+2cR1NqtHQW/n9RQx/UpZpdwbo9QzyxixfoGjzzNu625+9/mTkrXs8kYF4P
	iZz/JkRd1KjmZezzaluFNXinSH0GARSbFpBxp3/Rm2Ip30+As1yFoGoZejKzhor2Jh2H
	Fz6jHcTHVN+TuhcFQSePnLKNQ4kTeU4QI9qvWEaUxWEom85RSMXzkGPL9DPh7y6skCua
	l3U7MpbGol0H4YellLtHf+uoi8mKbUWNXa1epR8fG0PLhqoIoe6FziI6GmbWYSKi4dGM
	fAkA==
X-Gm-Message-State: AOPr4FVuAat1uYoG/DYcr+yesQqfQo4LI8S29AKMBQZSAjGZJ/JBH7OI5zMyCep06XOAPA==
X-Received: by 10.55.11.4 with SMTP id 4mr10101833qkl.92.1461148302823;
	Wed, 20 Apr 2016 03:31:42 -0700 (PDT)
Received: from [192.168.0.101] (c-76-116-171-164.hsd1.nj.comcast.net.
	[76.116.171.164])
	by smtp.gmail.com with ESMTPSA id b2sm9658203qgb.37.2016.04.20.03.31.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 03:31:41 -0700 (PDT)
From: Ryan Elkholy <ryanelkholy@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <BCF6D77D-444E-4998-A0F7-BD3CC7DDFEBB@gmail.com>
Date: Wed, 20 Apr 2016 06:31:41 -0400
References: <CAMZfsd5MAhEiAw7YsMuS0bv1AMKh3ZTONV0tW5E+U83UvQN4nQ@mail.gmail.com>
	<20160420080424.GA3520@ad.chargestorm.se>
In-Reply-To: <20160420080424.GA3520@ad.chargestorm.se>
To: openembedded-devel@lists.openembedded.org
X-Mailer: iPhone Mail (13E238)
Subject: Re: [meta-qt5] Qt SDK seems to be broken
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2016 10:31:44 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Thanks for the quick reply. Is this something that is wrong with the toolcha=
in or is it configuration of QtCreator? If QtCreator, what do I do to fix it=
? Are there specific variables in the Project's build environment setting th=
at I should look at?=20

Also, if that is the case then this would have to be done on a per project b=
asis. How can I fix it in the toolchain so that it is automatically detected=
 and corrected in QtCreator?

> On Apr 20, 2016, at 4:04 AM, Anders Darander <anders@chargestorm.se> wrote=
:
>=20
> * Ryan Elkholy, PhD, PE <ryanelkholy@gmail.com> [160419 18:26]:
>=20
>> It says it cannot find qmlplugindump, but I clearly see it in the path.
>=20
>> Regardless, I went along and I manually chose the compiler/debugger/versi=
on
>> using the SDK and made a kit for my target. After doing so I made a sampl=
e
>> app that required the following:
>=20
>> Qt +=3D quick qml
>=20
>> After trying to build I got the following compiler errors:
>=20
>> "
>> Makefile:659: warning: overriding commands for target `install_target'
>> Makefile:650: warning: ignoring old commands for target `install_target'
>> Makefile:663: warning: overriding commands for target `uninstall_target'
>> Makefile:654: warning: ignoring old commands for target `uninstall_target=
'
>> g++  -o testapp main.o qrc_qml.o   -lQt5Quick -lQt5Gui -lQt5Qml
>=20
> It's still using your hosts compiler.
>=20
>> -lQt5Network -lQt5Core -lGLESv2 -lpthread
>> /usr/bin/ld: cannot find -lQt5Quick
>> /usr/bin/ld: cannot find -lQt5Qml
>=20
> The same for ld.
>=20
> Check your compiler configuratin in QtCreator again.
>=20
> Cheers,
> Anders
>=20
> --=20
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

