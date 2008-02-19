Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>)
	id 1JRV7c-0004Kk-Eh; Tue, 19 Feb 2008 17:15:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1JGEKEY018333;
	Tue, 19 Feb 2008 16:14:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18298-01; Tue, 19 Feb 2008 16:14:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1JGEDpL018323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 19 Feb 2008 16:14:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080219161100.02282dfe@widy.localdomain>
References: <E1JRSFH-0007Gx-36@linuxtogo.org>
	<20080219161100.02282dfe@widy.localdomain>
Date: Tue, 19 Feb 2008 16:14:13 +0000
Message-Id: <1203437653.21824.58.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev package_ipkg.bbclass: Remove	uneeded line, the anonymous python function sets this only in the case its	needed (PACKAGES isnt empty)
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
X-List-Received-Date: Tue, 19 Feb 2008 16:15:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-02-19 at 16:11 +0200, Paul Sokolovsky wrote:
> On Tue, 19 Feb 2008 14:10:51 +0100
> > package_ipkg.bbclass: Remove uneeded line, the anonymous python
> > function sets this only in the case its needed (PACKAGES isnt empty)

> > --- classes/package_ipk.bbclass
> > 1094aec718c676ccf9d8083a10b5fedde8494c1e +++
> > classes/package_ipk.bbclass
> > fdf9fdf2855198b24b017026dd3777995b2977d2 @@ -313,5 +313,4 @@
> > do_package_write_ipk[dirs] = "${D}"
> > bb.build.exec_func("do_package_ipk", d) } do_package_write_ipk[dirs]= "${D}" 
> > -do_package_write_ipk[depends]="ipkg-utils-native:do_populate_staging" 
> > addtask package_write_ipk before do_package_write after do_package
> 
> And still I somehow hit a case when for 'generic'-based distro there
> was some trouble with that. Just FYI, I don't remember details. Will
> retry later.

If that is the case there is something wrong with the dependency chains
and we need to identify what and fix it properly.

Cheers,

Richard



