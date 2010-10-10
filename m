Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4uJF-00006R-Jz
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 13:43:37 +0200
Received: by iwn7 with SMTP id 7so1511689iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 04:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vVNjlJL79rgINOYUwupvTP28ZquCC1akAXDkWRPQaBU=;
	b=UM76LGg+ZtTbynh6NADxTdlaZDZAP7NpE5veL8zlhY0iOuzWgJdxfKk2475lqBdPlE
	m4YuKI79PKBaJDaiRPBiPzj4ymdvTB4fQvt/1o4aOLoYqYrMMOAa6r6slivcXLNX9iBD
	rhdrU85K2Yzd1eNU6Y4PhilDg3sWKhn8eXjfE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JrtHD0j1hKEXlXHBBncfPAfDPxbTHm3gCNCDdRT7xp+U3lijipW2CX5sHGyugeNOJg
	15dxZqDSNB0pgkXzEIhSnn+4AmDXfO/7XjIbOOHmY6H/Xt0Jsf8F3mNwxnOgil1FoH38
	W4ODAYYm2LHScFJcRn6K0Oen01GDC3BJOrmHk=
MIME-Version: 1.0
Received: by 10.231.20.65 with SMTP id e1mr3903836ibb.32.1286710975128; Sun,
	10 Oct 2010 04:42:55 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 10 Oct 2010 04:42:55 -0700 (PDT)
In-Reply-To: <AANLkTinhe7b-u+LMqXjgEZ4+3vuix0akw=6sghpZOfU8@mail.gmail.com>
References: <AANLkTikXgD1ULsL7Fc3jQ45vDEH4ECqsG7s6KHRhJ1op@mail.gmail.com>
	<AANLkTi=Fry0wuBpU6eFztR98rw2KtK76LUdZs6SMuUos@mail.gmail.com>
	<AANLkTinhe7b-u+LMqXjgEZ4+3vuix0akw=6sghpZOfU8@mail.gmail.com>
Date: Sun, 10 Oct 2010 13:42:55 +0200
Message-ID: <AANLkTinTajKGotqpGp8D20BmnpDmWdfKz+a=7U2b-S--@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question on writing perl lib .bb files
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
X-List-Received-Date: Sun, 10 Oct 2010 11:44:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/10 J. L. <vwyodapink@gmail.com>:

>> NOTE: Running task 911 of 922 (ID: 2,
>> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-p=
erl_0.11.bb,
>> do_install)
>> NOTE: Running task 912 of 922 (ID: 15,
>> /home/vdubhack/overo-oe/user.collection/recipes/perl/libnet-whois-arin-p=
erl_0.11.bb,
>> do_package)
>> NOTE: the following files were installed but not shipped in any package:
>> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi=
/perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN.3pm
>> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi=
/perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::Contact.3pm
>> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi=
/perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::AS.3pm
>> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi=
/perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::Organization.3pm
>> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi=
/perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::Customer.3pm
>> NOTE: =A0 /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi=
/perl-5.8.8-r36/image/usr/share/man/man3/Net::Whois::ARIN::Network.3pm

Ah you are using perl 5.8.8
Anyway, haivng packages that are installed but not shipped in a
package does not seem good. You should probably add these in a doc
package. See other recipes on how do do this.

[...]

>>
>
> Sorry guess I need to go to sleep here is the recipe I built without
> the depends, the first one is the ones it says it needs in CPAN, here
> the one that I built and installed::

As I wrote before this is probably because earlier you already build
all the required modules.
>
> DESCRIPTION =3D "Net::Whois::ARIN =A0 =A0 =A0 =A0 whois arin "
> SECTION =3D "libs"
> LICENSE =3D "Perl"
> PR =3D "r1"
>
> SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TC/TCAINE/Net-Whois=
-ARIN-${PV}.tar.gz"
>
> S =3D "${WORKDIR}/Net-Whois-ARIN-${PV}"
>
> inherit cpan
>
> BBCLASSEXTEND=3D"native"
>
> SRC_URI[md5sum] =3D "a5aee39187c6272acd2a77e30847fdef"
> SRC_URI[sha256sum] =3D
> "d47a6720ff265674cbd918d866c73221be9916d81e1c30ccdb0d49e6b45110e8"
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


