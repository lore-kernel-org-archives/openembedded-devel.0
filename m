Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 58D5C60810
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 15:14:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4MFITXj013815 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 16:18:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QjjN_RxbegW0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 16:18:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4MFIOWI013805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 16:18:26 +0100
Message-ID: <1369235677.14887.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2013 16:14:37 +0100
In-Reply-To: <20130522144925.GJ32431@jama>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<519CCFFF.2060506@windriver.com> <20130522144925.GJ32431@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2013 15:14:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-22 at 16:49 +0200, Martin Jansa wrote:
> When this was discussed about a year ago in TSC, the most important
> reason was complicating backports, you can read something about it my RFC:
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/090135.html
> Now close to creating dylan branch for meta-openembedded is imho best
> time to do this, not many changes from released dylan will be backported
> to danny, because people will start moving to newer release instead of
> backporting more and more stuff to old one (also resolving possible
> whitespace merge conflict it not hard). Causing conflicts for merge was
> IIRC most important reason why my proposal was rejected for oe-core.

What I don't want to see is a ton of changes against OE-Core changing
tabs to spaces in the shell functions. This is a particularly nasty
change which breaks patch application across the flag day and breaks the
way several people are using the project and code for exchange of
features. Whilst there may have been minimal cases in meta-oe where the
change was necessary, the situation in the core is different and there
are more changes needed there since it is pretty standardised on tabs.

I've been explicitly asked by various community members not to do what
we did with the python change again as it was invasive and it did cause
people significant pain. There is also no pressing need to change the
shell situation, there was significant technical grounds for the python
spacing change (for example we'd not even be considering python 3 if we
hadn't fixed the tabs).

I'm actually rather annoyed the TSC members agreed to one thing, then
publicly backed something else thereby undermining the TSC and the
agreement that was reached. There is little that I can do about this
other than state my opinion :(.

Rightly or wrongly, OE-Core is continuing with the style its always
promoted which is spaces in python, tabs in shell.

Cheers,

Richard


