Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NAoVE-0004zC-HS
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 18:39:39 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NAoTs-0005TM-LR for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 12:38:12 -0500
Date: Wed, 18 Nov 2009 12:38:09 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911181237050.10186@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: build failure just trying to build guile-1.8.7 natively
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
X-List-Received-Date: Wed, 18 Nov 2009 17:39:39 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  (something i just mailed to the guile-devel list, as i was asking
for their help earlier.  in a nutshell, doing a simple native build of
the tarball hits the same error.)

---------- Forwarded message ----------
Date: Wed, 18 Nov 2009 12:11:51 -0500 (EST)
From: Robert P. J. Day <rpjday@crashcourse.ca>
To: guile-devel@gnu.org
Subject: build failure just trying to build guile-1.8.7 natively


  as a followup to my earlier plea for help, i downloaded the
guile-1.8.7 tarball and tried to build it on my (effectively) fedora
12 system, and ran into exactly the same error:

cat alist.doc arbiters.doc async.doc backtrace.doc boolean.doc
chars.doc continuations.doc debug.doc deprecation.doc deprecated.doc
discouraged.doc dynl.doc dynwind.doc environments.doc eq.doc error.doc
eval.doc evalext.doc extensions.doc feature.doc fluids.doc fports.doc
futures.doc gc.doc goops.doc gsubr.doc gc-mark.doc gc-segment.doc
gc-malloc.doc gc-card.doc guardians.doc hash.doc hashtab.doc hooks.doc
i18n.doc init.doc ioext.doc keywords.doc lang.doc list.doc load.doc
macros.doc mallocs.doc modules.doc numbers.doc objects.doc objprop.doc
options.doc pairs.doc ports.doc print.doc procprop.doc procs.doc
properties.doc random.doc rdelim.doc read.doc root.doc rw.doc
scmsigs.doc script.doc simpos.doc smob.doc sort.doc srcprop.doc
stackchk.doc stacks.doc stime.doc strings.doc srfi-4.doc srfi-13.doc
srfi-14.doc strorder.doc strports.doc struct.doc symbols.doc
threads.doc throw.doc values.doc variable.doc vectors.doc version.doc
vports.doc weaks.doc ramap.doc unif.doc dynl.doc filesys.doc posix.doc
net_db.doc socket.doc regex-posix.doc |
GUILE="/home/rpjday/guile-1.8.7/pre-inst-guile"
../scripts/snarf-check-and-output-texi          >
guile-procedures.texi || { rm guile-procedures.texi; false; }
ERROR: unknown doc attribute: (location (string . alist.c) (int . 40)
(hash . hash))
make[3]: *** [guile-procedures.texi] Error 1
make[3]: Leaving directory `/home/rpjday/guile-1.8.7/libguile'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/rpjday/guile-1.8.7/libguile'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/rpjday/guile-1.8.7'
make: *** [all] Error 2

  so this is no longer an openembedded issue, it's a straight build
issue.  can anyone help?  i simply ran:

  $ ./configure
  $ make

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


