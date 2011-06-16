Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QX5AM-0003bV-UQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 07:30:55 +0200
Received: by pzk2 with SMTP id 2so887597pzk.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 22:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=u0dvJBm/2IzVnxcB39qGtM5uNtuj+bGKgPB1xYG9JLY=;
	b=VyjBsO71uUWsRiHAC0w3IVRUYdu50O5PDjJB8F1gsJrUWZge96E1juluF9gq3yBFVj
	gR+9Grc25xYKtFleEivbI08hDiR3FlZoEFdhwC1zw9PlEk90w8dfAak49b62D1oZ3pkq
	clvn90pXLM5aN2tGo4TcnvqFpXfX820Rhp2o0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NShb1foyr6gMelSWfsRzQI0zHTYjPh7ZvY2aduUUf06dTFxqbv4yLKAUbLs6D5gmpP
	gUNE37w6P9YZDwUYTelvPPK/vKxB6R1WNR6VhEZePlUxQuGNjzlc1DrRI7cVY+3PGq3N
	GKRHSGl1bvtXf6NEcEKpprx+LVtT7v2e55xek=
MIME-Version: 1.0
Received: by 10.142.127.5 with SMTP id z5mr93918wfc.247.1308202046595; Wed, 15
	Jun 2011 22:27:26 -0700 (PDT)
Received: by 10.142.178.20 with HTTP; Wed, 15 Jun 2011 22:27:26 -0700 (PDT)
In-Reply-To: <4DF94D6A.8090509@mentor.com>
References: <1308173139-15748-1-git-send-email-eric@eukrea.com>
	<4DF94D6A.8090509@mentor.com>
Date: Thu, 16 Jun 2011 07:27:26 +0200
Message-ID: <BANLkTinmc_Wp-vFoKuRe_LpFdwmVeU8bnQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2011.03] eeze 1.0.0: fix checksums
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
X-List-Received-Date: Thu, 16 Jun 2011 05:30:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2011 at 2:25 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 06/15/2011 02:25 PM, Eric B=E9nard wrote:
>> the 1.0.0 archive seems to have been changed on the march 17th
>> when 1.0.1 was created.
>> This creates a failure when trying to build from scratch using
>> Angstrom 2008.1 from the maintenance branch.
>>
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>> ---
>> =A0recipes/efl1/eeze_1.0.0.bb | =A0 =A04 ++--
>> =A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/efl1/eeze_1.0.0.bb b/recipes/efl1/eeze_1.0.0.bb
>> index 12d70d9..b050473 100644
>> --- a/recipes/efl1/eeze_1.0.0.bb
>> +++ b/recipes/efl1/eeze_1.0.0.bb
>> @@ -6,5 +6,5 @@ SRC_URI =3D "\
>> =A0 =A0${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
>> =A0"
>>
>> -SRC_URI[md5sum] =3D "31f9b2a8fce56a73c99c1c5d2a449fb6"
>> -SRC_URI[sha256sum] =3D "27da2b12f60b3c23cd52d16d601b5ab61734b9038beb3ab=
40129ac770f048d84"
>> +SRC_URI[md5sum] =3D "8fa2aa89ba48f262700a3cf88cb1c777"
>> +SRC_URI[sha256sum] =3D "d8ffb1af53c03c5860cd90ae78aa5ae0ce2d027a462509d=
eaca5ee3adacd0cee"
>
> Is it possible to check eeze 1.0.0 out of upstream scm? =A0That way when
> 1.0.2 comes out (or whatever) we don't run the risk of this going bad,
> again, and so forth...

I guess it won't be repeated with each release.. you can cherry-pick
my commit with better commit message explaining what was changed from
master (or Eric can send pull request for that, I'm away from my
workstation and I'm not using 2010.13)

http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D79d295c31e64=
e972608d5dde5d57e6250d7ca77c

Regards,


