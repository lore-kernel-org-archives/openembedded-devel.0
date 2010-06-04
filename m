Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OKLsP-0006Rx-0z
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 03:39:17 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OKLoF-0007N3-II from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 18:34:55 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 3 Jun 2010 18:34:55 -0700
Received: from [172.30.80.90] ([172.30.80.90]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 3 Jun 2010 19:34:54 -0600
Message-ID: <4C08583A.3090308@mentor.com>
Date: Thu, 03 Jun 2010 18:34:50 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimkddVJqU15C0NqsM5L3zPVvgfX5sZo4hXU6385@mail.gmail.com>
In-Reply-To: <AANLkTimkddVJqU15C0NqsM5L3zPVvgfX5sZo4hXU6385@mail.gmail.com>
X-OriginalArrivalTime: 04 Jun 2010 01:34:54.0502 (UTC)
	FILETIME=[223B8C60:01CB0386]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: psplash vs. psplash-$DISTRO
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
X-List-Received-Date: Fri, 04 Jun 2010 01:39:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
> Hello,
> 
> building console-image for minimal distro I receive the following warning:
> 
> IMHO we have an issue with psplash-zap:
> RRECOMMENDS_${PN} = "psplash-angstrom"
> should probably be
> RRECOMMENDS_${PN} = "${SPLASH}"

Yes, that's right.  Or...

> But here we have a new issue: not all distro are defining $SPLASH, in
> particular look at the images using ZZSPLASH:
> ( from  http://fr.pastebin.ca/1876829 )

I guess, why is it a problem and isn't there something setting a default 
now?  I swear I saw that the other day.  But if they don't have SPLASH 
they probably don't want psplash-zap.

-- 
Tom Rini
Mentor Graphics Corporation


