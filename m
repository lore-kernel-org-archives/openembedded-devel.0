Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PGXMf-0001he-Go
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 14:38:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3AD1C8F07D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 08:37:59 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22265-09 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 11 Nov 2010 08:37:59 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 1593037F101
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 08:37:59 -0500 (EST)
Date: Thu, 11 Nov 2010 08:37:58 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1289459533.10621.4.camel@mattotaupa>
Message-ID: <Pine.LNX.4.64.1011110837450.5082@juice.ott.cti.com>
References: <1289414144-18181-1-git-send-email-msmith@cbnco.com>
	<1289414144-18181-2-git-send-email-msmith@cbnco.com>
	<1289459533.10621.4.camel@mattotaupa>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] smpeg: configure with --disable-rpath
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
X-List-Received-Date: Thu, 11 Nov 2010 13:38:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 11 Nov 2010, Paul Menzel wrote:

> > -SRC_URI = "svn://svn.icculus.org/smpeg/;module=trunk"
> > +SRC_URI = "svn://svn.icculus.org/smpeg/;module=trunk \
> > +	file://add-disable-rpath.patch;apply=yes"
> 
> Please remove the `apply=yes` since that is assumed implicitly if a file
> has the extension `patch` [1].

Thanks, fixed.

Mike


