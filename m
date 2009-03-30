Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LoDgR-00013m-Pv
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 11:21:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 24C833A013;
	Mon, 30 Mar 2009 11:19:27 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBNm1Wa2Fr+c; Mon, 30 Mar 2009 11:19:27 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9863.dip0.t-ipconnect.de
	[217.95.152.99])
	by mx51.mymxserver.com (Postfix) with ESMTP id B8FFB3A006;
	Mon, 30 Mar 2009 11:19:26 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 4F1681E0122; Mon, 30 Mar 2009 11:19:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id A404D1E0100;
	Mon, 30 Mar 2009 11:19:21 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 10:18:38 +0100
User-Agent: KMail/1.9.7
References: <20090328211530.7700adb1@mail.villafam.com>
	<200903301053.34937.hs4233@mail.mn-solutions.de>
	<gqq1us$1hk$1@ger.gmane.org>
In-Reply-To: <gqq1us$1hk$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200903301118.38613.hs4233@mail.mn-solutions.de>
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
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
X-List-Received-Date: Mon, 30 Mar 2009 09:21:32 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> > And maybe it should be deprecated as well. With Busybox
> > 1.13.3 you won't need TinyLogin at all.
>
> You do if you don't want busybox to run setuid root.

Is this a problem?  After all, busybox can drop priviledges:

-------------------------------
CONFIG_FEATURE_SUID

With this option you can install the busybox binary belonging to 
root with the suid bit set, and it will automatically drop 
priviledges for applets that don't need root access.
-------------------------------

The text goes further in case you don't trust busybox' auto-drop 
capability:

-------------------------------
If you are really paranoid and don't want to do this, build two 
busybox binaries with different applets in them (and the 
appropriate symlinks pointing to each binary), and only set the 
suid bit on the one that needs it. The applets currently marked 
to need the suid bit are:

crontab, dnsd, findfs, ipcrm, ipcs, login, passwd, ping, su,
traceroute, vlock.
----------------------------------


So, the paranoid thinking would make a tinylogin_1.13_3.bb file, 
which has busybox 1.13.3 in it's SRC_URI, select only the stuff 
needed for passwd, login, su and friends and install that a 
SUID.

In the meantime, I'm happy with my CONFIG_FEATURE_SUID-configured 
busybox :-)


