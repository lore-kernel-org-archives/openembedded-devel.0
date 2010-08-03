Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OgR1h-0007gF-3J
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 01:36:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 72F757597AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Aug 2010 19:36:02 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27096-09 for <openembedded-devel@lists.openembedded.org>; 
	Tue,  3 Aug 2010 19:36:02 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 411AB3B55BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Aug 2010 19:36:02 -0400 (EDT)
Date: Tue, 3 Aug 2010 19:36:02 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C56973F.9090208@nedap.com>
Message-ID: <Pine.LNX.4.64.1008031934390.7055@juice.ott.cti.com>
References: <4C56973F.9090208@nedap.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PREMIRRORS trouble
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
X-List-Received-Date: Tue, 03 Aug 2010 23:36:07 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 2 Aug 2010, Jaap de Jong wrote:

>     PREMIRRORS = "(ftp|http|https)://.*/.* http://myServer/sources/"

> NOTE: Task failed: Unknown fetch Error: too many values to unpack

Hi Jaap,

Does it work if you set SOURCE_MIRROR_URL to your mirror, and add this to 
your conf somewhere?

INHERIT += "own-mirrors"

Just a guess, but maybe it has trouble with the "(ftp|http|https)".

Mike


