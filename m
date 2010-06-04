Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKTb0-00085A-Jy for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 11:53:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKTWk-0008Vd-1k for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 11:49:22 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 11:49:22 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 11:49:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 04 Jun 2010 11:49:13 +0200
Message-ID: <huai6q$553$1@dough.gmane.org>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>	<1275510896-30845-4-git-send-email-raj.khem@gmail.com>	<AANLkTimuc2dtfmbduEhLKLAxcjg_tR2Yah1jZxYBZp7y@mail.gmail.com>
	<AANLkTinv1zLuDcj3cFbLOGZC_hKorUmM3Tg04nk7Y6OW@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <AANLkTinv1zLuDcj3cFbLOGZC_hKorUmM3Tg04nk7Y6OW@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 03/16] gettext-0.18: Add recipe for 0.18
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
X-List-Received-Date: Fri, 04 Jun 2010 09:53:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-06-10 11:41, Martin Jansa wrote:
> On Fri, Jun 4, 2010 at 9:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> * gl_cv_func_unsetenv_works is not computed correctly in cross
>>>  environment so cache it.
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> I've forgotten to add that it needs automake-1.11 and
> angstrom-2008-preferred-versions.inc is locking older version
> PREFERRED_VERSION_automake-native = "1.10.3" - maybe not need anymore?

I'm not a big fan of bumping such basic toolchain bits, but fortunately
Graeme and I have already tested 1.11 and found it to be safe for the
important bits we build, so I guess angstrom can move to 1.11 if needed.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMCMwZMkyGM64RGpERAlX/AJ9KGlCl6LCXWVvf2U9QTH8odwgYRgCffApp
K6tQDNl9VsJFZFZ00GOlA4k=
=X0X/
-----END PGP SIGNATURE-----



