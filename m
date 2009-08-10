Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MaWWG-0004ES-Kl
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 17:10:40 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 074C61B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 14:57:34 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Aug 2009 16:53:55 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1249908498-24405-1-git-send-email-methril@gmail.com>
In-Reply-To: <1249908498-24405-1-git-send-email-methril@gmail.com>
MIME-Version: 1.0
Message-Id: <200908101653.55541.holger+oe@freyther.de>
Subject: Re: [PATCH] [Updated] Update the em-x270 machine to work with linux_2.6.23.
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
X-List-Received-Date: Mon, 10 Aug 2009 15:10:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 10 August 2009 14:48:18 Rafael Campos Las Heras wrote:
>  * Use of generic linux_2.6.23 recipe
>  * remove em-x270_2.6.23 recipe (ugly).
>  * Add a patch that gives with gcc 4.1 compiler.
>
> Signed-off-by: Rafael Campos Las Heras <methril@gmail.com>
> ---
>  conf/machine/em-x270.conf                          |    4 +-
>  recipes/linux/em-x270_2.6.23.bb                    |   29
> -------------------- .../em-x270/01-prevet_loop_timespec_add_ns.patch}  |  
> 12 +++++--- .../em-x270}/defconfig                             |    0
>  .../em-x270}/em-x270.patch                         |    0
>  recipes/linux/linux_2.6.23.bb                      |    3 ++
>  6 files changed, 13 insertions(+), 35 deletions(-)
>  delete mode 100644 recipes/linux/em-x270_2.6.23.bb
>  copy
> recipes/linux/{linux-rp-2.6.24/0001-time-prevent-the-loop-in-timespec_add_n
>s-from-bei.patch =>
> linux-2.6.23/em-x270/01-prevet_loop_timespec_add_ns.patch} (55%) rename

Great, could you do one more round with a "prevet" to "prevent" rename?

z.


