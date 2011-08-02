Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1Qo44w-0007Ln-E6
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 03:47:32 +0200
Received: (qmail 24400 invoked by uid 501); 1 Aug 2011 18:43:07 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13385. avast: v3.2.0/110731-2. sophie:
	3.06/3.22.0/4.68. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.029903 secs); 02 Aug 2011 01:43:07 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 1 Aug 2011 18:43:06 -0700
x-mimeole: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 2 Aug 2011 13:43:05 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7AA6B@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Bitbake syntax error
Thread-Index: AcxQtYYErMe+PDHETYazK5Jw9GVjjw==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Bitbake syntax error
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
X-List-Received-Date: Tue, 02 Aug 2011 01:47:32 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Guys,

I am getting the following error while trying to build the
bootstrap-image, my bitbake is version 1.12.0.

----------- error -----------
gnueabi/bootstrap-image-1.0-r0/temp/log.do_package_update_index_ipk.2777
9
Log data follows:
| + do_package_update_index_ipk
| + set -x
| + ipkgarchs=3D'all any noarch arm  armv4 armv4t armv5te armv6 mx31ads'
| + '[' '!' -z '' ']'
| + mkdir -p /home/bmentink/devel/build/tmp/deploy/eglibc/ipk
| + touch /home/bmentink/devel/build/tmp/deploy/eglibc/ipk/Packages
| + opkg-make-index -r
/home/bmentink/devel/build/tmp/deploy/eglibc/ipk/Packages -p
/home/bmentink/devel/build/tmp/deploy/eglibc/ipk/Packages -l
/home/bmentink/devel/build/tmp/deploy/eglibc/ipk/Packages.filelist -m
/home/bmentink/devel/build/tmp/deploy/eglibc/ipk
|   File
"/home/bmentink/devel/build/tmp/sysroots/i686-linux/usr/bin/opkg-make-in
dex", line 128
|     print pkg_dir + "/" + old_filename
|                 ^
| SyntaxError: invalid syntax
NOTE: package bootstrap-image-1.0-r0: task do_package_update_index_ipk:
Failed

Any idea's?

Cheers,
Bernie.






