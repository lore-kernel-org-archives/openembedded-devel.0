Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Lrb3r-0007fa-Og
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 18:55:42 +0200
Received: by yx-out-1718.google.com with SMTP id 3so135602yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pNDs36dvKlTQ8zLOO/SrsqdcI+tqIXN+vcbbYNwkqQM=;
	b=TCKfZkI7OXoWNe3p2rbNxoK+PboodHzaVcdqhBaZfy0z1mJdmoWaaxgcM4lQwfHqCP
	MrMj9Krf7bT0USd+0J3eODYEP2Q3/Fr0JhyQPfskP1l6aKCPBWK+Z4HIha/aHKVYxJJP
	Yc5gy8C19G/IcFqRCsMzpOPAdDcnc1ulwXRJo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fsDzzlNN239AfHx4ttUupSoWl2JPNXPJXj9z+QUk+aq3XkbSO982m6vSG86eby5Bb9
	o0QJ/ZctXC6z9wU9AryW/acZlLp5cLDXrauYxzCPjrugBURbvAShYsAIDJp+UHzM+92M
	PzVBW9WzXhcnSZNbadv0EhR/ujT7SaYsMtuyM=
MIME-Version: 1.0
Received: by 10.100.126.15 with SMTP id y15mr3449357anc.27.1239209555379; Wed, 
	08 Apr 2009 09:52:35 -0700 (PDT)
In-Reply-To: <gric5v$qc4$1@ger.gmane.org>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
	<20090407165123.GE2195@smtp.west.cox.net>
	<d2b9ea600904080716y5776086fu8521915fa402f694@mail.gmail.com>
	<gric5v$qc4$1@ger.gmane.org>
Date: Wed, 8 Apr 2009 18:52:35 +0200
Message-ID: <d2b9ea600904080952g656823dby8c15a46b425f76c6@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.152
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Wed, 08 Apr 2009 16:55:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2009 at 4:26 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> On 08-04-09 16:16, Esben Haabendal wrote:
>
>> Then, please someone apply this to .dev. =A0But then how are we supposed
>> to remember which patches should also be moved to stable, and when?
>
> If you want something in stable, you send the patch to this mailinglist w=
ith
> [STABLE] in the subject.

Which is exactly what I did.  Now 3 times even.

> That way it will show up here:
>
> http://patchwork.openembedded.org/project/openembedded/list/?state=3D*&q=
=3Doe%2CSTABLE
>
> or for a complete historic view:
>
> http://patchwork.openembedded.org/project/openembedded/list/?q=3Doe,STABL=
E&archive=3Dboth&state=3D*
>
>> Let's not make it to complicated to maintain stable, so that it will die
>> from us again :-(
>
> Stuff needs to get into .dev first to receive wider testing. Putting stuf=
f
> directly in stable negates the idea of the stable branch.

Naturally, but (2 but's):

1. When .dev is sufficiently different from stable, some fixes needed
for stable will not make sense or work on .dev, so this rule will have
to be bent once in a while, and most likely, more often when
stable/2009 gets old.

2. There must be a some sensible elastic, as straight out simple fixes
IMHO, could just go in both at the same time.  But I guess, my opinion
on this matter does not really matter.

It is quite impressive how difficult it can be made to submit what is
mainly just a copy action of a file...

/Esben


