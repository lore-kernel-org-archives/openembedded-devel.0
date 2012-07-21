Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SsWOc-0004si-83
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 11:54:46 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWDc-0002Jb-8m>; Sat, 21 Jul 2012 11:43:24 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWDc-0001R4-69>; Sat, 21 Jul 2012 11:43:24 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SsWDb-0000yp-3S
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 11:43:23 +0200
Date: Sat, 21 Jul 2012 11:43:23 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120721094323.GE31778@mi.fu-berlin.de>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
	<1342761538-19890-5-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342761538-19890-5-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-java][PATCH 5/5] log4j1.2: Upgrade recipe to 1.2.17 release
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
X-List-Received-Date: Sat, 21 Jul 2012 09:54:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 19, 2012 at 10:18:58PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-core/jakarta-libs/log4j1.2_1.2.15.bb |   36 --------------------------
>  recipes-core/jakarta-libs/log4j1.2_1.2.17.bb |   35 +++++++++++++++++++++++++
>  2 files changed, 35 insertions(+), 36 deletions(-)
>  delete mode 100644 recipes-core/jakarta-libs/log4j1.2_1.2.15.bb
>  create mode 100644 recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
> 
> diff --git a/recipes-core/jakarta-libs/log4j1.2_1.2.15.bb b/recipes-core/jakarta-libs/log4j1.2_1.2.15.bb
> deleted file mode 100644
> index 6a88ab0..0000000
> --- a/recipes-core/jakarta-libs/log4j1.2_1.2.15.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -DESCRIPTION = "Java library to help the programmer output log statements to a variety of output targets"
> -AUTHOR = "Apache Software Foundation"
> -LICENSE = "AL2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=f4ce41a6d1028498fcacde12f589bce7"
> -
> -SRC_URI = "http://archive.apache.org/dist/logging/log4j/${PV}/apache-log4j-${PV}.tar.gz"
> -
> -inherit java-library
> -
> -S = "${WORKDIR}/apache-log4j-${PV}"
> -
> -DEPENDS = "gnumail gnujaf"
> -DEPENDS_virtclass-native = "gnumail-native gnujaf-native"
> -
> -
> -JARFILENAME = "log4j-${PV}.jar"
> -ALTJARFILENAMES = "log4j-1.2.jar log4j1.2.jar"
> -
> -do_compile() {
> -  mkdir -p build
> -
> -  oe_makeclasspath cp -s activation gnumail
> -
> -  # Built everything but the JMS and JMX classes (like in Debian)
> -	javac -sourcepath src/main/java -cp $cp -d build `find src/main/java -name "*.java" -and -not \( -iwholename "*jms*" -or -iwholename "*jmx*" \)`
> -
> -  cp -R src/main/resources/* build/
> -
> -  fastjar -C build -c -f ${JARFILENAME} .
> -}
> -
> -SRC_URI[md5sum] = "10f04abe4d68d5a89e8eb167e4e45e1a"
> -SRC_URI[sha256sum] = "f5d9f6aa78b9156ae2de2a32d0f26507d2e73db4993d501db2e79f0bd803ab31"
> -
> -BBCLASSEXTEND = "native"
> -
> diff --git a/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
> new file mode 100644
> index 0000000..b37eb05
> --- /dev/null
> +++ b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION = "Java library to help the programmer output log statements to a variety of output targets"
> +AUTHOR = "Apache Software Foundation"
> +LICENSE = "AL2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f4ce41a6d1028498fcacde12f589bce7"
> +
> +SRC_URI = "http://archive.apache.org/dist/logging/log4j/${PV}/log4j-${PV}.tar.gz"
> +
> +inherit java-library
> +
> +DEPENDS = "gnumail gnujaf"
> +DEPENDS_virtclass-native = "gnumail-native gnujaf-native"
> +
> +S = "${WORKDIR}/apache-log4j-${PV}"
> +
> +JARFILENAME = "log4j-${PV}.jar"
> +ALTJARFILENAMES = "log4j-1.2.jar log4j1.2.jar"
> +
> +do_compile() {
> +  mkdir -p build
> +
> +  oe_makeclasspath cp -s activation gnumail
> +
> +  # Built everything but the JMS and JMX classes (like in Debian)
> +	javac -sourcepath src/main/java -cp $cp -d build `find src/main/java -name "*.java" -and -not \( -iwholename "*jms*" -or -iwholename "*jmx*" \)`
> +
> +  cp -R src/main/resources/* build/
> +
> +  fastjar -C build -c -f ${JARFILENAME} .
> +}
> +
> +SRC_URI[md5sum] = "8218714e41ee0c6509dcfeafa2e1f53f"
> +SRC_URI[sha256sum] = "a528e3771ee6234661b5eb0fa02e14faee89dfec38de94088c163ddf2a0a8663"
> +
> +BBCLASSEXTEND = "native"
> +
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Thanks,

patch is applied to master.

Bye Henning


