Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NjwGm-0001J6-Tv for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 16:01:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NjwE9-00067g-Bp for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 15:59:09 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 15:59:09 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 15:59:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Feb 2010 15:58:55 +0100
Message-ID: <hm0qff$9v8$1@dough.gmane.org>
References: <mailman.3988.1266916925.14961.openembedded-devel@lists.openembedded.org>
	<4B83DC88.7070705@tycoelectronics.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <4B83DC88.7070705@tycoelectronics.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: reply to digest mails, was: Re: Openembedded-devel Digest, Vol 43, Issue 98
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
X-List-Received-Date: Tue, 23 Feb 2010 15:01:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

When you receive a digest mail it tells you to change the subject line
to something non-bogus. Please do so in the future.

If it turns out tha that is too hard for people we can consider turning
off digests.


On 23-02-10 14:47, Jay Snyder wrote:
>>
>>
>> try the following:
>> TARGET_CC_ARCH += "${LDFLAGS}"
>> This should resolve your problems if you build your executable from
>> within your OE buildsystem.
>> In very rare cases (e.g. when you build some programs outside of OE
>> but use OE to package all) it could be useful to use the following:
>> INSANE_SKIP_objc = "True"
>> AFAIK that sould not be commonly used, but it worked for me.
>>
>> majo
>>
> 
> Updating my GCC recipe with a "git pull" worked (the INSANE_SKIP_obj
> line got added sometime recently).
> 
> The TARGET_CC_ARCH += "${LDFLAGS}"  fix is the first thing that I try
> when i get this problem, and usually fixes it, although there are some
> packages that required patching Makefile.ac files throughout the
> project.     As I just stated in another reply, when I get beyond the
> current project time crunch (coming up on a release deadline), I will
> submit my recipe patches for inclusion in the OE git repository.
> 
> Thanks,
> Jay

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLg+0vMkyGM64RGpERAoELAKCTgm09I1gjcpAGVfd4CcTpD6WE7wCfdJ/k
spNEAoXQJqueAMXjoPCgqS8=
=Kt9W
-----END PGP SIGNATURE-----



