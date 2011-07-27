Received: from service19.mimecast.com ([213.235.63.71])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.sherwood@sepura.com>) id 1Qm1na-0008Fh-BG
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 12:57:10 +0200
Received: from mta01 (187-217-254-62.static.virginmedia.com
	[62.254.217.187]) by service19.mimecast.com; Wed, 27 Jul 2011 11:52:55
	+0100
Received: from [193.150.132.22] (helo=MAIL01B.SEPURA.co.uk)
	by mta01 with esmtp (Exim 4.02) id 1Qm1jO-0002pO-00
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 11:52:50 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 27 Jul 2011 11:52:49 +0100
Message-ID: <7B12C7CF8EB6734F9C50A406CD99BED20C7A8403@mail01b>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: libvpx_0.9.5 fails with parallel make (-j 24)
Thread-Index: AcxMQ9DW4/oh0OAxTfagMwq6u3cC2wAB38kQ
From: "Daniel Sherwood" <Daniel.Sherwood@sepura.com>
To: <openembedded-devel@lists.openembedded.org>
X-MC-Unique: 111072711525500901
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: FW: libvpx_0.9.5 fails with parallel make (-j 24)
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
X-List-Received-Date: Wed, 27 Jul 2011 10:57:10 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

=20

=20

From: Daniel Sherwood=20
Sent: 27 July 2011 10:59
To: 'openembedded-devel@lists.openembedded.org'
Subject: libvpx_0.9.5 fails with parallel make (-j 24)

=20

All

=20

This package fails to build with parallel make as
libvpx/vp8/encoder/arm/armv5te/boolhuff_armv5te.asm includes
vpx_vp8_enc_asm_offsets.asm but no dependency is resolved in the
makefile.

=20

I suggest that either the makefile is fixed or PARALLEL_MAKE=3D"" is added
to the BB file.

=20

Daniel Sherwood
Software Specialist
=20
Sepura plc

100 Longwater Drive, Green Park, Reading RG2 6GP

T: +44 (0) 1223 694637
F: +44 (0) 1223 879000

E: daniel.sherwood@sepura.com
www.sepura.com <http://www.sepura.com>=20

________________________________

=20


The information in this email is confidential. It is intended
solely for the addressee. Access to this email by anyone else
is unauthorised. If you are not the intended recipient, any
disclosure, copying, or distribution is prohibited and may be
unlawful. If you have received this email in error please delete
it immediately and contact commercial@sepura.com.

Sepura plc. Registered Office: Radio House, St Andrew&#65533;s Road, Cambr=
idge, CB4 1GR, England. Registered in England and Wales. Registration Numbe=
r 4353801
=20
From kg4ysn@gmail.com Wed Jul 27 16:16:59 2011
Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1Qm4ux-0007AV-L8
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 16:16:59 +0200
Received: by pzk1 with SMTP id 1so2794813pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 07:12:44 -0700 (PDT)
DKIM-Signature: v
