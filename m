Received: from mail.eads.net ([80.156.45.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Q0VYN-0005LM-0Q for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 10:01:03 +0100
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p2I8xMwq012449
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 09:59:23 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 18 Mar 2011 09:59:18 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 18 Mar 2011 09:59:17 +0100
Message-ID: <0C757E680E33864AB113392C7E83F910BE5145@GSX300A.mxchg.m.corp>
In-Reply-To: <201103171654.31619.pgsellmann@portner-elektronik.at>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH 3/3] base-files-3.0.14  configuration files
Thread-Index: AcvkvVkOgl2RmWRSSq2kTsafc711ywAjPSyg
References: <201103171154.23397.pgsellmann@portner-elektronik.at><1300360258.2132.14668.camel@phil-desktop><0C757E680E33864AB113392C7E83F910BE5144@GSX300A.mxchg.m.corp>
	<201103171654.31619.pgsellmann@portner-elektronik.at>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 18 Mar 2011 08:59:18.0547 (UTC)
	FILETIME=[C3CC2E30:01CBE54A]
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
X-List-Received-Date: Fri, 18 Mar 2011 09:01:03 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> > Mark some files in ${sysconfdir} as configuration files so they are
>> not blindly overwritten when upgrading
>>=20
>> I would suggest a pre-/post processing in the packages, like debian
>> does.
>> If a config file exists or is changed, the current File will be
rotated
>> or, if possible, left as it is and the new=20
>> file is installed beside the changed one.

>The opkg does not touch a present config file, but installs the new
file with the name *-opkg
>So if you do a find /etc -name \*-opkg you see the conflicts.

>Any sensible conversion from old to new config file should be made by
the package itself.

As I experienced, opkg exits with an error code if a config file already
exists, so if you want to create an image, the process will break at
that error.
It wasn't possible to create an image automatically then.


