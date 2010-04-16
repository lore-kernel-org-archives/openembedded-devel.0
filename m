Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O2h5Z-0001oq-3q for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 10:39:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O2h2C-0002vM-JZ for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 10:36:20 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 10:36:20 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 10:36:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 16 Apr 2010 10:36:11 +0200
Message-ID: <hq97hr$l0b$1@dough.gmane.org>
References: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
	<n2n141020e31004160117uafdaf45mb8a05ba17903a1de@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <n2n141020e31004160117uafdaf45mb8a05ba17903a1de@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Partial merge of SRCPV
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
X-List-Received-Date: Fri, 16 Apr 2010 08:39:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-04-10 10:17, Martin Jansa wrote:
> On Tue, Apr 13, 2010 at 1:23 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Please consider applying this patch series.
>>
>> Proposed and discussed in [1], the main reason for NACK (multiple builders
>> uploading to shared feeds) was resolved with bitbake patch [2] and it's
>> enabled by default in PATCH 1/6. It needs bitbake 1.10 or master, but Koen
>> confirmed yesterday that he is using 1.10 already.
>>
>> People not using multiple builders or any of changed recipes don't need to
>> upgrade their bitbake, just keep your tmp/cache dir even for rebuilds from
>> scratch (as you already should, if you have ever used AUTOREV).
>>
>> I'll keep SRCPV changes for other recipes in shr/unstable branch so maintainers
>> of other recipes can move to SRCPV easily too.
>>
>> WARNING: don't use BB_LOCALCOUNT_OVERRIDE with AUTOREV, it will make revision
>> counter in PV constant and chaning SRCREV is not enough to ensure increasing PV.
>>
>> [1] : http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01325.html
>> [2] : http://git.openembedded.org/cgit.cgi/bitbake/commit/?h=1.10&id=2f32735463159e9e42e03819d6b505dba49c7f17
> 
> No comment?
> 
> if nobody care then maybe we can push it even without
> BB_LOCALCOUNT_OVERRIDE enabled by default.
> It will be closer to current state and whoever needs it, can enable it
> for his local.conf or distro easily,
> without forcing AUTOREV people to enable it imediately after this push.

BB_LOCALCOUNT_OVERRIDE should be enabled by default, autorev people are
used to breakage.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLyCF7MkyGM64RGpERAqHPAJ4tD39hWTXCXmWcQQP5vBsqtpRObACfb9U7
H7tCZ4pDFGejbBj8lTXqgxQ=
=b58J
-----END PGP SIGNATURE-----



