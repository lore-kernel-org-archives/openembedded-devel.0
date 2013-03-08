Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UDwdp-0004sB-4T for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 13:43:20 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UDwOA-0006Jj-2A for openembedded-devel@lists.openembedded.org;
	Fri, 08 Mar 2013 13:27:06 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2013 13:27:06 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2013 13:27:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 08 Mar 2013 13:26:31 +0100
Message-ID: <khcldh$htt$1@ger.gmane.org>
References: <1362521704-25965-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRT+RDine-AZQx+K8oaf25mncrHvvbYq5FMNS7TnXQU0Pw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <CALbNGRT+RDine-AZQx+K8oaf25mncrHvvbYq5FMNS7TnXQU0Pw@mail.gmail.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe][PATCHv2] poppler: upgrade to 0.18.4
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
X-List-Received-Date: Fri, 08 Mar 2013 12:43:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 08-03-13 12:25, Andreas Müller schreef:
> On Tue, Mar 5, 2013 at 11:15 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>> * 0.18.0 was failing to build after libpng was upgraded to 1.6 in
>> oe-core
>> 
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
>> meta-oe/recipes-support/poppler/poppler_0.18.0.bb | 12 ------------ 
>> meta-oe/recipes-support/poppler/poppler_0.18.4.bb | 10 ++++++++++ 2
>> files changed, 10 insertions(+), 12 deletions(-) delete mode 100644
>> meta-oe/recipes-support/poppler/poppler_0.18.0.bb create mode 100644
>> meta-oe/recipes-support/poppler/poppler_0.18.4.bb
>> 
> Maybe it is a temporary problem but I get
> 
> ERROR: Fetcher failure: Fetch command failed with exit code 4, no output 
> ERROR: Function failed: Fetcher failure for URL: 
> 'http://poppler.freedesktop.org/poppler-0.18.4.tar.gz'. Unable to fetch
> URL from any source. ERROR: Logfile of failure stored in: 
> /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/poppler/0.18.4-r0/temp/log.do_fetch.20883
>
> 
ERROR: Task 4
(/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-support/poppler/poppler_0.18.4.bb,
> do_fetch) failed with exit code '1'

FDO is flakey this week. Rumour has it's being slashdotted due to the new
systemd release.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFROdj3MkyGM64RGpERAguqAJ9Tb8xRLeFzdZ1+LBqE3tVVIxxW8wCeIPQ0
Hjqlkm2gjhzS4Y2yegVym8s=
=8w7W
-----END PGP SIGNATURE-----



