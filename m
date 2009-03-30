Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LoFBb-0005TP-76
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 12:57:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 25C6A4B017;
	Mon, 30 Mar 2009 12:55:42 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDFV3rF4Sfik; Mon, 30 Mar 2009 12:55:42 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9863.dip0.t-ipconnect.de
	[217.95.152.99])
	by mx51.mymxserver.com (Postfix) with ESMTP id A4D8B4B004;
	Mon, 30 Mar 2009 12:55:41 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 1F5F91E0122; Mon, 30 Mar 2009 12:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 4089E1E0100;
	Mon, 30 Mar 2009 12:55:34 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 11:54:51 +0100
User-Agent: KMail/1.9.7
References: <20090328211530.7700adb1@mail.villafam.com>
	<200903301118.38613.hs4233@mail.mn-solutions.de>
	<1238407681.16991.114.camel@mill.internal.reciva.com>
In-Reply-To: <1238407681.16991.114.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200903301254.51359.hs4233@mail.mn-solutions.de>
Cc: openembedded-devel@openembedded.org
Subject: Re: TinyLogin
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
X-List-Received-Date: Mon, 30 Mar 2009 10:57:47 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> - security auditing is difficult, since the large amount of
> code-sharing in busybox makes it hard to determine which
> functions can potentially be called from a setuid context;

Can I assume from this that you didn't actually look at busybox's=20
source-code?

In libbb/appletlib.c, function "check_suid(int applet_no)":

if (APPLET_SUID(applet_no) =3D=3D _BB_SUID_ALWAYS) {
        /* Real uid is not 0. If euid isn't 0 too, suid bit
         * is most probably not set on our executable */
        if (geteuid())
                bb_error_msg_and_die("must be suid to work"
                                     "properly");
} else if (APPLET_SUID(applet_no) =3D=3D _BB_SUID_NEVER) {
        xsetgid(rgid);  /* drop all privileges */
        xsetuid(ruid);
}


The function is called by run_applet_no_and_exit(), which is the=20
only way to run an applet. So it's always called.

Maybe you'll also look at include/applets.h, where we have lines=20
like:

USE_BRCTL(APPLET(brctl, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))

and then you can check the definition of APPLET_SUID() in=20
include/busybox.h


=46rom what I gathered in just a few minutes, this doesn't seem to=20
be "hard to determine".

Also I fear that many people that now insist "This is no=20
thoroughtly done security examination" --- and which are=20
right ---  never actually didn't do a proper security=20
examination of tinylogin either.



> - the relatively high rate of code churn, combined with the
> large amount of code re-use and the fact that there's no
> inbuilt guard against accidentally mixing privilege domains,
> means that any audit would be likely to need repeating
> frequently.

This seems to be not true from what the code says. ALL calls to=20
busybox applets go via the above quoted function, it's not the=20
the case that each applet individually drops it's priviledge ---=20
and that therefore it's easy for one applet to forget dropping.


>
> > If you are really paranoid and don't want to do this, build
> > two busybox binaries with different applets in them
>
> That does help with the first two points above, but not with
> the latter two.

> And, if you're going to build a separate binary for the login
> utilities, you might just as well have gone on using tinylogin
> in the first place.=20

Except that TinyLogin is end-of-life and won't get bugfixes from=20
upstream.


