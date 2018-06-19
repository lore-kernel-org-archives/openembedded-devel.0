Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 254C874A37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 07:53:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,242,1526335200"; d="scan'208";a="10915317"
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-devel@lists.openembedded.org>
References: <20180425150258.8606-1-git@andred.net>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <c81933b4-864f-47de-4b6a-2ca7859c314b@skidata.com>
Date: Tue, 19 Jun 2018 09:53:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180425150258.8606-1-git@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] classpath: harmonise -native and -initial-native recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 07:53:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 25.04.2018 17:02, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> removing lots of code-duplication
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>

Tested-by: Richard Leitner <richard.leitner@skidata.com>

> ---
>   .../classpath/classpath-initial-native_0.93.bb     | 54 ++++++++++------------
>   recipes-core/classpath/classpath-native.inc        | 25 +++++-----
>   recipes-core/classpath/classpath-native_0.99.bb    | 31 ++++++-------
>   3 files changed, 51 insertions(+), 59 deletions(-)
> 
> diff --git a/recipes-core/classpath/classpath-initial-native_0.93.bb b/recipes-core/classpath/classpath-initial-native_0.93.bb
> index 0cfa693..51229ec 100644
> --- a/recipes-core/classpath/classpath-initial-native_0.93.bb
> +++ b/recipes-core/classpath/classpath-initial-native_0.93.bb
> @@ -4,7 +4,6 @@
>   require classpath-native.inc
>   
>   DESCRIPTION="Java1.4-compatible GNU Classpath variant that is used as bootclasspath for jikes-native."
> -LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
>   DEPENDS += "jikes-native"
>   
>   PR = "${INC_PR}.2"
> @@ -13,38 +12,35 @@ SRC_URI += " \
>   	    file://autotools.patch \
>   	    file://miscompilation.patch \
>   	   "
> +SRC_URI[md5sum] = "ffa9e9cac31c5acbf0ea9eff9efa923d"
> +SRC_URI[sha256sum] = "df2d093612abd23fe67e9409d89bb2a8e79b1664fe2b2da40e1c8ed693e32945"
>   
> -EXTRA_OECONF = " \
> -                --with-jikes=jikes \
> -                --with-fastjar=fastjar \
> -                --with-glibj \
> -                --disable-Werror \
> -                --disable-local-sockets \
> -                --disable-alsa \
> -                --disable-gconf-peer \
> -                --disable-gtk-peer \
> -                --disable-plugin \
> -                --disable-dssi \
> -                --disable-examples \
> -                --with-glibj-dir=${STAGING_DATADIR_NATIVE}/classpath-initial \
> -                --with-native-libdir=${STAGING_LIBDIR_NATIVE}/classpath-initial \
> -                --includedir=${STAGING_INCDIR_NATIVE}/classpath-initial \
> -                --with-vm=java \
> -              "
> +EXTRA_OECONF += "\
> +    --with-jikes=jikes \
> +    --with-fastjar=fastjar \
> +    --disable-local-sockets \
> +    --with-glibj-dir=${STAGING_DATADIR_NATIVE}/classpath-initial \
> +    --with-native-libdir=${STAGING_LIBDIR_NATIVE}/classpath-initial \
> +    --includedir=${STAGING_INCDIR_NATIVE}/classpath-initial \
> +    --with-vm=java \
> +"
>   
>   # Ensure tools.zip is not installed at same path as classpath-native
>   EXTRA_OEMAKE += "pkgdatadir=${STAGING_DATADIR_NATIVE}/classpath-initial"
>   
> -# remove files clashing with classpath-native in sysroot
>   do_install_append() {
> -
> -	for i in gappletviewer gjarsigner gkeytool gjar gnative2ascii gserialver grmiregistry gtnameserv gorbd grmid
> -	do
> -		rm ${D}${bindir}/${i}
> -	done
> -	rm ${D}${libdir}/logging.properties
> -	rm ${D}${libdir}/security/classpath.security
> +    # remove files clashing with classpath-native in sysroot
> +    rm \
> +       ${D}${bindir}/gappletviewer \
> +       ${D}${bindir}/gjarsigner \
> +       ${D}${bindir}/gkeytool \
> +       ${D}${bindir}/gjar \
> +       ${D}${bindir}/gnative2ascii \
> +       ${D}${bindir}/gserialver \
> +       ${D}${bindir}/grmiregistry \
> +       ${D}${bindir}/gtnameserv \
> +       ${D}${bindir}/gorbd \
> +       ${D}${bindir}/grmid \
> +       ${D}${libdir}/logging.properties \
> +       ${D}${libdir}/security/classpath.security
>   }
> -SRC_URI[md5sum] = "ffa9e9cac31c5acbf0ea9eff9efa923d"
> -SRC_URI[sha256sum] = "df2d093612abd23fe67e9409d89bb2a8e79b1664fe2b2da40e1c8ed693e32945"
> -
> diff --git a/recipes-core/classpath/classpath-native.inc b/recipes-core/classpath/classpath-native.inc
> index 6a56337..b1de458 100644
> --- a/recipes-core/classpath/classpath-native.inc
> +++ b/recipes-core/classpath/classpath-native.inc
> @@ -1,6 +1,7 @@
>   SUMMARY = "GNU Classpath standard Java libraries - For native Java-dependent programs"
>   HOMEPAGE = "http://www.gnu.org/software/classpath/"
>   LICENSE = "GPL-2.0 & SAX-PD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
>   
>   DEPENDS = "fastjar-native zip-native"
>   
> @@ -14,17 +15,13 @@ export JAVA="${STAGING_BINDIR_NATIVE}/java-initial"
>   export JAVAC="${STAGING_BINDIR_NATIVE}/ecj-initial"
>   export JAVACFLAGS="-nowarn"
>   
> -EXTRA_OECONF = " \
> -                --with-glibj \
> -                --enable-local-sockets \
> -                --disable-Werror \
> -                --disable-alsa \
> -                --disable-gconf-peer \
> -                --disable-gtk-peer \
> -                --disable-plugin \
> -                --disable-dssi \
> -                --disable-gjdoc \
> -                --disable-examples \
> -                --enable-tools \
> -                --includedir=${STAGING_INCDIR}/classpath \
> -               "
> +EXTRA_OECONF = "\
> +    --with-glibj \
> +    --disable-Werror \
> +    --disable-alsa \
> +    --disable-gconf-peer \
> +    --disable-gtk-peer \
> +    --disable-plugin \
> +    --disable-dssi \
> +    --disable-examples \
> +"
> diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
> index a97cae0..a1e1e0f 100644
> --- a/recipes-core/classpath/classpath-native_0.99.bb
> +++ b/recipes-core/classpath/classpath-native_0.99.bb
> @@ -1,6 +1,5 @@
>   require classpath-native.inc
>   
> -LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
>   DEPENDS += "classpath-initial-native ecj-initial-native virtual/java-initial-native"
>   
>   PR = "${INC_PR}.0"
> @@ -12,21 +11,21 @@ SRC_URI += " \
>               file://miscompilation.patch \
>               file://toolwrapper-exithook.patch \
>              "
> -
> -# tools using java-initial rather than java sed it out
> -do_compile_append () {
> -
> -	COMMANDS="gappletviewer gjarsigner gkeytool \
> -                  gjar gnative2ascii gserialver grmiregistry \
> -                  gtnameserv gorbd grmid grmic gjavah \
> -                 "
> -
> -        for i in ${COMMANDS};
> -        do
> -                 sed -i -e "s/java-initial/java/g" tools/${i}
> -        done
> -}
> -
>   SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
>   SRC_URI[sha256sum] = "f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8"
>   
> +EXTRA_OECONF += "\
> +    --enable-local-sockets \
> +    --disable-gjdoc \
> +    --enable-tools \
> +    --includedir=${STAGING_INCDIR}/classpath \
> +"
> +
> +do_compile_append () {
> +    # tools using java-initial rather than java sed it out
> +    cd tools
> +    sed -e "s/java-initial/java/g" \
> +        -i gappletviewer gjarsigner gkeytool \
> +           gjar gnative2ascii gserialver grmiregistry \
> +           gtnameserv gorbd grmid grmic gjavah
> +}
> 

