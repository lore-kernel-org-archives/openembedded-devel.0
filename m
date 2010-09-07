Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Osxfg-00026B-LE for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:53:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Osxf3-0006ux-CZ for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:52:29 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 14:52:29 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 14:52:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Sep 2010 14:52:20 +0200
Message-ID: <i65ci4$4c3$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=0ukfZL=oQxGHXaoUg30TCu5LfkTKhrvCM5g8d@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTi=0ukfZL=oQxGHXaoUg30TCu5LfkTKhrvCM5g8d@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Tue, 07 Sep 2010 12:53:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-09-10 07:54, Khem Raj wrote:
> On Mon, Sep 6, 2010 at 3:21 PM, Steve Sakoman <sakoman@gmail.com> wrote:
>> Using current top of tree to build some of my images I noticed that
>> quite a few apps seems to be broken at run time (Firefox, Epiphany,
>> Gnome-mplayer, and others).
>>
>> All were complaining about libstdc++6 being missing.  Manually
>> installing the libstdc++6 package fixed the issue.
>>
>> Any idea what changed that introduced this issue?
> 
> Yes I have been seeing that and spent not so much time on the real cause
> but it seems that the depends get lost when we rename the pkgs in debian way
> may be thats not the real cause I dont know yet. but that something to look at
> even libstdc++-dev ipks miss to have dependencies on libstdc++

it happens when you build 'gcc' after 'gcc-cross', gcc will doesn't
create a libstdc6++ package, but it does create a libstdc-dev package.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMhjWEMkyGM64RGpERAkP3AJ9664771JV6Rap+9F6c9xbeh69fZgCggBVt
XerzMrwvIL7HaPknWKd816Y=
=t1WC
-----END PGP SIGNATURE-----



