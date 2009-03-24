Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LmCnZ-00034P-C3
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 21:00:33 +0100
Received: by yw-out-1718.google.com with SMTP id 9so1884358ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 12:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=TrVADSrlL/v0m86hno194Y+K4Dc/8+0UJ19mhAMbn34=;
	b=eaF23vtk9aNi2V0BtlkXF0ZvjcPGWNJ+qpTQUxScy53CXojl7svprfC7iFEShrEz5t
	iVuADEd2+stC6KJhuf6a+KD6CtOHJ9ebnu+FSTuixa9Y5vRVTViFQgkxS8rABzyGaOuP
	Utrm3zk4w6FvWwaBgudbCjgY6ZgndjAvOgzbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=hShS3P91ubeurXbAwLYIrsQZOCbVDlUc+KMqn+EeqaqfD9KFay53LPnPCQdWWVsBg3
	odcYOB82qc5SAJwN49Aye6hEOfXMl4kBjST0fOauWrY0Rj6UNl3Kkn6YzAfZFkpYNHil
	6MNiepYpvIRVJeMa1bvGtlywnu869orYPxNf0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.8.8 with SMTP id l8mr14922385ybi.92.1237924742934; Tue, 24 
	Mar 2009 12:59:02 -0700 (PDT)
In-Reply-To: <20090324195001.GR14278@smtp.west.cox.net>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
	<b6ebd0a50903241155u7743eaads81be33e350925b7a@mail.gmail.com>
	<gqbbf3$jak$1@ger.gmane.org>
	<b6ebd0a50903241224j9f11e8dp73fe5eb1a81bfd86@mail.gmail.com>
	<20090324195001.GR14278@smtp.west.cox.net>
Date: Tue, 24 Mar 2009 12:59:02 -0700
X-Google-Sender-Auth: 0731efc13f81ffbc
Message-ID: <b6ebd0a50903241259s7a47a13fo53f9da922a5864f8@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 20:00:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2009 at 12:50 PM, Tom Rini <trini@kernel.crashing.org> wrot=
e:
> On Tue, Mar 24, 2009 at 12:24:27PM -0700, Chris Larson wrote:
> [snip]
>> I also don't think the fact that a recipe builds is an excuse to
>> ignore it. =C2=A0Recipes should be kept in good shape, by current
>> standards, in my opinion. =C2=A0As an example, many recipes still don't
>> take advantage of the ${BP}, etc variables, and are overriding
>> FILES{DIR,PATH} unnecessarily.
>
> I'm saying this as an example, but, the what-now variable? =C2=A0And why
> didn't however added a handy new variable regex an update in? =C2=A0If we=
're
> going to push cleanups off of the person writing them and onto the
> maintainer, they need to be documented and linked from a single spot or
> so (so people can check a page once a week / whenever and see what's
> been put on their plate).

Not all usage scenarios can be hit by a regex, and regexes are prone
to introducing syntax errors due to not considering every usage.  I'm
not saying don't use them, just pointing out that it's no substitute
for personal care.

BPN is the base package name, basically the package name with
-native/-cross ripped off.  I didn't add it, but it's a lovely thing.
A -native recipe doesn't need to manipulate FILESPATH/FILESDIR to
ensure their file:// uris in SRC_URI are found, for example, since the
base variables are also used.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


