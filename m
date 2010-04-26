Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6Uze-0007SG-VO for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 22:33:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6Uw8-0006tV-Mk for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 22:29:48 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 22:29:48 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 22:29:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Apr 2010 22:29:39 +0200
Message-ID: <hr4t3j$tds$1@dough.gmane.org>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
	<v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com>
	<hr3im2$gf6$1@dough.gmane.org>
	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-users@lists.openembedded.org
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Mon, 26 Apr 2010 20:33:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-04-10 20:41, Abhishek Sharma wrote:

> Thanks for the previous response. I did as suggested, but now the image
> built gives this sort of an error.
> kernel panic - not syncing: No init found. Try passing init= option to
> kernel

> I don't have a clue as to why this is happening, do i need to set something
> in my image-recipe or the app-recipe???

Ehm, you specified that it shouldn't contain an init with:

IMAGE_INIT_MANAGER = ""
IMAGE_INITSCRIPTS = ""

Why did you put those vars in if you to want /sbin/init to be there?!?!?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL1fexMkyGM64RGpERAsfhAJ4kyXGOYi26QA5ZHS3YwFrFiwYsyQCfVpvU
8/R9tQh7NSUZKFe++FKN+r4=
=7uwL
-----END PGP SIGNATURE-----



