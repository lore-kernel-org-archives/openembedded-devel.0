Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NNSGB-0004eh-1I for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 15:32:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NNSEN-0006af-4s
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 15:30:27 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 15:30:27 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 15:30:27 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Dec 2009 15:30:00 +0100
Message-ID: <hgt9h8$25m$1@ger.gmane.org>
References: <200912190854.11510.holger+oe@freyther.de>
	<hglsin$2vi$2@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <hglsin$2vi$2@ger.gmane.org>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Wed, 23 Dec 2009 14:32:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-12-09 20:05, Koen Kooi wrote:
> On 19-12-09 08:54, Holger Hans Peter Freyther wrote:
>> Hi Koen, All,
>>
>> we have the GLES problem once again in the Qt4 recipes. My opinion is
>> still
>> the same that a "bitbake meta-toolchain-qte" should work without
>> requiring
>> downloading proprietary stuff from TI/PowerVR.
> 
> Exactly
> 
>>  From what I think to know, the only difference between GLES and the
>> non GLES
>> recipe is that we have one plugin more. Koen could you help me to
>> verify that?
> 
> For qt/e it's one plugin more (a gfxdriver) and library (openvg) and for
> qt/x11 it's one plugin (gldriver) + 2 libs (opengl + openvg) more.

It looks like it also changes stuff in libQtGui(E) :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLMiloMkyGM64RGpERAsCYAKCu7ora2XgofUYjPZaznsbySr8x2QCglffO
97qYBGfnD1kQZYXvVm4/sNk=
=FvSK
-----END PGP SIGNATURE-----



