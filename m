Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=Michael.Morrell=645426946@palm.com>)
	id 1NdSj6-0002vj-2V for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 19:16:26 +0100
X-IronPort-AV: E=Sophos;i="4.49,414,1262592000"; d="scan'208";a="23715069"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 05 Feb 2010 10:12:42 -0800
Received: from ushqwmh01.palm1.palmone.com (ushqwmh01.palm1.palmone.com
	[148.92.223.142])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	o15IAdQD015137 for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Feb 2010 10:10:44 -0800 (PST)
Received: from ushqwmb02.palm1.palmone.com ([148.92.223.121]) by
	ushqwmh01.palm1.palmone.com ([148.92.223.142]) with mapi;
	Fri, 5 Feb 2010 10:12:37 -0800
From: Michael Morrell <Michael.Morrell@palm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Feb 2010 10:12:35 -0800
Thread-Topic: Issues with .list files
Thread-Index: AcqmErSiU6Hu+QlKSvm4G6MrO4moyQAe2xcA
Message-ID: <D15778FFF6A6CA4FAF01B8D2C3780300499DAE1659@ushqwmb02.palm1.palmone.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.28.152.243
X-SA-Exim-Mail-From: prvs=Michael.Morrell=645426946@palm.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Issues with .list files
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
X-List-Received-Date: Fri, 05 Feb 2010 18:16:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>>> Ehm, no. If it did that you'd get missing shlibs in lots of cases. OE
>>> won't error out, but you're stabbing users of the packages in the eye
>>> since they get stuck with the mess.
=20
IMO, the missing shlib message should be fatal.  Cases where this message a=
ppears need to be fixed.

>> But it does seem like using a library created by something the recipe
>> does not DEPEND on is a problem that should be corrected sooner, rather
>> than later.

Agreed.

> That's certainly true, but the above approach is the complete wrong way
> to go about it

Then what do you suggest?  I'd like to fix the efficiency issue, but I'm mo=
re concerned about the parallelism failure.

   Michael


