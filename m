Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtPhU-0000tQ-OO
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 20:48:53 +0200
Received: by ywa8 with SMTP id 8so223780ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jaA2eV6yhvrL13D9oYSUjZWpnN1ohTg6nPGNvT6Mjss=;
	b=KEYpr9c4r6w67vh/aUXlZDsXQv56hbFZ+GYprOlj1NyGuFIsyebe3177eL2Q5rH7hU
	qrBKrhzo+wctoepUT9L6meIchVZh0xQzBGJa9VzvIOmeiCBdl+Qjw43llScngt1ZDgDl
	R/qEaERyqP48BtOtrj9MDEhxAOPEADHS/2leY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VqIXJnqYeTKok3+tecANoJeuEmq/mK2iB/hmqv/OpCCVVbX4MiqbXSj0mKYLX6LqOR
	KmI5URzFIdD/w/rhjHug2qZBnbPDPVjgnapWHx10PkfPncwGZW8JLM6J8vWSNrYOgFs+
	IZmNkxjt/cBNNV6CrKD8KQ39x87mEzwbcofy0=
MIME-Version: 1.0
Received: by 10.151.154.14 with SMTP id g14mr380853ybo.314.1283971690513; Wed,
	08 Sep 2010 11:48:10 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 11:48:10 -0700 (PDT)
In-Reply-To: <4C87D894.9050609@mentor.com>
References: <AANLkTi=3gKS1xKPCLJOg0vxpVSgxOwx9N-GmiQS1zO9g@mail.gmail.com>
	<AANLkTi=YqpnwM52LoTsVSb6wZJaGEXfyxrQiV_tMjwSH@mail.gmail.com>
	<4C87D894.9050609@mentor.com>
Date: Wed, 8 Sep 2010 20:48:10 +0200
Message-ID: <AANLkTino843P2Cxr8g=s6H7pv3dTTH1iAp051MwPN6w8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: recipe simplification questions
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
X-List-Received-Date: Wed, 08 Sep 2010 18:48:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/8 Tom Rini <tom_rini@mentor.com>:
> Khem Raj wrote:
>>
>> On Wed, Sep 8, 2010 at 10:41 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>>
>>> Hi
>>>
>>> While browsing through a recipe I stumbled upon the following two
>>> functions:
>
> [snip]
>>>
>>> do_install() {
>>> =A0 =A0 =A0 make install DESTDIR=3D${D}
>>> }
>>>
>>
>> this if used in a recipe which inherits autotools could be for getting
>> parallelism out of context during install but not during compile.
>> again this kind of stuff should be avoided.
>
> Not true (but I had to double check just now, so it's quite possible some
> others have assumed this behavior). =A0If we look at bitbake.conf:
> EXTRA_OEMAKE_prepend_task_do_compile =3D "${PARALLEL_MAKE} "
> EXTRA_OEMAKE_prepend_task-compile =3D "${PARALLEL_MAKE} "
>
> So in the case of literally having DESTDIR=3D${D}, these can just go away=
.
> =A0There are some annoying cases however where it's not DESTDIR but some =
other
> variable. =A0IMHO, it's questionable if it'd be cleaner to do a custom on=
e
> line do_install vs EXTRA_OEMAKE_append_task-do_install =3D "PREFIX=3D${D}=
"

Woudht aht have to be an EXTRA_OEMAKE_append_task-do_install ?
I see also recipes that just add PREFIX or DESTDIR to EXTRA_OEMAKE
(actually I would expect the presence or absence not to be an issue in
most cases (as DESTDIR is quite likely not used during compile)

Frans


