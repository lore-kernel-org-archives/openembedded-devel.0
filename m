Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nl3lQ-0003RE-LB
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 18:14:09 +0100
Received: by fxm20 with SMTP id 20so293609fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 09:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=wDyvGWA93OH1qoSOaeyDBXsSmZn2hox4vFum6p7fR5k=;
	b=XGe7+hF17S/nN7PXff5qMbuUgf23hyAI2KbBFEC8yz0IsVGpIbfsRE7BvnUFN4q2Mu
	5rZbT+tQpRabVUoGv5dTgwALriN6z70WmlqgFzcgMoszL7j56tMhjUn0ivUy7gHI5nl5
	v3K2l+nlDkelGYlMGhL44eEjLr9huBYBVLgLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=cHyf3SG2+tf/8xTyEmuqyXJ1421S/BRWf9z2oas7h3Bp5TPCdsqTzw65S3rf67uUj+
	ug4YPObdDQ6qOAV0k2fZb6FG9APb8l/zucgHcZ5SnplxfBz5pfkDGWog8Ath6Jv7qLID
	MW8L2smY2Jk5VGRGw8hjRsdsDziSHXAU6v/LU=
Received: by 10.223.4.132 with SMTP id 4mr793855far.90.1267204281461;
	Fri, 26 Feb 2010 09:11:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm259690fxm.14.2010.02.26.09.11.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 09:11:20 -0800 (PST)
Date: Fri, 26 Feb 2010 18:11:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226171124.GB3206@jama>
References: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
	<201002261754.25997.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201002261754.25997.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Generating slightly different images for different IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 26 Feb 2010 17:14:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Feb 26, 2010 at 05:54:25PM +0100, Marcin Juszkiewicz wrote:
> Dnia piątek, 26 lutego 2010 o 17:39:16 Martin Jansa napisał(a):
> 
> > We're slowly stripping packages not really needed, but it would be
> > nice to remove whole /boot with kernel-image.
> 
> > Is there better way to solve it or should we try harder to save space
> >  somewhere else?
> 
> Learn about ROOTFS_POSTPROCESS_COMMAND variable present in 
> classes/rootfs_*.bbclass files. You can use it to launch your function after 
> rootfs is populated.
> 
> So for example your shr-lite-image has drop_kernel_from_boot function in which 
> you check "MACHINE==om-gta01" and if it is then "rm -rf /boot/uImage". After 
> your function all normal ext2/ubifs/jffs2/tarball images will be created 
> without kernel in them.
> 
> Regards, 

with additional IRC chat about hrw's umbaumba-wonders :P moved to
recipes/images/shr-image.inc in faster version (which moves only /boot)

# We don't want /boot directory in jffs2/ubi/ubifs images
IMAGE_CMD_jffs2 = "
mv ${IMAGE_ROOTFS}/boot ${IMAGE_ROOTFS}-boot 
&& mkfs.jffs2 ....
&& mv ${IMAGE_ROOTFS}-boot ${IMAGE_ROOTFS}/boot"

Any better idea?

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


