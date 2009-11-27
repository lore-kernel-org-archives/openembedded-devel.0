Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NDw1U-00022p-BP
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 09:17:51 +0100
Received: by bwz9 with SMTP id 9so948601bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 00:16:17 -0800 (PST)
Received: by 10.204.11.3 with SMTP id r3mr749238bkr.107.1259309777165;
	Fri, 27 Nov 2009 00:16:17 -0800 (PST)
Received: from localhost (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 15sm340323bwz.0.2009.11.27.00.16.16
	(version=SSLv3 cipher=RC4-MD5); Fri, 27 Nov 2009 00:16:16 -0800 (PST)
Date: Fri, 27 Nov 2009 08:16:23 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091127081623.7155d194@xora.org.uk>
In-Reply-To: <loom.20091127T012624-591@post.gmane.org>
References: <loom.20091127T012624-591@post.gmane.org>
X-Mailer: Claws Mail 3.7.3 (GTK+ 2.18.3; i686-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gcc-cross-4.3.3 build failure - PPC/Sequoia
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
X-List-Received-Date: Fri, 27 Nov 2009 08:17:51 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Nov 2009 00:51:38 +0000 (UTC)
Jeremy Williams <jerm7861@yahoo.com> wrote:

> Looks like a recent commit applies a patch to libobjc in gcc-4.3.3
> that causes the build of gcc-cross-4.3.3 on PPC to fail (and I'm
> assuming other non-ARM machines as well).
> 
> gcc 4.3.4: add objective-c patch for eabi and add a package for
> libobjc 27622153e629cdff24e0f528b4802019d7f87f81 
> 
> The issue lies in the failure to remove the old "#define
> __objc_exception_class" macro in the (#else (non ARM_EABI_UNWINDER)
> case.
> 
> Koen, since this one is yours can you revert and apply a fix? Might
> want to update the headline too, this patch is applied to gcc 4.3.3
> not 4.3.4.
> 
I had already found this and have been testing a fix, will commit
later today!

Graeme


