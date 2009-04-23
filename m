Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LwwXS-0007fe-IK
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 12:52:18 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LwwSx-000HhP-88
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 14:47:39 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 14:47:35 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1238404723-8814-1-git-send-email-khimov@altell.ru>
	<200904220859.23657.khimov@altell.ru>
	<c384c5ea0904230326v3742658ah5c8afd8d156a1c08@mail.gmail.com>
In-Reply-To: <c384c5ea0904230326v3742658ah5c8afd8d156a1c08@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904231447.35932.khimov@altell.ru>
Subject: Re: [PATCH] bitbake.conf: use ROOTFS_SIZE for gzip'd images
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
X-List-Received-Date: Thu, 23 Apr 2009 10:52:18 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 23 April 2009 14:26:55 Leon Woestenberg wrote:
> On Wed, Apr 22, 2009 at 6:59 AM, Roman I Khimov <khimov@altell.ru> wrote:
> > IMAGE_EXTRA_SPACE was brought into OE with commit
> > d38f1dd24dd6ed94408aa49aad33e46634a129ff, see comment for that. This one
> > just fixes it for compressed images.
>
> Hmm, this part runs on the host:
>
> ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}
>
> Would this correctly work if my host has a, say 16kB block, XFS
> filesystem? I.e. would "du -ks" correctly estimate the amount of
> ext2/3 blocks needed to layout the rootfs on ext2/3?

Well, my 'du' manual says

	-k     like --block-size=1K

So it's just kilobytes or at least should be so. And in genext2fs there is

	#define BLOCKSIZE         1024

For its "-b".


