Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MaoGj-0001iO-Sp
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 12:07:49 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mao0z-0003mh-0c
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 10:51:33 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Mao0y-000871-R4
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 10:51:32 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200908110501.11808.holger+oe@freyther.de>
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
	<200908110501.11808.holger+oe@freyther.de>
Date: Tue, 11 Aug 2009 10:51:29 +0100
Message-Id: <1249984289.1608.29.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH 2/3] uClibc: use __always_inline instead of __inline__
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
X-List-Received-Date: Tue, 11 Aug 2009 10:07:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-08-11 at 05:01 +0200, Holger Hans Peter Freyther wrote:
> On Monday 20 July 2009 00:33:57 Otavio Salvador wrote:
> > From: Mario Domenech Goulart <mario@ossystems.com.br>
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> 
> Why? what does it fix?

There are some functions in the dynamic linker bootstrap code that must
(for a variety of reasons) be inlined to operate correctly.  Under some
circumstances, particularly on MIPS for some reason, gcc decided to
disregard the normal "inline" qualifier and put these functions out of
line which led to disaster.

p.




