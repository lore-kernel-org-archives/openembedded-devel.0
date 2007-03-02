Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HN4ZC-00026t-Ql
	for openembedded-devel@openembedded.org; Fri, 02 Mar 2007 11:00:55 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l22A0hox008672 for <openembedded-devel@openembedded.org>;
	Fri, 2 Mar 2007 11:00:43 +0100
Message-ID: <45E7F5C9.2000507@dominion.kabel.utwente.nl>
Date: Fri, 02 Mar 2007 11:00:41 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <HOECLKEKOHLAMMGDLLBHIEJEKEAA.skoroneos@digital-opsis.com>
	<45E7ED77.2090103@whitby.id.au>
In-Reply-To: <45E7ED77.2090103@whitby.id.au>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Fri, 02 Mar 2007 10:01:00 -0000
X-List-Received-Date: Fri, 02 Mar 2007 10:01:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> Stelios Koroneos wrote:
>> I am not sure how many of you are building multimachine distro's but the old
>> system was not a very good solution.
>> We are building a distro for a number of machines x86 arch (i486, i585,
>> i686), a number of powerpc targets  and recently mipsel and puttinng
>> everything in a giant ipk pool is not the best of solutions.
>>
>> As far as i can understand its a case where  single machine distro's made
>> use of this OE feature while multimachine distros had to look for other ways
>> (i.e post processing).
> 
> Perhaps when multimachine was added, the deploy ipk feed support should
> have been updated to continue to work, instead of later breaking single
> machine feed support.

Again, it didn't break anything that was *supported*. Rootfs generation continued to work.
However, rootfs_ipk.bbclass is *not* the place to put in feed management. That class is
supposed to build a rootfs from ipkgs, which it does by treating deploy/ipk/<arch> as
feeds. I can think of ways to do rootfs generation without Packages.* (e.g sqlite), and if
they prove to be faster and more robust I _will_ replace the old methods.

So my proposal:

Make a contrib/deploy-ipkg-feed.bb that basically does:

cd ${DEPLOY_DIR_IPK}
find */ -name  "*.ipk" -exec cp  '{}'  ./ \;
rm Packages*
ipkg-make-index -p Packages -l Packages.filelist -m .

and add the problems mentioned in other mails as comments.

This way people wanting a single feed get it with a simple 'bitbake -b
contrib/deploy-ipkg-feed.bb' without the impression it's officially supported in OE.

Does anyone have problems with this proposal?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF5/XJMkyGM64RGpERAgtvAKChIZPrfuunIzm/pk7t83yim5zo0gCfQMli
OfEiT2MTSgKrxADF0pZhdw4=
=eWES
-----END PGP SIGNATURE-----


