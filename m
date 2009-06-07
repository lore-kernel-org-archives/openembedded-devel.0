Received: from [17.148.16.91] (helo=asmtpout016.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MDFGw-0000Aa-KB
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 12:06:38 +0200
MIME-version: 1.0
Received: from [87.201.169.74] by asmtp016.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKV00LBH4ZB2H50@asmtp016.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	07 Jun 2009 02:57:15 -0700 (PDT)
Message-id: <618E409A-94E7-486B-B6CF-6D2F01FF08B6@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Phil Blundell <pb@reciva.com>
In-reply-to: <1244367963.4151.5.camel@lenovo.internal.reciva.com>
Date: Sun, 07 Jun 2009 13:57:06 +0400
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
	<1244367963.4151.5.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: linux-omap3_git.bb doesn't work when copied	to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 10:06:39 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		 Where is ${GITDIR} located ? I tried echo $GIRDIR but didn't get  
anything.

Elvis

On Jun 7, 2009, at 1:46 PM, Phil Blundell wrote:

>>
>
> It seems that bitbake is trying to run "git fetch" without having
> previously cloned.  That must mean that either bitbake is under the
> erroneous impression that clone has already been run, or that it has
> indeed been run but that it failed without bitbake noticing.
>
> Have you tried cleaning out your ${GITDIR}?
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



