Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTdU0-0005oA-Vp
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 18:53:13 +0100
Received: by iahk25 with SMTP id k25so3295995iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 09:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=vlz0N9LNq5VF8IJ1TcQJcMN1acTbZ110QHaJn2wnmkY=;
	b=kXPcm7wj0obGsHBJH9yzQ9TC6oXx685p3GNmPdech76hZ2RXjTrAMW2CLO3G/X7BjM
	QXRiVUaabFbffTo8TEzYBUSENsjIK/54bgSCPr8X7tBfGdslshGM1x4DLGkkXWP3fGIc
	huX5FFd11l6bTFopfYqZ+0EFi3myVzGXRrvgs=
Received: by 10.42.151.68 with SMTP id d4mr8436191icw.36.1322156798460;
	Thu, 24 Nov 2011 09:46:38 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id g16sm89701145ibs.8.2011.11.24.09.46.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 09:46:36 -0800 (PST)
Date: Thu, 24 Nov 2011 09:53:23 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111124175323.GB28767@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4ECA1EA0.9080309@dcclabs.tv>
	<CAMKF1sqtTsT-W5SuegBrJS9q9JLEze2rU1R8axSrSkwsq-0_Tw@mail.gmail.com>
	<4ECE2EE0.8050708@dcclabs.tv>
MIME-Version: 1.0
In-Reply-To: <4ECE2EE0.8050708@dcclabs.tv>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Cannot compile glibc-initial for ARM
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
X-List-Received-Date: Thu, 24 Nov 2011 17:53:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/11/11 12:47), Pawel Osmialowski wrote:
> Hi Khem,
> 
> Thanks for your answer.
> 
> Unfortunately, removing TARGET_OS and changing glibc to eglibc did not help:
> 
> | running configure fragment for ports/sysdeps/arm/elf
> | checking for ARM TLS support... yes
> | running configure fragment for nptl/sysdeps/pthread
> | configure: error: working compiler support for visibility
> attribute is required
> NOTE: package eglibc-initial-2.12-r21.8+svnr13230: task do_configure: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/pawelo/h3660/openembedded/h3660/../recipes/eglibc/eglibc-initial_2.12.bb
> do_configure failed

can you post the config.log that you will find in glibc-initial build
tree


