Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RV2To-00046k-KA
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 15:46:48 +0100
Received: by bkbzs2 with SMTP id zs2so7906017bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 06:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bLskVIh59Y3sNvLFuNURNW2Qm3KdMOVVZ7X2Glco8OM=;
	b=vhjpThfVtynOVu0elIsswveGMN8vIVh/malg6n2cCSOlQKrmhtDwVnXgR3mhbpPYR+
	IZKwvG4QDjYI3hTP/4w2o8I3FwiEJUqZmhygbVa2s/Xak8fl3uaoPX5afO7xtpB9Oydv
	K3SfVheIWy6MoBsnXRSD6yKsP1p4xil8HFyFQ=
MIME-Version: 1.0
Received: by 10.204.38.16 with SMTP id z16mr46965819bkd.66.1322491210489; Mon,
	28 Nov 2011 06:40:10 -0800 (PST)
Received: by 10.223.73.197 with HTTP; Mon, 28 Nov 2011 06:40:10 -0800 (PST)
In-Reply-To: <CA+M6bXnQN9Q62w22sjiVaqkdipaXPgujR_FTWPE8N24z=MAW4A@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<jatlso$idi$1@dough.gmane.org>
	<CA+M6bXnQN9Q62w22sjiVaqkdipaXPgujR_FTWPE8N24z=MAW4A@mail.gmail.com>
Date: Mon, 28 Nov 2011 15:40:10 +0100
Message-ID: <CAGiJk9e0o9Z5EdywpQVU0Oj9tZvysFUNRTkHvNAojYDhYUqaDw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Documentation problems
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
X-List-Received-Date: Mon, 28 Nov 2011 14:46:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/11/28 Tom Rini <tom.rini@gmail.com>:
[snip]
>
> The number one thing we lack today is people willing to document.
> Everyone, myself included, who has said we need X done to the public
> documentation today, has generally found a point at which they stop
> wanting to keep things up to date. =C2=A0Why? =C2=A0What would change tha=
t?
> Does anyone reading this know people that _like_ editing wikis? =C2=A0Can
> we ask them what keeps them engaged in the process?
Hi,

The process done when documenting code (or more generally: changing
sets of information),
could be displayed as the opposition of the one documenting and the change.
For the person that documents the information the question is:
"How long does my change last until it is outdated again?"
in some cases changes last long, for others the documentation may
change every few months.



Part 1 according to the wiki:

Working with Mediawiki is not that easy (not for the editors and even
less for the administrators),
as my past experience (administrating an intranet Mediawiki with >50
users for at least 2 years) has shown me,
that updates of the infrastructure (wiki versions, extension versions)
may break content.

2011/11/28 Koen Kooi <koen@dominion.thruhere.net>:
>>Op 28-11-11 06:11, Tom Rini schreef:
>>...
>> The number one thing we lack today is people willing to document.
>
>I'd change that to "knowledgable people"

I fully agree, this is also the reason why I didn't step up and offered my =
help,
of course I could explain how to build an image with OE-Core (or how
to create a custom recipe for Qt etc.),
but I didn't get the experience (yet) to show users best practices, or
simply "the way to go".


By the way, some time ago I did a complete overhaul of the
wikipedia.org OE page,
as it was not informative and the first location new users would look
at is wikipedia.

It would be nice if anyone more knowledgeable could review the current vers=
ion.
Version before the changes:
http://en.wikipedia.org/w/index.php?title=3DOpenEmbedded&oldid=3D414622717

Current version:
http://en.wikipedia.org/w/index.php?title=3DOpenEmbedded

(It is at one point already outdated since meta-texasinstruments was
renamed to meta-ti, but I think about fixing that later.)



Part 2 my humble opinion about documenting OE-Core:

FWIW, I already thought of possible ways to document OE-Core changes
(nearly automatically), before this discussion started.

After documenting parts of a software that my colleague wrote,
some c++/Qt application I documented with Doxygen, I was thinking
about the OE-Core situation.
It came to my mind that it would be great if it's possible to use
Doxygen (or maybe a Bitbake documentation module?) to document
recipes, variables and functions (e.g. custom do install).
Using a searchable HTML documentation would allow the most users would
easily to find examples of what they look for.

Also it would be possible to see every (inc / bbappend / bbclass /
dependency) file as hyperlink (to their doc) inside the documentation.
The documentation method Doxygen uses (something like /** \brief Short
summary of the following class/function/... */ in c++)
lets the user create the documentation as he edits the file and it
will remain readable inside the file too (no need for anything like a
browser or PDF viewer).
Hyperlinked dependency graphs would also be nice.


This idea of direction sounds very promising (at least to me), but
this step of course has its downsides,
afar from the concrete incompatibility of Doxygen with bash script,
the time to compose the information (of all recipes) into the
documentation would be tremendous,
it "could" take longer than building an image itself and the
documentation has to be rebuild partially after each update to stay
fresh.

Of course the scope I "suggested" was the complete documentation of OE,
so if this would only focus on variables and common functions /
leaving out per recipe informations,
then it could work out to compose the full documentation in a few minutes.

I'd like to read about your opinions / ideas regarding this.
>
> --
> Tom
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Regards
Samuel


