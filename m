Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpdJA-0000He-8d
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 10:32:09 +0200
Received: by iwn2 with SMTP id 2so3855496iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=u3XNQthyLmhlkNT1Oshyc0rSairuFprsbkod4iqNwjQ=;
	b=iAXhN2119MRtcdrALeuYhEPAYjjc7m+m/BJdwySbbfUZLc5tpJt3ANWYkIykZJENrN
	cECy0oV/6ckxRNIgKK/GTdLaq4n04Md0BTShAZxMCuoXf1UPUAdG43UnW06hp+05Owhw
	AE6omx5+deXAZfl39NnON7QNzZjSG8OxPDrlo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Kk8N0mohkmLtvUaQD+YwVvqfvBDR1sty1BRBouu1W58Ob/0+g0zexZJNu21m46a4UX
	wfu0V+5WU2zG+tbmk5WEgSsPIP649tCTLudsgd5Vl8RTNqi9ief+QH4nqMiTjTTsNCd3
	Vm0nQ/c9Uyd41oiZkT5hsr2mWgpjHF5QHMTUs=
Received: by 10.231.19.6 with SMTP id y6mr3547513iba.16.1283070699130; Sun, 29
	Aug 2010 01:31:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 01:31:19 -0700 (PDT)
In-Reply-To: <AANLkTinJTRgxw3zLkeweU-WsWrABz298X67tHkWcVwXv@mail.gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-20-git-send-email-raj.khem@gmail.com>
	<AANLkTinJTRgxw3zLkeweU-WsWrABz298X67tHkWcVwXv@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 01:31:19 -0700
Message-ID: <AANLkTi=VySVy92pqhs6VPTdn_j3WnAEjuX6K+NK_jA=e@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 19/23] cnetworkmanager_git.bb: python-uuid is not provided remove it from RDENEDS
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
X-List-Received-Date: Sun, 29 Aug 2010 08:32:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2010 at 11:55 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> mistyped DEPENDS in commit but still

Thanks I will amend this commit.

> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> 2010/8/28 Khem Raj <raj.khem@gmail.com>:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0recipes/networkmanager/cnetworkmanager_git.bb | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/networkmanager/cnetworkmanager_git.bb b/recipes/net=
workmanager/cnetworkmanager_git.bb
>> index d8ec179..5625502 100644
>> --- a/recipes/networkmanager/cnetworkmanager_git.bb
>> +++ b/recipes/networkmanager/cnetworkmanager_git.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Command line interface for Network Mana=
ger"
>> =A0HOMEPAGE =3D "http://vidner.net/martin/software/cnetworkmanager/"
>> =A0LICENSE =3D "GPL"
>> =A0SECTION =3D "console/network"
>> -RDEPENDS_${PN} =3D "python-core python-crypt python-dbus python-math py=
thon-pygobject python-re python-textutils python-uuid python-xml"
>> +RDEPENDS_${PN} =3D "python-core python-crypt python-dbus python-math py=
thon-pygobject python-re python-textutils python-xml"
>> =A0PR =3D "r2"
>> =A0PV =3D "0.8+git"
>>
>> --
>> 1.7.1
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


