Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jew6D-0005w4-OH
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 18:41:13 +0100
Received: from [212.23.103.122] (helo=[10.161.239.33])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Jew6D-0008Jo-Av
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 18:41:13 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2008 18:40:49 +0100
User-Agent: KMail/1.9.9
References: <200803271217.41967.thomas.cooksey@trolltech.com>
	<200803271752.07855.thomas.cooksey@trolltech.com>
In-Reply-To: <200803271752.07855.thomas.cooksey@trolltech.com>
MIME-Version: 1.0
Message-Id: <200803271840.49202.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.122
Subject: Re: LEAD_SONAME?
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
X-List-Received-Date: Thu, 27 Mar 2008 17:41:13 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 27 March 2008 17:52:07 Tom Cooksey wrote:

> Ok, well I'm not sure I like the idea of packages being renamed outside my
> control, I wouldn't know which name to use in DEPENDS in other recipies.
> There is also the issue of image recipies not knowing about the new name,
> so I can't just add my package to the list in the image recipie.

Hehe. For DEPENDS this is not an issue, for RDEPENDS it is not an issue as 
well and this is the reason why I ask you to create a task in between, 
because the renaming is failing/not done on image creation. ;)



>
> > Your options are:
> > 	- Ignore the warning
>
> My prefered option, but only if this is not causing my dissappearing
> library issue.

Unlikely


>
> > 	- Define a LEAD_SONAME of your primary lib
> > 	- More finegrained packaging.
>
> Do you mean doing having LEAD_SONAME_foo, LEAD_SONAME_bar, etc. ? That
> could work?

I assume this is with Qt? So you still have separate packages for qtcore, 
qtxml, ...? Why do you have more than one library in these packages anyway? 
But yes LEAD_SONAME_qtcore, LEAD_SONAME_qtxml would clarify things. But again 
findout why there is more than one lib in the package.


z.


