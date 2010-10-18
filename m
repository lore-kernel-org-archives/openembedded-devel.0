Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7u1d-0003gq-3y
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:01:33 +0200
Received: by iwn2 with SMTP id 2so1475656iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=r66RgEmq7z47pMkeqAlRbSzL6J8MolBrWZOGy7PsBbY=;
	b=GHsC5uVQbqmUZXPscNZcyXVX7zCv0bnbU4k5aTOtg58JzdJTLQciHvc7t0Q93uy2hv
	By8xJrc9IiYdx+USZGCkArnBHGUTYwFfNJIzVuBljqgo+DjJQVwK+B1JgS5YunwJ48eA
	aKlt3x/kbmkqzH8Wr1wlR7EcB+fvayuqyIYJk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ASOgsHMTBDTgA0sH6T4OhQzh+snlITwSyzWib1KSkIFK9wl7uDo0/6k+3Ze/78hbbL
	3X4Omc1WROnIepf7CJ7MHRDWW8xbOWEHMGK6RGYpynmYci1rnfOVwKgoWGw4rG8vptM4
	95DxFXlv2WhuiAEzqavRxLR2Lk8aHwpOII/Jo=
MIME-Version: 1.0
Received: by 10.231.35.73 with SMTP id o9mr3633482ibd.193.1287424838668; Mon,
	18 Oct 2010 11:00:38 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 11:00:38 -0700 (PDT)
In-Reply-To: <AANLkTinU=v796xChiQWRvPEw-BfKwbsOuAVfiosDyazE@mail.gmail.com>
References: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
	<AANLkTinU=v796xChiQWRvPEw-BfKwbsOuAVfiosDyazE@mail.gmail.com>
Date: Mon, 18 Oct 2010 20:00:38 +0200
Message-ID: <AANLkTikhRRwVnvu69frtXfOV-yp74zkT9U7+tSsS19rw@mail.gmail.com>
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
Subject: Re: [PATCH v3] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 18:01:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/18 Khem Raj <raj.khem@gmail.com>:
> On Mon, Oct 18, 2010 at 9:44 AM, Michael Smith <msmith@cbnco.com> wrote:
>> The previous system("cp %s/* ...") missed dotfiles/dirs at the
>> top-level.
>>
>> Signed-off-by: Michael Smith <msmith@cbnco.com>
>> Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> Cc: Graham Gower <graham.gower@gmail.com>
>> Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> ---
>> =A0classes/package.bbclass | =A0 10 +++++-----
>> =A01 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/classes/package.bbclass b/classes/package.bbclass
>> index e2a61bf..2769595 100644
>> --- a/classes/package.bbclass
>> +++ b/classes/package.bbclass
>> @@ -356,15 +356,15 @@ python package_do_split_locales() {
>> =A0}
>>
>> =A0python perform_packagecopy () {
>> - =A0 =A0 =A0 dest =3D bb.data.getVar('D', d, True)
>> - =A0 =A0 =A0 dvar =3D bb.data.getVar('PKGD', d, True)
>> + =A0 =A0 =A0 installdest =3D bb.data.getVar('D', d, True)
>> + =A0 =A0 =A0 pkgcopy =3D bb.data.getVar('PKGD', d, True)
>>
>> - =A0 =A0 =A0 bb.mkdirhier(dvar)
>> + =A0 =A0 =A0 bb.mkdirhier(pkgcopy)
>>
>> =A0 =A0 =A0 =A0# Start by package population by taking a copy of the ins=
talled
>> =A0 =A0 =A0 =A0# files to operate on
>> - =A0 =A0 =A0 os.system('rm -rf %s/*' % (dvar))
>> - =A0 =A0 =A0 os.system('cp -pPR %s/* %s/' % (dest, dvar))
>> + =A0 =A0 =A0 os.system('rm -rf %s/*' % (pkgcopy))
>> + =A0 =A0 =A0 os.system('cp -pPR %s/. %s/' % (installdest, pkgcopy))
>> =A0}
>
> will it also try to copy . and .. ?

No (tested that).

Frans.
>
>>
>> =A0python populate_packages () {
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


