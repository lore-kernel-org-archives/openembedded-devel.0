Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PTEZG-000273-Qe for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 15:12:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PTEXi-0004II-76 for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 15:10:50 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 15:10:50 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 15:10:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Dec 2010 15:10:37 +0100
Message-ID: <ied6kt$dqa$1@dough.gmane.org>
References: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>	<201012152240.45068.roman@khimov.ru>	<131E5DFBE7373E4C8D813795A6AA7F080329DB6BEA@dlee06.ent.ti.com>	<201012152339.06515.roman@khimov.ru>
	<131E5DFBE7373E4C8D813795A6AA7F080329E92ADA@dlee06.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080329E92ADA@dlee06.ent.ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move openssl.cnf file into base openssl package
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
X-List-Received-Date: Thu, 16 Dec 2010 14:12:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-12-10 15:04, Maupin, Chase wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Roman I Khimov
>> Sent: Wednesday, December 15, 2010 2:39 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [RFC] move openssl.cnf file into base openssl package
>>
>> В сообщении от Среда 15 декабря 2010 22:47:05 автор Maupin, Chase написал:
>>>> Missed that change. Seems wrong to me. And I still think that it
>> belongs
>>>> to
>>>> libcrypto, not openssl since you can easily not install openssl binary
>>>> and still use it with tuned openssl.cnf in your apps.
>>>
>>> So it seems like there are two packages that need this default
>> openssl.cnf
>>>  file, the libcrypto and openssl packages.  Would it perhaps be a better
>>>  idea to pull the configuration file into its own package and then set
>> the
>>>  RDEPENDS for the libcrypto and openssl packages to use the openssl
>>>  configuration package? That way you can still have multiple versions of
>>>  libcrypto (like Koen was trying to do) and have the default file shared
>>>  between both packages that need it.
>>
>> openssl is rdepending on libcrypto anyway (it's linked with it and I don't
>> think it'll change any time soon). But configs for different versions can
>> be
>> conflicting, so I'm not sure this kind of approach solves anything.
> 
> I noticed that.  I think the only thing that putting this into its own package would solve is addressing Koen's comment about having multiple versions of libcrypto installed.
> 
> Koen, can you comment on your change that moved the openssl.cnf file to the misc package?  Do you still need to be able to install multiple versions of libcrypto?

Yes, I still need to be able to do that, couldn't you just add an
rrecommend for -misc?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNCh3dMkyGM64RGpERAseRAJ9KEl9B6YuGjRmZNzK3mFGhMZlAlwCfYJqK
1MNv3HdFqJteWCrn+kFD48Q=
=eo6B
-----END PGP SIGNATURE-----



