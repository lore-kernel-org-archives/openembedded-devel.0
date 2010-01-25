Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=Michael.Morrell=634322cf1@palm.com>)
	id 1NZWbD-0006AF-Ut for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 22:35:59 +0100
X-IronPort-AV: E=Sophos;i="4.49,342,1262592000"; d="scan'208";a="23579927"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 25 Jan 2010 13:32:25 -0800
Received: from ushqwmh02.palm1.palmone.com (ushqwmh02.palm1.palmone.com
	[148.92.223.143])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	o0PLUV2U027909 for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 13:30:33 -0800 (PST)
Received: from ushqwmb02.palm1.palmone.com ([148.92.223.121]) by
	ushqwmh02.palm1.palmone.com ([148.92.223.143]) with mapi;
	Mon, 25 Jan 2010 13:32:22 -0800
From: Michael Morrell <Michael.Morrell@palm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Jan 2010 13:32:21 -0800
Thread-Topic: Making bitbake directives conditional
Thread-Index: AcqeBeCn4lvBE6eeSH6NI01Gb74Ylw==
Message-ID: <D15778FFF6A6CA4FAF01B8D2C3780300499D3EAEDF@ushqwmb02.palm1.palmone.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.28.152.243
X-SA-Exim-Mail-From: prvs=Michael.Morrell=634322cf1@palm.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Making bitbake directives conditional
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
X-List-Received-Date: Mon, 25 Jan 2010 21:35:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>On Thursday 31 December 2009 19:55:52 Michael Morrell wrote:
>> I have two quick OE questions.
>>=20
>> First, is it possible to use any of the "directives" in a bb file or con=
f
>>  file based on a condition?  For example, can I "inherit" a class or use
>>  "addtask" only under certain conditions.  I couldn't find a way to do
>>  this.

>The question is why do you need this? What would be your usecase? You coul=
d=20
>achieve this with inherit ${MY_VAR} and then have MY_VAR be either "base"=
=20
>(which is already included) or what you want... but this is kind of ugly >=
and hard to understand.

Agreed this might work, but is ugly.

One reason why I'd like to do this is so that "inherit package" which adds =
the package and package_write tasks isn't done if PACKAGES is empty (like f=
or native package).  It is more efficient to not have these tasks scheduled=
 and executed since they don't do anything in this case.

I was thinking about implementing something like:

  inherit <name> [if <cond>]

By the way, is there a difference between using "inherit" and assigning to =
the INHERIT variable?

  Michael


