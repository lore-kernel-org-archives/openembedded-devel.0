Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1PALqt-0006wu-Cd
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:08:36 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 234EE491278;
	Mon, 25 Oct 2010 14:07:53 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 25 Oct 2010 14:07:53 +0200
Message-ID: <4CC5731F.2030009@dresearch.de>
Date: Mon, 25 Oct 2010 14:07:59 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.11) Gecko/20101013 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <DB561678F08F554EB0D9F21B70E268A505AF5C@exchange.intern.dresearch.de>	<1288000524-18800-1-git-send-email-sledz@dresearch.de>
	<1288006635.3793.38.camel@mattotaupa>
In-Reply-To: <1288006635.3793.38.camel@mattotaupa>
X-OriginalArrivalTime: 25 Oct 2010 12:07:53.0194 (UTC)
	FILETIME=[405E4CA0:01CB743D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2] epiphany-2.30.2: unbreak do_configure by setting ca-file path
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
X-List-Received-Date: Mon, 25 Oct 2010 12:08:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 25.10.2010 13:37, schrieb Paul Menzel:
> Am Montag, den 25.10.2010, 11:55 +0200 schrieb Steffen Sledz:
>> * Disable existence check for ca-bundle file in configure.ac because
>>   it does not work in OE cross compile environment (location at build
>>   host may differ from location at target).
>> * Explicitely set ca-bundle file path according to the one used by
>>   ca-certificates package.
>> ...
>> ++# disable this check because it does not work in all environments
>> ++# (location at build host may differ from target)
>> ++#    if ! test -f "$with_ca_file"; then
>> ++#        AC_MSG_ERROR([No such file '$with_ca_file'. Use --with-ca-f=
ile=3Dpath to set, or --without-ca-file to disable])
>> ++#    fi
>=20
> Would adding the following check also work?
>=20
>         if test "$cross_compiling" !=3D "yes"; then
>          =E2=80=A6
>         fi

I don't think this is a good idea. It is not a problem of cross compiling=
. Cross compiling is just one case where it occurs.

Also if i build for the same architecture it is not a good idea to check =
for the existence of a file *at buildtime* and compile this path into the=
 binary.

The existence of such a file should be checked and handled at runtime onl=
y.

> I think this would be more portable. Could you report that issue
> upstream too please.

I'll try.

Steffen



