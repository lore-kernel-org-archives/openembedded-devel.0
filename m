Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ne4kj-0005Ek-PC for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 11:52:36 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ne4iK-00085m-Mz for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 11:50:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 11:50:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 11:50:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 07 Feb 2010 11:44:53 +0100
Message-ID: <hkm5j4$fib$2@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: TSC meeting minutes 20100204
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
X-List-Received-Date: Sun, 07 Feb 2010 10:52:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

TSC Meeting 20100204

Attendees: Chris, Graeme, Koen

Looking back a the past month the naming and shaming campaign for bad
commit messages seems to work well. People also seem to be able to solve
problems themselves instead of moving everything to the TSC.

The TSC also discussed where variable defaults should be and Chris is
going to start a wiki to form an idea on the scope of the cleanup and
gauge interest in a 'kernel janitors' type of project for it.

The TSC is also wondering what our userbase wants OE to be like and what
to focus on, but we need to find the right tools to ask such questions
first, the website vote method is just too passive.

On overriding default variables the TSC is very clear: we should try to
make it impossible to do things like PACKAGES = "of". An idea would be
to move the PACKAGES =+ -dbg, -dev, doc to e.g. package.bbclass. More
thought on this is needed.

The last two items discussed were new-style staging and packaged
staging. The TSC would like to *strongly* encourage people to move their
recipes to new style staging. If you are using packaged-staging with a
big TMPDIR (e.g. a few machines with big images built) legacy staging
will easily take more than 15 minutes per recipe because it scans
through the complete staging looking for changes.

The consensus in the TSC is that DISTROs are in charge of enabling
packaged-staging or not, but keeping the non-packaged-staging working
well is not a priority.

End of meeting

Postscript: Richard mentions that keeping non-packaged staging working
will be a major pain, so DISTRO maintainers should aim to enable it so
OE can move forward.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLbpmlMkyGM64RGpERAtgXAJ9q7s562EhMwdNRbfBcu2R+1dVwywCfdPEl
rgF/e2PDzsBkUj0Kf12y/wE=
=kLei
-----END PGP SIGNATURE-----



