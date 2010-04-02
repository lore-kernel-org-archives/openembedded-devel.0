Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NxbXn-0003fI-7y for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 09:43:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NxbUd-00039O-SV for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 09:40:39 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 09:40:39 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 09:40:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 02 Apr 2010 09:40:28 +0200
Message-ID: <hp471c$59h$1@dough.gmane.org>
References: <E1NxKhE-0007AO-Bh@melo.openembedded.org>
	<1270159668.6277.138.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1270159668.6277.138.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Joshua Lock : relocatable: Class to post-process packages for relocatability
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
X-List-Received-Date: Fri, 02 Apr 2010 07:43:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-04-10 00:07, Tom Rini wrote:
> On Thu, 2010-04-01 at 13:44 +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: rpurdie/work-in-progress
>> Commit: 2365530efff7681fa34b2a466cf5f78acac10274
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=2365530efff7681fa34b2a466cf5f78acac10274
>>
>> Author: Joshua Lock <josh@linux.intel.com>
>> Date:   Wed Mar 31 11:41:58 2010 +0100
>>
>> relocatable: Class to post-process packages for relocatability
> [snip]
>> +def rpath_replace (path, d):
>> +    bindirs = bb.data.expand("${bindir} ${sbindir} ${base_sbindir} ${base_bindir} ${libdir} ${base_libdir} ${PREPROCESS_RELOCATE_DIRS}", d).split()
> 
> Is that last variable there to let recipes add non-standard locations to
> the search path?
> 
> [snip]
>> -       required_utilities = "patch help2man diffstat texi2html
> makeinfo cvs svn bzip2 tar gzip gawk md5sum"
>> +       required_utilities = "patch help2man diffstat texi2html
> makeinfo cvs svn bzip2 tar gzip gawk md5sum chrpath"
> 
> How hard would it be to add a chrpath-native recipe and maybe treat this
> like we used to treat qemu?  Don't see it in yum on my rhel5 box.
> Thanks.

We already have that from our previous chrpath experiments :) See
recipes/chrpath

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLtZ9sMkyGM64RGpERAptOAJ9tPe40kbEGIn8YOcHfd8AqS+b0HgCeI0+s
4iPCr2JzhEwC9cjeJ9b/3lg=
=0C5K
-----END PGP SIGNATURE-----



