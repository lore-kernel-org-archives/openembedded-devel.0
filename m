Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MDbSz-0006zn-4z
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 11:48:33 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MDbJo-0002JQ-Nl
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 10:39:04 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MDbJo-0003OR-HZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 10:39:04 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244407406-23717-2-git-send-email-msmith@cbnco.com>
References: <Pine.LNX.4.64.0906071637260.27204@juice.ott.cti.com>
	<1244407406-23717-1-git-send-email-msmith@cbnco.com>
	<1244407406-23717-2-git-send-email-msmith@cbnco.com>
Date: Mon, 08 Jun 2009 10:39:04 +0100
Message-Id: <1244453944.2611.176.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH] busybox: fix udhcpc default script location when prefix is not "/usr"
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
X-List-Received-Date: Mon, 08 Jun 2009 09:48:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-07 at 16:43 -0400, Michael Smith wrote:
> -CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
> +CONFIG_UDHCPC_DEFAULT_SCRIPT="@DATADIR@/udhcpc/default.script"

Great, thanks.  I tested this with a qemux86 build and it seems to work
fine, so I checked it in.

p.




