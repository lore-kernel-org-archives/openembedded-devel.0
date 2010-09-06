Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OsXZd-00007U-BQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 11:01:12 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OsXYu-0003Qh-SD from Noor_Ahsan@mentor.com ;
	Mon, 06 Sep 2010 02:00:25 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 6 Sep 2010 11:00:21 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5042F15B5@eu2-mail.mgc.mentorg.com>
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Thread-Topic: llvm-native package dependency on binutils-croos package
Thread-Index: ActNoe9JZDMN3VuVSpqMuuH9SbHdDg==
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL, BAYES_00,
	EXTRA_MPART_TYPE, HTML_MESSAGE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: robertschuster@fsfe.org
Subject: llvm-native package dependency on binutils-croos package
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
X-List-Received-Date: Mon, 06 Sep 2010 09:01:12 -0000
Content-class: urn:content-classes:message
Content-Type: multipart/related; type="multipart/alternative";
	boundary="----_=_NextPart_001_01CB4DA1.F0D7700B"

------_=_NextPart_001_01CB4DA1.F0D7700B
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

=20

I was looking into llvm2.7-native package (llvm2.7-native_2.7.bb). Its
recipe file includes llvm-native.inc, in this file the DEPENDS lists
contains binutils-cross package. I am bit confused that why a non-native
package is present in DPENDS list of a native package. This commit link
is 6da4ed714f269373271a14149b131bf1ff7a6def.=20

=20

When I removed the binutils-cross from the dependency list and cleaned
binutils-cross and llvm-native packages and rebuilt llvm-native package
it built without any problem. So if llvm-native build successfully then
I think binutils-cross should be removed from the DEPENDS list. Can
somebody explain the reason if binutils-cross in the DEPENDS list?
Thanks.

=20

Regards,

Noor

=20

Noor Ahsan Khawaja

Team Lead, Pakistan SystemBuilder / EDGE Group

Embedded Systems Division

Mentor Graphics Pakistan Development (Pvt) Ltd

Direct: +92 42 609-9196

www.mentor.com/embedded <http://www.mentor.com/embedded>=20

=20

=20

=20


------_=_NextPart_001_01CB4DA1.F0D7700B--
