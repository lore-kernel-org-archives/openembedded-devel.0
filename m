Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qdfgw-0003hh-E7
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 11:43:46 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QdfdI-0004r8-7Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 11:40:00 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309654060-29955-1-git-send-email-raj.khem@gmail.com>
References: <1309654060-29955-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 04 Jul 2011 10:39:59 +0100
Message-ID: <1309772399.2633.97.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH v2] systemd: Replace use of %m in printf formats
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
X-List-Received-Date: Mon, 04 Jul 2011 09:43:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-07-02 at 17:47 -0700, Khem Raj wrote:
> +-        if ((fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY)) < 0) {
> ++        if ((fd = mkstemp(temp)) < 0) {

This change looks like it will effectively remove O_CLOEXEC without
reinstating it anywhere else.  Have you verified this is a safe thing to
do?

> +-        fd = mkostemp(path, O_RDWR|O_CLOEXEC);
> ++        fd = mkstemp(path);

Likewise.

> ++		char dev[20];
> +                 int prio = 0, k;
> + 
> +                 if ((k = fscanf(m->proc_swaps,
> +-                                "%ms "  /* device/file */
> ++                                "%19s "  /* device/file */
> +                                 "%*s "  /* type of swap */

Is 19 characters definitely enough?  If this is potentially a pathname
then it could be much longer than that.

p.




