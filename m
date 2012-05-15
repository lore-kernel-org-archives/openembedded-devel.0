Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUEI2-0004iy-8V for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 11:43:34 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SUE8L-0001CK-7v for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 11:33:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 11:33:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 11:33:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 May 2012 11:33:16 +0200
Message-ID: <jot7t2$gbg$1@dough.gmane.org>
References: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
	<CAMKF1sqCxAnukfORLmDT9vxg-V8ABcUgjXYTP5b1jc=LZfDu1w@mail.gmail.com>
	<CADZ6=auir8z1R2eQ0c++EcdLWizOQ+=OhbqM5q6Fms1=G0CJhw@mail.gmail.com>
	<4FB216D2.6010108@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <4FB216D2.6010108@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: New kmod {libdir} breaks udev 182 build
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
X-List-Received-Date: Tue, 15 May 2012 09:43:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-05-12 10:41, Martin Ertsås schreef:
> On 05/15/12 10:39, Thilo Fromm wrote:
>> Hello Khem,
>> 
>>>> I've got an issue with 
>>>> openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, with the
>>>> way {libdir} is set in line 19:
>>>> 
>>>> libdir = "${base_libdir}"
>>>> 
>>>> "git blame" claims this was added by Khem Raj on 2012-05-08. This
>>>> line causes libkmod to put its pkgconfig ".pc" file in the staging
>>>> area at "/lib/pkgconfig/libkmod.pc". This is sad because other
>>>> recipes would only look at /usr/lib/pkgconfig/ and
>>>> /usr/share/pkgconfig.
>>>> 
>>>> Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for 
>>>> example. The build predictably fails with
>>>> 
>>>> checking for KMOD... no configure: error: Package requirements
>>>> (libkmod >= 5) were not met:
>>>> 
>>>> No package 'libkmod' found
>>>> 
>>>> 
>>>> So what's the right thing do do here? Use a different package
>>>> install path for libkmod, or point udev to /lib/pkgconfig by
>>>> extending its PKG_CONFIG_PATH correspondingly?
>>> One solution is to fix kmod to install pc files in /usr/lib with
>>> right paths to access libkmod
>>> 
>>> second solution is to look for pc files in ${base_libdir} while
>>> building udev can you try this option.
>> Yes, I was trying to state these two possible resolutions in my first 
>> mail. I already tried adding
>> 
>> PKG_CONFIG_PATH = 
>> "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig:${PKG_CONFIG_SYSROOT_DIR}/${base_libdir}/pkgconfig/"
>>
>>
>> 
to udev-182 and systemd (which is also affected) recipes. It works
>> around the bug. Still, I think kmod is publishing its .pc files in the 
>> wrong directory.
>> 
>> Regards, Thilo
>> 
> We are also having this issue, and have just added this hack in a 
> bbappend for udev and systemd. Not a pretty solution, but found it to be 
> a lot of work to make only the .pc files be put in /usr/lib/pkgconfig 
> instead of /lib/pkgconfig. I totally agree that kmod publishes it's .pc 
> files in the wrong directory,

It's not kmods fault. The recipe changes $libdir to /lib. It tries to take a
shortcut that backfires.

 as every distro I have tried uses
> /usr/lib/pkgconfig as the pkgconfig directory. Guess we will keep this 
> hack until kmod is fixed upstream though.

The bug is in the recipe:
http://cgit.openembedded.org/openembedded-core/commit/?id=6b74f2461735272bd950a4f060dab6e778a36f92

I spoke to upstream and they confirmed we get what we ask for in OE:
pkgconfig in the wrong location.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPsiLcAAoJEHZqAkdh1vT6V0QQAIXqt8azrJ29/P4n6quYFTg8
hOCDbNw/0CdKpqmAD7rEpBQPIAJ+oTKhWBQe6lFe9U6XgJzpMLvzV25ECzwlLxvo
g2PC832IeFO+joUSNx5quAJraHep+yVxf+NSYf725L8pYBqqZKgPPPpw4f9ShH9b
/kdcrmGd8cSCYehC70AsnDjKTgEh5955TZyovN6mp5xxuPPBNKfZFu/mtoomhGUG
87rfv8CaMVEzWCooBAaQGj1zsWl/4B94LJylyLj33dfFezUvwAtzkiHujsAlgQNi
vqWpqIhHpWClvMA7kzp4hWJ9rMS63+MbrMF1nCRJf2H3Hx+KVjZ4s1lQKbVJ1c7t
YaoQLyEadtyLYz4gC+S7+jwahyYrG70LSbOGav2UloYyDL/CLgBc5ziifKwsNypr
Yc6I/mCZq1nNkGGUKIuzk4Jx5HJ/vYd45UjJVDmWq7FowL791bxzrG8oV6Q2P/XU
FGP7VTnyIOdChqWKDI5Z89/sjk9VtQMWzO2Kz1gDdVs4HZFlO7XDs2dG5CHImdec
ItFqErawHZ9V/aaFhXZqAGXQEQ/Bi6FWBRe6jcOtdEjkK3BvCIPmj5B/RRdlUc+/
kp9TmAkg+qG6P0bousZ8F/NIK5pRVQ5UmxlZosvwB9f5I7rtCovcn3mPthkt1+CL
STheUSNwZ8RLFWYN9IV2
=clGb
-----END PGP SIGNATURE-----



