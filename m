Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MScby-0006Vj-3S
	for openembedded-devel@openembedded.org; Sun, 19 Jul 2009 22:03:54 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MScOY-0003f4-L7
	for openembedded-devel@openembedded.org; Sun, 19 Jul 2009 19:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 19 Jul 2009 19:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jul 2009 19:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 19 Jul 2009 21:49:47 +0200
Message-ID: <h3vtcr$td5$1@ger.gmane.org>
References: <4A6374DB.8020901@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <4A6374DB.8020901@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: sqlite3 recipe
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
X-List-Received-Date: Sun, 19 Jul 2009 20:03:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-07-09 21:32, Philip Balister wrote:
> Does anyone mind if I push this change? I ran across a package that
> needed an additional header not staged by the current inc file.

Go ahead, the currunt do_stage is obviously wrong.

regards,

Koen

>
> Philip
>
> diff --git a/recipes/sqlite/sqlite3.inc b/recipes/sqlite/sqlite3.inc
> index 93a536e..ae20ff5 100644
> --- a/recipes/sqlite/sqlite3.inc
> +++ b/recipes/sqlite/sqlite3.inc
> @@ -9,7 +9,7 @@ SRC_URI = "http://www.sqlite.org/sqlite-${PV}.tar.gz \
>
> S = "${WORKDIR}/sqlite-${PV}"
>
> -inherit autotools pkgconfig
> +inherit autotools_stage pkgconfig
>
> EXTRA_OECONF = "--disable-tcl --enable-shared \
> --enable-threadsafe"
> @@ -26,15 +26,6 @@ do_compile_prepend() {
> install -m 0644 sqlite3.h ${STAGING_INCDIR}
> }
>
> -do_stage() {
> - oe_libinstall -so libsqlite3 ${STAGING_LIBDIR}
> - install -m 0644 sqlite3.h ${STAGING_INCDIR}
> -}
> -
> -#do_install() {
> -# oe_runmake install DESTDIR=${D} prefix=${prefix} exec_prefix=${exec_pref
> -#}
> -
> PACKAGES = "libsqlite libsqlite-dev libsqlite-doc sqlite3 sqlite3-dbg"
> FILES_sqlite3 = "${bindir}/*"
> FILES_libsqlite = "${libdir}/*.so.*"
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




