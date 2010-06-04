Received: from smtp-out115.alice.it ([85.37.17.115])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OKefN-0006NE-Nt
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 23:43:06 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out115.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 4 Jun 2010 23:37:42 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 4 Jun 2010 23:37:42 +0200
Received: from [192.168.10.102] ([79.21.49.187]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 4 Jun 2010 23:37:41 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 04 Jun 2010 23:37:26 +0200
Message-ID: <1275687446.32393.23.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 04 Jun 2010 21:37:41.0832 (UTC)
	FILETIME=[29503480:01CB042E]
X-SA-Exim-Connect-IP: 85.37.17.115
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: autoconf-2.65-r9.0 failing to correctly detect M4 (core)
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
X-List-Received-Date: Fri, 04 Jun 2010 21:43:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

hi,
I've the following issue:
armv6-angstrom-linux-gnueabi/autoconf-2.65-r9.0/autoconf-2.65$ grep m4
config.log 
configure:2401: result: /usr/bin/m4
which results in the following error at compilation:
| autom4te: need GNU m4 1.4 or later: /usr/bin/m4
| make[2]: *** [autoconf.in] Error 1
| make[2]: Leaving directory
`.../armv6-angstrom-linux-gnueabi/autoconf-2.65-r9.0/autoconf-2.65/bin'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`.../work/armv6-angstrom-linux-gnueabi/autoconf-2.65-r9.0/autoconf-2.65'
| make: *** [all] Error 2
| FATAL: oe_runmake failed

./run.do_configure.2044
results in:
checking for GNU M4 that supports accurate traces...
(cached) /usr/bin/m4


but removing that line: 
export ac_cv_path_M4="${ac_cv_path_M4=/usr/bin/m4}"
in:
do_configure() {
  if true
  then
    export ac_cv_path_PERL="${ac_cv_path_PERL=/usr/bin/perl}"
    export ac_cv_path_M4="${ac_cv_path_M4=/usr/bin/m4}"
    export ac_cv_prog_gnu_m4="${ac_cv_prog_gnu_m4=yes}
  fi
  autotools_do_configure

}

make it configure well:

checking for GNU M4 that supports accurate
traces... /home/gnutoo/embedded/oe/oetmps/bug/sysroots/x86_64-linux/usr/bin/m4

and:
$ grep m4 config.log 
configure:2401:
result: /home/gnutoo/embedded/oe/oetmps/bug/sysroots/x86_64-linux/usr/bin/m4

The issue is that that code in autoconf.inc

do_configure_prepend () {
  if ${@['true', 'false'][bb.data.inherits_class('native', d)]}
  then
    export ac_cv_path_PERL="${ac_cv_path_PERL=${bindir}/perl}"
    export ac_cv_path_M4="${ac_cv_path_M4=${bindir}/m4}"
    export ac_cv_prog_gnu_m4="${ac_cv_prog_gnu_m4=yes}"
  fi
}

autoconf.inc is definitely core and very important...

I was bitbaking illume-image with bug as machine

I don't know why it pulls a non native/cross autoconf...

but anyway some people may want to compile stuff on the target.

use case:
*they don't know how to cross-compile or don't want too(-dev packages
are faster to install) or have issues with cross-compilation
*they have an arm smartbook like the touchbook and want to program on
it.

Denis.





