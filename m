Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1URZDV-0000ft-E9
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 04:32:32 +0200
Received: by mail-pa0-f42.google.com with SMTP id kq13so2290479pab.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 19:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=I1zqCZn6CPydQqtt7ES2I4fMYdW7jVUgptIWcZCgitQ=;
	b=0k8jQv9/im1HSfvISC/gYm9qMu4Gec8RU9J19DM8pfPyNw2EG2DSm5BseTm7tVqV9o
	Hd5VCjKacSfqrDI/MH4TE+WfOIfmbW2BxZmJR3S+00wh3xbC80oYSlPzJYPVK6CeRYqT
	q2LJ8wVUVtL3qjUelAmF7Eu90Z3COoXUTN6HFc7ezWC/1MiuqMZdpAcSho9EF1jMeTWJ
	Oc87TBe0AupXBu3Rb4SvZOK4ThdoTAWU4T9HPAxzTAm5MEzUky9lHdWCO92AHuc6IBKF
	KtoaBxblFOXl1YKd2/28S6LeNVANIRhquUlPkKaXr0GhE4+7kcH66neOPN1Yq+PaSAw2
	7Z1g==
X-Received: by 10.68.98.165 with SMTP id ej5mr15506028pbb.184.1365992096580;
	Sun, 14 Apr 2013 19:14:56 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id wi6sm18269506pbc.22.2013.04.14.19.14.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 19:14:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5166C774.5040200@communistcode.co.uk>
Date: Sun, 14 Apr 2013 19:14:53 -0700
Message-Id: <BE3ADE1C-F9B9-4B35-B5E0-9B4085F897E7@gmail.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<5166C774.5040200@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Mon, 15 Apr 2013 02:32:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Apr 11, 2013, at 7:23 AM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:

> On 28/03/13 05:51, Khem Raj wrote:
>> All,
>>=20
>> I have added gcc 4.8 recipes and the branch is here
>>=20
>> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
>>=20
>> cgit
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-4.=
8
>>=20
>> Please test it out on your respective environments if you can.
>>=20
>> To enable gcc 4.8 with OE-Core you would
>>=20
>> in local.conf set
>>=20
>> GCCVERSION =3D "4.8%"
>>=20
>> and if you use angstrom. Please checkout 'next' branch of =
setup-scripts
>> and then in conf/local.conf
>>=20
>> set
>>=20
>> ANGSTROM_GCC_VERSION =3D "4.8%"
>>=20
>> My testing so far has been building systems-image for all qemu =
machines and they
>> seem to boot as good as 4.7 did. But I am hoping for wider testing =
and finding issues
>> or very least improve the existing recipes for now and once the 1.4 =
release is done
>> we can then propose it for inclusion in OE-Core
>>=20
>> Thanks for your time
>>=20
>>=20
>> -Khem
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> Hi Khem,
>=20
> Testing your patches today threw up a build failure in nativesdk-qemu.
>=20
> Log attached.


Thanks for trying it out. Do you have meta-beagleboard in your layer set =
?
if yes then retry with oe-core of today especially

=
http://git.openembedded.org/openembedded-core/commit/?id=3Ddfb0c2cf9799d08=
4a76aa92e243c743d7ff05db8




