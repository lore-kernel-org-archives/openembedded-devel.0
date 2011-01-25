Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Phozq-0002Gy-41
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 20:56:10 +0100
Received: by iyj18 with SMTP id 18so6040815iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 11:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=s3jHpF6NVWIXejW5hCb817rvgU1x3AtqUI4Kh1tNvcA=;
	b=VXq5MPBEX2SGqaftXJ3LihS5G+UsP2t3CL7A14vbYo4J/IwGc43GiaDopFkspVquqn
	DH3WAffldbeYvylMpb5G9Or/g0YWJ/c6xvkPWtNJ0JyMSplX9GYDuoD8AkkbKJzpx1RZ
	1skOieNQOjZUo85s3HkusDMj7s23/XhqpazwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lGAkgc8UsGD0/Ff0Dqmym0U8HuFJ3ypqSKbivDNQBXkjY2NE17Tm1Be1MxtldLuWJH
	26HE+h8r+hFU1C3RUFAuUoN+2GBLl2+tIl3IPliYowUXVT53RZIHz+DONQ86TMBEl9hN
	ma8D3lI2OmKyER2IyqONlN7gOVamT40ubYIlA=
MIME-Version: 1.0
Received: by 10.231.13.203 with SMTP id d11mr7136413iba.33.1295985322681; Tue,
	25 Jan 2011 11:55:22 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Tue, 25 Jan 2011 11:55:22 -0800 (PST)
In-Reply-To: <4DD7B11A-3C41-4BCD-AC46-FD1A0FA16A5C@vanille-media.de>
References: <1295879950-24057-1-git-send-email-vjaquez@igalia.com>
	<4DD7B11A-3C41-4BCD-AC46-FD1A0FA16A5C@vanille-media.de>
Date: Tue, 25 Jan 2011 20:55:22 +0100
Message-ID: <AANLkTimmENov_hkuRCEDdxXNVMHABemADiXAgQXkTPVZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: "Dr. Michael Lauer" <mickey@vanille-media.de>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] minimal.conf: inherit devshell task
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
X-List-Received-Date: Tue, 25 Jan 2011 19:56:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/25 Dr. Michael Lauer <mickey@vanille-media.de>:
> Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

Acked, pushed & updated patchwork.

Victor, thanks for the contribution.
>
> Am 24.01.2011 um 15:39 schrieb V=EDctor Manuel J=E1quez Leal:
>
>> Everybody loves devshell
>>
>> Signed-off-by: V=EDctor Manuel J=E1quez Leal <vjaquez@igalia.com>
>> ---
>> conf/distro/minimal.conf | =A0 =A03 +++
>> 1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
>> index f495d13..11525b9 100644
>> --- a/conf/distro/minimal.conf
>> +++ b/conf/distro/minimal.conf
>> @@ -104,6 +104,9 @@ QA_LOG =3D "1"
>> #run QA tests on recipes
>> INHERIT +=3D "recipe_sanity"
>>
>> +#make devshell available as task
>> +INHERIT +=3D "devshell"
>> +
>> ########################################################################=
#####
>> # PREFERRED VERSIONS
>> ########################################################################=
#####
>> --
>> 1.7.0.2
>>
>
>


