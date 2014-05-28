Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (unknown [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id B15A26FB68
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 06:28:09 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WpXLN-0004Y4-Vq for openembedded-devel@lists.openembedded.org;
	Wed, 28 May 2014 08:28:09 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 08:28:09 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 08:28:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 28 May 2014 08:27:56 +0200
Message-ID: <lm3vld$94k$1@ger.gmane.org>
References: <1401196396-2009-1-git-send-email-maxim.uvarov@linaro.org>	<20140527142106.GB2426@jama>
	<5384A14C.70900@linaro.org> <20140527194816.GC2426@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <20140527194816.GC2426@jama>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] daq fix compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 May 2014 06:28:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 27-05-14 21:48:
> On Tue, May 27, 2014 at 06:29:32PM +0400, Maxim Uvarov wrote:
>> On 05/27/2014 06:21 PM, Martin Jansa wrote:
>>> On Tue, May 27, 2014 at 05:13:16PM +0400, Maxim Uvarov wrote:
>>>> preset paths to remove that error: 
>>>> /meta-oe/recipes-connectivity/daq/daq_2.0.2.bb ./config.log:cc1:
>>>> warning: include location "/usr/local/include" is unsafe for
>>>> cross-compilation [-Wpoison-system-directories]
>>>> 
>>>> Also this patch add required libdnet dependency.
>>>> 
>>>> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org> --- 
>>>> meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 5 ++++- 1 file
>>>> changed, 4 insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
>>>> b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb index
>>>> 4e85194..dcf38fc 100644 ---
>>>> a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb +++
>>>> b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb @@ -5,7 +5,7 @@
>>>> LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
>>>> 
>>>> PARALLEL_MAKE = ""
>>>> 
>>>> -DEPENDS = "libpcap libpcre" +DEPENDS = "libpcap libpcre libdnet"
>>>> 
>>>> SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \ 
>>>> file://disable-run-test-program-while-cross-compiling.patch " @@
>>>> -15,6 +15,9 @@ SRC_URI =
>>>> "http://fossies.org/linux/misc/daq-${PV}.tar.gz \ # daq/daq/latest
>>>> lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink 
>>>> EXTRA_OECONF += "--disable-nfq-module --disable-ipq-module"
>>>> 
>>>> +# never look to /usr/local lib while cross compiling +EXTRA_OECONF
>>>> += "--includedir=/usr/include --with-libpcap-includes=/usr/lib
>>>> --with-dnet-includes=/usr/lib"

Apart from Martins comments:

s,/usr/include,${includedir}, s,/usr/lib,${libdir],s

>>> Does it look into /usr on host now?
>> 
>> yes and it compiles after that change.
> 
> Because you don't have dnet headers in /usr, right? Shouldn't it point to
> sysroot libdir/includedir paths to prevent any host libraries/headers to
> sneak in?
> 
> Or better explicitly disable/enable dnet with PACKAGECONFIG?
> 
>> Maxim.
>>> 
>>>> SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0" 
>>>> SRC_URI[sha256sum] =
>>>> "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
>>>> 
>>>> -- 1.8.5.1.163.gd7aced9
>>>> 
>>>> -- _______________________________________________ 
>>>> Openembedded-devel mailing list 
>>>> Openembedded-devel@lists.openembedded.org 
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>> 
>>> 
>> 
>> -- _______________________________________________ Openembedded-devel
>> mailing list Openembedded-devel@lists.openembedded.org 
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFThYHsMkyGM64RGpERAtiuAKC9mKMO+TzYJ0Z42mCUa3vI2NP+oQCffCv4
Wo1+U3SJNrRsNMAUepC9mQs=
=DMBJ
-----END PGP SIGNATURE-----


