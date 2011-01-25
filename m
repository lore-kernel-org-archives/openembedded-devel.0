Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhnaQ-0004N5-Iz
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 19:25:52 +0100
Received: by iyj18 with SMTP id 18so5953110iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 10:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=js3KI99Ao7KrB9uLQxCuLXusAjpOsn+lCVXuynaRFoM=;
	b=rN6l6Y8T5uUUNKvKghzJW1yJBsr8qdVVYNQBABKVPzSAEP+ok3YSNdHUPXuxrrM6WO
	Cz9T8nKk3Xpw8lXc8ow1jPw4JsLezGdIv4XvPALWgNAU56h0vZDoAO/6N1PRVjYG+mda
	twUQZBkkYA3DvTAJZu4z45CKdoE2WAh0DkF9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=K+v3Qq8amhKfpkNKqtr3ksp44TiZB+B4ZgXkQOl1spC4lWC5/elrGC/K1FzfDpKgk+
	K9lqG8wU9B+YcESf5x2PMOi5D1uTnkkZbfufjkeYO11dyKTwYA32UGTGr5xaSvkFRZLw
	nimncsr/Zux5L/2bFf12MmVxmoY3TIsmlc/is=
Received: by 10.42.173.198 with SMTP id s6mr7078634icz.206.1295979902855; Tue,
	25 Jan 2011 10:25:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Tue, 25 Jan 2011 10:24:42 -0800 (PST)
In-Reply-To: <ihmaqm$eho$1@dough.gmane.org>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
	<ihmaqm$eho$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2011 10:24:42 -0800
Message-ID: <AANLkTik6uH9JbHZPdQg1gJN7fi2TUP9cHDt-HSSfarSV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Tue, 25 Jan 2011 18:25:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2011 at 3:05 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> Ignoring the timeline a bit, since ideally we would do this around a
> yocto milestone to get them to use this straight after their freeze.
>
> The technical roadmap/todo:
>
> * setup openembedded-core repo on oe.org
> * setup oe-core ml on oe.org
> * add oe-core ml to patchwork
> * import yocto-core in oe-core
> * start an integration branch
> =C2=A0o remove bitbake
> =C2=A0o cleanup namespace (s/yocto/OE/, s/poky/OE/)
> =C2=A0o split out superfluous layers (e.g. ememlow)
> * start merging in OE things
> =C2=A0o e.g. OE gcc 4.5, toolchains for avr32, bfin, etc
> * switch meta-oe to build on top of oe-core, fix issues
>
> When that is done meta-oe can start to expand.
>
> The non-technical roadmap/todo:
>
> * Assign 2 gatekeepers to oe-core, one from yocto, one from OE
> * sketch out decision tree (RP -> gatekeepers -> maintainers)
> * work out model for meta-oe
> * appoint OE member to yocto SC
> * work out how to marry yocto goals (4 archs, one toolchain) to OE goals
> (zillion archs, as much toolchains as we can manage)
> * Work out OE roadmap and align with yocto
>
> The above tries to restrict itself to dealing with the new oe-core, not
> with how OE is going to split into layers (meta-oe, meta-graveyard, etc).
> It also ignores the maintainer aspects since we will be dealing with
> yocto metadata at the start. After oe-core reaches a ready enough state
> we can start looking at assigning maintainers, but for the time being
> let's get things done first.
>
> So, let's start fleshing out the above roadmaps and implement them!

very well said. I think lets get started by setting up the repo.

>
> regards,
>
> Koen


