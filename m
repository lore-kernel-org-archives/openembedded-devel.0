Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PD0Bj-0007ub-ES
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:37:07 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PD0At-0002tl-2N from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 12:36:11 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Nov 2010 12:36:10 -0700
Received: from [172.30.80.166] ([172.30.80.166]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Nov 2010 13:36:10 -0600
Message-ID: <4CCF16A7.3020600@mentor.com>
Date: Mon, 01 Nov 2010 12:36:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20101029191718.GA27520@gmail.com>
In-Reply-To: <20101029191718.GA27520@gmail.com>
X-OriginalArrivalTime: 01 Nov 2010 19:36:10.0493 (UTC)
	FILETIME=[094CAAD0:01CB79FC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Toolchain recipes, versions, removal and consolidation
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
X-List-Received-Date: Mon, 01 Nov 2010 19:37:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> Hi
> 
> There are so many versions of toolchain components gcc/binutils/glibc that
> we have in metadata. I would like to reduce the number and keep supporting
> the ones we really use. Right now we have recipes for
> 
> binutils = 2.14.90.0.6,2.14.90.0.7, 2.15.94.0.1, 2.16, 2.16.1, 2.16.91.0.6,
> 2.16.91.0.7, 2.17, 2.17.50.1, 2.17.50.0.5, 2.17.50.0.8, 2.17.50.0.12, 2.18,
> 2.18.50.0.7, 2.18.atmel.1.0.1, 2.19, 2.19.1, 2.19.51, 2.19.51.0.3, 2.20,
> 2.20.1, cvs
> 
> gcc = 3.3.3, 3.3.4, 3.4.3, 3.4.4, 3.4.6, 4.0.0, 4.0.2, 4.1.0, 4.1.1, 4.1.2,
> 4.2.1, 4.2.2, 4.2.3, 4.2.4, 4.3.1, 4.3.2, 4.3.3, 4.3.4, 4.4.1, 4.4.2,
> 4.4.4, 4.5, csl-arm-2007q3, csl-arm-2008q1, csl-arm-2008q3
> 
> glibc = 2.2.5, 2.3.2, 2.3.3, 2.3.5+cvs20050627, 2.5, 2.6.1, 2.9, 2.10.1,
> cvs
> 
> uclibc = 0.9.28, 0.9.29, 0.9.30, 0.9.30.1, 0.9.30.2, 0.9.30.3, 0.9.31, git
> 
> 
> eglibc = 2.9, 2.10, 2.11, 2.12, svn

For flexibility in out of tree projects, I'd like to see us keep at 
least for binutils 2.18 and newer (official releases) and one each of 
the H.J. Lu releases (.5x.y.z) for folks that need that.  Similarly for 
gcc, 4.2.4, 4.3.4, 4.4.4 and one of the csl's.  For glibc, 2.9 and 
newer?  For uclibc maybe we can drop 0.9.30.[12] if they aren't pinned.

But I fear this won't help your concern as much since often fixing up 
for say gcc 4.2.4 fixes it up for 4.2.1 and 4.2.2 and 4.2.3, and so forth.

-- 
Tom Rini
Mentor Graphics Corporation


