Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QqyvY-0003jI-0x
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Aug 2011 04:53:52 +0200
Received: (qmail 4880 invoked by uid 501); 9 Aug 2011 19:49:19 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13417. avast: v3.2.0/110808-1. sophie:
	3.06/3.22.0/4.68. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.011971 secs); 10 Aug 2011 02:49:19 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 9 Aug 2011 19:49:19 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 10 Aug 2011 14:49:18 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04BC9EBB@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Init process help please
Thread-Index: AcxXCBlEn2xcSFAfTbiqm/JFcNErEw==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Init process help please
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
X-List-Received-Date: Wed, 10 Aug 2011 02:53:52 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Guys,

I am porting Linux to an imx31 based target and have the kernel booting
and the NFS filesystem booting and I see the kernel messages in the ram
buffer uptill where it states:

"Freeing init memory: 104K"

However, I do not see any more messages regarding the init process, how
do I know if it has started? (By the way, I don't have a serial console
working at present ..)

I am currently exporting a root filesystem via NFS, I am not sure If I
am doing it correctly but I have:
"console=3Dttymxc0,115200 root=3D/dev/nfs ip=3Ddhcp
nfsroot=3D10.3.16.71:/export,v3,tcp" as my kernel argument and I have
un-compressed my root file system
Into my /export directory .... i.e I have bin/sbin/home etc under
/exports ... is this correct?

By the way I have built the Angstom-console-ads31.. Image.

I am not sure what program starts, is it /sbin/init? It currently is a
link to /sbin/init.sysvinit

The root filesystem seems to be mounter as per ram dump:

.<4>     device=3D
eth0, addr=3D10.3.
16.116, mask=3D255
.0.0.0, gw=3D255.2
55.255.255,.<4>=20
    host=3D10.3.16
.116, domain=3D, n
is-domain=3D(none)
,.<4>     bootse
rver=3D255.255.255
.255, rootserver
=3D10.3.16.71, roo
tpath=3D.<4>Warnin
g: unable to ope
n an initial con
sole..<5>Looking
100003/3 on 10.3
 up port of RPC=20
.16.71.<5>Lookin
g up port of RPC
 100005/3 on 10.
3.16.71.<4>VFS:=20
Mounted root (nf
s filesystem) on
 device 0:11..<6
>Freeing init me
mory: 104K....


Any ideas?

Cheers,
bernie


=20








