Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MDfeE-0001hs-QA
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 16:16:26 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MDfV3-000092-8T
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 15:06:57 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MDfV3-0005cB-3a
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 15:06:57 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A2D111A.3030003@cbnco.com>
References: <Pine.LNX.4.64.0906071637260.27204@juice.ott.cti.com>
	<1244407406-23717-1-git-send-email-msmith@cbnco.com>
	<1244454759.2611.178.camel@mill.internal.reciva.com>
	<4A2D111A.3030003@cbnco.com>
Date: Mon, 08 Jun 2009 15:06:50 +0100
Message-Id: <1244470012.2611.187.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH] busybox: Split syslog initscript into busybox-syslog
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
X-List-Received-Date: Mon, 08 Jun 2009 14:16:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-08 at 09:24 -0400, Michael Smith wrote:
> What I'm wondering is how would that modification get persisted if, say, 
> bitbake failed during do_compile, and then I restarted it? Would it 
> think from the stamp that it's already done do_mangle_rrecommmends, and 
> not bother running it again? Then RRECOMMENDS_${PN} would go back to 
> whatever it was at parse time, i.e. no busybox-syslog. Is there a way 
> around that?

Ah, yes, right.  The easiest way to deal with that would be to have the
function that does the mangling be called during do_package (i.e. listed
in PACKAGEFUNCS) rather than as a separate task.  This is where things
like the shared library dependencies are computed as well.

p.




