Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PlHBd-0004fE-MH
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 09:38:37 +0100
Received: by iyj18 with SMTP id 18so1940887iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 00:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=1VNbYDBhWziJXjzCsfQmhbmq1kBukSrsfngtxTWZWC8=;
	b=Fv4PxoHHbaDMDvvIhIF0dTM07Jm/hQ06PIPOdZR/90KvCe2jOmC+2kVKK3zMobACld
	0rrVPrar4pavHXDGfcZDZKbXRwuCJD95gbE0ThS6bCuROr3DqTpOyuq9MWiBT6J1fg0P
	bLcmNb9p+4ykxNe2TrvdvKWAmOaI3kl1V7K6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wHBQh8KYMBVm6166gFjnymYpbQ6uecC9O4IQSIwgLKy5kXuzMGtlxoW2vbb4NPJF9q
	LfmXLk342gzSkk4MZ2Ak8UElc08Ck2opDtTpzjT2VAO7uqVoR5X5hmndKWQ8Ye5qdXhp
	ju2HKEIBhpebYXCSOkUsBAPMC1+1CggqnOKpA=
MIME-Version: 1.0
Received: by 10.42.218.3 with SMTP id ho3mr11232841icb.437.1296808659460; Fri,
	04 Feb 2011 00:37:39 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 4 Feb 2011 00:37:39 -0800 (PST)
In-Reply-To: <20110204081659.GQ4580@excalibur.local>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>
	<4D403D6F.3040800@mentor.com> <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
Date: Fri, 4 Feb 2011 09:37:39 +0100
Message-ID: <AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Fri, 04 Feb 2011 08:38:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/4 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> On Fri, 2011-02-04 at 08:54, Frans Meulenbroeks wrote:
>> 2011/2/4 Tom Rini <tom_rini@mentor.com>:
>> > On 02/03/2011 03:20 PM, Denys Dmytriyenko wrote:
>> >>
>> >> On Thu, Feb 03, 2011 at 10:43:26AM -0700, Tom Rini wrote:
>> >>>
>> >>> On 02/03/2011 12:09 AM, Denys Dmytriyenko wrote:
>> >>>>
>> >>>> On Thu, Jan 27, 2011 at 08:02:44AM -0700, Tom Rini wrote:
>> >>>>>
>> >>>>> On 01/27/2011 04:27 AM, Frans Meulenbroeks wrote:
>> >>>>>
>> >>>>> The problem is that today we have QA Errors that are warnings
>> >>>>> (coreutils-native) and QA Errors that result in a non-zero exit co=
de
>> >>>>> but
>> >>>>> also don't "kill the build" nor make it obvious at the end that th=
ere
>> >>>>> is
>> >>>>> a
>> >>>>> non-zero exit code (GNU_HASH, RPATH). =A0Finally we do have "kill =
the
>> >>>>> build"
>> >>>>> fatal checks in insane.bbclass, namely the do_qa_configure tests.
>> >>>>
>> >>>> Actually, I believe there was a simple error in the code which made=
 QA
>> >>>> Error

>> >>>> on RPATH not kill the build[1]. BTW, GNU_HASH QA Error does stop th=
e
>> >>>> build.
>> >>>>
>> >>>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/42168
>> >>>
>> >>> Good spotting. =A0But.. GNU_HASH QA error will give you a non-zero e=
xit
>> >>> code
>> >>> and not kill the build so we're back where we started, albeit with a=
 less
>> >>> often hit in the community trigger (but I bet more often hit in priv=
ate /
>> >>> 3rd party collections).
>> >>
>> >> So, do you ack the patch, should I push it in? It will break the buil=
d for
>> >> anyone still using libtool-2.2, specifically in gettext package...
>> >
>> > So, that would break angstrom-2008.1 so I don't think that's a great i=
dea
>> > until we fix it..
>>
>> Then again, if we push it there will be some incentive to fix it.
>
> So you are going to care care about the not yet ready for libtool 2.4 fal=
lout?
> Get warm with openjdk-6 then as it still needs libtool 2.2. :)
>
> More serious, I think this should at least wait until after the upcoming =
2011-03
> release. We need to find a balance between waiting forever and not breaki=
ng
> existing stuff.
>
Ehm, so if there is an RPATH or GNU_HASH QA error the code is *not* broken?
In that case it should not be a QA error but a QA warning.
But if it is an error then the existing stuff is already broken.
Ignoring the error then is more like ostrich behaviour.

Just my two cents.
Frans.


