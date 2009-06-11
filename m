Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MEoXM-00040Y-Tu
	for openembedded-devel@openembedded.org; Thu, 11 Jun 2009 19:58:05 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5BHlxiG004857 for <openembedded-devel@openembedded.org>;
	Thu, 11 Jun 2009 18:47:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id or+r85+Iel0E for <openembedded-devel@openembedded.org>;
	Thu, 11 Jun 2009 18:47:59 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5BHlqjk004853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 11 Jun 2009 18:47:55 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45E16D13-5F20-47D5-99C3-725DAB6D345C@mvista.com>
References: <1244733177.6018.35.camel@dax.rpnet.com>
	<200906111827.06763.mickey@vanille-media.de>
	<45E16D13-5F20-47D5-99C3-725DAB6D345C@mvista.com>
Date: Thu, 11 Jun 2009 18:46:46 +0100
Message-Id: <1244742406.6018.40.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Thu, 11 Jun 2009 17:58:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-11 at 09:38 -0700, Christopher Larson wrote:
> On Jun 11, 2009, at 9:27 AM, Michael 'Mickey' Lauer wrote:
> 
> > On Thursday 11 June 2009 17:12:56 Richard Purdie wrote:
> >> Forwarding this as there is problem some interest here too...
> >
> > Sounds cool, will any of this also fix the deploy-area-out-of-tmpdir  
> > issue
> > which makes packaged staging completely not working for the typical  
> > usecase of
> > removing tmpdir and then expecting packages to be filled up from  
> > staging area
> > on rebuild?
> 
> You can use pstage for that use case without moving the entire deploy  
> area out of tmp, with a minor tweak, at least thats what I do here.   
> Change the PSTAGE_PKG assignment to ?= in packaged-staging.bbclass,  
> then set PSTAGE_PKG=${TOPDIR}/prebuilt/${PSTAGE_PKGNAME} or so.

Right, as Chris says, you just override the path. I'm surprised its not
a ?= in there already...

I'm certainly happy to use a better default. Personally, I just remove
directories except tmp/deploy/pstage or change DEPLOY_DIR itself outside
TMPDIR...

Cheers,

Richard





