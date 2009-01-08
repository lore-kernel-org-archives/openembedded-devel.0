Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LKwSt-00077c-G4
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jan 2009 16:06:37 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id DFD31628195
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2009 16:00:22 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0901080537k6c1dfa9bm77ca6c03c24f1a49@mail.gmail.com>
References: <f96d234e0901080537k6c1dfa9bm77ca6c03c24f1a49@mail.gmail.com>
Date: Thu, 08 Jan 2009 16:00:22 +0100
Message-Id: <1231426822.27651.2.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: opkg-cl: corrupted double-linked list
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
X-List-Received-Date: Thu, 08 Jan 2009 15:07:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> Has anyone else seen this?
> 
> I see it with x86 machine, but not cm-x270 machine.

> NOTE: package console-image-1.0: started
> NOTE: package console-image-1.0-r0: task do_rootfs: started
> *** glibc detected *** opkg-cl: corrupted double-linked list:
> 0x000000000061a350 ***

valgrind is far the best tool for x86 to find such type of errors. It's
most probably malloc()/free() pairing problem.

I have not seen it on the yesterday's snapshot (on x86_64).

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



