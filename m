Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MEnSR-0005we-4f
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 18:48:55 +0200
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP id 4DA2F1AB5E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 09:39:00 -0700 (PDT)
Message-Id: <45E16D13-5F20-47D5-99C3-725DAB6D345C@mvista.com>
From: Christopher Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200906111827.06763.mickey@vanille-media.de>
Mime-Version: 1.0 (Apple Message framework v935.3)
Date: Thu, 11 Jun 2009 09:38:58 -0700
References: <1244733177.6018.35.camel@dax.rpnet.com>
	<200906111827.06763.mickey@vanille-media.de>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: [Fwd: [poky] Packaged Staging Improvements]
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
X-List-Received-Date: Thu, 11 Jun 2009 16:48:55 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On Jun 11, 2009, at 9:27 AM, Michael 'Mickey' Lauer wrote:

> On Thursday 11 June 2009 17:12:56 Richard Purdie wrote:
>> Forwarding this as there is problem some interest here too...
>
> Sounds cool, will any of this also fix the deploy-area-out-of-tmpdir  
> issue
> which makes packaged staging completely not working for the typical  
> usecase of
> removing tmpdir and then expecting packages to be filled up from  
> staging area
> on rebuild?

You can use pstage for that use case without moving the entire deploy  
area out of tmp, with a minor tweak, at least thats what I do here.   
Change the PSTAGE_PKG assignment to ?= in packaged-staging.bbclass,  
then set PSTAGE_PKG=${TOPDIR}/prebuilt/${PSTAGE_PKGNAME} or so.
-- 
Chris Larson
Software Engineer
MontaVista Software, Inc.
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com



