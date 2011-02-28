Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pu7IG-0006H4-NX
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:54:00 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Pu7Gv-0006SS-Rg; Mon, 28 Feb 2011 18:52:38 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1298914102-27047-1-git-send-email-otavio@ossystems.com.br>
References: <AANLkTim3uRSJMCskYcUzpg2aGCwzmoxLBxJeMTztzLzb@mail.gmail.com>
	<1298914102-27047-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 28 Feb 2011 17:57:52 +0000
Message-ID: <1298915872.23547.30.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 1/3] freerdp: rdepends on xprop
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
X-List-Received-Date: Mon, 28 Feb 2011 17:54:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-02-28 at 17:28 +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes/freerdp/freerdp.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Thanks, that's better.  It seems pretty lame that freerdp does this
popen("xprop...") thing at all, and even lamer that it apparently
doesn't cope with xprop not being there, but that isn't really your
problem.  So I think you can go ahead and check this in.

Acked-by: Phil Blundell <philb@gnu.org>

p.




