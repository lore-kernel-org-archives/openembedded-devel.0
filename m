Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QLxn9-0007JZ-Vb
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:25:00 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1QLxLG-000402-6Y; Mon, 16 May 2011 14:56:10 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305548385-10942-1-git-send-email-otavio@ossystems.com.br>
References: <1305548385-10942-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 16 May 2011 14:22:08 +0100
Message-ID: <1305552128.2429.10.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v1 1/2] libpcsclite: add version 1.7.2
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
X-List-Received-Date: Mon, 16 May 2011 13:25:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 12:19 +0000, Otavio Salvador wrote:
> +#!/bin/sh
> +DAEMON=/usr/sbin/pcscd
> +NAME=pcscd
> +DESC="PCSC Daemon"
> +PIDFILE=/var/run/pcscd/pcscd.pid

Please make these paths be parameterised (e.g. ${sbindir}
not /usr/sbin), otherwise the script will not work if those vars are
changed from the defaults.

> +	install -d "${D}/etc/init.d"
> +	install -m 755 "${WORKDIR}/pcscd.init" "${D}/etc/init.d/pcscd"

Same here.

p.




