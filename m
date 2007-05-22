Received: from [192.208.34.52] (helo=smtp3.smiths.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <Scott.Davis@smiths-aerospace.com>)
	id 1HqZsY-0001O6-GU for openembedded-devel@lists.openembedded.org;
	Tue, 22 May 2007 21:18:43 +0200
Received: from COSSMGIMS04.EMAIL.CORP.TLD (cossmgims04.email.corp.tld
	[10.225.225.147])
	by smtp3.smiths.com (Postfix) with ESMTP id B32F0327D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2007 13:17:47 -0600 (MDT)
Received: from COSSMGFEX03.EMAIL.CORP.TLD ([10.225.225.62]) by
	COSSMGFEB04.EMAIL.CORP.TLD with Microsoft SMTPSVC(6.0.3790.1830); 
	Tue, 22 May 2007 13:17:46 -0600
Received: from COSSMGIMS04.EMAIL.CORP.TLD ([10.225.225.147]) by
	COSSMGFEX03.EMAIL.CORP.TLD with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 22 May 2007 13:17:46 -0600
MIME-Version: 1.0
Received: from cossmgmbx07.EMAIL.CORP.TLD ([10.225.225.44]) by
	COSSMGFEB03.EMAIL.CORP.TLD with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 22 May 2007 13:17:44 -0600
X-OriginalArrivalTime: 22 May 2007 19:17:44.0894 (UTC)
	FILETIME=[E03C65E0:01C79CA5]
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Tue, 22 May 2007 13:17:43 -0600
Message-ID: <BDD06CD3363F254993AED78CA36350E20324E06D@cossmgmbx07.EMAIL.CORP.TLD>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Building Python extensions
Thread-Index: Acecpd9/uswWbcX2T5+xcKgN94668g==
From: "Davis, Scott (AGRE)" <Scott.Davis@smiths-aerospace.com>
To: <openembedded-devel@lists.openembedded.org>
X-Mailman-Approved-At: Thu, 24 May 2007 11:27:02 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Building Python extensions
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
X-List-Received-Date: Tue, 22 May 2007 19:18:43 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


I am trying to build a 32-bit shared library for a C library I have on
an x86_64 AMD SuSE linux system.  I am observing the same problem that
apparently someone on your list has had.  I have a commercial C 32-bit
linux library that I want to use SWIG to build a python extension for.
My linux system is 64-bit and when I compile against Python.h for Python
2.4 I get #error LONG BIT below emitted.=20

The original post is at the URL below:
http://projects.linuxtogo.org/pipermail/openembedded-devel/2007-March/00
1722.html

What is the fix to build 32-bit shared library python extension on a
64-bit linux system?

#if LONG_BIT !=3D 8 * SIZEOF_LONG=20
/* 04-Oct-2000 LONG_BIT is apparently (mis)defined as 64 on some recent=20
* 32-bit platforms using gcc. We try to catch that here at compile-time=20
* rather than waiting for integer multiplication to trigger bogus *
overflows. */
 #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
config?)."=20
#endif=20

Scott Davis
GE
Aviation
Digital Systems
Principal Software Engineer

T 616 224 6659
F 616 241 8707
E scott.davis@smiths-aerospace.com
www.ge.com/aviation=20

3290 Patterson Ave, SE=20
Grand Rapids, MI 49512, U.S.A.



</table> </Pre>
<HTML>
<br>
<br>
************************************************<br>
The information contained in, or attached to, this e-mail, may contain con=
fidential information and is intended solely for the use of the individual =
or entity to whom they are addressed and may be subject to legal privilege.=
  If you have received this e-mail in error you should notify the sender im=
mediately by reply e-mail, delete the message from your system and notify y=
our system manager.  Please do not copy it for any purpose, or disclose its=
 contents to any other person.  The views or opinions presented in this e-m=
ail are solely those of the author and do not necessarily represent those o=
f the company.  The recipient should check this e-mail and any attachments =
for the presence of viruses.  The company accepts no liability for any dama=
ge caused, directly or indirectly, by any virus transmitted in this email.<=
br>
************************************************<br>
</HTML>
From openembedded@hrw.one.pl Thu May 24 14:05:18 2007
Received: from [195.149.226.213] (helo
