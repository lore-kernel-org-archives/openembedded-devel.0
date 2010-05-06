Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9uZq-00048A-Dg for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:29:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9uW8-0005Na-5r for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:25:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 08:25:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 08:25:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 06 May 2010 08:23:24 +0200
Message-ID: <hrtn8s$e9m$1@dough.gmane.org>
References: <1273102999.5743.49.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <1273102999.5743.49.camel@rex>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Thu, 06 May 2010 06:29:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-10 01:43, Richard Purdie wrote:
> I finally felt the time was right so I've merged the work-in-progress
> branch I've been talking about to OE.dev. This contains various
> architecture improvements and legacy staging cleanups that have been
> used in Poky for a while with great benefit.

With bitbake 1.10 I get:

NOTE: Preparing runqueue
Traceback (most recent call last):
  File "/OE/bitbake/lib/bb/server/none.py", line 128, in idle_commands
    retval = function(self, data, False)
  File "/OE/bitbake/lib/bb/cooker.py", line 730, in buildTargetsIdle
    retval = rq.execute_runqueue()
  File "/OE/bitbake/lib/bb/runqueue.py", line 830, in execute_runqueue
    self.prepare_runqueue()
  File "/OE/bitbake/lib/bb/runqueue.py", line 513, in prepare_runqueue
    if len(runq_recrdepends[task]) > 0:
IndexError: list index out of range

when doing MACHINE=beagleboard bitbake console-image

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4mBcMkyGM64RGpERAgqjAJ0aTRFgft4TINZP181N4jBgfOb2wQCfQMZD
2JHtNB/w4uDZJBkJMCcfyic=
=60rt
-----END PGP SIGNATURE-----



