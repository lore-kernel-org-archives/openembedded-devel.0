Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OE0oB-0006DY-1P for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 15:56:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OE0kK-0000dv-7z for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 15:52:40 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 15:52:40 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 15:52:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 May 2010 15:52:30 +0200
Message-ID: <hsrhmu$sp8$1@dough.gmane.org>
References: <hsql3t$o5c$1@dough.gmane.org> <20100517055550.GA6686@gmail.com>
	<hsr2pr$4vp$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <hsr2pr$4vp$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question: is 'gcc' supposed to replace the libstdc++.la installed by 'gcc-cross'?
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
X-List-Received-Date: Mon, 17 May 2010 13:57:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-05-10 11:38, Koen Kooi wrote:
> On 17-05-10 07:55, Khem Raj wrote:
>> On (17/05/10 07:44), Koen Kooi wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Hi,
>>>
>>> I just noticed that after doing 'bitbake gcc' the old libstdc++ gets
>>> replaced and the new one has:
>>>
>>> dependency_libs='
>>> /OE/angstrom-dev/sysroots/armv6-angstrom-linux-gnueabi/usr/lib/libstdc++.la'
>>>
>>> instead of the expected '-lm'. It now refers to itself :(
> 
>> hmmm target gcc should not have staged libstdc++ if it was already staged
>> by gcc-cross but the problem is casued by
>> gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch it passed the native libdir which
>> is build_libdir even for target library builds using -rpath. I am currently
>> looking into the reason. If possible we can get rid of that patch.
> 
> I'm getting a build failure with 'gcc' now failing to find libstc++.la.
> I'm trying a build from scratch now to rule out any packaged-staging
> problems (>1 recipes installing the same file, pstage removing it prior
> to build).

Yep, it's a packaged-staging problem, or rather, a metadata problem
highlighted by packaged-staging.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL8UoeMkyGM64RGpERAs4YAKCmiLtnoXDRCCODUCkS3EcSTCpDeACfTZoS
aQv46a+QTSUv3P+5iG/FB58=
=/KH3
-----END PGP SIGNATURE-----



