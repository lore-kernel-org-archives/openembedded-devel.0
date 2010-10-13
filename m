Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P65Jb-0006ei-IF for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 19:40:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P65J5-0004Yn-6Z for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 19:40:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 19:40:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 19:40:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Oct 2010 19:39:49 +0200
Message-ID: <i94qt5$r2l$1@dough.gmane.org>
References: <AANLkTikN5UjQfK=AvKV8YeqxFb1U7bq7ZZYuvxE5MHbq@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTikN5UjQfK=AvKV8YeqxFb1U7bq7ZZYuvxE5MHbq@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openjade-native build fails
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
X-List-Received-Date: Wed, 13 Oct 2010 17:40:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-10-10 05:40, Steve Sakoman wrote:
> After commit fdf02c61607acb5046afaa11c5c682ab99f4d508 openjade-native
> is failing on a clean build:
> 
> http://build.sakoman.com/public/logs/task/114486.txt
> 
> Any ideas on how to fix this? I've reverted the commit on my local
> tree so I can keep working, but I'm sure others will run into this
> too.

This sort of came back with libtool 2.4:

NOTE: package openjade-native-1.3.2-r3: task do_populate_sysroot: Succeeded
NOTE: Running task 6999 of 12209 (ID: 11645,
virtual:native:/OE/angstrom-setup-scripts/sources/openembedded/recipes/openjade/openjade_1.3.2.bb,
do_package)
ERROR: QA Issue with staging: libospgrove.la failed sanity test
(workdir) in path
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib
ERROR: QA Issue with staging: libostyle.la failed sanity test (workdir)
in path
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib
NOTE: package openjade-native-1.3.2-r3: task do_package: Started

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMte7lMkyGM64RGpERAjI7AKCstqWALEuTSZKJLAoMDFFk4spPJgCeJenM
N/6drLWQ9uYSky93TyGQyNY=
=ZpI7
-----END PGP SIGNATURE-----



