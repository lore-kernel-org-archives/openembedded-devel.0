Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6o2H-0006gH-SI
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 21:34:46 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 12:22:30 -0700
Received: by obblz20 with SMTP id lz20so1816936obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 12:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=JEdzIkAHQhYzVMXszVy+hXrTbabD6ML4hNEGUwbtyQE=;
	b=cyJVwzA9SVVT+6pXZeVNaquerK0uy+Qos5s4GeCf10nhh6s48r2kXTO7v+hPgmmVHe
	ovcOc5rbj6mIRMssH1jOaeVi6RobV03Ja8+01c9MelSQuorht1RscU23f4MIMg+i+T3W
	eQdSDx+tlC/pgD21VIa/67EWUgt/dgaPZTFG2Pljn1r5ZRVdAsXePCPMdgSq1GoXpjg1
	UG6wrJqi7AThvp7TLldik8Q+izUTJFdXCHp2wTEWkuEfYtcE7vPvTS9YqxJRv+N4VFS0
	5W8EyLfp5k8nDI4RfC47kmCJsRg8ocV1bunzsGErX0lM6yc3aA51UsNGXVA2qpPpwed5
	Yx7A==
Received: by 10.60.19.195 with SMTP id h3mr2242199oee.102.1346268149324; Wed,
	29 Aug 2012 12:22:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 29 Aug 2012 12:22:08 -0700 (PDT)
In-Reply-To: <CAMKF1srEAmTthOBC6D23uCfO6YW=ZD-BW+mF4UZYwdFbXyKrjg@mail.gmail.com>
References: <1346247150-17236-1-git-send-email-ross.burton@intel.com>
	<3DA568F2-7691-4344-904C-7DB6FFBF90B9@gmail.com>
	<CAJTo0LYGOrwT1BwB8gDmGwMr67v8Mhtci8MK_QdHm9AW7EeDFA@mail.gmail.com>
	<CAMKF1srEAmTthOBC6D23uCfO6YW=ZD-BW+mF4UZYwdFbXyKrjg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 20:22:08 +0100
Message-ID: <CAJTo0LZbKRBWdASi54gO7NvemP_Y3vzvk+w8KD+gVFqFadwwgA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmUOYbeH+7vRY8oOabowOduYD6ff4U9SHDeHf0AiY4Rslf1A6DlCvdLYLqfijR9WiXNxE1u
Subject: Re: [PATCH] pimlico: remove Poky overrides
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
X-List-Received-Date: Wed, 29 Aug 2012 19:34:46 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 18:34, Khem Raj <raj.khem@gmail.com> wrote:
> Patch is fine.
> it should go into meta-yocto which is integration layer for poky distro
> so you patch to delete is fine. may be convert it to some sort of PACKAGECONFIG
> which distros can use.

I don't want them in Poky. :)  I started by simply deleting them, but
Martin insisted that he still has users.  They are not using Poky, I
presume.

Ross


