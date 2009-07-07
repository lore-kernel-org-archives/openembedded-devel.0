Received: from [67.134.254.86] (helo=ltrxmail.lantronix.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lars.Holowko@lantronix.com>) id 1MOJ7T-0008Pu-4o
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 00:26:35 +0200
X-MessageTextProcessor: DisclaimIt (2.00.201) on draw.int.lantronix.com
Received: from 3putt.int.lantronix.com ([172.16.1.16]) by
	ltrxmail.lantronix.com with Microsoft SMTPSVC(6.0.3790.1830);
	Tue, 7 Jul 2009 15:13:56 -0700
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.2992
MIME-Version: 1.0
Date: Tue, 7 Jul 2009 15:13:56 -0700
Message-ID: <022254FBC8645942BBF88A022862CDD33C60BA@3putt.int.lantronix.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: How does OE determine the kernel version that gets build?
thread-index: Acn/UDhthhqBK4AqSBO74ir2dRGcpw==
Importance: normal
Priority: normal
From: "Lars Holowko" <Lars.Holowko@lantronix.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 07 Jul 2009 22:13:56.0891 (UTC)
	FILETIME=[389ADEB0:01C9FF50]
Subject: How does OE determine the kernel version that gets build?
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
X-List-Received-Date: Tue, 07 Jul 2009 22:26:35 -0000
Content-Class: urn:content-classes:message
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi everybody,

I am working with an Atmel AT91SAM9G20-EK evaluation board. I was able
to successfully build the console-image and the default 2.6.28 kernel
for it.

Now I want to switch to a 2.6.30 kernel (for better wireless support)
but bitbake linux or bitbake console-image always builds 2.6.28 instead.
I copied a defconfig to recipies/linux/linux-2.6.30/at91sam9g20ek,
copied the AT91 patches for 2.6.30 in its place and added a
DEFAULT_PREFERENCE_at91sam9g20ek =3D "30" line to
recipies/linux/linux_2.6.30.bb hoping to make the 2.6.30 kernel active.

I can build a running kernel 2.6.30 with bitbake -b
recipies/linux/linux_2.6.30.bb.

Funnily there is no DEFAULT_PREFERENCE_at91sam9g20ek line in
recipies/linux/linux_2.6.28.bb and its DEFAULT_PREFERENCE =3D "-1" so I =
do
not even understand why that kernel gets chosen at all.

Looks like kernel version that gets build is determined somewhere else.
Can anyone point me to a document that describes how versions really get
determined? Adding a couple of -D -D -D -D did not really help. I see a
line

DEBUG: selecting
/old/OE-current/openembedded/recipes/linux/linux_2.6.28.bb as
PREFERRED_VERSION 2.6.28 of package linux (for item
kernel-module-zd1211rw)

in the log but then I do not understand why kernel-module-zd1211rw
triggers the 2.6.28 kernel. 'zd1211rw' hardly appears in any recipes :-(


Any hint would be highly appreciated.


Lars
=20
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the =
person or entity to which it is addressed and may contain information =
that is privileged, confidential, or otherwise protected from =
disclosure. Distribution or copying of this e-mail, or the information =
contained herein, to anyone other than the intended recipient is =
prohibited.


