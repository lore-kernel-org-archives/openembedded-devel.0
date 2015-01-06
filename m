Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECB87293A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 11:33:48 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id p6so662229qcv.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 03:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Us2IPlqd9Ce8I1nBHFgIbd1330bFGdJXJyUNvEWdePM=;
	b=V/VQRKq8Jp5rlNu91Q3AD50Lk7O94n4gQTZjRRn5y/OdULDAO9HAGIdZULU92Xn8R7
	AkmDl+NCUz6EDYRMpAzyokINkkc2kpPt/VKaQbv0thNX3JeZvb8OQlchToqU6iG3mdcx
	Ld7vkAkLyTbCJNDNWsEhKEVztzlWxYusskD7YtRJgfrStVMvyDTCy2utb0vDtUW3xyaH
	3Fjah20QuUXH8+vPli9JO2WwTQvX+X5fASVJb3CyVepFm/eBxDV6W3CrFov5fgK0Nz41
	uUr8sV50rHA8gAltMFsX9fm+0fY8LWQkYNOpYyJcRwJIVcasrCfo6VT9+vU27xyk2JGA
	/5Ow==
X-Gm-Message-State: ALoCoQk1dhimmHULv0A33kzSK4Y8adexGTQbFqh1OHTH2Lzd0+Iuy0vn0qu9MoMYrkXK0QDvEmW1
X-Received: by 10.224.92.205 with SMTP id s13mr152431927qam.52.1420544027562; 
	Tue, 06 Jan 2015 03:33:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 6 Jan 2015 03:33:27 -0800 (PST)
In-Reply-To: <20150106110406.GD19402@jama>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl> <20150106085731.GC19402@jama>
	<20150106110406.GD19402@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jan 2015 11:33:27 +0000
Message-ID: <CAJTo0Lbp=oNx9nd-LJ-sz1+N1ZSspPoz=7f9EoFdZhCUEVjiQg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] What is expected of a kernel recipe nowadays?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2015 11:33:50 -0000
Content-Type: text/plain; charset=UTF-8

On 6 January 2015 at 11:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> > | make: *** No rule to make target `oldconfig'.  Stop.
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at
> /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498)
> > NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task
> do_configure: Failed
> > ERROR: Task 491
> (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-smartphone/meta-lg/recipes-kernel/linux/
> linux-lg-mako_git.bb, do_configure) failed with exit code '1'
>
> This was caused by linux.inc, fixed in:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099687.html


I'm replicating this error with an oe-core kernel, so there's more causes
here.

Ross

