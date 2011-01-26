Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PiDi1-0002kY-KY for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 23:19:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PiDhH-0000x0-OR for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 23:18:39 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 23:18:39 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 23:18:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 26 Jan 2011 23:18:26 +0100
Message-ID: <ihq6ji$ftc$1@dough.gmane.org>
References: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: oestats as automated testing reporting tool (Was: testing branch 2011-01-20)
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
X-List-Received-Date: Wed, 26 Jan 2011 22:19:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-01-11 23:04, Yury Bushmelev wrote:
> I have spent some time to looking over oestats client and server code.
> Below are some ideas.
> 
>> I've thought about collecting testing results via oe-stats.
>> We should collect following data:
>> - machine
> Already in oestats (bb MACHINE variable)
> 
>> - distro
> Already in oestats (bb USERDISTRO variable)
> 
>> - target
> Well.. This should be name of image which was built. We have it but it
> is mixed with lots of other packages data.
> Not sure about best way here. May be we should use bitbake cmdline
> args here. I'll address this question to bitbake developers.
> 
>> - workstation (distro + arch)*
> We have build arch in oestats already (BUILD_ARCH). I'll prefer
> replace it with BUILD_SYS because we can use e.g.
> darwin/freebsd/cygwin as build host later.
> As there is no reliable way to get user's build host distro I'll ask
> to introduce new bitbake variable (OESTATS_HOST_DISTRO?).
> 
>> - bitbake version*
> Seems bb.__version__ should be enough. Should we send revision and
> branch when using git version?
> 
>> - tester (builder) name
> OESTATS_BUILDER
> 
>> - last successful build
> Report may get this from database.
> 
>> - build type (clean/incremental)*
> OESTATS_BUILD_TYPE?
> 
>> - current issues
> Report may get this from database.
> 
> I've forget to note that we have METADATA_BRANCH and METADATA_REVISION
> as well in oestats.
> 
> P.S.: Do we really need this in perspective of merging with yocto? Or
> may be just use e.g. some spreadsheet/form on google instead?

We really need an automated way to get these reports and it looks like
oestats is already 95% there :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNQJ2xMkyGM64RGpERAtWaAJ9uSkSOLqFHkA0+iCq0eTmW30PPYgCeMiGH
rsISLjJcPNOOQpg8bOHiS68=
=t0lU
-----END PGP SIGNATURE-----



