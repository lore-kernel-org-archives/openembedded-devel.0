Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1T3TEA-0000Kc-Tw
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 16:45:15 +0200
Received: by lban1 with SMTP id n1so3073703lba.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=erWa9VSurlXPM3tJLPQTXn2O7N+4D4VKfPtRHUXvpR8=;
	b=e58qsDxUWEdFl1s+SqT/HYo7dUIULg4ov+9PCLwvTwcU8u+kz+t61fPsExw+X16Cqs
	E1Qn74873i7Zz7xQdfrCGU5/TjpifcFX5G9DWxldkzER36LDaglLn4NfL+NwSByLfw+S
	vzyYSLAPZuk/WUr6vkK77saPMBrOeWo0iWty+D/TzUZdIoh5c0WDb2jG9MbJwIv/gCia
	ZDi6W2hHUPpG/l61BqNStyFzqT4HmvKuYEM4xk5RKnfDVCB2Rme0tMtP0j0f6yzF9N9C
	kAen+dRRUcU+/Boi7QzcFO+3IJYrp70Xwr3dZFq6BNFq2ypDyEvVSzHjKV6IZc3hTSvF
	Kyog==
MIME-Version: 1.0
Received: by 10.112.36.195 with SMTP id s3mr6223321lbj.42.1345473192394; Mon,
	20 Aug 2012 07:33:12 -0700 (PDT)
Received: by 10.112.85.196 with HTTP; Mon, 20 Aug 2012 07:33:12 -0700 (PDT)
In-Reply-To: <91586D499ADFD74FBCFB8425266A5DE4012C6BAE354C@pluto.melinkcorp.local>
References: <91586D499ADFD74FBCFB8425266A5DE4012C6BAE354C@pluto.melinkcorp.local>
Date: Mon, 20 Aug 2012 10:33:12 -0400
Message-ID: <CAOd_LFyRYKMmhrf3cHHv9r8EpPAY6_OOO9A4w226L6=1--OCaA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Cron job additions from image and package update
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
X-List-Received-Date: Mon, 20 Aug 2012 14:45:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 20, 2012 at 9:21 AM, Bryan Evenson <bevenson@melinkcorp.com>wrote:

> I am on the 2011.03-maintenance branch of OpenEmbedded.  I have a few cron
> jobs that I want my device to run, but I am having issues getting updated
> images to apply the new cron job list.  I would like the cron jobs to be
> installed for root in the built image and I would also like to be able to
> update the cron job list through an appropriate package.  I am having
> problems with both tasks.
>
> First, I have a customized image for my system.  In the image recipe, I am
> using an addition to the ROOTFS_POSTPROCESS_COMMAND to add my cron job
> list.  This is what I am doing so far inside my image's Bitbake recipe
> related to cron:
>
> rootfs_postprocess() {
>         # cron: Add cron jobs for our image
>         cd ${IMAGE_ROOTFS}
>         cd etc
>         echo '<text for job 1>' > temp_cron.txt
>         echo '<text for job 2>' >> temp_cron.txt
>         echo '<text for job 3>' >> temp_cron.txt
>         crontab temp_cron.txt
> }
>
> ROOTFS_POSTPROCESS_COMMAND += " rootfs_postprocess; "
>
> When I bitbake my image and look at the resulting filesystem, I see that
> /etc/temp_cron.txt exists but there are no entries under /var/cron/tabs.
>  If I burn my new image onto a board, login as root and then call "crontab
> /etc/temp_cron.txt", then the cron jobs are installed as expected.  I've
> also tried changing the last line of the rootfs_postprocess function to
> "crontab -u root temp_cron.txt", but then I get then following error during
> the image build:
>
> | ERROR: ld.so: object 'libfakeroot.so' from LD_PRELOAD cannot be
> preloaded: ignored.
> | must be privileged to use -u
>
> I assume this is all related to some intricacies of using crontab under
> fakeroot but I haven't yet found a solution.  Anyone else successfully
> installing cron jobs on their image?
>
> Also, this would then install the cron jobs on the image but there is no
> opkg package created that contains the updated cron job list.  I would like
> to be able to perform an opkg install or upgrade to apply new system
> settings like this.  Do I need to create a separate recipe so that these
> system files are included in a package, or is there a ways to do this from
> my existing image recipe?
>
>
What about having the crontab run on the target as part of the package
install?

http://pokylinux.org/doc/poky-handbook.html#usingpoky-extend-addpkg-postinstalls

Thanks,
Cliff

-- 
=================
http://bec-systems.com

