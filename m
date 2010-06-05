Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1OKi6n-0005Bk-Sk
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 03:23:35 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o551JFcC006313
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Jun 2010 20:19:15 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o551JFla015773
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Jun 2010 20:19:15 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o551JFQH022509
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Jun 2010 20:19:15 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Fri, 4 Jun 2010 20:19:15 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Jun 2010 20:19:13 -0500
Thread-Topic: Host Environment affect on target builds
Thread-Index: AQHLBE0c9/h8P3tkgUmMvnUpsJDX6w==
Message-ID: <A24693684029E5489D1D202277BE89445316FB43@dlee02.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Host Environment affect on target builds
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
X-List-Received-Date: Sat, 05 Jun 2010 01:23:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello.

I don't really understand why some recipes depend on the host environment.

For example, on my Fedora 12 machine I have:
    $ yum info ncurses-devel | grep Release
    Release    : 3.20090207.fc12
    $ ncurses5-config --libs
    -lncurses

And on my Fedora 13 machine this is a bit newer
    $ yum info ncurses-devel | grep Release
    Release    : 7.20100130.fc13
    $ ncurses5-config --libs
    -lncurses -ltinfo

The newer version lists tinfo library in addition to ncurses. Don't know wh=
y but OK.
The problem is the configure (autoconf) portion of recipes (here alsa-utils=
) uses this executable
to determine library linkage dependencies. So I get a build error even thou=
gh this is for the target (here arm).
    /opt/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../..=
/arm-none-linux-gnueabi/bin/ld: cannot find -ltinfo

This seems counter intuitive to me. Is this expected? Or maybe I missed som=
ething in setting up my OE environ.

Regards,
Martin=


