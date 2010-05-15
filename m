Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODJXt-0002OK-SN for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 17:44:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODJU3-0008MZ-Vj for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 17:40:59 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 17:40:59 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 17:40:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 15 May 2010 17:40:47 +0200
Message-ID: <hsmf9v$mug$1@dough.gmane.org>
References: <AANLkTil2qHZfmWTZXunj5iWnMZg0vFDDFEtzFSR9t7Ok@mail.gmail.com>	<AANLkTinuZ0-7oI-cEQVr7YkFtZm8GLZ2_IIkIizB3wjA@mail.gmail.com>	<AANLkTilk2Zb_F5psNZJNC8t9bfp7OOnMnAK5nyYIz96y@mail.gmail.com>	<hsmbkb$btq$1@dough.gmane.org>
	<AANLkTinydII_uSb0INtCwN6oo4nBu3oYkhKG4ZCr71Uj@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <AANLkTinydII_uSb0INtCwN6oo4nBu3oYkhKG4ZCr71Uj@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building opkg-native on 64 bit Ubuntu
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
X-List-Received-Date: Sat, 15 May 2010 15:44:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-05-10 17:09, Steve Sakoman wrote:
> On Sat, May 15, 2010 at 7:38 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 
>> On 15-05-10 15:41, Steve Sakoman wrote:
>>
>>>>> x86_64-linux-libtool: link: cannot find the library `' or unhandled
>>>>> argument `/..//lib'
>>>>> make[2]: *** [libopkg.la] Error 1
>>
>> Could you have a look at libcurl.la in your x86_64 sysroots dir? I
>> suspect that has the offending '/..//lib' in it.
> 
> Yes, libcurl.la did contain the offending '/..//lib'
> 
>> After removing that things build again for me. I suspect the curl-native
>> recipe installs a broken .la file.
> 
> That worked for me too.  Seems that we are plagued by broken .la files!

Indeed, luckily it was lib*c*url.la instead of libzurl.la, it happened
to be the 3rd one I checked :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL7sB/MkyGM64RGpERAjtgAKChAzQs1dJvcRbIhmuAVzl7kjGKYwCfSJcE
7PwgjTs238QFouPpw2Y1A3w=
=Xjrl
-----END PGP SIGNATURE-----



