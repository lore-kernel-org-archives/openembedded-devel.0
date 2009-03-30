Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LoIsH-0008Vo-Mz
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 16:54:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 9C8924B009;
	Mon, 30 Mar 2009 16:51:59 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3MKFqp0ToFT2; Mon, 30 Mar 2009 16:51:59 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9863.dip0.t-ipconnect.de
	[217.95.152.99])
	by mx51.mymxserver.com (Postfix) with ESMTP id 44B1E4B00D;
	Mon, 30 Mar 2009 16:51:59 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id B415F1E0122; Mon, 30 Mar 2009 16:51:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 66EA61E0100;
	Mon, 30 Mar 2009 16:51:55 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 15:51:11 +0100
User-Agent: KMail/1.9.7
References: <20090330142737.GA12011@fh-wedel.de>
In-Reply-To: <20090330142737.GA12011@fh-wedel.de>
MIME-Version: 1.0
Message-Id: <200903301651.11651.hs4233@mail.mn-solutions.de>
Subject: Re: sane-toolchain-glibc.inc and old g++ versions
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
X-List-Received-Date: Mon, 30 Mar 2009 14:54:05 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Upon thinking about that, it occured to me that you can do this 
without modifying bitbake: by using python code that modifies 
CXXFLAGS and an anonymous function.

For example, in any *.bb, *.inc, *.conf and *.bbclass file you 
can use anonmyous python functions like this:

SRCDATE=${@bb.data.getVar('PV', d, 1)[9:]}

And no one hinders you to do:

CXXFLAGS=${@bb.data.getVar('CXXFLAGS', d, 
1).replace(" -fvisibility-inlines-hidden",""))


That's pretty all untested, but I think it will work. One recipe 
that uses this trick is mesa/mesa_6.0.1.bb.


