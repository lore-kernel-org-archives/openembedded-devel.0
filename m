Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NjzK3-0005U2-Ot
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 19:17:32 +0100
Received: by pvf33 with SMTP id 33so424068pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=lKvlCsQXyvFQ6145u7ERLTE8q1fApqr2/gpjw+Wtuds=;
	b=gb4bnCBEwJ9zzhB6X22fSG4zYq/9Nlwtqe1TOvtQrR+U05Gx9FmvPCkjUKvDyEZSHT
	SOVrBvuINWDqZM3sGmTR9FWF0ngcfCUnM7raMRxXSkq7XgFsETsMOGArp+IxHgbNJMZb
	c322OmXJo66ceNdIVj2e4dXijQwuTKWrkdgDo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=QEIsfLPP5CT8VeLdAdEbGMcg4u3l7Wo0AiSn1xPQ6UURk2SmKkA9vetujH1ioCmHwQ
	qFKMlnIyAYh9/f+QVFmCpoRcHlen5Xv068YsFoCRcE0K73dfUqo5guWzYImwFWjiJPo/
	7qoubGID7/pqeQQWLSXSZoT9pyzXjnjBM+ObE=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.121.1 with SMTP id t1mr10141290wfc.37.1266948879163; Tue, 
	23 Feb 2010 10:14:39 -0800 (PST)
In-Reply-To: <1266947743.1714.521.camel@rex>
References: <1266316492.6436.127.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com> 
	<1266334604.6436.159.camel@rex>
	<201002181009.07359.marcin@juszkiewicz.com.pl> 
	<b6ebd0a51002180813q171a3d41kef83d708f4ba6eea@mail.gmail.com> 
	<1266512303.6436.1199.camel@rex>
	<b6ebd0a51002191739r245abeafq23de526308a29bab@mail.gmail.com> 
	<1266706695.2134.23.camel@dax.rpnet.com>
	<b6ebd0a51002201719jc6e694fudbd3eaacb47df0b2@mail.gmail.com> 
	<1266947743.1714.521.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Feb 2010 11:14:19 -0700
X-Google-Sender-Auth: 98dd2763a2862bb8
Message-ID: <b6ebd0a51002231014q207b8261y8189a62d00d2ad0a@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Tue, 23 Feb 2010 18:17:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 10:55 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sat, 2010-02-20 at 18:19 -0700, Chris Larson wrote:
>> > I disagree but its pointless to take this further and spoil what
>> > otherwise is a useful patch, we'll just add the default behaviour you
>> > describe.
>>
>> I see a few problems here. =C2=A0First, there's more to a notion of prio=
rity than
>> just 'prepend' and 'append'. =C2=A0It's unlikely that a given layer will=
 either
>> way to override everything else, or be overridden by everything else.
>
> I assume s/way/want/ above?
>
> I agree there is more to it than that but you're arguing for a simple
> default case which is just "prepend" or "append" effectively. I expect
> most layers do want to override the preceding layer.
>
>> =C2=A0Second, the final resulting BBPATH will end up depending upon orde=
ring
>> anyway, because the prepend/appends will be applied based on the order o=
f
>> the parsing of the bblayer.conf files.
>
> Most likely BBPATH and optionally BBFILE_COLLECTIONS will be appended or
> prepended to which seems reasonable and BBFILES it doesn't matter.
>
>> =C2=A0 Third, you seem to be retaining the
>> separation between configuration file / class priority (BBPATH) and
>> collection priority (BBFILE_COLLECTIONS, priority number). =C2=A0Users s=
ee a
>> layer/overlay/collection as a single entity, not two components whose
>> interactions with everyone else may vary.
>
> Well, the default case where there is no layer.conf file just needs to
> become more complex and append to BBFILE_COLLECTIONS too then. You're
> the one arguing for it :).
>
> The default case should make them function as one I agree but where
> there is a layer.conf I'd argue its up to that file to setup the righr
> variables.
>
>> If you're going to use a priority numbering scheme or something similar,
>> defined by the layer, then everything should obey it, in my opinion, and
>> BBPATH_prepend/append is not sufficient to reflect that priority scheme.
>
> I propose no numbering scheme, just a convention for priorities e.g.:
>
> Core metadata: 100
> Supplementary metadata: 500
> User metadata: 1000
>
> So a user overlay would override supplementary metadata and so on
> (assuming I have my numbers going the right way, I never can remember).
>
>
> Take a step back again - we want a system where each overlay contains
> data about what it contains and sets up bitbake's variables and any OE
> specific variables to match the setup. The layer.conf in this case does
> that well.
>
> What it does badly is let the conf files know about each other so they
> can fight over who does what, or let that be controlled from the
> bblayers.conf file other than through ordering the BBLAYERS variable.
> I'm open to ideas on how to work this better but think what I'm
> proposing has ways of meeting all real world use cases?

The point I'm attempting to make is, an individual layer doesn't know
enough to make the call.  "Override the preceding" is meaningless if
you don't know what the preceding *is*.  You haven't given the
individual layer that information.  You haven't moved the
responsibility from the user (BBLAYERS) to the layer (layer.conf) as
you seemed to be implying (by noting that a given layer will be
expected to be part of a set of layers, or operate against a specific
set of layers, you imply that the responsibility doesn't belong in the
hands of the user).  You're moving part of the responsibility, not all
of it, and what responsibility you do move over is useless without the
rest of the information.  You're giving them control without
knowledge, which, as far as I can tell, won't meet any additional use
cases that a simpler mechanism wouldn't, yet does increase the amount
of setup necessary, and, therefore, more potential points of failure.
In my opinion, you're better off leaving it entirely in the hands of
the user, or entirely in the hands of the layers, not a hodgepodge of
the two.

Now, to be clear, I'm not trying to rain on your parade here.  The
patch is an improvement, absolutely, and is in the right direction for
bitbake, imo, as users would find a more project-oriented solution to
be less confusing, but I think the design needs more thought and
discussion before it goes in.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


