Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q4Wiw-0007vO-Ve
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 13:04:35 +0200
Received: by iye7 with SMTP id 7so48959iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 04:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=XJozY5unT76HHvnF0elX0jujGgxVGYYErdkGeCoUv8I=;
	b=c7z3ABEO5uaUxZ5TiTPxM7Imm27TDYOEXJhldpDpTOqGiGNXJDeQBU09vvx3zFsdiq
	3fKVLxkC1m9nmGp3vqQTNtxueN9GTKkdPz3lP4H7fcY4fs+gYtkpjqrTUZLTgT20qt+m
	nAdVp0DvIyccINRhshw8nGmF0lwP0fxrXhC5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hEDNfaKAuP36AuIC9HX3bEqfGeD7OVS7Wu/P9Jov6gcHpttGqhFGVxtskyPtEOM7bH
	gsVIXwp9sgdcHlKYKUqxqY8PgBG/qBy9gCkE+ZBW285XcPEQR6Z8lwSgULkP3h50Ow34
	Agj16vgoOlebL9R8YEvTaBfqSp+x1mE/x6SKQ=
MIME-Version: 1.0
Received: by 10.42.163.65 with SMTP id b1mr2774562icy.510.1301396556377; Tue,
	29 Mar 2011 04:02:36 -0700 (PDT)
Received: by 10.43.131.199 with HTTP; Tue, 29 Mar 2011 04:02:36 -0700 (PDT)
In-Reply-To: <1301388439.4200.8.camel@mattotaupa>
References: <1301337206-24526-1-git-send-email-philippedeswert@gmail.com>
	<1301388439.4200.8.camel@mattotaupa>
Date: Tue, 29 Mar 2011 14:02:36 +0300
Message-ID: <AANLkTikfoVbd9adxQO1Dnu0Bho2asr6W0o6iSHO24hrZ@mail.gmail.com>
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] poppler 0.12.3: remove "default_preference = -1"
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
X-List-Received-Date: Tue, 29 Mar 2011 11:04:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On 29/03/2011, Paul Menzel <paulepanter@users.sourceforge.net> wrote:
> please read the commit policy [1] and example [2] on how to format the
> commit message. You do not have to resend this patch as I will edit the
> commit message before pushing your patch.

Thanks.  Seem they are still pretty the same as way back when I had
commit rights on the monotone OE tree... Things got a bit complicated
due to my inexperience with git. So some stuff went wrong... My second
patch looks already better ;)

> Am Montag, den 28.03.2011, 21:33 +0300 schrieb phdeswer:
>
>> remove default_preference game as everybody wants to use the latest
>> version, but the default_prefernce is -1 so this fails building packages
>> that depend on poppler if not used with a distro that has a preferred
>> version or default_preference bump
>
> Please note that you can always set your preferred version in
> `conf/local.conf`.

I know. Or in a distro/include/<distro-name>.inc with preferred_versions...

>> Signed-off-by: phdeswer <philippedeswert@gmail.com>
>>
>> ---
>>  recipes/poppler/poppler_0.12.3.bb |    5 -----
>>  1 files changed, 0 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes/poppler/poppler_0.12.3.bb
>> b/recipes/poppler/poppler_0.12.3.bb
>> index 8b9fcca..ce1952e 100644
>> --- a/recipes/poppler/poppler_0.12.3.bb
>> +++ b/recipes/poppler/poppler_0.12.3.bb
>> @@ -2,11 +2,6 @@ require poppler.inc
>>
>>  DEPENDS +=3D "lcms"
>>
>> -DEFAULT_PREFERENCE =3D "-1"
>> -DEFAULT_PREFERENCE_angstrom =3D "1"
>> -DEFAULT_PREFERENCE_minimal =3D "1"
>> -DEFAULT_PREFERENCE_minimal-uclibc =3D "1"
>> -
>>  EXTRA_OECONF_append =3D " --disable-abiword-output "
>>
>>  RDEPENDS_${PN} =3D "poppler-data"
>
> Do all distribution maintainers agree with this patch? I do not see a
> problem since it has been used in tested in =C8=A6ngstr=C3=B6m and
> minimal{,-uclibc} for over six months.

No idea. It is just that if you do a default build without Angstrom or
other distro it will pick the wrong version (unless you set a
preferred version). Removing the distro specific workarounds and the
default_preference=3D -1 makes it pick that version. Even Debian stable
is ahead of us there as they use poppler 0.12.4... I also hoped this
patch would bring up why there are all the workarounds in that file.

Thanks a lot! And hopefully I'll do a bit better on the next patch.

Philippe


