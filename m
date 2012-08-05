Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxzOg-00032j-1g for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 13:53:26 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SxzDK-0001MD-Vi for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 13:41:42 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2012 13:41:42 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2012 13:41:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 05 Aug 2012 13:41:33 +0200
Message-ID: <jvlm56$r75$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jvk13l$nh$2@dough.gmane.org>
	<CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Sun, 05 Aug 2012 11:53:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-08-12 22:47, Khem Raj schreef:
> On Sat, Aug 4, 2012 at 1:36 PM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> 
>> As said before, this class isn't angstrom specific and it won't move
>> back to angstrom.
> 
> koen no one else is using it other than angstrom. but it interferes with
> similar class from OE-Core

I guess oe-core people need to be less anti-social with other layers then
and provide migration patches.

> so essentially you want to keep a feature thats just used by angstrom in
> a non angstrom layer?

No, I want the class deleted. But as I keep saying, the class was moved to
meta-oe on request because is was most certainly not angstrom specific. And
as angstrom maintainer I have no intent to add it back to the angstrom
layer. So your commit message is entirely wrong.

> doent sound logical to me. Would it be acceptable if angstrom used this
> feature from OE-Core as well ? then it will remove the usecase
> completely.

I keep waiting on the person that pushed it to oe-core to provide patches
for distro layers using the old functionality, see above.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQHlvtMkyGM64RGpERAlM+AJ0QIjUUJazAAA39xptb5OTVbU7GkQCgumJT
FFtbzZWd8sI4w3gPZJTLeho=
=mlaZ
-----END PGP SIGNATURE-----



