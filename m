Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D46B765C5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:10:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 12 Apr 2016 15:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,476,1455004800"; d="scan'208";a="943823049"
Received: from scetola-mac01.jf.intel.com ([10.7.198.61])
	by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2016 15:10:12 -0700
Date: Tue, 12 Apr 2016 15:10:11 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160412221011.GA46822@scetola-mac01.jf.intel.com>
References: <1460498439-18426-1-git-send-email-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1460498439-18426-1-git-send-email-stephano.cetola@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] devtool: sdk-update fails on remote hosts
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
X-List-Received-Date: Tue, 12 Apr 2016 22:10:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, this belongs in OE-core. Resent to the right mailing list.

Cheers,
Stephano

On 04/12, Stephano Cetola wrote:
> This fixes bug #9426:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9426
> 
> Skip .git folders when copying the build system.
> 
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  meta/lib/oe/copy_buildsystem.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
> index dd0e664..7b9a0ee 100644
> --- a/meta/lib/oe/copy_buildsystem.py
> +++ b/meta/lib/oe/copy_buildsystem.py
> @@ -8,7 +8,7 @@ def _smart_copy(src, dest):
>      # source is a file or a directory.
>      mode = os.stat(src).st_mode
>      if stat.S_ISDIR(mode):
> -        shutil.copytree(src, dest, symlinks=True)
> +        shutil.copytree(src, dest, symlinks=True, ignore=shutil.ignore_patterns('.git'))
>      else:
>          shutil.copyfile(src, dest)
>          shutil.copymode(src, dest)
> -- 
> 2.8.0
> 

