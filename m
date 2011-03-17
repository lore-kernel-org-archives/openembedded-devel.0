Received: from mail.eads.net ([80.156.45.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Q0Cwx-0004in-1e for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:09:11 +0100
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p2HCrWeT011236
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 13:53:33 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 17 Mar 2011 13:53:27 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 17 Mar 2011 13:53:27 +0100
Message-ID: <0C757E680E33864AB113392C7E83F910BE5144@GSX300A.mxchg.m.corp>
In-Reply-To: <1300360258.2132.14668.camel@phil-desktop>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH 3/3] base-files-3.0.14  configuration files
Thread-Index: AcvknDfrjkBOH2Z8S1e0KtzW5nluggABPl0A
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<1300360258.2132.14668.camel@phil-desktop>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 17 Mar 2011 12:53:28.0170 (UTC)
	FILETIME=[4F9CC4A0:01CBE4A2]
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Thu, 17 Mar 2011 13:09:11 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Mark some files in ${sysconfdir} as configuration files so they are
not blindly overwritten when upgrading

I would suggest a pre-/post processing in the packages, like debian
does.
If a config file exists or is changed, the current File will be rotated
or, if possible, left as it is and the new=20
file is installed beside the changed one.

Having too much config files makes it difficult to do an individual
configuration by own packages.

Regards
Wolfgang


