Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C71EE7574D;
	Fri, 29 May 2015 09:18:08 +0000 (UTC)
Received: by wgme6 with SMTP id e6so57221280wgm.2;
	Fri, 29 May 2015 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fRDSQqDXz3KpDQbVuihnJ4YHt0QcqlNbt8kMxaXOA0I=;
	b=OMLy4OJlq9SgsdudJ+FhwJC8XROhYwy6wPLpftldHrdU3/0RgrPR643OjR0COXv6tY
	aNBV7h0GGKkW5BcMVq16oB26Osl+B61T2KDdAQNlrLEr2FGj75r7Dn4LVCdYjrvwEG0e
	Qzc7RQNmtMpO/liaFxEhDRcqBaPb/UwwELoMHQjNw7XIutkvInldXvMmgsgW2WcNJ8EN
	DIsro+yu/ElhI47062vlA6hr2abeycB2sqzBGdjZmVNgWgVUL9sI3KSLkOTtI4OuXbZR
	1E46Z0Xo8CIeTGIkxAz7bhAZMhnhlc0SGxc91KO8Lzk25gTv2gOopHORyTQ/lDQm5XE+
	cb6Q==
MIME-Version: 1.0
X-Received: by 10.194.90.100 with SMTP id bv4mr12988617wjb.143.1432891088548; 
	Fri, 29 May 2015 02:18:08 -0700 (PDT)
Received: by 10.28.167.73 with HTTP; Fri, 29 May 2015 02:18:08 -0700 (PDT)
In-Reply-To: <CAK8F28mc2C=r4n42xFmNaxNveectuB8esrkt4M2BkSknH-mFxw@mail.gmail.com>
References: <20150427105100.GB2379@jama>
	<1432309170-5575-1-git-send-email-ashcharles@gmail.com>
	<5567C5B1.7010901@windriver.com>
	<CAK8F28mc2C=r4n42xFmNaxNveectuB8esrkt4M2BkSknH-mFxw@mail.gmail.com>
Date: Fri, 29 May 2015 11:18:08 +0200
Message-ID: <CA+chaQe_T9zPjckAm+NZrZpdw5BO81eL-vxrAA-2kYymMRbd1w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Ash Charles <ashcharles@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: bitbake-devel <bitbake-devel@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [bitbake-devel] [PATCH] fetch/hg: Disable checksums for archived downloads
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
X-List-Received-Date: Fri, 29 May 2015 09:18:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

FWIW: I see vim unpack failing now in world builds:

NOTE: recipe vim-7.4.481-r0: task do_unpack: Started
ERROR: Function failed: Fetcher failure: Fetch command failed with
exit code 255, output:
abort: repository
/home/jenkins/oe/world/shr-core/downloads/hg/vim.googlecode.com/hg/vim
not found!

ERROR: Logfile of failure stored in:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/vim=
/7.4.481-r0/temp/log.do_unpack.28505
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| DEBUG: Unpack: creating new hg repository in
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/vi=
m/7.4.481-r0/vim'
| DEBUG: Running export
PATH=3D"/home/jenkins/oe/world/shr-core/openembedded-core/scripts:/home/jen=
kins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux=
-gnueabi:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/bin=
/crossscripts:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-lin=
ux/usr/sbin:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux=
/usr/bin:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/sb=
in:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/bin:/hom=
e/jenkins/oe/world/shr-core/openembedded-core/scripts:/home/jenkins/oe/worl=
d/shr-core/bitbake/bin:/home/jenkins/bin:/usr/local/sbin:/usr/local/bin:/us=
r/sbin:/usr/bin:/sbin:/bin:/usr/games";
export HOME=3D"/home/jenkins"; /usr/bin/env hg init
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/vim=
/7.4.481-r0/vim
| DEBUG: Unpack: updating source in
'/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/vi=
m/7.4.481-r0/vim'
| DEBUG: Running export
PATH=3D"/home/jenkins/oe/world/shr-core/openembedded-core/scripts:/home/jen=
kins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux=
-gnueabi:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/bin=
/crossscripts:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-lin=
ux/usr/sbin:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux=
/usr/bin:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/sb=
in:/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/bin:/hom=
e/jenkins/oe/world/shr-core/openembedded-core/scripts:/home/jenkins/oe/worl=
d/shr-core/bitbake/bin:/home/jenkins/bin:/usr/local/sbin:/usr/local/bin:/us=
r/sbin:/usr/bin:/sbin:/bin:/usr/games";
export HOME=3D"/home/jenkins"; /usr/bin/env hg pull
/home/jenkins/oe/world/shr-core/downloads/hg/vim.googlecode.com/hg/vim
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| ERROR: Function failed: Fetcher failure: Fetch command failed with
exit code 255, output:
| abort: repository
/home/jenkins/oe/world/shr-core/downloads/hg/vim.googlecode.com/hg/vim
not found!
|
NOTE: recipe vim-7.4.481-r0: task do_unpack: Failed
ERROR: Task 5789
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/=
vim/vim_7.4.481.bb,
do_unpack) failed with exit code '1'



On Fri, May 29, 2015 at 7:46 AM, Ash Charles <ashcharles@gmail.com> wrote:

> > I wonder how did you test the patch, please ? Did you revert the patch:
> >  fetch/hg: support submodules ?
> Hi Robert,
> I tested the patch in a Yocto environment which had a prepopulated
> downloads directory. In particular, I had seen the failure described [1]
> for vim.
> My version of bitbake was slightly older so the submodule patch that was
> breaking the mirroring hadn't yet been applied.
>
> [1]
> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/ms=
g41328.html
>
> --Ash
>
> --
> _______________________________________________
> bitbake-devel mailing list
> bitbake-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/bitbake-devel
>
>

