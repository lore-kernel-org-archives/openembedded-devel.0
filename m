Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1PVyk8-0007fn-5e
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 04:55:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C435B92C296
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 22:54:51 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19009-10 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 23 Dec 2010 22:54:51 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 8E1AB92C295
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 22:54:50 -0500 (EST)
Date: Thu, 23 Dec 2010 22:54:50 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D13F894.4010100@gmail.com>
Message-ID: <Pine.LNX.4.64.1012232251340.7526@juice.ott.cti.com>
References: <4D13F894.4010100@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] micro.conf: Pin an older udev to avoid space consuming	dependencies.
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
X-List-Received-Date: Fri, 24 Dec 2010 03:55:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 24 Dec 2010, Graham Gower wrote:

> micro-uclibc/micro-image with udev 124 = 957207 bytes.
> micro-uclibc/micro-image with udev 162 = 2303604 bytes.

Could you be convinced to try udev 141? When I build it, its only 
runtime dependencies are glibc and libvolume-id.

> +PREFERRED_VERSION_udev ?= "124"

I'd suggest adding a comment above this setting, something like:

# Pin an older udev to avoid space consuming dependencies.

Otherwise the rationale doesn't show unless you do a git blame.

Mike


