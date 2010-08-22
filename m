Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnH0j-0003Az-Uq
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 22:19:23 +0200
Received: by iwn2 with SMTP id 2so2358287iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 13:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Z3hHbvAQznKOQaOmTJ5QMh2skOA1geL/OVvgCu2Uw9o=;
	b=nxC6U3371RXNM7SNgZ7qad5o67VoaOUBvB0chMn8kdITniyIw5m5uy4euq/I146YQU
	3H90DcUx+RVj0h9R9LJBFDWNhpSKZb1hELwVeLFZtw5KbJZHzq0tkOWOnHFyN5V9Js/U
	6jSiXx4/EcId9tOld78USbOjZc1pz3wXRkF68=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qkpRH+cGwEPV1qtL9THMOMx3xJBvmAIh9w4TJkEuzpggrpEHKvjsbIL361oyZjcGbx
	dneX0iBCYKuINKTMawEuRjsRq/OWH+WAYWm6nEUBbJVi4x7mKugosEOZPjUXANPL1B9z
	0JZtHiV8KsQYBaV2Jl5qCqxBIQyWLER9hIz6U=
MIME-Version: 1.0
Received: by 10.231.149.207 with SMTP id u15mr5482791ibv.13.1282508335205;
	Sun, 22 Aug 2010 13:18:55 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 22 Aug 2010 13:18:55 -0700 (PDT)
In-Reply-To: <4C7162B0.6090206@balister.org>
References: <1282498345-8697-1-git-send-email-raj.khem@gmail.com>
	<4C7162B0.6090206@balister.org>
Date: Sun, 22 Aug 2010 22:18:55 +0200
Message-ID: <AANLkTikrYdUuo5G_0y7FwYqrP5zxcPvm_bHpMOjyu0HP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ncurses_5.7.bb: Make DEFAULT_PREFERENCE
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
X-List-Received-Date: Sun, 22 Aug 2010 20:19:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/22 Philip Balister <philip@balister.org>:
> On 08/22/2010 01:32 PM, Khem Raj wrote:
>>
>> * Select 5.7 if none pinned.
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =A0recipes/ncurses/ncurses_5.7.bb | =A0 =A03 ---
>> =A01 files changed, 0 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/ncurses/ncurses_5.7.bb
>> b/recipes/ncurses/ncurses_5.7.bb
>> index ab029ae..57374ec 100644
>> --- a/recipes/ncurses/ncurses_5.7.bb
>> +++ b/recipes/ncurses/ncurses_5.7.bb
>> @@ -6,9 +6,6 @@ PATCHDATE =3D "20100501"
>> =A0PKGV =3D "${PV}+${PATCHDATE}"
>> =A0PR =3D "r11"
>>
>> -# recipe is experimental for now...
>> -DEFAULT_PREFERENCE =3D "-99"
>> -
>> =A0DEPENDS =3D "ncurses-native unifdef-native"
>> =A0DEPENDS_virtclass-native =3D "unifdef-native"
>>
>
> We need to combine this with a PR bump for all recipes that DEPEND on
> ncurses ....

Agree; otherwise packages on feeds will remain to refer to the old libs

Frans


