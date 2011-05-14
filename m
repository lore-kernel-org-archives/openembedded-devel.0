Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLMDd-0002M6-K0
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 23:17:50 +0200
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id p4EKtWCe022781
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 13:55:32 -0700 (PDT)
Received: from hammb01.corp.atmel.com ([10.142.130.20]) by
	csomb01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 14 May 2011 14:58:29 -0600
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Sat, 14 May 2011 21:56:48 +0100
Message-ID: <F619927BD5260540BACE9E197A0F2A692005F7@hammb01.corp.atmel.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] perl-native fails on Ubuntu 11.04
Thread-Index: AcwSQ9TgU2ZhokqWTGukEDzmXl5xzwANZwPt
References: <201105051150.06842.sgh@sgh.dk> <4DC2827E.9020801@mlbassoc.com>
	<4DCE3FCF.4050706@atmel.com> <4DCE9282.5080603@mentor.com>
From: "Samuelsson, Ulf" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 14 May 2011 20:58:29.0644 (UTC)
	FILETIME=[AD66CCC0:01CC1279]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: perl-native fails on Ubuntu 11.04
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
X-List-Received-Date: Sat, 14 May 2011 21:17:50 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Maybe try that if the others fail?

Best Regards
Ulf Samuelsson




-----Ursprungligt meddelande-----
Fr=E5n: openembedded-devel-bounces@lists.openembedded.org genom Tom Rini
Skickat: l=F6 2011-05-14 16:32
Till: openembedded-devel@lists.openembedded.org
=C4mne: Re: [oe] perl-native fails on Ubuntu 11.04
=20
On 05/14/2011 01:39 AM, Ulf Samuelsson wrote:
> 2011-05-05 12:57, Gary Thomas skrev:
>> On 05/05/2011 03:50 AM, S=F8ren Holm wrote:
>>> Please apply this patch to make perl-native build on Ubuntu 11.04
>>>
>>> =
https://gist.github.com/raw/925006/4217f358fb00b5b7f1dfbd1ce5f4afa4f64b0b=
b0/0001-perl-native-multilib-patch-for-ubuntu-11.04.patch
>>>
>>
>> This patch only works for x86_64 systems.  A corrected version
>> replaces `uname -m` with * in
>>   ++test -f /usr/lib/*-linux-gnu/libc.so &&
>> glibpth=3D"/usr/lib/*-linux-gnu $glibpth"
>>
>=20
>=20
> Yes ,  Just installed Ubuntu 11.04 on a machine and I tried that patch
> and failed.
> 'uname -m`  returns i686  but the library is in i386-linux-gnu
> I symlinked i686-linux-gnu to i386-linux-gnu, and then the build =
completes.
>=20
> `uname -i`  will return i386 so that is an alternative as well.

On my x86_64 ubuntu 10.04 box it returns unknown, so I think we'll have
to use the glob.

--=20
Tom Rini
Mentor Graphics Corporation

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


