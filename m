Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDwb4-0005Dn-48 for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 13:03:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDwVV-0005nj-7T for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 12:57:53 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:57:53 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:57:53 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 12 Oct 2011 12:57:40 +0200
Message-ID: <j73rr4$5ar$1@dough.gmane.org>
References: <5A47E75E594F054BAF48C5E4FC4B92AB038595A123@dbde02.ent.ti.com>
	<j73pg0$knr$1@dough.gmane.org>
	<5A47E75E594F054BAF48C5E4FC4B92AB038595A16D@dbde02.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <5A47E75E594F054BAF48C5E4FC4B92AB038595A16D@dbde02.ent.ti.com>
X-Enigmail-Version: 1.3.2
Subject: Re: Patches to add support for TI Linux Graphics SDK release 04.04.00.02
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
X-List-Received-Date: Wed, 12 Oct 2011 11:03:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-10-11 12:42, Srinivas, Prathap schreef:
> Thanks for the comments. Please find my responses inline.


>> diff --git a/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb 
>> b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb new file mode 
>> 100644 index 0000000..c5062c1 --- /dev/null +++ 
>> b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb @@ -0,0 +1,29 @@
>>  +BINLOCATION_omap3  = "${S}/gfx_rel_es3.x" +BINLOCATION_ti816x = 
>> "${S}/gfx_rel_es6.x" + +ES2LOCATION = "${S}/gfx_rel_es2.x" +ES3LOCATION
>> = "${S}/gfx_rel_es3.x" +ES5LOCATION = "${S}/gfx_rel_es5.x" +ES6LOCATION
>> = "${S}/gfx_rel_es6.x"
> 
> Since the above is being repeated in each recipe, shouldn't it move to
> the .inc? - I am just following in the way of already existing recipes.
> Existing recipes have this. If it still needs to be addressed, let me
> know.

It needs to be addressed, otherwise I wouldn't have mentioned it

> 
>> --- /dev/null +++ 
>> b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
> 
>> +MACHINE_KERNEL_PR_append = "i"
> 
> Start at 'a' please, or remove it - I am just following in the way of
> already existing recipes. Existing recipes have this way only. If it
> still needs to be addressed, let me know.

It needs to be addressed, otherwise I wouldn't have mentioned it

>> +TI_PLATFORM_omap3 = "omap3630" +TI_PLATFORM_ti816x = "ti81xx" + 
>> +MODULESLOCATION_omap3 = "dc_omapfb3_linux" +MODULESLOCATION_ti816x = 
>> "dc_ti81xx_linux"
> 
> Move to .inc? - I am just following in the way of already existing
> recipes. Existing recipes have this way only. If it still needs to be
> addressed, let me know.

It needs to be addressed, otherwise I wouldn't have mentioned it


>> diff --git a/recipes/powervr-drivers/libgles-omap3.inc 
>> b/recipes/powervr-drivers/libgles-omap3.inc index 36c311d..e605681 
>> 100644 --- a/recipes/powervr-drivers/libgles-omap3.inc +++ 
>> b/recipes/powervr-drivers/libgles-omap3.inc @@ -1,7 +1,7 @@ DESCRIPTION
>> = "libGLES for the omap3" LICENSE = "proprietary-binary"
> 
>> -PR = "r15" +PR = "r16"
> 
>> COMPATIBLE_MACHINE = "(omap3|ti816x)"
> 
>> @@ -35,6 +35,13 @@ do_configure() { for i in $(find ${S} -name "*.h") 
>> $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do chmod 0644 $i
>>  done + +	for drifile in $(find ${S} -name "libsrv_um_dri.so"); do + if
>> [ "$drifile" != "" ] ; then +                        dir=$(dirname 
>> ${drifile}) +                        rm -rf ${dir}/libsrv_um_dri.so + 
>> fi +	done
> 
> What does this try to fix exactly? - This fix is for the issue seen with
> opkg install of libgles-omap3_4.04.00.02-r16.6_armv7a.ipk on target. With
> Graphics SDK release 04.04.00.02, there are 2 versions of the library
> libsrv_um.so - one is libsrv_um.so and other is libsrv_um_dri.so (For
> Xorg driver). What we observed was in presence of libsrv_um_dri.so , the
> links created under /usr/lib were all by default linking to
> libsrv_um_dri.so only. Due to this demos used to fail. Now this fix makes
> sure that only 1 appropriate version of the library libsrv_um.so is
> present and hence links created will now be proper.
=

Please put that explanation in both the commit message and as a comment
about the for loop so people won't say "I am just following in the way of
already existing recipes" when this issues has been properly fixed.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOlXKkMkyGM64RGpERAvROAKCCDqURb233i2eJ2mxdCNU2DoyhEACfXQmr
jB2nZhTMFSiQY0LWiRxYedE=
=1KC2
-----END PGP SIGNATURE-----



