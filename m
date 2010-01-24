Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYzlm-0003KF-5I for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 11:32:41 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYzjX-0005Lo-8A
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 11:30:19 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 11:30:19 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 11:30:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 Jan 2010 11:29:56 +0100
Message-ID: <hjh7f3$6v0$2@ger.gmane.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100124070602.GA8642@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <20100124070602.GA8642@denix.org>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Sun, 24 Jan 2010 10:32:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-10 08:06, Denys Dmytriyenko wrote:
> On Sat, Jan 23, 2010 at 09:06:13PM +0100, Paul Menzel wrote:
>> does [1] still describe the official policy to add checksums? Or is
> 
> No
> 
>> putting them into the recipes preferred nowadays?
> 
> Yes

I think not! The new format:

* is not documented
* it has no tools to autogenerate it
* has not been agreed on in any way.

As an experiment I tried to use it for a branch at work and I
*absolutely* hate the workflow needed for the new format.

With checksums.ini it's a matter of:

either

cat /OE/tmp/checksums.ini >> conf/checksums.ini ; python
contrib/source-checker/oe-checksum-sorter -i conf/checksums.ini

or

Verbatimly copy/paste the *output* OE gives you into conf/checksums.ini.

These concerns have been raised time after time and still haven't been
addressed, so for now:

checksums.ini is the way to go
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXCEkMkyGM64RGpERAsSuAKCL8RKc/w03gNou79d3HXJbf8wqtACgnkrn
0jZ/RL/sSIoBxyLT4vGaMdc=
=K1O3
-----END PGP SIGNATURE-----



