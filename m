Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N77aE-0002OV-Us
	for openembedded-devel@openembedded.org; Sun, 08 Nov 2009 14:13:34 +0100
Received: (qmail 18918 invoked by uid 1003); 8 Nov 2009 13:12:14 -0000
Received: from localhost (HELO ?192.168.5.106?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 8 Nov 2009 13:12:14 -0000
Message-ID: <4AF6C3A7.3020102@balister.org>
Date: Sun, 08 Nov 2009 13:12:07 +0000
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911080653060.13874@localhost>
In-Reply-To: <alpine.LFD.2.00.0911080653060.13874@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: any ETA on a fixed xterm-207?
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
X-List-Received-Date: Sun, 08 Nov 2009 13:13:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2009 11:58 AM, Robert P. J. Day wrote:
>
>    i realize i've mentioned this at least a couple times before (on the
> angstrom list) but is there any ETA on fixing the unbuildable
> xterm-207 package so that i can bitbake beagleboard-demo-image?

I can reproduce the problem, but I cannot implement a fix and test until 
Tuesday AM at the earliest.

Philip

>
>    the problem with xterm_207 appears to be obvious.  the install
> script contained therein -- sinstall.sh -- contains the following
> snippet:
>
> =====
>
>          case ".$cf_mode" in #(vi
>          .???s??s*) #(vi
>                  PROG_SUID=4000
>                  PROG_SGID=2000
>                  ;;
>          .???s*) #(vi
>                  PROG_SUID=4000
>                  PROG_GRP=
>                  ;;
>          .??????s*)
>                  PROG_SGID=2000
>                  PROG_USR=
>                  ;;
>          esac
>          PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g' -e 's/--[sxt]/1/g'`
>
> =====
>
>    it seems clear that the point of that snippet is to convert a
> symbolic mode to a numeric mode.  unfortunately, these days, the
> symbolic mode has a trailing period, whereupon the resulting numeric
> mode *also* has a trailing period, at which point the subsequent
> "chmod" command tries to use a mode of "755." and chokes.
>
>    as a quick hack, i snuck in the line:
>
>    PROG_MODE=${PROG_MODE%\.}
>
> right after that last line to knock off the trailing period and that
> fixed things and allowed xterm to build.  a cleaner solution would be
> to perhaps whack off that period at the top.  either way would work.
>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


