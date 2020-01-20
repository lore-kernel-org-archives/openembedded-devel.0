Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id C6D347FC51;
	Mon, 20 Jan 2020 17:04:07 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id f5so67640ilq.5;
	Mon, 20 Jan 2020 09:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h56WhaeW5G+DMUumyyjX6NUchgAh9sdB4bGhnT+SiJA=;
	b=tjOSFJp0kqR9CNwFCLHWppfoItqBlvY+U/dckl2+q2K1EV3+DqMzOUW+Mz8DlL5WtG
	gUilVoatG3oCg9mSJW9ECstJ8GP7igOlKmZVNsoDkjgMnBVCG3DIdBZoeNFMNd5UPBVo
	4UAfglupmtoTn2xZ0aSmiNErmp2nCZxbpuFqtSlemwiqiyz7kjddvo6+jiGPVNAiLZk7
	jK3faX0cUSLVMIox1I/k5UhlR+W4PPY/9cZ4oo9urgnbpwFAiSOHFDyJmpuv3n0c5doT
	Js1BUlPoZcYLi06yws2bQna+6f1rmgkGA/eukSSsPBZHNOL8fufe1UkoqQlATw+xLrm9
	siKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h56WhaeW5G+DMUumyyjX6NUchgAh9sdB4bGhnT+SiJA=;
	b=MfRFXCqXDQUDOwPZ+UqqhpzMYQP+YiT86hhzEoes/NlkpCz7bScDcSLBFSX7OjDogx
	ym3mphfgKMkALU4dUTp/2koW+amOPgbo13m6guqim9BXN/i7VHqALShlJs9hX63U4nIt
	Y+mzS2blTqDTAsuqckb04yFLaegQ+THWhiqXDhiaDouPPLU7ozK+gJkS5xn8wp9tw0Sg
	LQOtr/cxDLgMIZkGSCzz/KZpzeJkhZRbyjr5lNtGE6TijWC3rrkJLZWVp9KyOoErYKlk
	1Kat1PscotGErhpRUh0/Zfdjq2ieftne3jJiIZpGZs1rq0qEimJP7FclA2DI+0CEV1tS
	YSVg==
X-Gm-Message-State: APjAAAW0A0DNWzCjx0zQhPmXfNG78CPhXvFv/ymi1uC52lWAKUCHKzjz
	Oc5OK/EA3oDKqmoKmkOD8SDAG3FbL/94s347HK4=
X-Google-Smtp-Source: APXvYqxnOk0woPeEbQqLSND5tI2g1MaWO0SfiULv6dG/aZ9B24510rqzB6RVNXY0IeAuDgDA7UTGSGJ44p22tIw7xhI=
X-Received: by 2002:a92:911b:: with SMTP id t27mr48024ild.142.1579539848718;
	Mon, 20 Jan 2020 09:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20200120115132.3618-1-ross.burton@intel.com>
In-Reply-To: <20200120115132.3618-1-ross.burton@intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 20 Jan 2020 09:03:57 -0800
Message-ID: <CANx9H-BBqLtyL3g9KmzyUw1ZasginK7eQzWA8AM05R_8KJqM+g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][meta-python2] python: add 2.7.17 from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jan 2020 17:04:08 -0000
Content-Type: text/plain; charset="UTF-8"

First of all, a GREAT BIG THANK YOU for doing this.

ERROR: ParseError at
/home/ttorling/Projects/meta-python2/recipes-devtools/python/
python_2.7.17.bb:1: Could not include required file python.inc

Seems like python.inc is 2.7 specific and should also move? I grepped for
usage in poky and didn't find any.

On Mon, Jan 20, 2020 at 3:51 AM Ross Burton <ross.burton@intel.com> wrote:

> Python 2 ceased being maintained on the 1st January 2020.  All users of
> Python 2 in oe-core have already been ported to Python 3, so in oe-core
> 390f3eda Python 2 was finally removed from oe-core itself.
>
> The following are added to meta-python2 in this commit:
> - python and python-native 2.7.17
> - python-setuptools
> - The classes pythonnative, pythondir, distutils, setuptools
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  classes/distutils-base.bbclass                |    4 +
>  classes/distutils.bbclass                     |   87 ++
>  classes/python-dir.bbclass                    |    5 +
>  classes/pythonnative.bbclass                  |   27 +
>  classes/setuptools.bbclass                    |    3 +
>
> <snip>

> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

