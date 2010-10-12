Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5cCP-0003fv-3s for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 12:35:18 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5cC0-0001PL-R3 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 12:34:48 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 12:34:48 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 12:34:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 12 Oct 2010 12:34:40 +0200
Message-ID: <i91dk0$7lv$1@dough.gmane.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>	<i9154e$2rk$1@dough.gmane.org>
	<AANLkTimnE3nuhgQQpCrZ0ymjzmLUkK0wxNX8bqJwa=AF@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTimnE3nuhgQQpCrZ0ymjzmLUkK0wxNX8bqJwa=AF@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv3 1/3] kernel bbclass: split do_compile into do_compile and do_compile_modules
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
X-List-Received-Date: Tue, 12 Oct 2010 10:35:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-10-10 12:08, Frans Meulenbroeks wrote:
> 2010/10/12 Koen Kooi <k.kooi@student.utwente.nl>:

>>> +}
>>> +
>>> +do_compile_kernelmodules() {
>>> +     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> 
> Is it needed/required?

It is, and it's in kernel.bbclass already:

fe938bbe (Michael Lauer 2004-12-14) kernel_do_compile() {
0448ec0d (Richard Purdie 2006-11-20)     unset CFLAGS CPPFLAGS CXXFLAGS
LDFLAGS MACHINE
fe938bbe (Michael Lauer 2004-12-14)     oe_runmake
include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"


> I'm a little bit concerned by this.
> (actually this was the only worry I had after reading the patch, don't
> want to loose additional CFLAGS settings here 

You actually want to do that, since the kernel is bare-metal, not userspace.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMtDm/MkyGM64RGpERAuFwAKCBzAXJwVvcQ6oh2DSISA/7Hhh8zACgp9M9
muqzjUd8tGg/RCZoEKmsU/4=
=1SOi
-----END PGP SIGNATURE-----



