Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LoFmZ-0003Wa-Ny
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 13:35:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 77D034B005;
	Mon, 30 Mar 2009 13:33:54 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKtd99CATyDQ; Mon, 30 Mar 2009 13:33:54 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9863.dip0.t-ipconnect.de
	[217.95.152.99])
	by mx51.mymxserver.com (Postfix) with ESMTP id 54F934B003;
	Mon, 30 Mar 2009 13:33:53 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 795C01E0122; Mon, 30 Mar 2009 13:33:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 91BDF1E0100;
	Mon, 30 Mar 2009 13:33:47 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: Phil Blundell <pb@reciva.com>
Date: Mon, 30 Mar 2009 12:33:04 +0100
User-Agent: KMail/1.9.7
References: <20090328211530.7700adb1@mail.villafam.com>
	<200903301254.51359.hs4233@mail.mn-solutions.de>
	<1238411534.16991.120.camel@mill.internal.reciva.com>
In-Reply-To: <1238411534.16991.120.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200903301333.04881.hs4233@mail.mn-solutions.de>
Cc: openembedded-devel@openembedded.org,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 30 Mar 2009 11:36:00 -0000
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> No, I think you misunderstood what I meant.

Okay.

> The issue is that, since all the applets are linked together
> into one monolithic binary, and hence have the ability in
> theory to call any function in that binary, it is difficult to
> tell by looking at the source code which functions might
> potentially be called (directly or indirectly) by one of the
> setuid applets and hence would need to be included in an audit
> for privilege-escalation vulnerabilities.

I'd have to cross-ref one specific busybox version with my 
specific .config file and look the call graph below the 
SUID-root applets. That would reveal if this is a substantial 
claim or just a fear.

But hey, I am among those people that didn't do a 
priviledge-escalation-verification of tinylogin. And so I'm not 
inclined to do that now for busybox --- it's not something that 
I care fore.  The usage-scenarios of my devices don't call for 
such measures.

However, I like to base fear on evidence, that's why I replied.


> > Except that TinyLogin is end-of-life and won't get bugfixes
> > from upstream.
>
> Yes, that's obviously the tradeoff.

The end-of-life argument is an argument for my 
paranoid-suggestion ("create a tinylogin_1.13.3_bb file with 
SRC_URI = busybox and a stripped down .config only for the 
tinylogin-equivalent-applets").


> Tinylogin is simple enough, though, that fixing bugs locally
> would be easy enough if that became necessary.

Your point <smile>

Let's wait (some more years) for the security assessment of 
tinylogin then <even bigger smile>.


