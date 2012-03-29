Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SDDy0-0006nW-QX
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 13:56:37 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 32E31F81229; Thu, 29 Mar 2012 05:47:35 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 77565F8121B;
	Thu, 29 Mar 2012 05:47:29 -0600 (MDT)
Message-ID: <4F744BD1.1070309@mlbassoc.com>
Date: Thu, 29 Mar 2012 05:47:29 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1333018650-987-1-git-send-email-gary@mlbassoc.com>
	<4F7449C6.8090004@opendreambox.org>
In-Reply-To: <4F7449C6.8090004@opendreambox.org>
Subject: Re: [meta-oe 1/2] python-twisted: update to latest upstream version
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
X-List-Received-Date: Thu, 29 Mar 2012 11:56:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-29 05:38, Andreas Oberritter wrote:
> Hi Gary,
>
> I was going to submit a similar patch. See my comments inline.

Feel free to submit yours - I have no investment in my version, it was purely
an update of the one in the current repo with a couple of tweaks.

BTW, I couldn't figure out how to get 'git' to recognize this as a rename
with changes when I commited the change.  Any hints?

>
> On 29.03.2012 12:57, Gary Thomas wrote:
>> diff --git a/meta-oe/recipes-devtools/python/python-twisted_12.0.0.bb b/meta-oe/recipes-devtools/python/python-twisted_12.0.0.bb
>> new file mode 100644
>> index 0000000..a642656
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/python/python-twisted_12.0.0.bb
>> @@ -0,0 +1,234 @@
>> +DESCRIPTION = "Twisted is an event-driven networking framework written in Python and licensed under the LGPL. \
>> +Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
>> +(including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
>> +HOMEPAGE = "http://www.twistedmatrix.com"
>> +SECTION = "console/network"
>> +
>> +#twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fc0f9dafb8baecfd2b77ff4bf64e6eaf"
>
> I used "file://LICENSE;beginline=40;md5=3fced11d6df719b47505837a51c16ae5", so the checksum
> doesn't change when the header containing years and authors changes.
>
>> +SRC_URI = "http://pypi.python.org/packages/source/T/Twisted/Twisted-${PV}.tar.bz2"
>> +SRC_URI[md5sum] = "cf49a8676c21c50faf1b42b528049471"
>> +SRC_URI[sha256sum] = "e5561c9714583fd052ea9e0b10331609a719b3878f9d2593e4c57eab0ba0effd"
>> +
>> +S = "${WORKDIR}/Twisted-${PV}"
>> +
>> +inherit setuptools
>> +
>> +do_install_append() {
>> +    # remove some useless files before packaging
>> +    find ${D} -name "*.bat" -o -name "*.c" -o -name "*.h" -exec rm {} \;
>> +}
>> +
>> +PACKAGES += "\
>> +  ${PN}-zsh \
>> +  ${PN}-test \
>> +  ${PN}-protocols \
>> +  ${PN}-bin \
>> +  ${PN}-conch \
>> +  ${PN}-lore \
>> +  ${PN}-mail \
>> +  ${PN}-names \
>> +  ${PN}-news \
>> +  ${PN}-runner \
>> +  ${PN}-web \
>> +  ${PN}-words \
>> +  ${PN}-flow \
>> +  ${PN}-pair \
>> +  ${PN}-core \
>> +"
>> +
>> +RDEPENDS_${PN} = "python-core \
>> +	          python-io \
>> +		  python-fcntl \
>> +		  python-netclient \
>> +		  python-netserver \
>> +                  python-stringold \
>> +		  python-threading \
>> +		  python-zopeinterface"
>
> This seems wrong, because ${PN} is an empty meta package. I guess most users
> only want some parts of twisted, like twisted-web etc. So the RDEPENDS should
> be set for the individual packages.
>
>> +RDEPENDS_${PN} += "\
>> +  ${PN}-bin \
>> +  ${PN}-conch \
>> +  ${PN}-core \
>> +  ${PN}-lore \
>> +  ${PN}-mail \
>> +  ${PN}-names \
>> +  ${PN}-news \
>> +  ${PN}-protocols \
>> +  ${PN}-runner \
>> +  ${PN}-web \
>> +  ${PN}-words \
>> +"
>> +
>> +ALLOW_EMPTY = "1"
>> +FILES_${PN} = ""
>> +
>> +FILES_${PN}-test = " \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
>> +"
>
> RDEPENDS_${PN}-test = "${PN}"
>
>> +
>> +FILES_${PN}-protocols = " \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/ \
>> +"
>> +
>> +FILES_${PN}-zsh = " \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
>> +"
>> +
>> +# Note: these don't seem to be built
>> +FILES_${PN}-bin = " \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/_c_urlarg.so \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/cBanana.so \
>> +"
>> +
>> +FILES_${PN}-conch = " \
>> +  ${bindir}/ckeygen \
>> +  ${bindir}/tkconch \
>> +  ${bindir}/conch \
>> +  ${bindir}/conchftp \
>> +  ${bindir}/cftp \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py* \
>> +  ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
>> +"
>> +
>
> RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
>
>> +FILES_${PN}-core = " \
>> +${bindir}/manhole \
>> +${bindir}/mktap \
>> +${bindir}/twistd \
>> +${bindir}/tap2deb \
>> +${bindir}/tap2rpm \
>> +${bindir}/tapconvert \
>> +${bindir}/tkmktap \
>> +${bindir}/trial \
>> +${bindir}/easy_install* \
>> +${bindir}/pyhtmlizer \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
>
> It may be better to list the individual .so files, because twisted/python is
> also used by other packages, e.g. ${PN}-zsh:
>
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_epoll.so \
> ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_initgroups.so \
>
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
>> +"
>
> RDEPENDS_${PN}-core = "python-core python-zopeinterface"
>
>> +
>> +FILES_${PN}-lore = " \
>> +${bindir}/bookify \
>> +${bindir}/lore \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_lore.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/lore \
>> +"
>
> RDEPENDS_${PN}-lore = "${PN}-core"
>
>> +
>> +FILES_${PN}-mail = " \
>> +${bindir}/mailmail \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
>> +"
>> +
>
> RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
>
>> +FILES_${PN}-names = " \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
>> +"
>
> RDEPENDS_${PN}-names = "${PN}-core"
>
>> +
>> +FILES_${PN}-news = " \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
>> +"
>
> RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
>
>> +
>> +FILES_${PN}-runner = " \
>> +${libdir}/site-packages/twisted/runner/portmap.so \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
>> +"
>
> RDEPENDS_${PN}-runner = "${PN}-core ${PN}-protocols"
>
>> +
>> +FILES_${PN}-web = " \
>> +${bindir}/websetroot \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
>> +"
>
> RDEPENDS_${PN}-web += "${PN}-core ${PN}-protocols"
>
>> +
>> +FILES_${PN}-words = " \
>> +${bindir}/im \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
>> +"
>
> RDEPENDS_${PN}-words += "${PN}-core"
>
>> +
>> +FILES_${PN}-flow = " \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \"
>
> RDEPENDS_${PN}-flow += "${PN}-core"
>
>> +
>> +FILES_${PN}-pair = " \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
>> +"
>
> RDEPENDS_${PN}-pair += "${PN}-core"
>
>> +
>> +FILES_${PN}-dbg += " \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
>> +${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
>> +"
>> +
>
> RDEPENDS_${PN}-dbg = "${PN}"
>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


