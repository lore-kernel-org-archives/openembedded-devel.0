Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1Gafir-0000Nx-DN
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Oct 2006 23:46:41 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 3742022163
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 07:39:35 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06776-08
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 07:39:33 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 17DF31289C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 07:39:33 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 0C83313AD473; Fri, 20 Oct 2006 07:39:33 +1000 (EST)
Date: Fri, 20 Oct 2006 07:39:32 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061019213932.GA30714@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GadpR-0005SF-6I@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1GadpR-0005SF-6I@linuxtogo.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: [oe-commits] org.oe.dev glibc: drop 2.4, since it is confirmed to be nonworking on arm
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Oct 2006 21:46:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 19, 2006 at 09:45:21PM +0200, "koen commit" wrote:
> glibc: drop 2.4, since it is confirmed to be nonworking on arm

Hmm, was this really necessary? Surely marking it broken for arm
would have been enough for now?

I'm sure I'm not the only one running glibc 2.4 on lots of non-arm
devices and now have to either add glibc 2.4 back in to OE locally
and/or get all my devices upgraded (which will happen, once I've
finished testing with glibc 2.5, no other glibc's build here except
2.4 and 2.5.)

And I'm sure there'll be a lot of people wondering why OE is suddenly
building an older version of glibc.

-- 
 Jamie Lenehan <lenehan@twibble.org>


