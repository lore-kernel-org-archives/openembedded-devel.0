Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OORJT-00077n-87 for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 10:16:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OORFB-00046p-D4 for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 10:11:37 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 10:11:37 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 10:11:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 15 Jun 2010 10:11:27 +0200
Message-ID: <hv7cjf$9kc$1@dough.gmane.org>
References: <AANLkTilHhuvcQFQBwVWkW6_Nf7xQPd6xDQlZzv4kvnel@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <AANLkTilHhuvcQFQBwVWkW6_Nf7xQPd6xDQlZzv4kvnel@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: STAGING_KERNEL_DIR
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
X-List-Received-Date: Tue, 15 Jun 2010 08:16:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-06-10 07:36, Andrew Tverdohlebov wrote:
> Hello,
> 
> I am developing a recipe for a code that needs to obtain kernel
> configuration parameters
> in order to compile correctly.

If your recipe is really machine specific, add PACKAGE_ARCH =
"${MACHINE_ARCH}"

If not, add:

# We want a kernel header for armv7a, but we don't want to make mplayer
machine specific for that
STAGING_KERNEL_DIR =
"${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"

regards,

Koen


> 
> According to the manual there is a variable STAGING_KERNEL_DIR that is
> supposed to point to the kernel staging dir.
> In my case it points to staging/mips-linux where I don't see '.config' file.
> The '.config' file is located in staging/xls4lte-linux (xls4lte - is a
> name assigned to MACHINE in local.conf)
> 
> My question: - what is a correct way to refer to a directory where
> kerenel's config file is located.
> 
> The second question is - what is a point in several directories in staging dir ?
> 
> In my case I have:
> i686-linux
> i686-linux-sdk
> mips-linux
> xls4lte-linux
> 
> I thought that this might be a property of my distro and checked
> angstrom for beagleboard and saw the same picture there:
> 
> while working on my custom linux distro based on openembedded if noticed.
> armv7a-angstrom-linux-gnueabi
> armv7a-linux
> beagleboard-angstrom-linux-gnueabi
> i686-linux
> 
> In both cases at least two separate dirs are created in staging. One
> ${MACHINE}-linux and another ${TARGET-ARCH}-linux.  What are they for
> ?
> And how to properly refer to staging/${MACHINE}-linux ?
> 
> Any help will be hugely appreciated.
> Andrew

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMFzWvMkyGM64RGpERApsQAJ0Wmg02kVDp5rl0jnb8nxEClBW7AACfdwLj
JFufKD77LgRZ5pOdT9YXegk=
=oHiS
-----END PGP SIGNATURE-----



