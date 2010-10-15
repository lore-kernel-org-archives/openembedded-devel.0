Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P6q6b-0001p5-UI for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 21:38:20 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P6q67-0000aU-T6 for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 21:37:47 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 21:37:47 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 21:37:47 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 15 Oct 2010 21:37:39 +0200
Message-ID: <i9aai3$tmj$1@dough.gmane.org>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<1287157281-31597-1-git-send-email-kergoth@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <1287157281-31597-1-git-send-email-kergoth@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 19:38:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-10-10 17:41, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> Given the current implementation of OVERRIDES in bitbake, the variable is
> expected to contain elements in the order least specific to most specific,
> however, our current usage of it does not match that.  As one example, "local"
> is supposed to always be the most specific override, yet currently it's the
> least specific.  As another example, currently the target architecture is seen
> as more specific than the machine, which is also clearly wrong.
> 
> Big thanks to Chase Maupin for investigating and identifying this long
> standing issue.
> 
> It becomes clear that a reversal of the current value will bring us to a more
> sane behavior, and avoids the need for the dual overrides hack mentioned in
> the comments, so this implements this reversal, and drops the unnecessary and
> confusing comments.
> 
> This also introduces a MACHINE_OVERRIDES variable as a generic mechanism to
> inject overrides elements which are more specific than the distro but less
> specific than the machine, which is where things like MACHINE_CLASS or
> SOC_FAMILY or the like would go.  This variable is *space* separated, to make
> it easier and more convenient to assemble the variable incrementally.
> 
> Reported-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Koen Kooi <k-kooi@ti.com>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMuK2DMkyGM64RGpERAsrgAJ0QbM4VQaERuv72HzOGZJKGqGxljwCfUpHL
wX5AXypHwuHP4cG9BKj7CjM=
=Jpyx
-----END PGP SIGNATURE-----



