Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1O2JDn-00035L-M5
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 09:10:45 +0200
Received: from homiemail-a11.g.dreamhost.com (caiajhbdcagg.dreamhost.com
	[208.97.132.66])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 54EDB17CD5A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 00:07:17 -0700 (PDT)
Received: from sspaeth.de (mtec-hg-docking-1-dhcp-204.ethz.ch
	[129.132.133.204])
	by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPA id 01E8D19406D; 
	Thu, 15 Apr 2010 00:07:11 -0700 (PDT)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Thu, 15 Apr 2010 09:07:09 +0200
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-devel@lists.openembedded.org
In-Reply-To: <1271237902-6295-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1271237902-6295-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Thu, 15 Apr 2010 09:07:09 +0200
Message-ID: <87k4s9kxcy.fsf@SSpaeth.de>
User-Agent: notmuch version 0.1-129-g887e216 (Emacs 23.1.1/x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] dbus: use $(LIBTOOL) to install 'dbus-daemon'
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
X-List-Received-Date: Thu, 15 Apr 2010 07:10:45 -0000
Content-Type: text/plain; charset=us-ascii

On 2010-04-14, Enrico Scholz wrote:
> Depending on autotools/libtool version and configure flags, dbus-daemon
> will be built sometimes below .libs/ and sometimes in base directory.
> 
> Using 'libtool --mode=install' is a portable way to deal with this.
> 
> Changing Makefile.am to use native automake methods to install this
> files would be a better but more invasive fix.

Looks reasonable, although I am always for going with the "better" fixes
in general :-)

Acked-by: Sebastian Spaeth <Sebastian@SSpaeth.de>


