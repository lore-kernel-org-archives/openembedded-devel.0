Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9uUv-0001eb-Ma for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:23:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9uRH-0003gz-JB for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:20:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 08:20:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 08:20:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 06 May 2010 08:12:31 +0200
Message-ID: <hrtmkf$bp1$2@dough.gmane.org>
References: <mailman.6069.1273115899.24517.openembedded-devel@lists.openembedded.org>	<p2lad875cab1005052017k622928e3jabfe4ea684e4ef62@mail.gmail.com>
	<l2pad875cab1005052019o60a63221ya1727def61751e98@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <l2pad875cab1005052019o60a63221ya1727def61751e98@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: create ipk failed...
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
X-List-Received-Date: Thu, 06 May 2010 06:23:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-10 05:19, yenchengwang wrote:
>>
>> hi all,
>>     I have a problem when try to "bitbake -b recipes/minicom/
>> minicom-mypkg_2.4.bb"
>>
>>     the bellow is the content of my bb file:
>>     file name is minicom-mypkg_2.4.bb
>> *********************************************************************************************************
>>
>>     SECTION = "console/network"
>>     DEPENDS = "ncurses"
>>     LICENSE = "GPL"
>>
>>     SRC_URI = "
>> https://alioth.debian.org/frs/download.php/3195/minicom-${PV}.tar.gz<https://alioth.debian.org/frs/download.php/3195/minicom-$%7BPV%7D.tar.gz>
>> "
>>     S = "${WORKDIR}/minicom-${PV}"
>>     PR = "r0"
>>
>>     inherit autotools gettext
>>
>>     do_configure() {
>>         ./configure --host = arm
>>     }
>>
>>     do_install() {
>>         autotools_do_install
>>     }
>>
>> *********************************************************************************************************
>>
>> then bitbake -b recipes/minicom/minicom-mypkg_2.4.bb, I always get the
>> below messages:
>>
>>
>> ****************************************************************************************************************************************************************
>> NOTE: the following files were installed but not shipped in any package:
>> NOTE: /usr/local/share/man/man1/ascii-xfr.1
>> NOTE: /usr/local/share/man/man1/minicom.1
>> NOTE: /usr/local/share/man/man1/xminicom.1
>> NOTE: /usr/local/share/man/man1/runscript.1
>> ... ignored
>> NOTE: /usr/local/bin/xminicom
>> NOTE: /usr/local/bin/ascii-xfr
>> NOTE: /usr/local/bin/minicom
>> NOTE: /usr/local/bin/runscript
>> NOTE: /usr/local/bin/.debug/ascii-xfr
>> NOTE: /usr/local/bin/.debug/minicom
>> NOTE: /usr/local/bin/.debug/runscript
>> NOTE: Running task 12 of 17 (ID: 10, /home/rd/oe/build/recipes/minicom/
>> minicom-mypkg_2.4.bb, do_qa_staging)
>> NOTE: Running task 13 of 17 (ID: 16, /home/rd/oe/build/recipes/minicom/
>> minicom-mypkg_2.4.bb, do_package_write_ipk)
>> Packaged contents of minicom-mypkg-dbg into
>> /home/rd/oe/build/tmp/deploy/glibc/ipk/armv5te/minicom-mypkg-dbg_2.4-r0.5_armv5te.ipk
>> NOTE: Not creating empty archive for minicom-mypkg-2.4-r0.5
>> NOTE: Not creating empty archive for minicom-mypkg-doc-2.4-r0.5
>> Packaged contents of minicom-mypkg-dev into
>> /home/rd/oe/build/tmp/deploy/glibc/ipk/armv5te/minicom-mypkg-dev_2.4-r0.5_armv5te.ipk
>> NOTE: Not creating empty archive for minicom-mypkg-static-2.4-r0.5
>> NOTE: Not creating empty archive for minicom-mypkg-locale-2.4-r0.5
>> ...ignored
>>
>> ****************************************************************************************************************************************************************
>>
>> I have no idea why I always get these messages...
>> NOTE: Not creating empty archive for minicom-mypkg-2.4-r0.5
>> NOTE: Not creating empty archive for minicom-mypkg-doc-2.4-r0.5
>> NOTE: Not creating empty archive for minicom-mypkg-static-2.4-r0.5
>> NOTE: Not creating empty archive for minicom-mypkg-locale-2.4-r0.5
>>
>> any information is appreciate !!

Your do_configure is broken, so it installs to /usr/local, which isn't
in FILES_${PN} by default.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4l3PMkyGM64RGpERAgXFAJ9SB4Y461x3GkXdk+H+Zh23fqezVgCdEENx
N3D1GipD8aYuXF+jkrNhWQs=
=O0I2
-----END PGP SIGNATURE-----



