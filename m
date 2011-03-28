Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q4Hfq-00062N-N4 for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 21:00:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q4Hdx-0002Gq-KQ for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 20:58:25 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 20:58:25 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 20:58:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 28 Mar 2011 20:58:12 +0200
Message-ID: <imqlo4$ohv$1@dough.gmane.org>
References: <4D909B3E.5030201@balister.org> <imq7o7$sa6$1@dough.gmane.org>
	<4D90A3BA.6000609@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D90A3BA.6000609@balister.org>
X-Enigmail-Version: 1.0.1
Subject: Re: Problem with qmake2 and native sdk
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
X-List-Received-Date: Mon, 28 Mar 2011 19:00:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-03-11 17:05, Philip Balister wrote:
> On 03/28/2011 10:59 AM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 28-03-11 16:29, Philip Balister wrote:
>>> I building PyQwt on an omap3 suing the qt native sdk. This leads to the
>>> following message:
>>>
>>> Could not find mkspecs for your QMAKESPEC(linux-g++) after trying:
>>>          /home/balister/oe/tmp/sysroots/x86_64-linux/qt4/mkspecs
>>>
>>> I can work around this by editing the PyQwt configure.py file to use the
>>> full path to the linux-g++ spec file, but it would be nice if this
>>> worked out of the box.
>>>
>>> Does anyone know how to change the default spec file path in qmake2?
>>> I've looked at the recipe and nothing jumps out at me to try.
>>
>> If you are using angstrom, 'opkg install qt4-mkspecs' and source the
>> script that should be in there. That should install the specs and set
>> QMAKE* properly.
> 
> Already done :) I also have an uncommitted patch that adds a var for
> strip to the environment file. I looked at the env file and didn't see
> anything to change there either :(

In that case the OE patch to make qmake honour env vars might have
gotten lost. Can you compare the 4.6.x and 4.7.x patches?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNkNpEMkyGM64RGpERAk63AKCBAhqhScCvx9z/sF7U5qGoEhqe+ACgleh5
o1zMQiFCvov11hvc10K/s8Q=
=JeQb
-----END PGP SIGNATURE-----



