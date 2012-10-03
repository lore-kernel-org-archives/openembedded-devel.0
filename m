Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJNeI-0007Nz-AM for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 14:01:58 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJNRP-0005c0-Lk for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:48:39 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 13:48:39 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 13:48:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 13:47:52 +0200
Message-ID: <k4h8l4$2d0$1@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<00be8d19fe238a3ef1df3371ab354b9122b56d2c.1349107616.git.paul.eggleton@linux.intel.com>
	<k4h3jt$n4q$3@ger.gmane.org> <1913726.eYu8z7U0Ds@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1913726.eYu8z7U0Ds@helios>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-webserver][PATCH 6/6] xdebug: add new recipe
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
X-List-Received-Date: Wed, 03 Oct 2012 12:01:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-10-12 13:28, Paul Eggleton schreef:
> On Wednesday 03 October 2012 12:21:51 Koen Kooi wrote:
>> Op 01-10-12 18:14, Paul Eggleton schreef:
>>> Add new recipe for the Xdebug PHP debugger/profiler.
>>> 
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com> --- 
>>> meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb |   29 
>>> +++++++++++++++++++++ 1 file changed, 29 insertions(+) create mode
>>> 100644 meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb
>>> 
>>> diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb 
>>> b/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb new file mode
>>> 100644 index 0000000..5bd374c --- /dev/null +++ 
>>> b/meta-webserver/recipes-php/xdebug/xdebug_2.2.1.bb @@ -0,0 +1,29 @@ 
>>> +SUMMARY = "Debugging and profiling extension for PHP"
>> 
>> Missing DESCRIPTION
> 
> No, this is deliberate - presumably you're aware that the default value
> of DESCRIPTION is "${SUMMARY}" ? The opposite is not true, which leads to
>  packages with useless summaries if you set DESCRIPTION and not SUMMARY;
> so if it's just one line the single variable to set is SUMMARY. I know we
> have a lot of recipes that have this issue; we should probably address
> that on a wider basis.
> 
>>> +LICENSE = "Xdebug" +LIC_FILES_CHKSUM = 
>>> "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16" + +DEPENDS = 
>>> "modphp" + +PR = "r0"
>> 
>> default....
> 
> See reply to patch 2/6.

Extra work for M1.4, but it's your sandbox to play in...

>>> + +SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz" + 
>>> +SRC_URI[md5sum] = "5e5c467e920240c20f165687d7ac3709"
>>> +SRC_URI[sha256sum] =
>>> "11d340eb7f87909a596bac054cc927df757dc2fc7c90b50a832c30e9bf84c9ad" + 
>>> +inherit autotools + +EXTRA_OECONF += "--enable-xdebug 
>>> -with-php-config=${STAGING_BINDIR_CROSS}/php-config" +
>>> +do_configure() { +	${STAGING_BINDIR_CROSS}/phpize +	oe_runconf +}
>> 
>> Why not do autotools_do_configure?
> 
> Because AFAICT PHP modules are somewhat unusual when it comes to
> configure, and totally break if you try to autoreconf. IIRC this was the
> only way I could get the thing to build.

Can you add a comment saying that? A lot of recipes in OE classic replace
the configure step, but our autotools support has improved a lot, so a
comment saying what is going wrong will help people updating the recipe.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQbCXoMkyGM64RGpERAhBMAJ47+3mA0f3FwWl2NvK3h/joP/6FEQCcCH+y
mt9mrA8R/2QKMkfHH51QG2I=
=VWa7
-----END PGP SIGNATURE-----



