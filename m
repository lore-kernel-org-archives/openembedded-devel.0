Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA2F7753E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2016 22:17:57 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id f128so1288127iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jun 2016 15:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=IumxlUc2pVSqU0WVDrXrpeJcu79SP1TsUJFe4/2VnnQ=;
	b=kQKlD3tFgZON5Kplz40RVMuQi6QlwuQlownNnyck8OWZ9OGY2uNGBrqzQmkFcjrFGw
	39SsZ6AAU5mlccUTukXYppF2QlOEosqoiJLfLOgOYudyT6X8nbrkfJIF3olPG2ZkYE3g
	+P13BHBfEZVatxEPQE7F0gOFtcYaqdNc1RqSx372/WRPYnge831P1B3owdo38pDyyOTr
	0fmmc0A09aGNrNwKIYJXh/zTx8LGdxtiRv7TZBfGMu5ofJVwx3dUM8MrL1C0SkQLW6A/
	tlulOlRumlyFz/c8CEGvrPCArrPAKjDDRqVykoX2Wtzj9eR/n/7h5Dagrtx/i48OrZyV
	pUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=IumxlUc2pVSqU0WVDrXrpeJcu79SP1TsUJFe4/2VnnQ=;
	b=MFFqq7sNxyUMSCwrxFSRA4ffotwc29Lm/LixVO82kmwYolnWeVrtWLv/liugM19S52
	Mk4mPwbFoAq3z3blXBeNPQ6wQI3WlyKz7Ot5qeKz9kfxhHPyBXOUCdNnb5/hBxTQ4A1l
	3V0S716SMQ046d8Rx0t0iJmQ8TPvFn69+3k4DIwA71A3bwatLM0QS5RYHBqtP5sngpW/
	FBm0lnVXkz47lw/ytFrgAmpYK+7BwrGRGKRzoXbzq9Lvr8ZIUEXXpm3UrZmKTWFEw9NQ
	KO0t2DuME1zYLFneNhSzzM8EfnTVMHV/LuXgmQab5QszsIOpeleIpFy8hXT3O/eKHof0
	DSkg==
X-Gm-Message-State: ALyK8tIBPI+xL7xWabSEY+MyA6zQrWt8Nh0PtfwuVU8zVLqkHWiVle52NMLwoOBmatzpG168e+gD/8easnRKTw==
X-Received: by 10.36.3.7 with SMTP id e7mr2625404ite.15.1464992277814; Fri, 03
	Jun 2016 15:17:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Fri, 3 Jun 2016 15:17:38 -0700 (PDT)
In-Reply-To: <1464979004-19187-1-git-send-email-kergoth@gmail.com>
References: <1464979004-19187-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 3 Jun 2016 15:17:38 -0700
X-Google-Sender-Auth: U4Xf4tm9h4uUvad08rys48NZiUE
Message-ID: <CABcZANmeS76=CDWMHm0TOJ_HbzdzLPJWazseMsQy=AUHhW1maw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH] gitpkgv: ensure that we close our opened files
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
X-List-Received-Date: Fri, 03 Jun 2016 22:17:58 -0000
Content-Type: text/plain; charset=UTF-8

Ignore this, just noticed the fix is already on master-next.

On Fri, Jun 3, 2016 at 11:36 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Avoids warnings like this with python3:
>
>     WARNING:
> .../meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/
> smbnetfs_git.bb: <string>:94: ResourceWarning: unclosed file
> <_io.TextIOWrapper
> name='.../build/downloads/git2/smbnetfs.git.sourceforge.net.gitroot.smbnetfs.smbnetfs/oe-gitpkgv_ace1c519d4'
> mode='r' encoding='UTF-8'>
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta-oe/classes/gitpkgv.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/classes/gitpkgv.bbclass
> b/meta-oe/classes/gitpkgv.bbclass
> index 1cba00c..4866fac 100644
> --- a/meta-oe/classes/gitpkgv.bbclass
> +++ b/meta-oe/classes/gitpkgv.bbclass
> @@ -87,11 +87,13 @@ def get_git_pkgv(d, use_tags):
>
>                      if commits != "":
>                          oe.path.remove(rev_file, recurse=False)
> -                        open(rev_file, "w").write("%d\n" % int(commits))
> +                        with open(rev_file, "w") as f:
> +                            f.write("%d\n" % int(commits))
>                      else:
>                          commits = "0"
>                  else:
> -                    commits = open(rev_file, "r").readline(128).strip()
> +                    with open(rev_file, "r") as f:
> +                        commits = f.readline(128).strip()
>
>                  if use_tags:
>                      try:
> --
> 2.8.0
>
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

