Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NiDh4-0005SM-6Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 22:14:00 +0100
Received: from 88-110-39-162.dynamic.dsl.as9105.com ([88.110.39.162]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NiDeK-00082O-Bk
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 21:11:06 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1266525946-8354-2-git-send-email-GNUtoo@no-log.org>
References: <E1Ngbii-0008Ch-On@melo.openembedded.org>
	<1266525946-8354-1-git-send-email-GNUtoo@no-log.org>
	<1266525946-8354-2-git-send-email-GNUtoo@no-log.org>
Date: Thu, 18 Feb 2010 21:10:44 +0000
Message-ID: <1266527444.5437.126.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libxml2 : convert to new staging and fix python error in gnome-doc-utils
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
X-List-Received-Date: Thu, 18 Feb 2010 21:14:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-18 at 21:45 +0100, Denis 'GNUtoo' Carikli wrote:
> +do_install_append() {
>  	install -d ${STAGING_DATADIR}/aclocal/
>  	install -d ${STAGING_BINDIR_CROSS}

That doesn't look right.  I don't think do_install() should ever be
writing into ${STAGING_xxxDIR} directly.

What happens if you just remove those lines?

p.




