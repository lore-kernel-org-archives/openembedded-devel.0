Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nxxis-0008UU-3x for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 09:24:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nxxfh-0000WC-IO for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 09:21:33 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Apr 2010 09:21:33 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Apr 2010 09:21:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 03 Apr 2010 09:21:20 +0200
Message-ID: <hp6q9g$di5$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex>
	<hp4s4q$40a$1@dough.gmane.org>	<hp4vat$f2l$1@dough.gmane.org>
	<1270244497.4993.185.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1270244497.4993.185.camel@rex>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Sat, 03 Apr 2010 07:24:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-04-10 23:41, Richard Purdie wrote:
> On Fri, 2010-04-02 at 16:35 +0200, Koen Kooi wrote:
>> And lots of:
>>
>> : QA Issue with staging: libssp_nonshared.la failed sanity test
>> (installed) in path
>> /OE/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> 
> This one I can guess the reason for, we're missing the lamangler
> function helper for cross packages. At the bottom of cross.bbclass, try
> changing:
> 
> mv ${SYSROOT_DESTDIR}${target_base_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/ || true
> mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true
> 
> to become
> 
> rm -rf ${SYSROOT_DESTDIR}${target_base_libdir}/
> rm -rf ${SYSROOT_DESTDIR}${target_libdir}/
> sysroot_stage_libdir ${D}${target_base_libdir} ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}
> sysroot_stage_libdir ${D}${target_libdir} ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}
> 
> which should mean the mangling happens correctly. Sorry I can't
> test/push this right at the moment.

I pushed that to
http://gitorious.org/angstrom/openembedded/commits/koen/rpurdie-wip-rebased

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLtuxwMkyGM64RGpERAoeZAKCEnMZNc1/LwWLkfKAPFT8oFVqrfACbBm04
G8xIY0k4bvzPyLHPUJEhgB4=
=jHZ6
-----END PGP SIGNATURE-----



