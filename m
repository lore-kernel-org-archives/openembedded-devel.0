Received: from [67.134.254.86] (helo=ltrxmail.lantronix.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lars.Holowko@lantronix.com>) id 1Mds6g-0004Dn-Se
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 22:50:07 +0200
X-MessageTextProcessor: DisclaimIt (2.00.201) on draw.int.lantronix.com
Received: from 2putt.int.lantronix.com ([172.16.1.22]) by
	ltrxmail.lantronix.com with Microsoft SMTPSVC(6.0.3790.1830);
	Wed, 19 Aug 2009 13:32:51 -0700
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.2992
MIME-Version: 1.0
Date: Wed, 19 Aug 2009 13:32:50 -0700
Message-ID: <8128F0FD6C26E14C8EB4BFDB92B8D6B201B3E7@2putt.int.lantronix.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe]Is there an easy way to get a minimalist image without
	I18nLibraries?
thread-index: AcogzN8NkO2t/fh5Q0a9FOVaBiNmOQAOND4g
References: <1250176750.29049.1003.camel@conroy-linux><20090813155909.GC8906@gmail.com><1250612879.6785.12.camel@conroy-linux><20090818174157.GB25000@denix.org><8128F0FD6C26E14C8EB4BFDB92B8D6B201B3E4@2putt.int.lantronix.com>
	<19c81808ecdbf92546b395d4df864830.marcin@juszkiewicz.com.pl>
From: "Lars Holowko" <Lars.Holowko@lantronix.com>
Importance: normal
Priority: normal
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 19 Aug 2009 20:32:51.0535 (UTC)
	FILETIME=[39223DF0:01CA210C]
Subject: Re: Is there an easy way to get a minimalist image without I18nLibraries?
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
X-List-Received-Date: Wed, 19 Aug 2009 20:50:08 -0000
Content-Class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> I am playing with the minimal-image on this configuration:
>>
>> To save even more flash space, is there also a way to disable the=20
>> installation of opkg and its dependencies like: libgnutls26,
libcurl4?
>
> # Disable online package management
> ONLINE_PACKAGE_MANAGEMENT =3D "none"
>
> Add this into your image recipe.

Thanks a lot, that got rid off the package management.

If anyone knows how I can get rid off the internationalization stuff,
I'll be compeletly happy..

Lars
=20
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the =
person or entity to which it is addressed and may contain information =
that is privileged, confidential, or otherwise protected from =
disclosure. Distribution or copying of this e-mail, or the information =
contained herein, to anyone other than the intended recipient is =
prohibited.


