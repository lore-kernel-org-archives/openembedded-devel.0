Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9idQ-0003wL-Vh for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 20:16:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9icp-0007lI-7L for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 20:15:27 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 20:15:27 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 20:15:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 23 Oct 2010 20:15:19 +0200
Message-ID: <i9v8nn$303$1@dough.gmane.org>
References: <1287841515-19825-1-git-send-email-koen@openembedded.org>
	<AANLkTinLeN9pCrmwtZYxv7HhLgzfhq+HKhkBm0hLpm9x@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTinLeN9pCrmwtZYxv7HhLgzfhq+HKhkBm0hLpm9x@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] module bbclass: split each module into a kernel-module-<foo> subpackage and use PN as metapackage
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
X-List-Received-Date: Sat, 23 Oct 2010 18:16:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-10-10 19:03, Chris Larson wrote:
> On Sat, Oct 23, 2010 at 6:45 AM, Koen Kooi <koen.kooi@gmail.com> wrote:
> 
>> From: Koen Kooi <k-kooi@ti.com>
>>
>> Signed-off-by: Koen Kooi <k-kooi@ti.com>
>>
>> ---
>>  classes/module.bbclass |  191
>> ++++++++++++++++++++++++++++++++++++++++++++++-
>>  1 files changed, 186 insertions(+), 5 deletions(-)
>>
> 
> 
> How about moving the common functions into oe.module or oe.package and using
> them from module.bbclass and kernel.bbclass?

I thought about that, but that needs more work :( We need to pass in a
different path to System.map, use PN as metapackage name, use a
different blacklist, etc.
That requires a lot more python skill than I currently have.

Apart from the horrendous code duplication, how does this look? It seems
to do the right thing for the recipes I tested with :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMwyY2MkyGM64RGpERAvl7AJ9vvDrrfJoJv2uWbBYFNMtmUSQBlQCgqyU/
g7/rxYKqcNnGn5ar1d+mFSY=
=9tBi
-----END PGP SIGNATURE-----



