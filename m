Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SsWNI-0004Yx-W2
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 11:53:25 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWCJ-0002Dv-0b>; Sat, 21 Jul 2012 11:42:03 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWCI-0001M2-U2>; Sat, 21 Jul 2012 11:42:03 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SsWCH-0000qR-Qr
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 11:42:01 +0200
Date: Sat, 21 Jul 2012 11:42:01 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120721094201.GB31778@mi.fu-berlin.de>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
	<1342761538-19890-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342761538-19890-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-java][PATCH 2/5] hsqldb: Add recipe
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
X-List-Received-Date: Sat, 21 Jul 2012 09:53:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 19, 2012 at 10:18:55PM -0700, Khem Raj wrote:
> Fixes
> 
> ERROR: Nothing PROVIDES 'hsqldb' (but
> meta-java/recipes-core/xml-commons/jaxme_0.5.2.bb
> DEPENDS on or otherwise requires it)
> ERROR: Required build target 'jaxme' has no buildable providers.
> M
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-core/hsqldb/hsqldb_1.8.0.10.bb |   40 ++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 recipes-core/hsqldb/hsqldb_1.8.0.10.bb
> 
> diff --git a/recipes-core/hsqldb/hsqldb_1.8.0.10.bb b/recipes-core/hsqldb/hsqldb_1.8.0.10.bb
> new file mode 100644
> index 0000000..e886ae4
> --- /dev/null
> +++ b/recipes-core/hsqldb/hsqldb_1.8.0.10.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION = "Lightweight 100% Java SQL Database Engine"
> +# BSD-like
> +LICENSE = "HypersonicSQL"
> +
> +AUTHOR = "HSQLDB Development Group"
> +HOMEPAGE = "http://hsqldb.org"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/hsqldb/hsqldb_1_8_0_10.zip"
> +
> +S = "${WORKDIR}/${PN}"
> +
> +inherit java-library
> +
> +DEPENDS = "fastjar-native servlet2.4"
> +
> +do_compile() {
> +  # Build instructions according to build/buildJDK14.bat
> +        mkdir -p classes
> +
> +        oe_makeclasspath cp -s servlet-api-2.4
> +
> +        javac -sourcepath src -cp $cp -d build `find src -name "*.java" -and -not -wholename "*test*"`
> +
> +        mkdir -p classes/org/hsqldb/util
> +        mkdir -p classes/org/hsqldb/util/sqltool
> +        mkdir -p classes/org/hsqldb/resources
> +
> +        cp src/org/hsqldb/util/*.gif classes/org/hsqldb/util/
> +        cp src/org/hsqldb/util/*.png classes/org/hsqldb/util/
> +        cp src/org/hsqldb/util/*.properties classes/org/hsqldb/util/
> +        cp src/org/hsqldb/util/sqltool/*.text classes/org/hsqldb/util/sqltool/
> +
> +        cp src/org/hsqldb/resources/*.properties classes/org/hsqldb/resources
> +
> +  fastjar -C classes -c -f ${JARFILENAME} .
> +}
> +
> +SRC_URI[md5sum] = "17410483b5b5f267aa18b7e00b65e6e0"
> +SRC_URI[sha256sum] = "d30b13f4ba2e3b6a2d4f020c0dee0a9fb9fc6fbcc2d561f36b78da4bf3802370"
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


