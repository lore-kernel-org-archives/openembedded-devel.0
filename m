Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K3r1P-0001o0-Ir
	for openembedded-devel@openembedded.org; Wed, 04 Jun 2008 13:19:15 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K3qx2-0000my-1C
	for openembedded-devel@openembedded.org; Wed, 04 Jun 2008 11:14:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Jun 2008 11:14:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Jun 2008 11:14:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Jun 2008 13:14:36 +0200
Message-ID: <g25tes$bdb$1@ger.gmane.org>
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>	<1211958108.27777.15.camel@isis>	<35a670560805280252o3fc348d1x7b7cf51b01f209e9@mail.gmail.com>	<g1jf9e$ltq$1@ger.gmane.org>
	<35a670560806030016y4fab1071pd7843d2736b32943@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052703)
In-Reply-To: <35a670560806030016y4fab1071pd7843d2736b32943@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 04 Jun 2008 11:19:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Matthijs van de Water wrote:
> Did anyone working with GCC 4.3 have any problems with the C++
> compiler in the SDK?
>
> With the current setup, my include path search order is such that for
> instance the<cstdlib>  header is trying to #include_next<stdlib.h>,
> which fails because the normal include paths precede the C++ include
> paths.
> If I change the #include_next to #include the headers work fine, but
> that is obviously no solution. It looks like this is broken for all
> sysroot builds, because the compiler will put the sysroot include
> before the C++ ones and get rid of any duplicates.
>
> Did anyone see this before?

I did see that before as well.

> Any suggestions? I think I can solve this
> by changing back to --enable-cheaders=c_std instead of c_global (which
> was the default previously and which is why pre-4.3 toolchains work
> fine for me), but I'm not sure of the implications of that.

Maybe we try something like this:

--- packages/gcc/gcc-4.3.0.inc  7dac0d4ea94fbc3071cf13542d7afc9c97598920
+++ packages/gcc/gcc-4.3.0.inc  d4ceae7672f475a16184235ac603437f86c3079e
@@ -68,5 +68,5 @@ JAVA = ""
  FORTRAN = ""
  JAVA = ""

-EXTRA_OECONF_BASE = " --enable-libssp --disable-bootstrap 
--disable-libgomp --disable-libmudflap"
+EXTRA_OECONF_BASE = "  --enable-cheaders=c_std --enable-libssp 
--disable-bootstrap --disable-libgomp --disable-libmudflap"

============================================================
--- packages/gcc/gcc-cross_4.3.0.bb 
1ed2f60e65e1b09e4a5637ab29c85ad02338061f
+++ packages/gcc/gcc-cross_4.3.0.bb 
cc76abacb299b51bb7da2b6bc0a6f7bec093ebeb
@@ -7,6 +7,12 @@ SRC_URI_append_fail-fast = " file://zeck

  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "

-EXTRA_OECONF += "--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${layout_exec_prefix}"
+EXTRA_OECONF += "  --enable-cheaders=c_std 
--disable-libunwind-exceptions 
--with-mpfr=${STAGING_DIR_NATIVE}${layout_exec_prefix}"


regards,

Koen


>
> Regards,
>
> Matthijs
>
> --enable-cheaders=OPTION
>
>      This allows the user to define the approach taken for C header
> compatibility with C++. Options are c, c_std, and c_global. These
> correspond to the source directory's include/c, include/c_std, and
> include/c_global, and may also include include/c_compatibility. The
> default is c_global.




