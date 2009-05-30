Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MAVnD-0006pi-DL
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 23:08:39 +0200
Received: by bwz19 with SMTP id 19so6745335bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=66zeFFe0ekT0TeXfmSlbVaAYLh0Erl6Zgr9zsKbMmVU=;
	b=iBiUX3XaZOUbYMG2feSQQu5BFTuYwUkLW7oXTmdQ8qv+ZUigNRxnlk3IKx+p01qSJj
	IRpddi4uWLsmyy76E1uHyXT2fT9pwAvC1iIpEUNt4pgWgaDOEHhqP2uP1Zg2LbMgPFmO
	EFnE3LE1fGNCR9Jl4jpLgQD8rCe2aRONmcNfs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ImQfKYuTBQf4zAjDVsHL+klRL0wm8MArgvHHP4AqQANZuNeuLUi6ad3DVVBSGg7t0P
	s8qnoVmgYhYks+N29OTohzvS3MQ6XRilGPcWp2HIZmYtwfqs4rN4NBFU9H9p91FQhnM2
	U/sg0ekN0tTsRQu2On9Z6qT9MUyHPZXXzyFXo=
MIME-Version: 1.0
Received: by 10.103.172.7 with SMTP id z7mr2442900muo.15.1243717203398; Sat, 
	30 May 2009 14:00:03 -0700 (PDT)
In-Reply-To: <20090530205315.GO23842@smtp.west.cox.net>
References: <1243246822.4869.19.camel@lenovo.internal.reciva.com>
	<1243250313-10392-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243253873.4869.31.camel@lenovo.internal.reciva.com>
	<20090530205315.GO23842@smtp.west.cox.net>
Date: Sun, 31 May 2009 00:00:03 +0300
Message-ID: <fce2a370905301400p79316bbap6276c59f4f31d3bf@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gnome.bbclass: remove unneeded scrollkeeper stuff from gnome packages.
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
X-List-Received-Date: Sat, 30 May 2009 21:08:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2009 at 11:53 PM, Tom Rini <trini@embeddedalley.com> wrote:
> On Mon, May 25, 2009 at 01:17:53PM +0100, Phil Blundell wrote:
>> On Mon, 2009-05-25 at 14:18 +0300, Ihar Hrachyshka wrote:
>> > Scrollkeeper generates its XML database for every package when
>> > installing it. The problem is that while building it sees only specifi=
c
>> > package scrollkeeper stuff so we get wrong scrollkeeper xml file
>> > generated for every gnome.bbclass package. Including the file into eve=
ry
>> > gnome package results in package contents conflicts.
>> >
>> > -PACKAGES =3D+ "${PN}-scrollkeeper-leftovers"
>> > -FILES_${PN}-scrollkeeper-leftovers =3D "${localstatedir}/lib/scrollke=
eper"
>> > -
>> > =C2=A0gnome_stage_includes() {
>> > =C2=A0 =C2=A0 autotools_stage_includes
>> > =C2=A0}
>> > +
>> > +do_install_append() {
>> > + =C2=A0 rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
>> > +}
>> > +
>>
>> That change looks pretty reasonable to me, though maybe you want to
>> delete ${localstatedir}/lib/scrollkeeper itself (and its parents, if
>> they're empty) as well as the contents of the directory.
>>
>> In the longer term I guess we should figure out a general-purpose
>> solution to all this scrollkeeper stuff. =C2=A0I see that some packages =
are
>> configuring themselves --disable-scrollkeeper, others seem to be
>> patching the scrollkeeper bits out of their configure scripts and yet
>> others (notably empathy) have, effectively, a local copy of the bits
>> you've just removed from gnome.bbclass.
>
> Do you want more changes still? =C2=A0I don't see a SOB line, so... =C2=
=A0Thanks.

Should I resend the patch with SOB included?

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


