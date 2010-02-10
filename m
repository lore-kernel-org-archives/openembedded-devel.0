Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfEIZ-0005wP-Ap for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 16:16:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfEG3-00031S-Ba for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 16:13:39 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 16:13:39 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 16:13:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 10 Feb 2010 16:13:15 +0100
Message-ID: <hkuie9$cjg$1@ger.gmane.org>
References: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>	<1263990478-28107-2-git-send-email-Martin.Jansa@gmail.com>	<1263990478-28107-3-git-send-email-Martin.Jansa@gmail.com>	<1263990478-28107-4-git-send-email-Martin.Jansa@gmail.com>	<1263990478-28107-5-git-send-email-Martin.Jansa@gmail.com>	<hkgqat$53c$1@ger.gmane.org>
	<20100210131122.GB3378@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <20100210131122.GB3378@jama>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 4/6] pixman: add version 0.17.4 with neon patches
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
X-List-Received-Date: Wed, 10 Feb 2010 15:16:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yes, that's the error

On 10-02-10 14:11, Martin Jansa wrote:
> On Fri, Feb 05, 2010 at 11:02:07AM +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> This one fails to build for armv7a with some weird libtool problem
> 
> Does that error look like:
> 
> /bin/sh ../arm-oe-linux-gnueabi-libtool --tag=CC   --mode=link arm-oe-linux-gnueabi-gcc -march=armv4t -mtune=arm920t -mthumb-interwork -mthumb  -isystem/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -Wall -fno-strict-aliasing -fvisibility=hidden  -L/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib -Wl,-rpath-link,/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=gnu -o gradient-test gradient-test.o gtk-utils.o -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lglib-2.0   -L.. ../pixman/libpixman-1.la
> arm-oe-linux-gnueabi-libtool: link: cannot find the library `/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la' or unhandled argument `/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la'
> make[2]: Leaving directory `/home/projects/OE/tmpdir-dev-shr/work/armv4t-oe-linux-gnueabi/pixman-0.17.4-r1/pixman-0.17.4/test'
> 
> If yes than it's because
> -lpangocairo-1.0 -lcairo from GTK_LIBS have /home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la 
> in their own .la files and this way it creates circular dependency, which fails when armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la
> is removed during upgrade.
> 
> Removing those 2 libs from GTK_LIBS works as well as removing libpixman-1.la reference from their staged .la files.
> 
> Please advise how to fix it properly.
> 
> BTW: this is not new issue with 0.17.4, I had that before (and tried to resolve it with latest cleanup of old libpixman-native recipes)
> 
> Regards,
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLcs0LMkyGM64RGpERAmPbAKC7cTwWXilKLuleYVJINLVBikRuJACgjsD2
BFemPUDJUefDUXm4yJajLRI=
=BNDk
-----END PGP SIGNATURE-----



