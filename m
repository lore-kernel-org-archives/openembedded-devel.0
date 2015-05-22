Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id BEE8B609B2;
	Fri, 22 May 2015 05:15:35 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so10095405pac.2;
	Thu, 21 May 2015 22:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dfVIR+Z1ylOJzE8XV8f1hqPqXhxuqEI1cnhtfS/y7UU=;
	b=0cULbzTnPzHQWSy2tfgM1QM5lGZVXXThiY6BhK4ekcBBw6YTwk42qlBSc9E/Ri93WA
	qSqfwn2/DyOzfjUA4d40sUlkH0K86AVrAnTdKCngnj4U6oLRvCqeZ86UYQe6WXu43J1I
	qQZbfA96vK/ngaLpsvDD+iFuH51nHTa7ZMkVEZhm1ydwAaNcU0q7igYDmjYCxqTbILcF
	gH9AUSDCaepwPTz07ZsitFXTfCFU3Nqx0rSYG0ox0DpU7Yc6FgOXH8v5KhUeFUAoCBIg
	Ol6ZfhuV739nJnp8t0KCtul4WPnGx5NYg4Ii2rmcvEsCXv8VAbpVgrAB4LrpQLDbXlUS
	c52Q==
MIME-Version: 1.0
X-Received: by 10.68.200.100 with SMTP id jr4mr11975515pbc.168.1432271736332; 
	Thu, 21 May 2015 22:15:36 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Thu, 21 May 2015 22:15:36 -0700 (PDT)
In-Reply-To: <20150520212053.62A5E5040E@opal.openembedded.org>
References: <20150520212053.62A5E5040E@opal.openembedded.org>
Date: Fri, 22 May 2015 07:15:36 +0200
Message-ID: <CALbNGRTLxNG6936gZ1N_W2tpOpAtO8oDN7hnm=kZs-GPoVMe-A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Shiqun Lin : sanity.bbclass: improve the sanity check for PATH and BBPATH
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
X-List-Received-Date: Fri, 22 May 2015 05:15:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 20, 2015 at 11:20 PM,  <git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: b6a23572b8f14e27d4341892b9069e7cac1e9c14
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b6a23572b8f14e27d4341892b9069e7cac1e9c14
>
> Author: Shiqun Lin <Shiqun.Lin@windriver.com>
> Date:   Wed Jan  7 15:00:31 2015 +0800
>
> sanity.bbclass: improve the sanity check for PATH and BBPATH
>
> Build fails if "./" is in the PATH
>
> To reproduce the issue:
>
>   $ export PATH="./:$PATH"
>   $ make -C build-tools elfutils
>
>   Error: ./ld: unrecognized option '--sysroot=/'
>
> Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
>  meta/classes/sanity.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index fc8c980..e738110 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -653,9 +653,9 @@ def check_sanity_version_change(status, d):
>              status.addresult("You have a 32-bit libc, but no 32-bit headers.  You must install the 32-bit libc headers.\n")
>
>      bbpaths = d.getVar('BBPATH', True).split(":")
> -    if ("." in bbpaths or "" in bbpaths) and not status.reparse:
> +    if ("." in bbpaths or "./" in bbpaths or "" in bbpaths) and not status.reparse:
>          status.addresult("BBPATH references the current directory, either through "    \
> -                "an empty entry, or a '.'.\n\t This is unsafe and means your "\
> +                "an empty entry, a './' or a '.'.\n\t This is unsafe and means your "\
>                  "layer configuration is adding empty elements to BBPATH.\n\t "\
>                  "Please check your layer.conf files and other BBPATH "        \
>                  "settings to remove the current working directory "           \
> @@ -693,8 +693,8 @@ def check_sanity_everybuild(status, d):
>      sanity_check_conffiles(status, d)
>
>      paths = d.getVar('PATH', True).split(":")
> -    if "." in paths or "" in paths:
> -        status.addresult("PATH contains '.' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
> +    if "." in paths or "./" in paths or "" in paths:
> +        status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
>
>      # Check that the DISTRO is valid, if set
>      # need to take into account DISTRO renaming DISTRO
>
> --
The PATH part is problematic: My system (fedora 22) or my user - have
not yet checked where it comes from - sets './' in PATH. I am not
happy risking fallout on my system for yocto's sanity.

Andreas

