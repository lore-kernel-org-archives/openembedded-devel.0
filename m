Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODgel-0002zl-9E for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 18:27:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODgav-0002o8-Rb for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 18:21:37 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 18:21:37 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 18:21:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 16 May 2010 18:21:20 +0200
Message-ID: <hsp620$r3s$1@dough.gmane.org>
References: <hs35ae$l42$1@dough.gmane.org> <hsk1gf$v4j$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <hsk1gf$v4j$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libstc++ libtool problem, cross lamanger broken
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
X-List-Received-Date: Sun, 16 May 2010 16:27:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ping

On 14-05-10 19:33, Koen Kooi wrote:
> Almost a week later, any fixes people can try[1]?
> 
> [1] apart from sed -i -e
> 's:-L/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib::g'
> sysroots/*/usr/lib/*.la
> 
> 
> On 08-05-10 09:53, Koen Kooi wrote:
>> Hi,
> 
>> I've been getting failures when ARM apps try to link with x86_64
>> libxml2, and I started to do some digging:
> 
>> grep L/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib
>> /OE/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/*.la |
>> more | awk -F: '{print $1}' | sed
>> s:/OE/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/lib/::glibaspell.la
>> libatkmm-1.6.la
>> libcairomm-1.0.la
>> libetpan.la
>> libFLAC++.la
>> libgdkmm-2.4.la
>> libgiomm-2.4.la
>> libglibmm-2.4.la
>> libglibmm_generate_extra_defs-2.4.la
>> libgnutlsxx.la
>> libgtkmathview_custom_reader.la
>> libgtkmathview_libxml2.la
>> libgtkmathview_libxml2_reader.la
>> libgtkmm-2.4.la
>> libmathview_backend_gtk.la
>> libmathview_backend_ps.la
>> libmathview_backend_svg.la
>> libmathview_frontend_custom_reader.la
>> libmathview_frontend_libxml2.la
>> libmathview_frontend_libxml2_reader.la
>> libmathview.la
>> libpangomm-1.4.la
>> libpcrecpp.la
>> libpoppler-glib.la
>> libpoppler.la
>> libpspell.la
>> libschroedinger-1.0.la
>> libsidplay.la
>> libsigc-2.0.la
>> libstdc++.la
>> libsupc++.la
>> libtiffxx.la
>> libwebkit-1.0.la
> 
>> So pretty much anything with a c++ dep gets a bogus .la file, so lets
>> look at libstdc++.la:
> 
>> dependency_libs=' -L/OE/angstrom-dev/sysroots/x86_64-linux/usr/lib
>> /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la'
> 
>> So it looks like the cross.bbclass lamangler needs some more work.
> 
>> regards,
> 
>> Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL8BuAMkyGM64RGpERAt4cAJ4vI2Qgf6S+MnQ9ZnF4T2KHNpoqMACeMFTx
S+Rf/i7pmxQKbiq5VgNyF10=
=BU9M
-----END PGP SIGNATURE-----



