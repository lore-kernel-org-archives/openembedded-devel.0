Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOzTF-0006eh-J5 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 22:44:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOzOu-0001m4-LT for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 22:39:56 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 22:39:56 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 22:39:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Jun 2010 22:39:46 +0200
Message-ID: <hvbcqi$kvv$1@dough.gmane.org>
References: <E1OOdAL-0005Tc-Dn@melo.openembedded.org>	<hv9seb$ks1$1@dough.gmane.org>
	<hvajqb$i26$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <hvajqb$i26$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Khem Raj : gnu-config: Add recipe for git version.
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
X-List-Received-Date: Wed, 16 Jun 2010 20:44:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

As a side note, if for some reason you didn't get hit by the dependency
bug and have managed to fetch it, remove the
git_git.savannah.gnu.org.config.git_e35217687ee5f39b428119fe31c7e954f6de64f0.tar.gz*
files from DL_DIR, they probably have different checksums.

If you look closely at
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=54ca80948f1e867c3623af754be97d3b96bc31ec
you'll notice checksums.

Adding a *second* set of checksums like
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=8fcab9f2a9952270f00d68003997208073168567
is doing, is wrong, so:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=197acb9de5f0404049a1f4da97d3085ba27cb910

That makes it work again as intended. I would encourage security minded
people to download the snapshot and diff it against the git tree to
verify that it has no hidden backdoors added to it.

On 16-06-10 15:32, Koen Kooi wrote:
> On 16-06-10 08:54, Dmitry Eremin-Solenikov wrote:
>> git version control wrote:
> 
>>> Module: openembedded.git
>>> Branch: org.openembedded.dev
>>> Commit: 473cd5f616190739550abd8bf71629a87036730b URL:   
>>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=473cd5f616190739550abd8bf71629a87036730b
>>>
>>> Author: Khem Raj <raj.khem@gmail.com>
>>> Date:   Tue Jun 15 13:52:40 2010 -0700
>>>
>>> gnu-config: Add recipe for git version.
>>>
>>> * Rename gnu-config to files folder.
>>>
>>> Signed-off-by: Khem Raj
>>> <raj.khem@gmail.com>
> 
>> Unless I have git-native in ASSUME-PROVIDED, this breaks builds with:
>> ERROR: Unbuildable tasks were found.
>> These are usually caused by circular dependencies and any circular dependency chains found will be printed below. Increase the debug level to see a list of unbuildable tasks.
> 
> I changed it to fetch a snapshot instead, dep loop gone. Hopefully Khem
> will learn from this and not but tons of stuff in ASSUME_PROVIDED on his
> machine anymore...
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMGTaSMkyGM64RGpERAtSHAKC3pXlag5kqgYJbfiRejtHImk19BwCglQfI
RGIzMF+oAI34OeynpKZiPeY=
=c0JN
-----END PGP SIGNATURE-----



