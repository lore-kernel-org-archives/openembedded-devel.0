Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1411C6AFC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 16:46:23 +0000 (UTC)
Received: from [69.196.158.250] (port=59027 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1V7ppT-0004Qu-NZ for openembedded-devel@lists.openembedded.org;
	Fri, 09 Aug 2013 12:46:19 -0400
Date: Fri, 9 Aug 2013 12:46:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1308091242270.18531@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: what sources are *not* fetched by a "-c fetchall"?
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
X-List-Received-Date: Fri, 09 Aug 2013 16:46:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  currently testing a build for my beaglebone black using the meta-ti
layer and, as i am wont to do, i did a:

  $ bitbake -c fetchall core-image-minimal

to (allegedly) fetch everything i would need for such a build.

  at that point, i did:

  $ bitbake core-image-minimal

and while this is running, i can see more source tarballs being pulled
into the downloads directory -- examples:

  * file-5.13.tar.gz
  * icu4c-50_1_2-src.tgz
  * mklibs_0.1.34.tar.gz
  * pcre-8.32.tar.bz2

and perhaps more since the build is not yet done.

  what is it about these particular packages that doesn't fall under
the regular fetching from "-c fetchall"?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

