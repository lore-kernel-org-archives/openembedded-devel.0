Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ozlz8-0003yL-OQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 09:49:23 +0200
Received: by iwn2 with SMTP id 2so1924732iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=XD3xPvEmjNJVAGj6w1pj5eBEnrea9YrcJF22aGhcow0=;
	b=O730DZ/fXXmB4aoK7mp3MWQIoldhJBkboeWKz1LS0wLNcbl8FIKyAlkUJMcEoCrTvj
	Z6eYxl4NtRSmYvXQI31x/oH+gWZXnXWialcU+sAYK5iX/rGQ9zj+Dei44GsKdRIWnLps
	6EhqydF5Vyc2pNgvGrF8govgw/StFjixuaW48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=shNAc3IQy/BqUoc6Bv/xF2jrHV9E219J29WvYZPr7vtDMFKgmEb5X3YFMEWUSfB+FJ
	8OTcY9u+DkY5J6tquEkaGxac8Txpn9cwe4NmQ8OkJ+hBBo+QJb9s2SRpXgdbMOPw4d9z
	vKQv2qW/9NcswU6w84IG8g/KE5aWAQI9HfGYM=
Received: by 10.231.146.129 with SMTP id h1mr6663258ibv.181.1285487348640;
	Sun, 26 Sep 2010 00:49:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sun, 26 Sep 2010 00:48:47 -0700 (PDT)
In-Reply-To: <4C9EF882.9060407@eukrea.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
	<1285456353-27457-5-git-send-email-raj.khem@gmail.com>
	<4C9EF882.9060407@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Sep 2010 00:48:47 -0700
Message-ID: <AANLkTikViAvabyBzsxTmi=f1PPzuLXufLkjGnX2vhg7d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/12] distros: Disable gnu-style hash for mips64/mips64el
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
X-List-Received-Date: Sun, 26 Sep 2010 07:49:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2010 at 12:38 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi Khem,
>
> Le 26/09/2010 01:12, Khem Raj a =C3=A9crit :
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0conf/distro/include/angstrom-eglibc.inc =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
>> =C2=A0conf/distro/include/angstrom-glibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 =C2=A02 +-
>> =C2=A0conf/distro/include/angstrom-uclibc.inc =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
>> =C2=A0conf/distro/include/sane-toolchain-eglibc.inc | =C2=A0 =C2=A03 +--
>> =C2=A0conf/distro/include/sane-toolchain-glibc.inc =C2=A0| =C2=A0 =C2=A0=
3 +--
>> =C2=A0conf/distro/include/sane-toolchain-uclibc.inc | =C2=A0 =C2=A02 +-
>> =C2=A06 files changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/conf/distro/include/angstrom-eglibc.inc
>> b/conf/distro/include/angstrom-eglibc.inc
>> index 4b059fc..3a62781 100644
>> --- a/conf/distro/include/angstrom-eglibc.inc
>> +++ b/conf/distro/include/angstrom-eglibc.inc
>> @@ -23,7 +23,7 @@ BUILD_OPTIMIZATION =3D "-O2 -g"
>> =C2=A0BUILD_OPTIMIZATION_pn-perl =3D "-O1"
>> =C2=A0BUILD_OPTIMIZATION_sparc =3D "-O2"
>>
>> -TARGET_LINK_HASH_STYLE =3D
>> "${@['-Wl,--hash-style=3Dgnu',''][bb.data.getVar('TARGET_ARCH',d,1) in
>> ['mips', 'mipsel']]}"
>> +TARGET_LINK_HASH_STYLE =3D
>> "${@['-Wl,--hash-style=3Dgnu',''][bb.data.getVar('TARGET_ARCH',d,1) in
>> ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]}"
>>
> why do you also add avr32 in this patch ?
>

an oversight. thanks for catching it. I will fix it

> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


