Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NBBbW-0004lC-EN
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 19:19:41 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NBBaA-0003j2-Rg for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:18:14 -0500
Date: Thu, 19 Nov 2009 13:18:12 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911191314500.17075@localhost>
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
Subject: the apparent fix for guile-native
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
X-List-Received-Date: Thu, 19 Nov 2009 18:19:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  here's what i added to the guile recipe as a patch file:

diff -Nur guile.orig/libguile/guile-snarf-docs.in guile-1.8.7/libguile/guile-snarf-docs.in
--- guile.orig/libguile/guile-snarf-docs.in	2009-07-03 18:19:00.000000000 -0400
+++ guile/libguile/guile-snarf-docs.in	2009-11-19 12:55:32.487266268 -0500
@@ -23,4 +23,4 @@
 ## Let the user override the preprocessor autoconf found.
 test -n "${CPP+set}" || CPP="@CPP@"

-${CPP} -DSCM_MAGIC_SNARF_DOCS "$@"
+${CPP} -P -DSCM_MAGIC_SNARF_DOCS "$@"


  and that got me a successful build.  unless there are any
objections, i can submit a patch in a few minutes.

rday

p.s.  this is with cpp-4.4.2, so i can only imagine that others who
had working builds all this time were using an older version of cpp?
in any event, will that option play nice with older cpp's?

--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


