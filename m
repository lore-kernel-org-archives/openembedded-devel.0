Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JfBwb-000859-Eo
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 11:36:21 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JfBwV-000522-Kr
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 10:36:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 10:36:15 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 10:36:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Fri, 28 Mar 2008 11:36:05 +0100
Message-ID: <fsihmm$dr3$1@ger.gmane.org>
References: <20080328011211.7c66e00b@zaurus>	<1206696274.5029.14.camel@dax.rpnet.com>
	<1206699605.18251.39.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1206699605.18251.39.camel@hammer.suse.cz>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: binconfig.bbclass breaks packages QA
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
X-List-Received-Date: Fri, 28 Mar 2008 10:36:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stanislav Brabec schreef:
| Richard Purdie wrote:
|> On Fri, 2008-03-28 at 01:12 +0100, Stanislav Brabec wrote:
|
|>> After the fix, maybe binconfig files could be moved to the
|>> standard staging directory (it must be in build path then).
|>>
|>> Could anybody with deeper insight confirm it or do this change?
|> We still need that mangling unfortunately.
|
| Grr.
|
| | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:
/usr/include/freetype2
| | cc1: internal compiler error: in add_path, at c-incpath.c:371
|
| We may want -isysroot instead of -isystem (and report bug above to gcc
| developers, as the report advices), but only for cross builds.

We patch gcc to ICE on including /usr/include, /opt/include, etc, so we
shouldn't report them to the gcc people, but spank the application
authors where appropriate.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH7MoVMkyGM64RGpERAonaAJ9f8dqydelLPQc93nD0n1Qh+856cwCfeNNu
0BoSRuHZyQA4zwMnDGf6R44=
=UJik
-----END PGP SIGNATURE-----



