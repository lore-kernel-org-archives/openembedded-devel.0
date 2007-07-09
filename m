Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1I7zfa-0006tL-7t
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 22:17:18 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I7za7-0007s0-2l
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 22:11:39 +0200
Received: from host86-131-236-115.range86-131.btcentralplus.com
	([86.131.236.115]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 09 Jul 2007 22:11:39 +0200
Received: from koen by host86-131-236-115.range86-131.btcentralplus.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 09 Jul 2007 22:11:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Mon, 09 Jul 2007 21:11:31 +0100
Message-ID: <f6u4pj$fk0$1@sea.gmane.org>
References: <E1I7yE2-0000V0-1x@linuxtogo.org>
	<126613333.20070709215755@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: host86-131-236-115.range86-131.btcentralplus.com
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
In-Reply-To: <126613333.20070709215755@vanille-media.de>
X-Enigmail-Version: 0.95.2
Sender: news <news@sea.gmane.org>
Subject: Re: dbg packages
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
X-List-Received-Date: Mon, 09 Jul 2007 20:17:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dr. Michael Lauer schreef:
> koen commit wrote:
>> wireshark: fix -dbg
> [...]
>> +
>> +FILES_${PN}-dbg += "${libdir}/wireshark/plugins/${PV}/.debug"
>> +
>> +
> 
> We keep adding this stuff more and more -- since more and more
> packages go from a monolithic state to an extensible -- and
> I don't like having to specify this all over. Can't we get the dbg
> package to pick up all .debug directories automatically?

In this case I'd say "make wireshark even more granular by subpackaging its 2 shlibs and
plugins", which would not want every .debug directory in ${PN}-dbg.

In the general case I'm not sure if we want something automagically added to ${PN}-dbg or
not, since it is likely to be wrong in a lot of cases. So I'm not sure if something
automagically would cause more or less work for packages I want to add/maintain/fix.

What I would like to see implemented is some heuristic that puts .debug/<foo> in the -dbg
(sub)package that is named after the (sub)package that has <foo> (e.g. create
wireshark-plugin-<foo>-dbg automagically after finding <foo> in wireshark-plugin-<foo>).

Same goes for lib<foo>-dev automagically getting lib<foo>.{so,a,la,pc}, headers will have
to get sorted by hand.

Packaging is tedious, but let's not automate doing the wrong thing ;)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGkpZzMkyGM64RGpERAnhTAJsGakQCTjzec/sLVBoA9Zb/S6D7VwCdE8Qz
pnvest3WtETPsF4K93kWHWI=
=FrV+
-----END PGP SIGNATURE-----



