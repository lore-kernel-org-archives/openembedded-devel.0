Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PLAAt-0003ct-0G
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 08:53:55 +0100
Received: by iwn7 with SMTP id 7so302514iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 23:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wz38IAnWyQX5IfW5bdMmjxAf+3hhWmHBu29v8sQcZcg=;
	b=C9xK0uKWSQSOxZEuqWuJ9IBoUNVMFu9DNJdO2t8VbOQPLl3DG4RtJgWEeIFl2CE3oe
	SEvoRlQunAYBEhJ0HlhB8VUbMqSP7DzU4i/d19hl9iYa2NrN7IPesZ17Pook+NsvQyTF
	MA6N3v1BvfILqpgv5U+i5bCI5nwGkEVbM64ws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gThiYg2RVS9Cg6uWYkrw48a75O0AwvBdqa27EYucGKrmQrwOPr2UmFAINgL851vTwU
	YnZXieEx3SnKFD9jeZpIuj/RRN6RzPkjuu6ojxLk7rbeM1+M1RWR97UzOhf58AnYD3We
	AB5itCuBHkZKnIkWwYOUsIX5ehii5chyk/qH0=
MIME-Version: 1.0
Received: by 10.231.13.137 with SMTP id c9mr42222iba.76.1290585161884; Tue, 23
	Nov 2010 23:52:41 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Tue, 23 Nov 2010 23:52:41 -0800 (PST)
In-Reply-To: <AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
References: <4CEC1E17.1030208@sensortherm.de>
	<AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
Date: Wed, 24 Nov 2010 08:52:41 +0100
Message-ID: <AANLkTimymQB4kxvp-ybAzpUMMxQNy43GZyxKNzmRH3Uw@mail.gmail.com>
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
X-List-Received-Date: Wed, 24 Nov 2010 07:53:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/23 Khem Raj <raj.khem@gmail.com>:
> On Tue, Nov 23, 2010 at 12:03 PM, Klaus Schwarzkopf
> <schwarzkopf@sensortherm.de> wrote:
>> Hi,
>>
>> i've downloaded oe with this script (thanks frans):
>>
>> #!/bin/sh
>>
>> export OE=3D/home/klaus/development/oe/
>> export BBPATH=3D${OE}build:${OE}openembedded
>> export PATH=3D${OE}bitbake/bin:${PATH}
>> export MACHINE=3Ddm355-evm
>>
>> RECIPES=3D"${OE}/openembedded/recipes"
>> LOGFILE=3D"fetchsrc.log"
>>
>> #Find recipes how changed this week
>> #FIND_OPTIONS=3D"-atime 7"
>>
>> for i in $(find ${RECIPES} -name '*.bb' -type f ${FIND_OPTIONS} | sort )
>> do
>> =A0 =A0 =A0 =A0echo $i
>> =A0 =A0 =A0 =A0bitbake -c fetch -b $i
>> done > ${LOGFILE} 2>&1
>>
>> egrep -n 'ERROR.*bb..failed' ${LOGFILE}
>> egrep -n 'KeyError' ${LOGFILE}
>>
>>
>>
>>
>>
>> I found a lot of errors, see attachment! The whole logfile is on my
>> homepage:
>> http://fbi.hooster.de/download/sonstiges/oe/fetchsrc.log.tar.gz
>>
>> How can i/we fix this errors?
>>
>
> You should ignore nonworking and obsolete dirs and some errors are due
> to hh.org going AWOL too
>
>
Agree with Khem.

What about moving all recipes that do not fetch and also did not fetch
during Martins test from last march/april to a directory non-fetching
or so?
Apparently these are non fetchable for a long time, with no one
apparently building them or having an interest to fix them.
My proposal would be to do that before the release is made, thereby
improving the % of the recipes that build.

Frans.


