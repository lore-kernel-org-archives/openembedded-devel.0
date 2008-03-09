Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>)
	id 1JYMpg-0007Ct-0u; Sun, 09 Mar 2008 15:49:01 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Sun, 09 Mar 2008 14:47:13 +0000
	id 00030435.47D3F871.00007BC6
Date: Sun, 9 Mar 2008 14:47:17 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-issues@lists.openembedded.org
Message-ID: <20080309144717.101d44d1@cimmeria>
In-Reply-To: <bug-3990-13@http.bugs.openembedded.net/>
References: <bug-3990-13@http.bugs.openembedded.net/>
X-Mailer: Claws Mail 3.2.0 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Bug 3990] New: SanDisk ConnectPlus not working correctly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Mar 2008 14:49:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  9 Mar 2008 14:40:24 +0000 (UTC)
bugzilla-daemon@treke.net wrote:
> there seem to be patches at
> http://www.openembedded.org/repo/org.openembedded.dev/packages/linux/linux-rp-2.6.24/connectplus-prevent-oops-HACK.patch
> http://www.openembedded.org/repo/org.openembedded.dev/packages/linux/linux-rp-2.6.24/connectplus-remove-ide-HACK.patch
> but they seem to remove functionality
> 
> 

They are my patches, they prevent IDE and wifi system simultaneously
accessing the cards which with linux 2.6 just ends in neither subsystem
working. They are essential to getting the card working in wifi mode.

Graeme


