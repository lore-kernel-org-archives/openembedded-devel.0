Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N76SD-0004cf-MT
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 13:01:13 +0100
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N76Qc-0007DI-GT for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 06:59:30 -0500
Date: Sun, 8 Nov 2009 06:58:55 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911080653060.13874@localhost>
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
Subject: any ETA on a fixed xterm-207?
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
X-List-Received-Date: Sun, 08 Nov 2009 12:01:13 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i realize i've mentioned this at least a couple times before (on the
angstrom list) but is there any ETA on fixing the unbuildable
xterm-207 package so that i can bitbake beagleboard-demo-image?

  the problem with xterm_207 appears to be obvious.  the install
script contained therein -- sinstall.sh -- contains the following
snippet:

=====

        case ".$cf_mode" in #(vi
        .???s??s*) #(vi
                PROG_SUID=4000
                PROG_SGID=2000
                ;;
        .???s*) #(vi
                PROG_SUID=4000
                PROG_GRP=
                ;;
        .??????s*)
                PROG_SGID=2000
                PROG_USR=
                ;;
        esac
        PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g' -e 's/--[sxt]/1/g'`

=====

  it seems clear that the point of that snippet is to convert a
symbolic mode to a numeric mode.  unfortunately, these days, the
symbolic mode has a trailing period, whereupon the resulting numeric
mode *also* has a trailing period, at which point the subsequent
"chmod" command tries to use a mode of "755." and chokes.

  as a quick hack, i snuck in the line:

  PROG_MODE=${PROG_MODE%\.}

right after that last line to knock off the trailing period and that
fixed things and allowed xterm to build.  a cleaner solution would be
to perhaps whack off that period at the top.  either way would work.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


