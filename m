Received: from edison.awellconnected.net ([83.167.180.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1OXx7T-0004bp-Jp
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 16:03:02 +0200
Received: from [127.0.0.1] (helo=localhost)
	by edison.awellconnected.net with esmtpa (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1OXx2e-0001Fr-7Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 14:58:00 +0100
Received: from ip-80-226-0-1.vodafone-net.de (ip-80-226-0-1.vodafone-net.de
	[80.226.0.1]) by webmail.htc-linux.org (Horde MIME library) with HTTP;
	Sun, 11 Jul 2010 14:58:00 +0100
Message-ID: <20100711145800.264h899h0c8c08o0@webmail.htc-linux.org>
Date: Sun, 11 Jul 2010 14:58:00 +0100
From: lukas gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.6)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 83.167.180.132
X-SA-Exim-Mail-From: lukas@htc-linux.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET, RCVD_IN_SORBS_WEB,
	TRACKER_ID autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: glib-2.0: do_compile, angstrom: gcc-cross ver.
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
X-List-Received-Date: Sun, 11 Jul 2010 14:03:03 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have just ran a build in org.openembedded.dev commit
fd049a8b9904348456b26ffa7ff25d834c477c6b and noticed a bug.

I am using armv7a based htcleo machine configuration and
angstrom-2008.1 distro. because angstrom still selects obsolete
gcc-cross versions for armv7a (see
http://bugs.openembedded.org/show_bug.cgi?id=3D5435#c21 ) I bump it
manually like this

PREFERRED_VERSION_gcc-cross =3D "4.4.4"
PREFERRED_VERSION_gcc-cross-initial =3D "4.4.4"
PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.4"
PREFERRED_VERSION_binutils-cross =3D "2.20.1"

compile error from glib-2.0

| gconvert.c:55:2: error: #error GNU libiconv not in use but included
iconv.h is from libiconv

full log:

http://tinderbox.openembedded.net/public/logs/task/6483371.txt

Khem said it's because my host lacks libiconv. Unfortunately I can't
test it now. Is this related to following commit?

211fb05d665e95192cf4d4b81dfa89fde04359cf

Maybe it's good to add libiconv in bitbake host sanity checker or
require it in some other way like installing a libiconv-native ?

Can somebody look into updating gcc-cross in angstrom for armv7 ?
(Hope this the right list for angstrom topic)

Thanks

Lukas



