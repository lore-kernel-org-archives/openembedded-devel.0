Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MQK17-00074x-Ip
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 13:48:22 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MQJoN-0007VY-4Y
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 11:35:11 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 13 Jul 2009 11:35:11 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 13 Jul 2009 11:35:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 13 Jul 2009 13:34:59 +0200
Message-ID: <h3f654$f0j$1@ger.gmane.org>
References: <1247173768-5707-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <1247173768-5707-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] julius: add 4.1.2 of julius speech recognizer
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
X-List-Received-Date: Mon, 13 Jul 2009 11:48:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-07-09 23:09, Koen Kooi wrote:
> From: Koen Kooi<koen@openembedded.org>

ping


>
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   conf/checksums.ini             |    4 ++
>   recipes/julius/julius_4.1.2.bb |   63 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 67 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/julius/julius_4.1.2.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index bb1224c..152afb1 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -11338,6 +11338,10 @@ sha256=bc4f62cbac4716c2c1a25cf53b73343a03883964576d9dd590a9e4c7a70f465a
>   md5=a746183ea41aebc27a0f771036f668e1
>   sha256=1b8f50169bc2d827c6efe6bc98bbef2161f615219e4e8921e68227888fd50a9e
>
> +[http://iij.dl.sourceforge.jp/julius/37582/julius-4.1.2.tar.gz]
> +md5=886a114b391aa1992567019213efc63e
> +sha256=542c7f1042679c8484dc2f5f5536ed0c79fa79b2b9dd6cf6881278a6fdb37a84
> +
>   [http://osdn.dl.sourceforge.jp/julius/37582/julius-4.1.2.tar.gz]
>   md5=886a114b391aa1992567019213efc63e
>   sha256=542c7f1042679c8484dc2f5f5536ed0c79fa79b2b9dd6cf6881278a6fdb37a84
> diff --git a/recipes/julius/julius_4.1.2.bb b/recipes/julius/julius_4.1.2.bb
> new file mode 100644
> index 0000000..d528357
> --- /dev/null
> +++ b/recipes/julius/julius_4.1.2.bb
> @@ -0,0 +1,63 @@
> +DESCRIPTION = "Julius is a high-performance, two-pass large vocabulary continuous speech recognition (LVCSR) decoder software for speech-related researchers and developers."
> +LICENSE = "julius"
> +DEPENDS = "libsndfile1 flex zlib alsa-lib"
> +
> +SRC_URI = "http://iij.dl.sourceforge.jp/julius/37582/julius-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +EXTRA_OECONF = "--with-mictype=alsa --enable-julian"
> +
> +do_configure() {
> +	libtoolize --force
> +	gnu-configize
> +	oe_runconf
> +}
> +
> +do_install() {
> +	export prefix=${D}${prefix}
> +	export libdir=${D}${libdir}
> +	export bindir=${D}${bindir}
> +	export includedir=${D}${includedir}
> +	export mandir=${D}${mandir}
> +	export exec_prefix=${D}${exec_prefix}
> +	export datadir=${D}${datadir}
> +
> +	for i in libsent libjulius julius mkbingram mkbinhmm adinrec adintool mkgshmm mkss jcontrol generate-ngram jclient-perl man ; do
> +		sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g  -e s:\ /usr/share:\ \$\{datadir\}:g ${S}/$i/Makefile	
> +		cd ${S}/$i
> +		oe_runmake -e install
> +	done
> +
> +	for i in mkdfa/mkfa-1.44-flex mkdfa dfa_minimize generate accept_check nextword yomi2voca gram2sapixml dfa_determinize ; do
> +		sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g ${S}/gramtools/$i/Makefile
> +		cd ${S}/gramtools/$i
> +		oe_runmake -e install
> +	done
> +
> +	for i in ${D}${bindir}/*.pl ; do
> +		sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> +		echo sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i>>  /tmp/k
> +	done
> +}
> +
> +do_stage() {
> +    export libdir=${STAGING_LIBDIR}
> +    export bindir=${STAGING_BINDIR}
> +    export includedir=${STAGING_INCDIR}
> +    export datadir=${STAGING_DATADIR}
> +
> +    for i in libsent libjulius julius mkbingram mkbinhmm adinrec adintool mkgshmm mkss jcontrol generate-ngram jclient-perl man ; do
> +        sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g  -e s:\ /usr/share:\ \$\{datadir\}:g ${S}/$i/Makefile
> +        cd ${S}/$i
> +        oe_runmake -e install
> +    done
> +
> +    for i in mkdfa/mkfa-1.44-flex mkdfa dfa_minimize generate accept_check nextword yomi2voca gram2sapixml dfa_determinize ; do
> +        sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g ${S}/gramtools/$i/Makefile
> +        cd ${S}/gramtools/$i
> +        oe_runmake -e install
> +    done
> +}




