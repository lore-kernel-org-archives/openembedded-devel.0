Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LoIkI-00087q-Sy
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 16:45:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id CE16C4B018;
	Mon, 30 Mar 2009 16:43:44 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsOEOcx5IoLo; Mon, 30 Mar 2009 16:43:44 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9863.dip0.t-ipconnect.de
	[217.95.152.99])
	by mx51.mymxserver.com (Postfix) with ESMTP id 404024B01A;
	Mon, 30 Mar 2009 16:43:44 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 947B51E0122; Mon, 30 Mar 2009 16:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	HOT_NASTY autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 455851E0100;
	Mon, 30 Mar 2009 16:43:33 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 15:42:45 +0100
User-Agent: KMail/1.9.7
References: <20090330142737.GA12011@fh-wedel.de>
In-Reply-To: <20090330142737.GA12011@fh-wedel.de>
MIME-Version: 1.0
Message-Id: <200903301642.45980.hs4233@mail.mn-solutions.de>
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
X-List-Received-Date: Mon, 30 Mar 2009 14:45:51 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 30 March 2009 16:27:37 Martin Dietze wrote:
> | CXXFLAGS += "-fvisibility-inlines-hidden"

c) enhance bitbake so that you can do

include sane-toolchain-glibc.inc
# My old compiler doesn't like this:
CXXFLAGS -= "-fvisibility-inlines-hidden"




You'd do this in lib/bb/parse/parse_py/ConfHandler.py, and need 
to start with __config_regexp__. Then search for "prepend" in 
the source. Near this place you'll need to add your new "remove" 
handling.



qmake from Qt 3.x and 4.x for example has this feature. It also 
has the cool feature of

XXX *= blah
XXX *= muh
XXX *= blah

... and afterwards, "blah" is only once in ${XXX}.


