Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LwUck-000491-N4
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 07:03:54 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LwUYN-000Ern-VG
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 08:59:23 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 08:59:23 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1238404723-8814-1-git-send-email-khimov@altell.ru>
	<c384c5ea0904211351l607d74d2s2a010bf7a4138977@mail.gmail.com>
In-Reply-To: <c384c5ea0904211351l607d74d2s2a010bf7a4138977@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904220859.23657.khimov@altell.ru>
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
X-List-Received-Date: Wed, 22 Apr 2009 05:03:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 22 April 2009 00:51:15 Leon Woestenberg wrote:
> Hello,
>
> On Mon, Mar 30, 2009 at 11:18 AM, Roman I Khimov <khimov@altell.ru> wrote:
> > Make ext2.gz and ext3.gz images use ROOTFS_SIZE parameter for genext2s
> > (as non-compressed ext2 and ext3 does).
> >
> > This allows to use IMAGE_EXTRA_SPACE configuration.
>
> Could you explain how this works?

IMAGE_EXTRA_SPACE was brought into OE with commit 
d38f1dd24dd6ed94408aa49aad33e46634a129ff, see comment for that. This one just 
fixes it for compressed images.


