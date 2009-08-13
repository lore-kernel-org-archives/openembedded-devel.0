Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Mbhxd-0008OE-KB
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 23:35:49 +0200
Received: from 79-79-178-204.dynamic.dsl.as9105.com ([79.79.178.204]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MbhhJ-0001jB-IF
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 22:19:00 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A847C46.7090306@atmel.com>
References: <4A847C46.7090306@atmel.com>
Date: Thu, 13 Aug 2009 22:18:41 +0100
Message-Id: <1250198321.4215.133.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Common patch directory for a set of boards.
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
X-List-Received-Date: Thu, 13 Aug 2009 21:35:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-08-13 at 22:49 +0200, Ulf Samuelsson wrote:
> Is there a way to store a patch which is applied to a list of boards,
> but not every board, in a common directory?
> 
> SRC_URI_append_at91sam9263ek += "file://atmel.patch;patch=1"
> SRC_URI_append_at32stk1000 += "file://atmel.patch;patch=1"
> SRC_URI_append_at572d940hf += "file://atmel.patch;patch=1"
> SRC_URI_append_beta1 += "file://beta.patch;patch=1"
> SRC_URI_append_beta2 += "file://beta.patch;patch=1"

So long as the leafnames don't collide, you can just put them in one of
the standard directories (files, ${PN}, ...) and everything will be
fine.

If the leafnames do collide then you can selectively add new directories
to FILESPATHPKG based on ${MACHINE}.

p.




