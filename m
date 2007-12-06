Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J0Ohv-00026h-GZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Dec 2007 22:56:35 +0100
Received: by nf-out-0910.google.com with SMTP id h3so164371nfh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Dec 2007 13:52:49 -0800 (PST)
Received: by 10.86.86.12 with SMTP id j12mr1444444fgb.1196977969655;
	Thu, 06 Dec 2007 13:52:49 -0800 (PST)
Received: from ?10.0.0.6? ( [85.99.158.8])
	by mx.google.com with ESMTPS id z40sm345132ikz.2007.12.06.13.52.46
	(version=SSLv3 cipher=OTHER); Thu, 06 Dec 2007 13:52:46 -0800 (PST)
Date: Thu, 6 Dec 2007 23:52:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1711804550.20071206235245@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4757E6CB.5010000@student.utwente.nl>
References: <4757E6CB.5010000@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: RFC: make do_deploy operate on packages instead of ${S}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2007 21:56:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, December 6, 2007, 2:10:51 PM, you wrote:

> Hi,

> Richard recently merged packaged-staging2, which highlighted a
> fundamental problem in how we implement do_deploy.

[]

> If we look at two of the heaviest do_deploy users (linux kernels and
> uboot) we see than do_deploy can be implemented by unpacking the
> kernel-image and u-boot packages.  If it would need files that aren't
> packaged for good reasons, those files should be moved to staging and
> accessed from there.

  This is apparently good thing. And it reminds me of another issue
I've been keeping in mind for long time: can we stop to suffix
deployed kernel by the build date and instead use PR? That would make
sure that a kernel built under same condition is name the same way.
And any change to build conditions (e.g. defconfig change) should lead
to bumping of PR anyway.

  This would make kernel image naming a bit inconsistent with rootfs
naming, but real problem here is that using build date for rootfs
suffix is not ideal too. I'll leave this topic for later time, after
hopefully this zImage naming is discussed.


> Note that these problems only surface when doing a clean build using
> existing packages and pstage packages. The first build will succeed
> because staging hasn't been packaged yet.

> Comments?

> regards,

> Koen




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



