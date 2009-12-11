Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NJ9GR-0002XR-TR
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 18:26:51 +0100
Received: by iwn32 with SMTP id 32so551210iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 09:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YfDnwptdxaAf6ADPR3suEHqTii71ku1Ffb6isGdWhcI=;
	b=jpYz6vQtyOSJ60pcSD9wb6TMCkWotn2XwDhN4qo4990PacdxL4yiFkYjCP7pC/e/Cn
	0hMXhJsFeuXyNChliEk3X9yhn3mCHAifV/hpaiTvN4aSyFgoNncVgiVoIRnZay15Zc+K
	oQ2gwgc9p+u6mJzD2i6vB7chd8VmbyyQkM/kI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=G6K1P/9e7ZZmqRu8xV/QXfqKrb+xlBlUusXxSdfe1myW1G9JHkHjh2ymfpaJZJn13j
	u0ZSdWVzmRLkND1xqPuf/fyFtWugvol4AQ2RgJpN2nRy9VEBYAcieMUjt6c0tu5UyzJE
	YPgpK+8rcaOmSsVogcX/30eoN2Fz3nAOib4u8=
MIME-Version: 1.0
Received: by 10.231.21.157 with SMTP id j29mr1496570ibb.28.1260552303595; Fri, 
	11 Dec 2009 09:25:03 -0800 (PST)
In-Reply-To: <ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
	<ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
	<19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
	<ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
Date: Fri, 11 Dec 2009 09:25:03 -0800
Message-ID: <19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Fri, 11 Dec 2009 17:26:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2009 at 3:47 AM, RK Raggit <rk.raggit@gmail.com> wrote:
> =C2=A0As I see you are targetting cortex-a9 I would suggest that you use
>> later version of
>> glibc or even better use eglibc 2.10 or 2.11
>>
>
> one silly question ... how do i make my build skip the glibc package and
> pick the eglibc 2.11 instead ?

if you use minimal or micro distro then eglibc is default libc for
others you can add

LIBC=3D"eglibc"

IIRC angstrom needs ANGSTROMLIBC =3D "eglibc"

for choosing 2.11 you can add

PREFERRED_VERSION_eglibc =3D "2.11"
PREFERRED_VERSION_eglibc-initial =3D "2.11"

to your local.conf


>
> --RK
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


