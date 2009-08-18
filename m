Received: from [67.134.254.86] (helo=ltrxmail.lantronix.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lars.Holowko@lantronix.com>) id 1MdWf7-00029m-Tk
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 23:56:14 +0200
X-MessageTextProcessor: DisclaimIt (2.00.201) on draw.int.lantronix.com
Received: from 2putt.int.lantronix.com ([172.16.1.22]) by
	ltrxmail.lantronix.com with Microsoft SMTPSVC(6.0.3790.1830);
	Tue, 18 Aug 2009 14:39:05 -0700
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.2992
Date: Tue, 18 Aug 2009 14:39:04 -0700
Message-ID: <8128F0FD6C26E14C8EB4BFDB92B8D6B201B3E4@2putt.int.lantronix.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Is there an easy way to get a minimalist image without I18n
	libraries?
thread-index: AcogLNeReOhI4nmfTLmmwZpQC/bB4AAAxjOg
Importance: normal
Priority: normal
References: <1250176750.29049.1003.camel@conroy-linux><20090813155909.GC8906@gmail.com><1250612879.6785.12.camel@conroy-linux>
	<20090818174157.GB25000@denix.org>
From: "Lars Holowko" <Lars.Holowko@lantronix.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 18 Aug 2009 21:39:05.0090 (UTC)
	FILETIME=[4F24DE20:01CA204C]
Subject: Is there an easy way to get a minimalist image without I18n libraries?
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
X-List-Received-Date: Tue, 18 Aug 2009 21:56:14 -0000
Content-Class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there,

I am playing with the minimal-image on this configuration:

MACHINE =3D "at91sam9g20ek"
DISTRO =3D "angstrom-2008.1"
ANGSTROMLIBC =3D "uclibc"

and now I am wondeering if in order to save some flash space there is a
way to build a minimal-image without libiconv, gettext and friends? That
would save me about 2.5MB of flash space!!!

If I check USE_NLS with bitbake -I; getvar USE_NLS reposrts "no". So I
would assume all the NLS would be disabled.

To save even more flash space, is there also a way to disable the
installation of opkg and its dependencies like: libgnutls26, libcurl4?


Regards,

Lars
=20
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the =
person or entity to which it is addressed and may contain information =
that is privileged, confidential, or otherwise protected from =
disclosure. Distribution or copying of this e-mail, or the information =
contained herein, to anyone other than the intended recipient is =
prohibited.


