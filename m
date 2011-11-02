Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLikf-0000Lh-Io
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 22:53:41 +0100
Received: (qmail invoked by alias); 02 Nov 2011 21:47:33 -0000
Received: from p5B0A24CF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.36.207]
	by mail.gmx.net (mp067) with SMTP; 02 Nov 2011 22:47:33 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+71qM/mOi7WhJgDqMxZOvUv31FtoxSrH8d+9dprg
	95u57Hie1bzJkW
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Nov 2011 22:52:15 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <20111101085901.447CF1032F@opal>
In-Reply-To: <20111101085901.447CF1032F@opal>
MIME-Version: 1.0
Message-Id: <201111022252.15928.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] Martin Jansa : midori: fix build with dirty vala
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
X-List-Received-Date: Wed, 02 Nov 2011 21:53:41 -0000
X-Groupsio-MsgNum: 35180
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_PubsOf5X0hEpcfU"

--Boundary-00=_PubsOf5X0hEpcfU
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday, November 01, 2011 09:59:01 AM git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: bcfc89236b7a96eb00999492351fb9cafc0cbf84
> URL:   
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=bcfc89236b
> 7a96eb00999492351fb9cafc0cbf84
> 
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Wed Oct 19 13:47:03 2011 +0200
> 
> midori: fix build with dirty vala
> 
> * there is only one line added to default waf file
>   in unpack_wafdir() just before last chdir and return
>   because those files are downloaded and cannot be patched in normal way
>   os.system("sed -i
> \"s/version=output.split/version=output.replace('-dirty','').split/g\"
> wafadmin/Tools/vala.py")
> 
> * It fails to parse version like this
>   /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/valac --version
>   Vala 0.12.1-dirty
>   reporting 0.0.0 instead which breaks configure
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> ---
> 
>  .../recipes-connectivity/midori/midori-0.4.1/waf   |  Bin 0 -> 92569 bytes
>  .../recipes-connectivity/midori/midori_0.4.1.bb    |    8 ++++++++
>  2 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/midori/midori-0.4.1/waf
> b/meta-oe/recipes-connectivity/midori/midori-0.4.1/waf new file mode
> 100755
> index 0000000..b74a2d8
> Binary files /dev/null and
> b/meta-oe/recipes-connectivity/midori/midori-0.4.1/waf differ diff --git
> a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
> b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb index
> 2805b92..860ed21 100644
> --- a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
> +++ b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
> @@ -1,7 +1,15 @@
>  require midori.inc
> 
> +PR = "r1"
> +
>  SRC_URI =
> "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=mid
> ori \ +           file://waf \
>            "
> +
> +do_configure_prepend() {
> +  cp -f ${WORKDIR}/waf ${S}/
> +}
> +
>  SRC_URI[midori.md5sum] = "33dde203cd71ae2b1d2adcc7f5739f65"
>  SRC_URI[midori.sha256sum] =
> "b3c77ddb6f562a0ea3d2e6fbb756ca0dc158ad8410f4b60f8e5998c2f7305f07"
> 
> 
Hm - I am afraid since this update midori never finishes configuring here. I 
waited for approximately 2 hours and stopped the process. The log file is 
attached ( a fresh retry creates similar log ). I commented out the whole 

| do_configure_prepend() 

function, ran

| bitbake -ccleanall midori

and

| bitbake midori

without further issues in few minutes. 

Maybe we should rethink this monster blob commit intended to fix a corner case...

Andreas

--Boundary-00=_PubsOf5X0hEpcfU
Content-Type: text/plain;
  charset="utf-8";
  name="log.do_configure.16473"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="log.do_configure.16473"

+ cd /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/midori-0.4.1-r1/midori-0.4.1
+ do_configure
+ cp -f /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/midori-0.4.1-r1/waf /home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/midori-0.4.1-r1/midori-0.4.1/
+ sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
+ ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib --includedir=/usr/include --infodir=/usr/share/info --mandir=/usr/share/man --disable-hildon
Checking for Python			:  [92m/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/python2[0m
Checking for WAF			:  [92m/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/midori-0.4.1-r1/midori-0.4.1/waf[0m
calling waf configure with parameters
Checking for program gcc or cc           : ccache arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -ljavascriptcoregtk-1.0  -mthumb-interwork -mno-thumb --sysroot=/home/Superandy/tmp/oe-core-eglibc/sysroots/overo 
Checking for program ar                  : arm-angstrom-linux-gnueabi-ar 
Checking for program ranlib              : arm-angstrom-linux-gnueabi-ranlib 
Checking for gcc                         : ok  
Checking for program valac               : /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/valac 
Checking for gobject-2.0                 : yes 
Checking for gthread-2.0                 : yes 
Checking for program version valac >= 0.1.6 : ok 0.12.1 
Checking for program glib-genmarshal        : /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/glib-genmarshal 
Checking for program glib-mkenums           : /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/glib-mkenums 

--Boundary-00=_PubsOf5X0hEpcfU--
