Received: from [66.196.96.96] (helo=smtp123.sbc.mail.re3.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <golly@stellarwerx.com>) id 1JPzU4-0003kR-AI
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 13:16:07 +0100
Received: (qmail 36563 invoked from network); 15 Feb 2008 12:15:46 -0000
Received: from unknown (HELO gatekeeper.stellarwerx.com)
	(markgollahon@sbcglobal.net@70.236.3.229 with login)
	by smtp123.sbc.mail.re3.yahoo.com with SMTP; 15 Feb 2008 12:15:45 -0000
X-YMail-OSG: 1TWJVp0VM1numbr3Rjm2RWXe1tE2B8VzhPxwh82aHK_PsjBUEhi3Ny1_Mb.lRPN6npUXzj0vbArOP2plDVQFp6sc4A--
X-Yahoo-Newman-Property: ymail-3
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 3BCFEE673B; Fri, 15 Feb 2008 07:41:15 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 192.168.200.198
X-Mailer: Usermin 1.270
Message-Id: <1203079274.17656@gatekeeper.stellarwerx.com>
Date: Fri, 15 Feb 2008 07:41:14 -0500 (EST)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.196.96.96
X-SA-Exim-Mail-From: golly@stellarwerx.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: tinylogin vs. busybox
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2008 12:16:07 -0000
Content-Type: multipart/mixed; boundary="bound1203079274"

--bound1203079274
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Why not run two builds of busybox - once for the tinylogin functions and
again for all the rest?


Michael 'Mickey' Lauer wrote ..
> On Wednesday 13 February 2008 16:06:07 Koen Kooi wrote:
> > Michael 'Mickey' Lauer schreef:
> > | On Wednesday 13 February 2008 13:53:18 Koen Kooi wrote:
> > |> Michael 'Mickey' Lauer schreef:
> > |> | I just realized that we are still using tinylogin which has bugs
> and
> > |>
> > |> is dead.
> > |>
> > |> | Newer busybox releases contain all the functionality. Anyone know
> a
> > |> | compelling reason to keep using tinylogin as the default in
> >
> > task-base? If
> >
> > |> | not, I'd like to switch to busybox (after changing its defconfig)
> > |> | soon.
> > |>
> > |> Using busybox as login requires it being setuid root, with all the
> nasty
> > |> security implications stemming from that.
> > |
> > | http://www.busybox.net/lists/busybox/2004-May/011551.html give me the
> >
> > opinion
> >
> > | that this is not a problem.
> >
> > If that email is true, we could dump tinylogin
> 
> Excellent. I will look into this and do some tests.
> 
> > , but frankly, I trust 
> > busybox as far as I can throw a piano (and toybox as far as I can throw
> > a 21" crt) and SUID root binaries make my skin crawl, so we must be very
> > carefull and do thorough tests before making this change.
> > The last thing we want is $bigcompany to blame OE for the exploitabilty
> > of their devices.
> 
> Sure, better safe than sorry. Of course this would not be the default in
> OE.dev without being tested for quite some time.
> 
> :M:
> -- 
> Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--bound1203079274--
