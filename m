Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C6DC66AF21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:26:35 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id q10so915806pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=IwRHTXpjFKGYddszchkSyZvHbWjgNOx+3Br7MfEvKZU=;
	b=WFADaQBt1yYLehfYjr+PAigjsVWfAI40SeP0+7HlMmDG4LfAgGREprIGJmtEWm+lQV
	Sem1POD4770AL1lcAgoEYp85RxnYuBSyYjSGPxAvHfJjdeYIypziDL9NpZq8rZko/Rbo
	ssJLAmcUJQx+c0QekCSOpyrXezHGS164t8GhK6xGzn/ihGrePpFpAXAmOP0FbZSP5A6S
	cU/3y1T9Ey3wakrJpPWdmjJKbGY2rlYVKug1dDbMY+XfffS8b8KVxxAF0ims8TV+BLeJ
	ahydFyOaNzieMkiA32eyqW5Z5ZNN7kv5AtIhIplR3edDqJ2OhnIT9mqbWIvtLT3Af992
	u6Ng==
X-Received: by 10.68.175.164 with SMTP id cb4mr694145pbc.191.1377278796297;
	Fri, 23 Aug 2013 10:26:36 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id tr10sm966825pbc.22.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 10:26:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5217126A.5000403@gmail.com>
Date: Fri, 23 Aug 2013 10:26:34 -0700
Message-Id: <0EB65E80-0A96-4D8F-9244-983EF566FC13@gmail.com>
References: <5217126A.5000403@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: Issues with xbmc and expat.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2013 17:26:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 23, 2013, at 12:42 AM, Martin Ertsaas <martiert@gmail.com> wrote:

> Hi.
>=20
> I'm trying to build xbmc, but I am stuck at the following error:
>=20
> | arm-atto-linux-gnueabi-libtool: link: arm-atto-linux-gnueabi-gcc=20
> -march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dhard
> =
--sysroot=3D/home/martin/Programmering/attolinux/build/tmp-attolinux_next-=
eglibc-eglibc/sysroots/pandaboard
> -shared  -fPIC -DPIC  .libs/psymbol.o .libs/pscan.o .libs/ploader.o
> .libs/pinfo.o .libs/pcontrol.o .libs/serial.o .libs/logging.o
> .libs/context.o .libs/cpluff.o .libs/util.o .libs/list.o .libs/hash.o
> .libs/thread_posix.o   /usr/lib/libexpat.so -ldl  -march=3Darmv7-a
> -mthumb-interwork -mfloat-abi=3Dhard
> =
--sysroot=3D/home/martin/Programmering/attolinux/build/tmp-attolinux_next-=
eglibc-eglibc/sysroots/pandaboard
> -O4 -O2 -mno-apcs-stack-check -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed   -Wl,-soname -Wl,libcpluff.so.0 -o =
.libs/libcpluff.so.0.0.3
> | /usr/lib/libexpat.so: file not recognized: File format not =
recognized
> | collect2: error: ld returned 1 exit status
>=20
>=20
> What is strange to me is the /usr/lib/libexpat.so inside of there, =
which
> seems like it shouldn't be there. To me it looks like it tries to link
> to my host system expat libary, which of course would fail badly. Any
> tips on what might be wrong, or how to fix it?

most probably hosed up libtool, make sure that libtool scripts in there =
are 2.4 compatible and can
understand sysroot.

>=20
> Regards
> Martin
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


