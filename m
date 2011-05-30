Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QR0oY-0002cr-Eu for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 13:39:18 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QR0lX-0007S7-VF for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 13:36:11 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 13:36:11 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 13:36:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 30 May 2011 13:35:59 +0200
Message-ID: <irvvev$vsj$1@dough.gmane.org>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>	<c424bae29966b789e50eb4112a9d95a2b7833942.1306706130.git.Martin.Jansa@gmail.com>	<1306720135.5979.1.camel@perseus>	<20110530053016.GE18119@jama.jama.net>	<irvd51$kf9$1@dough.gmane.org>
	<20110530093039.GF18119@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110530093039.GF18119@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 07/14] libelf: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Mon, 30 May 2011 11:39:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-05-11 11:30, Martin Jansa wrote:
> On Mon, May 30, 2011 at 08:23:33AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 30-05-11 07:30, Martin Jansa wrote:
>>> On Sun, May 29, 2011 at 06:48:55PM -0700, Khem Raj wrote:
>>>> On Sun, 2011-05-29 at 23:56 +0200, Martin Jansa wrote:
>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>
>>>> You do not need to import libelf recipe. oe-core provides libelf via
>>>> elfutils change the depending recipes to depend on elfutils instead.
>>>
>>> OK, thanks! Will test and update patch.
>>> koen: should I update patch in same branch or send new patch removing
>>> libelf and changing deps?
>>
>> updating the branch would be good enough for me.
> 
> updated branch pushed
> libelf removed and ltrace DEPENDS updated and moved to recipes-devtools
> devmem2 removed from branch because it was already applied :)

I cherry-picked devmem2 since I needed it for something in meta-ti I had
already pushed :)

Anyway, the rest is in as well now.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN44EeMkyGM64RGpERAp2sAKC43/IKsjZ5rP9PDLOHuxs9l1Z0NwCgoXm1
R10Mh9E8khV0LK9wkGZAOxk=
=mxOk
-----END PGP SIGNATURE-----



