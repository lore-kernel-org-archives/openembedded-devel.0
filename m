Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RE4GD-0001ge-W2 for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 21:14:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RE4Aj-0001wS-24 for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 21:08:57 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 21:08:57 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 21:08:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 12 Oct 2011 21:08:40 +0200
Message-ID: <j74ojo$oi8$1@dough.gmane.org>
References: <4E958698.1030800@ts.fujitsu.com> <4E95DBA0.9080307@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <4E95DBA0.9080307@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: OE beginner constantly failing to build anything
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
X-List-Received-Date: Wed, 12 Oct 2011 19:14:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-10-11 20:25, Khem Raj schreef:
> On 10/12/2011 5:22 AM, Rainer Koenig wrote:
>> Hi there,
>> 
>> the following lines might give you the feeling of a rant, sorry about 
>> that but after 2 weeks of no success I need to write down quickly what 
>> bothers me. Please don't feel offended by my deep desperation. ;-)
>> 
>> My build system is running Debian/Squeeze (amd64) and I also
>> downloaded the CodeSourcery Toolchain. Was able to compile a simple
>> hello world with that for Angstrom, but now I wanted to build Angstrom
>> from scratch.
>> 
>> So I started with OE classic, tried the "getting started" from the PDF 
>> docs and failed. I learned quickly that there are version dependencies 
>> between bitbake and the version that I checkout of the OE tree. I also 
>> learned that some of the failures come because I tried to bild "old" 
>> images and meanwhile the sources that bitbake wants to fetch seem to 
>> have moved to another place or got deleted. I tried according to the 
>> wiki docs that said OE 2011.3 works with bitbake 1.12.0 but even then
>> I failed. Last failure had to do with building libtool-2.4-cross when
>> the build system told my that my compiler can't create binaries...
>> after the process has build around 60+ packets without any problem.
>> 
>> Well, I learned that OE classic is no longer maintained and that I 
>> should switch to OE-core. So I said, lets start from scratch again and 
>> see. I followed the Angstrome building instructions as they are
>> written here: 
>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/angstrom-layers/tree/README
>>
>>
>>
>> 
Did everything that was described there and faild again. This time
>> with the following errors: 
>> ----------------8<-snip---------------------- bitbake base-image Pseudo
>> is not present but is required, building this first before the main
>> build NOTE: angstrom DOES NOT support libiconv because the eglibc
>> provided iconv library is used                         | ETA:
>> 00:04:17 NOTE: angstrom DOES NOT support libiconv because the eglibc
>> provided iconv library is used                         | ETA:
>> 00:04:16 NOTE: angstrom DOES NOT support gconf-dbus because gconf-dbus
>> has been merged back into main GConf                 | ETA:  00:03:57 
>> NOTE: angstrom DOES NOT support gconf-dbus-native because gconf-dbus
>> has been merged back into main GConf ERROR: Error Method already seen:
>> get_tls_setting in' glx-use-tls.inc' now in 'glx-use-tls.bbclass'
>> | ETA:  00:02:59 ERROR: Could not include required file 
>> recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc | ETA:
>> 00:02:01 ERROR: Command execution failed: Exited with 1
> 
> bad timing. There is a bit of churn due to xorg updates happening in
> core layer and other layers need to adjust once the core parts are
> settled in. This is master so expect few bleeding here and there
> occasionally
> 
>> ----------------8<-snip----------------------
>> 
>> Then I read "glx-use-tls" and remembered to saw that in the list
>> archive of today. There is a mail from Khem Raj Subject: [oe]
>> [meta-oe][PATCH 1/2] classes/glx-use-tls.bbclass: Delete
>> 
>> Yeah. I checked my meta-oe tree and glx-use-tls.bbclass is still
>> there. Then I checked where that tree came from, it comes from github,
>> but nevertheless, also the tree from http://git.openembedded.org at
>> the moment has no patch like that applied.
>> 
>> So I need to start questions:
>> 
>> 1. Is there any *failsafe* procedure that lets me build some image for 
>> my beagleboard? I'm relatively new to embedded linux and I need to
>> read a lot about bitbake and oe, but failing with every "getting
>> started" instructions doesn't give me much confidence that I will ever
>> succeed.
>> 
>> 2. How are patches applied in OE? The patch from Khem Raj is not yet
>> in the git-tree, so how can I patch it to my tree.
> 
> with some git-fu you can. (git am) can help
> 
> However those patches are just a workaround to keep parsing happy they
> are not final patches that should go into repo.
> 
>> 
>> 3. I tried to search for the bugs I encountered and found out that you 
>> have abandoned a tool like Bugzilla in favor of reporting bugs on the 
>> mailing list. From my perspective the mailing list is not very helpful 
>> to *find* information about existing bugs and their status, so is
>> there a reason for this switch that I can understand?
> 
> It has been discussed extensively and decision to have mailing list was
> the outcome. You can searc through mailing list archives to gmane will 
> help you.
> 
>> 
>> I think there are solutions for my problem, the fact that Angstrom 
>> exists and can be downloaded makes me think that somebody was able to 
>> build it from the sources, but it seems that I got the wrong moment in 
>> time for my attempts so all the sources and recipes that I'm depending 
>> on are constantly changing and I always get lost in the gory details.
>> 
> 
> generally everybody builds from source every day its a norm with
> openembedded.
> 
> You could try the 2011.03 release branch which should be pretty stable

Especially if you're using the angstrom setup script instead of some 'pdf'


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOleW3MkyGM64RGpERAlyMAJ0dfeEZXFcyIzV89PW1mCBqryQxsQCfWlYC
zyytAMBH3V7o3TlcGTJmorA=
=Oy8j
-----END PGP SIGNATURE-----



