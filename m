Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P49g2-0004ZM-Pw
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 11:55:47 +0200
Received: by iwn5 with SMTP id 5so505395iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 02:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ExG4PY9fhb2D9a26Z30Db+cwLC5VZ4p2SDhWjQizUZM=;
	b=vyDjvexyA/iKvuwk6i4fh2zr30nfNhv78+nTYJ1J/AeHiLIZpgK0ewU/v4ajq+p/fc
	4MA36obz8FYPmTAUQy/eDs/j3XC2xLQq0D6yemtdHXangXu03R71/lxt9hUk2R4J87Rj
	1b601x3nvQk7D6MZ5xfqq3KsFgFGj2xmY6nFA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kILoac3vPs1jssMKe+fHXLYdX8yrTfDxRlW22ysMgChXYZUE5UilJmye8p84WoxPo4
	Zax/Q2/nrOLzYvHRTNywxSNKwIja37BvErKwc8+VS7eIe+UTqibK1S25fGJf23zZ3pdT
	U0N6YZEgD+5hrQ3FSZD4Hr9TvAwDd2SLUNdh4=
MIME-Version: 1.0
Received: by 10.42.97.193 with SMTP id p1mr374007icn.180.1286531723195; Fri,
	08 Oct 2010 02:55:23 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 8 Oct 2010 02:55:23 -0700 (PDT)
In-Reply-To: <AANLkTimFfia8svvb8chNmiJ_TOo4ub7-fbaMTuvFL9rN@mail.gmail.com>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTimFfia8svvb8chNmiJ_TOo4ub7-fbaMTuvFL9rN@mail.gmail.com>
Date: Fri, 8 Oct 2010 11:55:23 +0200
Message-ID: <AANLkTikp3SMK2MD8hPCc6=uBNujgceSQVM+tgYKO1q5M@mail.gmail.com>
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
Subject: Re: [PATCH 1/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Fri, 08 Oct 2010 09:55:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/8 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/10/6 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> ---
>> =A0classes/cpan-base.bbclass | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
>> index 379defa..a04f61c 100644
>> --- a/classes/cpan-base.bbclass
>> +++ b/classes/cpan-base.bbclass
>> @@ -5,7 +5,7 @@
>> =A0FILES_${PN} +=3D "${libdir}/perl5 ${datadir}/perl5"
>>
>> =A0DEPENDS =A0+=3D "${@["perl", "perl-native"][(bb.data.inherits_class('=
native', d))]}"
>> -RDEPENDS =A0+=3D "${@["perl", ""][(bb.data.inherits_class('native', d))=
]}"
>> +RDEPENDS_${PN} =A0+=3D "${@["perl", ""][(bb.data.inherits_class('native=
', d))]}"
>>
>> =A0# Determine the staged version of perl from the perl configuration fi=
le
>> =A0def get_perl_version(d):
>
>
> Aargh. Accidently pushed this patch yesterday with another one.
> Thought I'd removed it from my git, but apparently it wasn't.
> Propose to keep it like that (and no revert). Let me know if a PR bump
> of recipes inheriting this is needed.
>
> Frans.
>
Patches applied after getting a 2nd ack from Martin on irc so this
gets into the next testing branch.
If PR bumps are needed they can still be applied (let me know)

Frans


