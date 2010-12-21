Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PV7dz-0007RB-HC
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 20:13:08 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Al8FAJaKEE1bdWOb/2dsb2JhbACVcI8MwVeFSQQ
X-IronPort-AV: E=Sophos;i="4.60,208,1291590000"; d="scan'208";a="791091464"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 21 Dec 2010 20:13:02 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PV7du-0007Xw-DO
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 20:13:02 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PV7du-0003y2-6X
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 20:13:02 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PV7dt-0006hj-Hw
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 20:13:01 +0100
Date: Tue, 21 Dec 2010 20:13:01 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221191301.GB23127@lit.local.igalia.com>
References: <1292953146-22849-1-git-send-email-vjaquez@igalia.com>
	<4D10F751.8050006@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D10F751.8050006@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] strace: add netlink/netlink-compat.h in configure.ac
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
X-List-Received-Date: Tue, 21 Dec 2010 19:13:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Dec 21, 2010 at 11:52:01AM -0700, Tom Rini wrote:
> On 12/21/2010 10:39 AM, Víctor Manuel Jáquez Leal wrote:
> >I found, compiling an console-image for omap4330-panda machine, that strace
> >compilation broke because the netlink.h wasn't included. It was not included
> >because the AC_CHECK_HEADERS failed. If failed because sa_family_t wasn't
> >defined, even though linux/socket.h is supposed to define it.
> >
> >This patch modifies the configure.ac in order to include
> >netlink/netlink-compat.h in the AC_CHECK_HEADER macro, so the header is
> >detected correctly.
> 
> Is this fixed upstream or in 4.5.20 by chance?

I grabbed the git version and it cross-compile fine. The configure.ac
includes <stddef.h> instead of <linux/socket.h> - I saw that after sending the
rfc/patch.

vmjl


