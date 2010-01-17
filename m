Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NWd5Z-0000GR-VZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:55:21 +0100
Received: by yxe5 with SMTP id 5so720341yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 13:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YPTtsOUddzNL4WLO1zyN8GZtVnP8qO8HvgW67b5zvfY=;
	b=GhUzto2YDzNCawRzTeMaJKuLGXp3xj+VBPTg5yai2qBM6qeJf7AdQ4EE5Mud66mesr
	daIZEuuMylZ6u54F6ZKNFgDmfPjJXIskkdzbNiTLLFU4SXi9DlwNqH72Crb+ZOAuyK58
	PJjql+Gj0FqYyzdpcsBlnCLUjmouKxejXJeEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AkwCkbSFFDa8gixGwTevWTdzXaSPPSL6hjBhbeeZTakfKytP4BPBSq51gW+PJNLEZw
	JDqWI7KqitLdc7xqQJVsLZRIAQCQZgjmoyRNLipBt+QXZNeI2O1EC7i2SShPlH394h3J
	0erJRtoNDBu/5U2B7xXwkI9qaU0bZUVGmKcSQ=
MIME-Version: 1.0
Received: by 10.101.185.26 with SMTP id m26mr8291294anp.129.1263765183782; 
	Sun, 17 Jan 2010 13:53:03 -0800 (PST)
In-Reply-To: <1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
	<hivtt3$v2r$1@ger.gmane.org>
	<1263763723.5353.16.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sun, 17 Jan 2010 22:53:03 +0100
Message-ID: <ac9c93b11001171353p358c02a4k90cb3dd70240bc58@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Sun, 17 Jan 2010 21:55:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/17 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Sonntag, den 17.01.2010, 22:02 +0100 schrieb Koen Kooi:
>> On 17-01-10 21:32, Eric Benard wrote:
>> > * barebox is "a bootloader that inherits the best of U-Boot and the
>> Linux kernel"
>> > * add recipe for v2009.12.0 (last stable)
>> > * add recipe for git repository
>> >
>> > Signed-off-by: Eric Benard <eric@eukrea.com>
>>
>> > +++ b/recipes/barebox/barebox_2009.12.bb
>> > @@ -0,0 +1,15 @@
>>
>>
>> > +PR =3D "r0"
>>
>> > +++ b/recipes/barebox/barebox_git.bb
>> > @@ -0,0 +1,10 @@
>>
>> > +PR =3D "r0"
>>
>> Please don't set variables to the current default value, but leave
>> them
>> out. We had tons of problems with vars getting copy/paste where the
>> default changed and we had to manually fix those (e.g. efl.bbclass
>> still
>> pokes needlessly at PACKAGES).
>>
>> Setting PR is relatively minor, but lets stay consistent :)
>
> Could someone please change this in the manual please [1].
>
> =BBIt is good practice to always define PR in your recipes, even for the
> "r0" release, so that when editing the recipe it is clear that the PR
> number needs to be updated.=AB
>
Personally I'm in favour of the above good practice.
I suggest to keep PR =3D "r0" in recipes

Frans


