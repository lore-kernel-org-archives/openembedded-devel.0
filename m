Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OXyxj-0000Y1-Ji for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 18:01:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OXysu-0006cn-T4 for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 17:56:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 17:56:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 17:56:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 11 Jul 2010 17:55:50 +0200
Message-ID: <i1cpi6$jpb$1@dough.gmane.org>
References: <20100711145800.264h899h0c8c08o0@webmail.htc-linux.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <20100711145800.264h899h0c8c08o0@webmail.htc-linux.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: glib-2.0: do_compile, angstrom: gcc-cross ver.
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
X-List-Received-Date: Sun, 11 Jul 2010 16:01:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-07-10 15:58, lukas gorris wrote:
> Hello,
> 
> I have just ran a build in org.openembedded.dev commit
> fd049a8b9904348456b26ffa7ff25d834c477c6b and noticed a bug.
> 
> I am using armv7a based htcleo machine configuration and
> angstrom-2008.1 distro. because angstrom still selects obsolete
> gcc-cross versions for armv7a

Excuse me!?!?!? Gcc 4.3.x still generates the fastest and best code for
armv7a, gcc 4.4.x generates slow and buggy code and well, let's not talk
about gcc 4.5.

I'm using binaries built by this 'obsolete' toolchain daily on armv7a
hardware without problems, using neon, vfp, etc, so I'm wondering what
this is all about.

This all reeks of broken kernel syndrome, are you using linux.inc? If
not, please do so, it fixes up a whole lot of bugs.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMOemGMkyGM64RGpERAtpVAKCNitZFtUlGpbLtF/glkqhvs5GZQQCgrLx7
drZkWVNgaleAovXa7efOsVc=
=yPyi
-----END PGP SIGNATURE-----



