Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OALaB-0004P0-Qs for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 13:19:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OALWW-000079-9A for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 13:15:16 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 13:15:16 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 13:15:16 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 07 May 2010 13:15:02 +0200
Message-ID: <hs0snm$i4a$1@dough.gmane.org>
References: <alpine.DEB.1.10.1005011614380.15503@vitus.devnet.local>	<1272723767-16871-1-git-send-email-vjensen@gmx.de>	<1272723767-16871-2-git-send-email-vjensen@gmx.de>
	<20100507101850.GD18308@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <20100507101850.GD18308@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] canutils: new recipe
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
X-List-Received-Date: Fri, 07 May 2010 11:19:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-05-10 12:18, Stefan Schmidt wrote:
> Hello.
> 
> On Sat, 2010-05-01 at 16:22, Vitus Jensen wrote:
>> Adds canutils (PTX flavour) 4.0.4 as alternative to socketcan-utils-test.
>> canutils RCONFLICTS with socketcan-utils-test because of identical
>> file names.
>>
>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>> ---
>>  recipes/socketcan/canutils_4.0.4.bb           |   19 +++++++++++++++++++
>>  recipes/socketcan/socketcan-utils-test_svn.bb |    1 +
>>  2 files changed, 20 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/socketcan/canutils_4.0.4.bb
>>
>> diff --git a/recipes/socketcan/canutils_4.0.4.bb b/recipes/socketcan/canutils_4.0.4.bb
>> new file mode 100644
>> index 0000000..e769c46
>> --- /dev/null
>> +++ b/recipes/socketcan/canutils_4.0.4.bb
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION = "canutils (PTX flavour)"
>> +AUTHOR = "Luotao Fu"
>> +HOMEPAGE = "http://www.pengutronix.de"
>> +SECTION = "console/network"
>> +PRIORITY = "optional"
>> +LICENSE = "LGPL"
>> +DEPENDS = "libsocketcan"
>> +RDEPENDS = "libsocketcan"
> 
> Why do you need this RDEPENDS on the lib when it is already in DEPENDS?

The better question is "Why doesn't OE shlib code pickup that
dependency?" :)

Regardless of that, RDEPENDS = "foo" is bad, RDEPENDS_${PN} = "foo" is
better. Chris created the recipe sanity stuff to check for these kinds
of things.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4/Y2MkyGM64RGpERApiGAKCHkZaERI3RjRMFni0srqrz1bK1zACgh4Oc
txgZHww4OIZWD+cvr+GWb5w=
=eDEU
-----END PGP SIGNATURE-----



