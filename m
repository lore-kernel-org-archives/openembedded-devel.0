Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYdUn-0005yj-0K for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:45:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYdSZ-00046p-1q
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:43:19 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 11:43:19 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 11:43:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 23 Jan 2010 11:42:56 +0100
Message-ID: <hjejrf$m65$1@ger.gmane.org>
References: <201001230943.24210.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <201001230943.24210.holger+oe@freyther.de>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patchwork Workflow improvement
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
X-List-Received-Date: Sat, 23 Jan 2010 10:45:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-01-10 09:43, Holger Hans Peter Freyther wrote:
> Hi All,
> 
> right now I'm writing a Qt 4.6 based application that might help us a bit with 
> the patchwork queue.
> 
> The idea of the script is to have two things at the end:
> 	1.) a branch with all the patches that applied and that can be published
> 	2.) a list of patches that don't apply.
> 
> 
> What people are supposed to:
> 
> 1.) Cherry pick from the branch
> 2.) Send updated patches, close the reports on patchwork...

I think people that apply those patches to oe.dev should fix up the
commit message as well. The stack Khem pushed this week is just awfull.

I guess we should flag patches with bad commit messages as 'rejected' in
pw ASAP. We can weed out most of them by reject anything that lacks a
':' in the subject line.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLWtKwMkyGM64RGpERAgSAAJ4y0iproyWSH/ojheSFN40fdj16NgCfRfj3
rD4D/FAM3X5NeYdEUTRsbDQ=
=4N5e
-----END PGP SIGNATURE-----



