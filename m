Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NkOOB-0006VB-Ce
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 22:03:24 +0100
Received: from 88-110-39-162.dynamic.dsl.as9105.com ([88.110.39.162]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NkOLS-0006a6-PY
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 21:00:37 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267044772-10182-1-git-send-email-denis@denix.org>
References: <1267044772-10182-1-git-send-email-denis@denix.org>
Date: Wed, 24 Feb 2010 21:00:17 +0000
Message-ID: <1267045217.5437.326.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_SOFTFAIL autolearn=no
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rootfs_ipk.bbclass: fix BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 24 Feb 2010 21:03:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-24 at 15:52 -0500, Denys Dmytriyenko wrote:
> New opkg requires full and correct package name, version, revision and
> architecture to be specified when requiring de-installation of a package.
> Collect that info from opkg-info.

This seems like a bug in opkg.  Would it not be better to fix it there?

p.




