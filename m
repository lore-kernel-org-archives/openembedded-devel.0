Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PLbBU-0003ci-AL
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 13:44:21 +0100
Received: by iwn7 with SMTP id 7so1044193iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 04:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9b5FGS0MjFHB9EiEPb5zojLn2I930u4DfDd8Fs9K0p4=;
	b=hBIkHnqjgKld5XsTh4+gf7DmmKkLP+bEsRIf/F2LKKv/m4TFkh/Zej4IiMlFT9Ur2r
	D0JWh4G0fkHwLxt0QQhwQMQMS0EVdvu0tH4A0rOiRY9CWMYlC+zZjOffSqJTTJVPscEt
	plmJ4p+YwNeR0TKYiEgWG8huJZT6b4KBnyYlE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=U1mFApel0+AaezspPeUla1JtRNHT+k4hw5oOuYcE87wGWNyuzlaCIqrjj7bCw6Y+ii
	sKRGT0WOki9wEsrWWz98iR/DUC7ZE7iIOlz1TeE5lwdS2d3JWWz0FZKDU4U7eGP3iCO3
	9elW57/nqOwzxJrSeLv6roKjj/6QnPGrJYW9Q=
MIME-Version: 1.0
Received: by 10.231.13.137 with SMTP id c9mr467255iba.76.1290688984463; Thu,
	25 Nov 2010 04:43:04 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Thu, 25 Nov 2010 04:43:04 -0800 (PST)
In-Reply-To: <4CEE4F61.3060401@sensortherm.de>
References: <4CEC1E17.1030208@sensortherm.de>
	<AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
	<4CEE4F61.3060401@sensortherm.de>
Date: Thu, 25 Nov 2010 13:43:04 +0100
Message-ID: <AANLkTimpvN+hLUrk7LB1fOKbpY8aE1f-3hdoJA19JM2W@mail.gmail.com>
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
Subject: Re: I've downloaded oe
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
X-List-Received-Date: Thu, 25 Nov 2010 12:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/25 Klaus Schwarzkopf <schwarzkopf@sensortherm.de>:
> Am 23.11.2010 21:19, schrieb Khem Raj:
>>
>> On Tue, Nov 23, 2010 at 12:03 PM, Klaus Schwarzkopf
>> <schwarzkopf@sensortherm.de> =A0wrote:
>>>
>>> Hi,
>>>
>>> i've downloaded oe with this script (thanks frans):
>>>
>>> #!/bin/sh
>>>
>>> export OE=3D/home/klaus/development/oe/
>>> export BBPATH=3D${OE}build:${OE}openembedded
>>> export PATH=3D${OE}bitbake/bin:${PATH}
>>> export MACHINE=3Ddm355-evm
>>>
>>> RECIPES=3D"${OE}/openembedded/recipes"
>>> LOGFILE=3D"fetchsrc.log"
>>>
>>> #Find recipes how changed this week
>>> #FIND_OPTIONS=3D"-atime 7"
>>>
>>> for i in $(find ${RECIPES} -name '*.bb' -type f ${FIND_OPTIONS} | sort =
)
>>> do
>>> =A0 =A0 =A0 =A0echo $i
>>> =A0 =A0 =A0 =A0bitbake -c fetch -b $i
>>> done> =A0${LOGFILE} 2>&1
>>>
>>> egrep -n 'ERROR.*bb..failed' ${LOGFILE}
>>> egrep -n 'KeyError' ${LOGFILE}
>>>
>>>
>>>
>>>
>>>
>>> I found a lot of errors, see attachment! The whole logfile is on my
>>> homepage:
>>> http://fbi.hooster.de/download/sonstiges/oe/fetchsrc.log.tar.gz
>>>
>>> How can i/we fix this errors?
>>>
>>
>> You should ignore nonworking and obsolete dirs and some errors are due
>> to hh.org going AWOL too
>>
>
>
> egrep -n 'ERROR.*bb..failed' fetchsrc.log | egrep -v 'nonworking' | egrep=
 -v
> 'obsolete' | wc -l
> 434
>
> egrep -n 'ERROR.*bb..failed' fetchsrc.log | egrep -v 'nonworking' | egrep=
 -v
> 'obsolete' | egrep -v 'opie.*cvs' | wc -l
> 253
>
>
> I know, that the opie recipes missing the cvs server on hh.org.
>
> What is the best way to fix the missing download files?
> Move the recipes to nonworking directory?
> Find the missing files in the internet and upload the files to
> sources.openembedded.org?
>
> A combination: If we could not find the files, move the recipes to
> nonworking.
>
> Greetings
>
> Klaus

Thanks for your work.
Best way forward is to first verify if the sources are not elsewhere
(or renamed or so). E.g. php moves old versions to a "museum" site so
if a new version arrives the old version suddenly does not fetch any
more. In that case the solution is to change the SRC_URI
If that does not help and the sources are elsewhere on a reputable and
reliable server it might also be considered to change SRC_URI.

Otherwise if there happens to be a source found (e.g. in someones
downloads dir) we can consider moving it to sources.openembedded.org.
If the sources are unavailable moving to nonworking seems unavoidable.

There is one other case. If a recipe is old and not pinned, it can
also be considered to remove the recipe.

Frans


