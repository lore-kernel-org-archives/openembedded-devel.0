Received: from col0-omc3-s6.col0.hotmail.com ([65.55.34.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1S15RS-0006P1-LP
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 01:24:50 +0100
Received: from COL120-W40 ([65.55.34.137]) by col0-omc3-s6.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 24 Feb 2012 16:15:19 -0800
Message-ID: <COL120-W40B503FFC0574E4957B971DD6B0@phx.gbl>
X-Originating-IP: [70.137.141.9]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Feb 2012 16:15:19 -0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Feb 2012 00:15:19.0049 (UTC)
	FILETIME=[8E7F7F90:01CCF352]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: BOTAN crypto library
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
X-List-Received-Date: Sat, 25 Feb 2012 00:24:50 -0000
X-Groupsio-MsgNum: 37467
Content-Type: multipart/mixed;
	boundary="_1ed1f953-ee02-48c3-99e9-b4747e4ff39e_"

--_1ed1f953-ee02-48c3-99e9-b4747e4ff39e_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=2C

I hope this is right place to ask for help regarding this. I am trying to b=
uild the Botan crytpo library using
system builder. I created a recipe for this and I am getting an error when =
I try to $make the library.
This is the error I am getting:

| /usr/bin/ld: /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder=
/build_p4080ds_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
| /usr/bin/ld: /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder=
/build_p4080ds_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
| /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080d=
s_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: could not read symbols: File in wrong forma=
t
| collect2: ld returned 1 exit status
| make: *** [libbotan-1.10.so.0.1] Error 1
| ERROR: Function do_install failed

I am guessing this has to do something with the linking of the libbotan-1.1=
0.so.0.1 file. Please advice. I have attached
the recipe that I created
Thank you for any help.

Simran
 		 	   		  =

--_1ed1f953-ee02-48c3-99e9-b4747e4ff39e_
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="botan_1.0.bb"

REVTQ1JJUFRJT04gPSAiQm90YW4gbGlicmFyeSIKUFIgPSAicjAiClNSQ19VUkkgPSAiZmlsZTov
LyR7UE59LSR7UFZ9LnRhci5neiIKCmluaGVyaXQgYXV0b3Rvb2xzCgpTID0gIiR7V09SS0RJUn0i
Cgpkb19pbnN0YWxsKCkgewoKCW1rZGlyIC1wICR7RH0vdXNyL2JvdGFuCgljZCBCb3Rhbi0xLjEw
LjEKIwlweXRob24gY29uZmlndXJlLnB5IC0tcHJlZml4PSR7RH0vdXNyL2JvdGFuCglweXRob24g
Y29uZmlndXJlLnB5CgltYWtlCiMJbWFrZSBpbnN0YWxsCgp9CgpGSUxFU18ke1BOfSArPSAiL3Vz
ci9iaW4vYm90YW4iCg==

--_1ed1f953-ee02-48c3-99e9-b4747e4ff39e_--
