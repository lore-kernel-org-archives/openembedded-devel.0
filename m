Received: from [62.75.240.18] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <stefan@datenfreihafen.org>) id 1IPxjf-0004QQ-Fa
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2007 11:51:48 +0200
Received: from p3ee2f822.dip.t-dialin.net ([62.226.248.34]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1IPxi0-00057z-L6 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2007 11:50:07 +0200
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.67)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1IPxhz-0006GV-M4 for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2007 11:50:03 +0200
Date: Tue, 28 Aug 2007 11:50:03 +0200
From: Stefan Schmidt <stefan@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070828095003.GA7730@dodger.lab.datenfreihafen.org>
References: <1188293940.3521.12.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1188293940.3521.12.camel@localhost.localdomain>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.16 (2007-06-11)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
Subject: Re: I got a err : AttributeError: 'FetchData' object has no	attribute 'method'
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
X-List-Received-Date: Tue, 28 Aug 2007 09:51:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2007-08-28 at 17:39, Tongfeng.Yang wrote:
> 11 SRC_URI =
> "svn://svn.openmoko.org/trunk/src/target;module=gsm;proto=http \
> 12            file://gsmd \
> 13            file://default"\
> 14            file://fix-mlbuf.patch;patch=1

Wrong quotes. Try:
11 SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gsm;proto=http \
12            file://gsmd \
13            file://default\
14            file://fix-mlbuf.patch;patch=1"

regards
Stefan Schmidt


