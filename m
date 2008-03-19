Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jc0Ar-0002vq-Kl
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 16:26:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jc0An-0004qL-NT
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 15:25:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 15:25:49 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 15:25:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 19 Mar 2008 16:25:43 +0100
Message-ID: <frrb9n$5eh$1@ger.gmane.org>
References: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
	<1205929346.4555.34.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1205929346.4555.34.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] error out on .la files pointing to ${WORKDIR}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2008 15:26:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| Hi,
|
| On Wed, 2008-03-19 at 11:50 +0100, Koen Kooi wrote:
|> Things in stagin (e.g. .la files) point to ${WORKDIR} are broken and
|> should die. If we want packaged-staging and rm_work to function we
|> need to fix them. Since we are all lazy we need some incentive:
| [...]
|> --- classes/insane.bbclass      0712df99743c442ed311e6b4d4be0d28f29d525f
|> +++ classes/insane.bbclass      fa6b704f402965c8123dfa90527b5a11a8cd3288
|> @@ -178,7 +178,7 @@ def package_qa_make_fatal_error(error_cl
|>
|>       TODO: Load a whitelist of known errors
|>       """
|> - -    return not error_class in [0, 5, 7, 8]
|> +    return not error_class in [0, 5, 7]
|>
|>   def package_qa_write_error(error_class, name, path, d):
|>       """
|
| I'm ok with applying that since we do really need to sort out these
| issues.
|
| I did a load of cleanup in this area in poky and found in a lot of cases
| this happened since we weren't using oe_libinstall which mangles the .la
| files if it notices anything wrong with them.

Richard and I have now finally fixed the native.bbclass staging logic
for autotoolws packages. This means virtually all -native autotooled
recipes now get sanitized automagically.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4TB3MkyGM64RGpERAnvLAKC0++o3ntLzOjqv5pmrbcLrFl4pQwCgmRAj
9EL16VVjDtR54mR2axB8dPA=
=FemV
-----END PGP SIGNATURE-----



