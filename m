Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1PHH8Y-0005SA-RT
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 15:31:27 +0100
Received: from [192.168.1.178] (95.232.144.102) by smtp206.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C1A268C09EEFB22 for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 15:30:27 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Nov 2010 15:30:24 +0100
Message-ID: <1289658624.3521.26.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.102
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: binconfig.bbclass optional last slash handling
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
X-List-Received-Date: Sat, 13 Nov 2010 14:31:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

hi,

Martin Jansa (JaMa on irc(#oe on Freenode))told me that libmikmod-config
--libs had the following output:
-L/usr/lib -lmikmod -ldl -lm
Which is obviously problematic,because it was the libmikmod-config from
sysroot which prevented some compilation of packages like
supertux-qvga(fixes like 9a97090b98ee4177b806c305168473562580d0c7 ,
which resulted from a misunderstanding between me and Martin Jansa are
wrong because they only workaround the problem instead of fixing the
real issue, which is discussed here)
so I digged into it and here's what I found:

Here's the beginning of libmikmod-config as generated(and before the
binconfig mangling):
>#! /bin/sh
>
>prefix=/usr
>exec_prefix=/usr
>exec_prefix_set=no
Then because in libmikmod, binconfig is inherited, the following is
called:

binconfig_sysroot_preprocess () {
  for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
    configname=`basename $config`
    install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
    cat $config | sed ${@get_binconfig_mangle(d)} >  ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
    chmod u+x ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
  done

with get_binconfig_mangle beeing the following function:
# The namespaces can clash here hence the two step replace
def get_binconfig_mangle(d):
  s = "-e ''"
  if not bb.data.inherits_class('native', d):
    optional_quote = r"\(\"\?\)"
    s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
    s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
    s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
    s += " -e 's:=%s${prefix}/:=\\1OEPREFIX/:'" % optional_quote
    s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
    s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
    s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
    s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
    s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
    s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
    s += " -e 's:OEPREFIX:${STAGING_DIR_HOST}${prefix}:'"
    s += " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
    s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
    s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
    if bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d):
        s += bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d)
  return s

which turns into:
cat libmikmod-config | sed 
-e '' 
-e 's:=\("\?\)/usr/lib:=\1OELIBDIR:;' 
-e 's:=\("\?\)/usr/include:=\1OEINCDIR:;' 
-e 's:=\("\?\)/usr/share:=\1OEDATADIR:' 
-e 's:=\("\?\)/usr/:=\1OEPREFIX/:' 
-e 's:=\("\?\)/usr/:=\1OEEXECPREFIX/:' 
-e 's:-L/usr/lib:-LOELIBDIR:;' 
-e 's:-I/usr/include:-IOEINCDIR:;' 
-e
's:OELIBDIR:/home/gnutoo/embedded/oe/oetmps/nokia900/sysroots/armv7a-oe-linux-gnueabi/usr/lib:;' 
-e
's:OEINCDIR:/home/gnutoo/embedded/oe/oetmps/nokia900/sysroots/armv7a-oe-linux-gnueabi/usr/include:;' 
-e
's:OEDATADIR:/home/gnutoo/embedded/oe/oetmps/nokia900/sysroots/armv7a-oe-linux-gnueabi/usr/share:' 
-e
's:OEPREFIX:/home/gnutoo/embedded/oe/oetmps/nokia900/sysroots/armv7a-oe-linux-gnueabi/usr:' 
-e
's:OEEXECPREFIX:/home/gnutoo/embedded/oe/oetmps/nokia900/sysroots/armv7a-oe-linux-gnueabi/usr:' 
-e
's:-I/home/gnutoo/embedded/oe/oetmps/nokia900/work/armv7a-oe-linux-gnueabi/libmikmod-3.2.0-beta2-r3:-I/home/gnutoo/embedded/oe/oetmps/nokia900/sysroots/armv7a-oe-linux-gnueabi/usr/include:' 
-e
's:-L/home/gnutoo/embedded/oe/oetmps/nokia900/work/armv7a-oe-linux-gnueabi/libmikmod-3.2.0-beta2-r3:-L/home/gnutoo/embedded/oe/oetmps/nokia900/sysroots/armv7a-oe-linux-gnueabi/usr/lib:'

let's examine that part : -e 's:=\("\?\)/usr/:=\1OEPREFIX/:'

echo prefix=/usr | sed -e 's:=\("\?\)/usr/:=\1OEPREFIX/:' gives:
prefix=/usr

echo prefix=/usr/ | sed -e 's:=\("\?\)/usr/:=\1OEPREFIX/:' gives:
prefix=OEPREFIX/

we have in the bbclass:
s += " -e 's:=%s${prefix}/:=\\1OEPREFIX/:'" % optional_quote 
s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote

So, should I make the last slash optional, or should I remove it ?

Making it optional would result in the following code:
optional_slash = r"\(\/\?\)"
s += " -e 's:=%s${prefix}%s:=\\1OEPREFIX/:'" % (optional_quote ,optional_slash)
s += " -e 's:=%s${exec_prefix}%s:=\\1OEEXECPREFIX/:'" % (optional_quote ,optional_slash)

Denis.





