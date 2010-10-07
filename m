Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P3kj4-0004B4-Pl for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 09:17:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P3kil-0002Za-RG for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 09:16:55 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 09:16:55 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 09:16:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 07 Oct 2010 09:16:47 +0200
Message-ID: <i8js4v$ocr$1@dough.gmane.org>
References: <AANLkTik3=c=HKZ+EHkan8OSZDt8JfS+bbj5ZtBgJgBpM@mail.gmail.com>
	<AANLkTiknm8zsMUOFVfRXcZOGxitgjZPy8WxnnaU6hvMQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTiknm8zsMUOFVfRXcZOGxitgjZPy8WxnnaU6hvMQ@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libvpx should not inherit autotools
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
X-List-Received-Date: Thu, 07 Oct 2010 07:17:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-10-10 08:26, Khem Raj wrote:
> On Wed, Oct 6, 2010 at 10:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi Koen
>>
>> libvpx recipes are inheriting autotools while it seems to me that they
>> should not. Yes it does have a configure script but its not autoconf
>> generated but a hand written one
>> and there are no other traces of autoconf or automake and stuff that
>> goes with normal automake autoconf build systems.
>>
>> Would you take a look at it ?
> 
> something like attached would work. What do you think ?

That works for me, I was just too lazy to create the do_compile and
do_install :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMrXPfMkyGM64RGpERAu6qAJ9N6gQM1etGUzSsClL/TRYXYiTKsQCfZTRD
D2oDrFbvVot3RDKPS7DdEko=
=l+C2
-----END PGP SIGNATURE-----



