Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lyokq-0000oN-Lu
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 16:57:54 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lyofo-0002Tw-O5
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 18:52:40 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Apr 2009 18:52:35 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1240829698-28666-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1240829698-28666-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200904281852.36370.khimov@altell.ru>
Subject: Re: [PATCH 1/1] genext2fs: added 1.4.1 version
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
X-List-Received-Date: Tue, 28 Apr 2009 14:57:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 27 April 2009 14:54:58 Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  conf/checksums.ini                             |    4 +
>  recipes/genext2fs/genext2fs-1.4.1/volume.patch |  153
> ++++++++++++++++++++++++ recipes/genext2fs/genext2fs-native_1.4.1.bb    |  
> 10 ++
>  recipes/genext2fs/genext2fs_1.4.1.bb           |    9 ++
>  4 files changed, 176 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/genext2fs/genext2fs-1.4.1/volume.patch
>  create mode 100644 recipes/genext2fs/genext2fs-native_1.4.1.bb
>  create mode 100644 recipes/genext2fs/genext2fs_1.4.1.bb

Just FYI: this version (picked from .dev) broke my initrd for some reason 
(need to investigate further), generated FS wasn't usable on target device 
because any touch/mkdir/ln/everything changing FS resulted in "No space left 
on device" (4 Mb was actually available).

At the same time mounting FS via loop worked on host system. Maybe it has 
something to do with kernel version (2.6.18 on target, 2.6.29 on host), maybe 
some defaults changed to something incompatible with older kernels, don't know 
yet.

Setting PREFERRED_VERSION to older one fixed the problem.


