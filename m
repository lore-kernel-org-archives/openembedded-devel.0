Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SPqwC-0002yq-Mw for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 09:58:56 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SPqmm-0000FS-Ha for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 09:49:12 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 09:49:12 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 09:49:12 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 03 May 2012 09:48:57 +0200
Message-ID: <jntd9a$pip$1@dough.gmane.org>
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
	<4F9F8630.3070901@gmail.com>
	<CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
	<4FA0FFD5.6080201@gmail.com> <4FA1A1C8.3030705@gmail.com>
	<4FA22A58.3040100@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <4FA22A58.3040100@gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Thu, 03 May 2012 07:58:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-05-12 08:48, Martin Ertsås schreef:
> On 05/02/12 23:06, Khem Raj wrote:
>> On 05/02/2012 02:35 AM, Martin Ertsås wrote:
>>> The patches posted seems to be working fine. I at least didn't have 
>>> any problems with them.
>> 
>> 
>> thanks for trying them out. GCC patch is final but eglibc patch I still
>> got to improve that its not final version yet.
> 
> No problem. Is there also plans for renaming the toolchains created to 
> arm-none-linux-gnueabihf when using hardfloats?

What's the point in that? Renaming the toolchain won't grant it magical
powers and setting a targetvendor is perfectly valid.

I've seen too many presentations this year at ELC and Collab where someone
says "renaming the toolchain fixed it" when they actually mean "using a
bare-metal toolchain for userspace doesn't really work".
Just look at the building the kernel with LLVM talk, a third of Marks
presentation was about challenges with calling the right toolchain with the
right arguments.

</rant>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPojhnAAoJEHZqAkdh1vT63s0P/2yoPsNlXRcLHGfeH7SCtEHP
2fxZMUmxRzZjPF/rwqWCBwyHEseGtL15AfetHK2Ylvi+Pzw0Z+d5GpNlzwj4pBNo
JguZ6+4xo6Kd0mKxk9PN99ebcPYsQo23Hqs6Bpk6roYJNoBtmqUusZ/M0VoS+k/E
7KwUwYUjL1mONDpKWjPkuC2apkjjI/XQ/a9r0RlQ8qzKaMJDg8rJkRFV8Yzzrlxu
0DRjs+EyTjM/VUGXTxdnjsQwV4lbZC0bw9rZhISsXwG5JFEJVjkZ9pMMexqkAX7C
pE6YBWxAZ8g3ZAWd9AVwne4xR99xCPtYyqVr3smeEi+mxu+SLkZFaZvyFLhHsaBj
uRM9sKinrnnUdpWxCZ4qoNJ4j0h2tT7/wqBXsNyK5+0XmfJba58ZfyY2t8xSi4qn
d89gQ/iYTHCDpW+7Rogp5WNzhS2Y8a+ecvbP1zQHZitEfaA4TXUxB1x9hsqWVuT8
2RbVAIMgytCrj9sshdlAaWkFReF7CKSp7zMwn3FLCKFPLSsS7P260MQRWqpGJXjS
yPTaFgFeWBRbSOMtg8l2LP5gDVuyg1BrdmiRVycX/gOgj4ZTfMPOooyAWttVMj95
4cZO1yiCU4de8Fd2+8QW4KrUJhnKcI+pHZn0pP4qHMuKUoh+o0dbCz/O7OCK9now
VqIPweynKVrQ5SF8ZhYa
=F3G4
-----END PGP SIGNATURE-----



