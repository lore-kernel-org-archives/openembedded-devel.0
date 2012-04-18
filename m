Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SKYds-0001Jd-Fo for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 19:26:08 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SKYUk-0004JR-IG for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 19:16:42 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 19:16:42 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 19:16:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 18 Apr 2012 19:16:32 +0200
Message-ID: <jmmst9$r5o$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Wed, 18 Apr 2012 17:26:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-04-12 17:19, Samuel Stirtzel schreef:
> 2012/4/1 Paul Eggleton <paul.eggleton@linux.intel.com>:
>> On Thursday 02 February 2012 12:50:16 Samuel Stirtzel wrote:
>>> There are other CMake configure pitfalls (all cross compiling
>>> scripts in kdelibs are commented out) but it seems that at least the
>>> most of them showed already during build time.
>> 
>> Unfortunately when I tried to build kdelibs4 I got the following:
>> 
>> | cd /home/paul/poky/poky/build-kde/tmp/work/i586-poky- 
>> linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc- 
>> r0/git/build/kjs &&
>> /home/paul/poky/poky/build-kde/tmp/sysroots/x86_64- 
>> linux/usr/bin/icemaker
>> /home/paul/poky/poky/build-kde/tmp/work/i586-poky- 
>> linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc- 
>> r0/git/kjs/bytecode | /bin/sh:
>> /home/paul/poky/poky/build-kde/tmp/sysroots/x86_64- 
>> linux/usr/bin/icemaker: No such file or directory | make[2]: ***
>> [kjs/opcodes.h] Error 127 | make[2]: Leaving directory
>> `/home/paul/poky/poky/build-kde/tmp/work/i586- 
>> poky-linux/kdelibs4-4.8.0+git1+1439483a67135f483632f4c4cd239e96d2ed61fc-
>>
>> 
r0/git/build'
>> 
>> Any ideas? Is this a PARALLEL_MAKE issue?
>> 
>> Cheers, Paul
>> 
>> --
>> 
>> Paul Eggleton Intel Open Source Technology Centre
> 
> Hi, these issues should now be resolved thanks to Kai Kang. It requires
> to rebuild qt4-native, also it is recommended to use Qt 4.8.0
> 
> 
> Currently I'm testing the images, so there hopefully won't be any build
> errors on them. Sysvinit images seem to be a bit tougher, since they fail
> postinsts for me; So I can't login on them.
> 
> 
> As of now I have a working KDE Plasma Desktop image (based on Angstrom's
> systemd image) that runs well on my overo. If anyone wants to try the
> image, there is a branch at the git repository [1] named
> sst-test-images.
> 
> It is planned to have Poky standalone images too, as well as Plasma
> Active images for both Poky and Angstrom (after Plasma Active is
> working).
> 
> 
> Feel free to comment on the images.

Giving them a spin now :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPjvbrAAoJEHZqAkdh1vT6H+EP/3+am7AdZK5y1smlgtApcMm+
Gh7ruIoJwedSICKp6rqRyM1lUssIrC/7QKri+5Ae0Cjw7h5aglEPIYXCoB39NRqw
o2aOUyTjVDxk4nbv+z/3WFxwHHx0053GYztJUWPBNVL77HPn+8rq5ALaMydCCheR
jjdS/+/2tuD+DxAeFOsFMj3zoh9CrKR605+AkxjTAtMNRZl7QjCdP9J1wjrXrDQ0
ZnSnTEIH8ycZPjCL3b5LvGxfjRdah1y9uCjlaRu9rjMXY/UHA3Nzr84TjvCW3iiN
s3R21ggaSPKINZ3irigViXOeKPDhr3FThNhsLVkLY41JBe0xXqt9LCs1GxYIMGfC
phP7wpsiFLLtePwcBPn5X3lL3JFBXVXqwgqo8Eb0W9u3tLypiV50C6+0L7XwZNVW
ERNmxw0fdd1UN9wzRxpOcKofmxwO2ZW4BfkS8xbxfXLIXz4AktCHb7IDtXJCr5nT
7rrH2iMvbDyzNnVssYS3Yl2GGNlbG6jwwyd6/09kDo4OJdMWFs1soAw2QiEEWY5A
jc7lW9o7Z3rlwtUiUIktLF2rkGv63IDuN9+xXNyKwBHoTqwjcGFG/8M7EPGc2hTQ
HmNxTdEiLTdEjsvjzTqwFP5hjtFznMGmFl1BtDfEb3/aw4GSbcCbrkU/LylXqkGs
Jcu04IswcM3pi2RcaaVX
=tuC9
-----END PGP SIGNATURE-----



