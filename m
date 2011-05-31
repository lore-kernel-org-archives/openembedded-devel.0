Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRRy4-0003TW-B9 for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 18:38:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRRv1-0002D0-JJ for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 18:35:47 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 18:35:47 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 18:35:47 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 31 May 2011 18:35:33 +0200
Message-ID: <is35cl$1jv$1@dough.gmane.org>
References: <cover.1306856963.git.Martin.Jansa@gmail.com>	<b2a70421756ef2cc7d59c82fb4cd02141e99a52c.1306856963.git.Martin.Jansa@gmail.com>
	<20110531155728.GA23647@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110531155728.GA23647@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 1/3] xserver-xorg: upgrade from 1.10.1.902 to 1.10.2 and replace part of randr-support.patch with upstream patch
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
X-List-Received-Date: Tue, 31 May 2011 16:38:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-05-11 17:57, Martin Jansa wrote:
> On Tue, May 31, 2011 at 05:49:53PM +0200, Martin Jansa wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
> 
>> -EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
>> +EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
>>  EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
>>  
>>  export LDFLAGS += " -ldl "
> 
> I forgot to update commit message, but I've also enabled kdrive/xephyr
> per otavio request from oe.dev where it did ICE with gcc-4.5
> 
> With gcc-4.6 from meta-oe it builds fine, would be great if someone with
> gcc-4.5 from meta-oe or gcc-4.6.0/gcc-4.5.0 from oe-core test it before
> merging it.

NOTE: package xserver-xorg-2_1.10.2-r19.0: task do_package_write_ipk:
Succeeded

That's with gcc 4.5 from meta-oe
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN5RjVMkyGM64RGpERAv1lAJ0WqF3O/dPkqct2pBI6GIfqi9M0VgCfU0VP
ka4YCQGKHLC+Yo9OaLRbXeo=
=YcuN
-----END PGP SIGNATURE-----



