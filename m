Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ojv9z-0004cE-9D for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 16:23:18 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ojv9c-0002XO-SK for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 16:22:40 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 16:22:40 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 16:22:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Aug 2010 16:22:31 +0200
Message-ID: <i43kf7$942$1@dough.gmane.org>
References: <1281698231-26231-1-git-send-email-noor_ahsan@mentor.com>	<1281701005.3858.129.camel@mattotaupa>
	<AANLkTinLVmyz+QJQKXRcmf-1375uTPC84RYM8Xr59V3-@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <AANLkTinLVmyz+QJQKXRcmf-1375uTPC84RYM8Xr59V3-@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 14:23:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-08-10 14:25, Frans Meulenbroeks wrote:
> 2010/8/13 Paul Menzel <paulepanter@users.sourceforge.net>:
>> Am Freitag, den 13.08.2010, 17:17 +0600 schrieb noor_ahsan@mentor.com:

>>> +NATIVE_INSTALL_WORKS = "1"
>>
>> I am really a noob, but is not that for “normal”, i.e. no *-native,
>> recipes indicating no explicit native recipe is needed?
> 
> Afaik this is not needed.

If your -native recipe has something different than 'make install' in
do_install, it needs NATIVE_INSTALL_WORKS = "1" but only if you use
BBCLASSEXTEND to make it native.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMZVUnMkyGM64RGpERAmNcAJ45v9qAacER5cXEOEBSB/wqQv9gagCfXwSG
WR28gYaXsqvwUVbeCqC1hmE=
=MKz9
-----END PGP SIGNATURE-----



