Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P7nHa-0005lu-OO for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 12:49:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P7nH2-0001Nh-6o for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 12:49:00 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 12:49:00 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 12:49:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 18 Oct 2010 12:48:48 +0200
Message-ID: <i9h8mg$sg1$1@dough.gmane.org>
References: <1287353716-27717-1-git-send-email-obi@opendreambox.org>	<i9gsjn$8r0$3@dough.gmane.org>
	<4CBC1FBE.9020808@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <4CBC1FBE.9020808@opendreambox.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libfribidi-0.10.4: update recipe, fix packaging
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
X-List-Received-Date: Mon, 18 Oct 2010 10:49:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-10-10 12:21, Andreas Oberritter wrote:
> On 10/18/2010 09:22 AM, Koen Kooi wrote:
>> On 18-10-10 00:15, Andreas Oberritter wrote:
>>> * added LICENSE
>>> * removed configure patch
>>> * use lib_package and binconfig to package all installed files
>>
>> What's the upgrade path? I assume package names have changes due to this.
> 
> I guess my patch description wasn't clear enough.
> 
> The previously unpackaged files ${bindir}/fribidi and
> ${bindir}/fribidi-config are now packaged into libfribidi-bin and
> libfribidi-dev, respectively.
> 
> The only file which moved to a different package is libfribidi.a, from
> libfribidi-static to libfribidi-dev.

Well, .a files are supposed to go into -static, not into -dev.

> Does this change require special treatment for upgrades?

Every time you change packaging you need to make sure upgrade paths are
intact. Especially with libraries.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMvCYQMkyGM64RGpERAoo5AJ9+DLGIs6fcpMFzd0zu4rHZ1R6WnwCfW8MM
Td+T9s7UaTtrWvUyrH/0wCc=
=4fBZ
-----END PGP SIGNATURE-----



