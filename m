Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OpNZd-0000De-9X
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 17:44:10 +0200
Received: by wyg36 with SMTP id 36so4411794wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 08:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=tenjGcZ+ldfxVXeMktawUW2zljnjZwx6lkc26c11j6g=;
	b=uoD9IAa7lzKhbzFGlVLk9f1uySJWjuiUK5Uz4tcEvIRcC8PODfhqZIsT9k0Pa+EK+2
	zFTyqmuobumFE+pM/t8OEUjO5Fv/yi9I1UFWSNGr6eOxhRwtRCkE06A5bMa3KCztxB0Y
	h1FW8lGQGuRFDBkN8rufALPbB3zgFR3fdj7W8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=bM9tqsHG7nyvpuX6T3IBatwtq6YbRQ/IBr8LhD75ioTLwUxO/G+ox3CeTQHIqck4mu
	BvOY0DCSCn9Hq0GPtgWk7DcDKAlUvqJxHIr0nbC0nX1T2Xd0k3gakvHPCgJJHCCHNoS1
	vUilHQ1dyc8+n3ojRuWHfGf8WcgNGOo2V88t0=
Received: by 10.227.138.76 with SMTP id z12mr2401952wbt.60.1283010215144; Sat,
	28 Aug 2010 08:43:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Sat, 28 Aug 2010 08:43:15 -0700 (PDT)
In-Reply-To: <i5b9ni$qra$1@dough.gmane.org>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
	<i5b7mm$iso$1@dough.gmane.org>
	<AANLkTimui4vCRmhufXA9MGyjWWstr7C=O9tAErBsa-uv@mail.gmail.com>
	<i5b9ni$qra$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 28 Aug 2010 08:43:15 -0700
X-Google-Sender-Auth: Tvfr197JE5Yz4zUMfnplJBO0FaY
Message-ID: <AANLkTimqhCWD0Y0Mn0SZ8ZmCdiz4VXCofNWZrub=AzbW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Sat, 28 Aug 2010 15:44:12 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 28, 2010 at 8:24 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-08-10 16:55, Chris Larson wrote:
> > On Sat, Aug 28, 2010 at 7:49 AM, Koen Kooi <k.kooi@student.utwente.nl
> >wrote:
> >
> >> As usual you're completely ignoring the impact of this when using
> >> package management, which is probably why you still are clueless why
> >> your openssl fiasco is so much work to fix for distro maintainers.
> >
> >
> > If someone is missing something, then explain it to them.  Whining and
> > calling people clueless does absolutely nothing for the project but
> alienate
> > developers.  If you need to take out your frustration, buy a punching
> bag,
> > don't do it on the mailing list, please.
>
> And Chris, you don't have much right to say anything about this, since I
> raised my frustration with all this to the TSC almost two weeks ago, and
> I have only heard from Holger something and like "I haven't followed OE
> the past months".


As a member of the project who cares about its image, I have plenty of room
to say anything I like.  The TSC hasn't met to discuss this, but the issue
has been raised with frans, by mickey if I recall correctly.


> I haven't heard anything else, so keep getting more and more frustrated
> by frans moving goal posts ("ack or nak", "nak with explanation" "only
> naks from flawless maintainers") with the TSC doing seemingly nothing.


I think it's perfectly reasonable to request an explanation with a NAK, and
I'm not the only one.


> I do *not* have the time to read oe-devel daily, nor to do proper test
> builds within a day. Especially not with the current mega patches posted
> for review. I must admit that them being posted for review is an
> improvement, but by the looks of it the respective maintainers don't get
> a say since they aren't doing a perfect job.


A say is fine, childish behavior and insults are not.  This isn't the first
time we've had to deal with this sort of behavior from you, and I'm sure it
won't be the last.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

