Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MDbg8-0007Rx-HK
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 12:02:08 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MDbWx-0002d0-MF
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 10:52:39 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MDbWx-0003Wl-G3
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 10:52:39 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244407406-23717-1-git-send-email-msmith@cbnco.com>
References: <Pine.LNX.4.64.0906071637260.27204@juice.ott.cti.com>
	<1244407406-23717-1-git-send-email-msmith@cbnco.com>
Date: Mon, 08 Jun 2009 10:52:39 +0100
Message-Id: <1244454759.2611.178.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Mon, 08 Jun 2009 10:02:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-07 at 16:43 -0400, Michael Smith wrote:
> +# Make busybox recommend busybox-syslog for those images that expect it
> +RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"

I guess it'd be a good idea to make this conditional on
CONFIG_SYSLOGD=y.  Otherwise, folks who build with syslogd off will see
a confusing "unsatisfied recommendation" diagnostic whenever they
install busybox.

p.




