Received: from [129.46.51.59] (helo=ithilien.qualcomm.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mdevico@qualcomm.com>) id 1IVBaa-0006tS-4k
	for openembedded-devel@openembedded.org; Tue, 11 Sep 2007 21:40:00 +0200
Received: from neophyte.qualcomm.com (neophyte.qualcomm.com [129.46.61.149])
	by ithilien.qualcomm.com (8.13.6/8.12.5/1.0) with ESMTP id
	l8BJaQuj004141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 12:36:26 -0700
Received: from sanexcas01.na.qualcomm.com (sanexcas01.qualcomm.com
	[172.30.36.175])
	by neophyte.qualcomm.com (8.13.6/8.13.6/1.0) with ESMTP id
	l8BJaP9q003811 for <openembedded-devel@openembedded.org>;
	Tue, 11 Sep 2007 12:36:26 -0700
Received: from NAEX16.na.qualcomm.com ([10.47.6.158]) by
	sanexcas01.na.qualcomm.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 11 Sep 2007 12:36:25 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 11 Sep 2007 12:36:24 -0700
Message-ID: <9870FB9891C7AD4B910E20B14776DF850104187B@NAEX16.na.qualcomm.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: bootstrap-image boot error: Inconsistency detected by ld.so:
	dynamic_link.h...
Thread-Index: Acf0qwnZQwxHOyNHRtiHqpfKkmvVVA==
From: "DeVico, Michael" <mdevico@qualcomm.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 11 Sep 2007 19:36:25.0501 (UTC)
	FILETIME=[0A6F74D0:01C7F4AB]
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: bootstrap-image boot error: Inconsistency detected by ld.so: dynamic_link.h...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2007 19:40:00 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

=20

This is more than likely a configuration/environment setup issue rather
that a bug, so I'm posting it here

rather than filing a bug for now...

=20

I built the bootstrap-image using the angstrom-2007.1 distro and the
i686-generic machine definition.

My build host is running Fedora FC7 and the processor is an Intel Core 2
Duo.

=20

However, when I try to boot, the kernel progresses through the device
hw/driver initialization and=20

successfully mounts  the rootfs, but then fails with the following error
message:

=20

Inconsistency detected by ld.so: dynamic_link.h: 179
elf_get_dynamic_info: Assertion 'Info[15] =3D=3D ((void*)0)' failed!

=20

If I point it to a partition containing the helloworld root fs, it
prints "Hello World" as expected, so it would

appear to be a problem with the bootstrap image rootfs rather than the
kernel itself, but this is my first=20

experience building a linux system from the ground up so I could
definitely use some help here.

=20

Any ideas?

=20

Thanks in advance!

--Mike

=20


