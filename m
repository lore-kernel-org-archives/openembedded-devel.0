Received: from [84.12.140.56] (helo=moneypenny.softoption.local)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <Mark.Howells@softoption.com>) id 1GOtD3-00071e-TL
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Sep 2006 11:45:09 +0200
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Sun, 17 Sep 2006 10:38:35 +0100
Message-ID: <5144EF5B0ABC6745BEE64C74E43ABD8F11A202@moneypenny.softoption.local>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Heavy packet loss using Slugos head
Thread-Index: AcbaPQw0JrzHbfzsQfKbDsGpb/sfWg==
From: "Mark Howells" <Mark.Howells@softoption.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Heavy packet loss using Slugos head
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Sep 2006 09:45:10 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Hi,
=20
I think my slug is dropping packets. I have been having lots of problems =
with NFS (slow performance, crashing). Messing with rsize,wsize settings =
for the mount seemed to point to larger packets being less =
reliable/slower. Flooging the slug (from a desktop Gentoo client) with a =
couple of ping statements gives the following
=20
zeus ~ # ping -f -s 1400 192.168.0.5
PING 192.168.0.5 (192.168.0.5) 1400(1428) bytes of data.
....................................
--- 192.168.0.5 ping statistics ---
2327 packets transmitted, 2291 received, 1% packet loss, time 2543ms
rtt min/avg/max/mdev =3D 0.644/0.792/1.173/0.089 ms, ipg/ewma =
1.093/0.739 ms

zeus ~ # ping -f -s 50000 192.168.0.5
PING 192.168.0.5 (192.168.0.5) 50000(50028) bytes of data.
.........................................................................=
.............
--- 192.168.0.5 ping statistics ---
204 packets transmitted, 118 received, 42% packet loss, time 2386ms
rtt min/avg/max/mdev =3D 10.863/11.218/11.643/0.167 ms, pipe 2, ipg/ewma =
11.755/11.282 ms

Notice that the larger packet size is has a huge loss. Flooding another =
PC from the same client gives zero percent loss - so it looks like the =
slug is responsible for the loss. I'd appreciate a steer in the right =
direction to track this down as network analysis isn't my area of =
expertise.

Thanks

Mark

--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.1.406 / Virus Database: 268.12.4/449 - Release Date: =
15/09/2006
=20


