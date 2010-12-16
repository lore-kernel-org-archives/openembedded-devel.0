Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PTmcm-0001Jr-Nd
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 03:34:20 +0100
Received: by fxm11 with SMTP id 11so1239706fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 18:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/jiF1ME84ttR/jAGQychCxQUbWP5+JOJbK8BkXLti+o=;
	b=D3i5HevlPW68DfmeyJ04sWQP3aUL6LwgBEFCm92aBUeN/2D5jXhnbdv+w3dYDiFvNH
	X8Khp2/NRwCg5GRu/Xaad+MgotyZ08Oql/qOvJ8RPDdMtCAn2QA2X1SJwUMM2xkWsx8q
	ho73/sj2pz7OVJXaCqEsaZw86ZyvDoBSULT1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tvNBxnQhWCvkJiIyJoGGmjgeAxHTZDxB2BrImBw4tevLhXtdg660xsoVdpb8hvTQ9k
	EFaclvfJTLZFRmiFGt0xEKVuRZ2dpjGF8e4WHVR2D84WhsEOQMxQgyJuTotyJMMM45Ii
	BUUwxUfIxWdwwoGAqEM+VMv3HZn0VfhGgUDPM=
Received: by 10.223.125.196 with SMTP id z4mr291648far.124.1292536339501;
	Thu, 16 Dec 2010 13:52:19 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o17sm212600fal.1.2010.12.16.13.52.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 13:52:18 -0800 (PST)
Date: Thu, 16 Dec 2010 22:52:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216215228.GB19482@jama>
References: <1292510112-32629-1-git-send-email-otavio@ossystems.com.br>
	<1292515657-15330-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1292515657-15330-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] classes/gitpkgv.bbclass: add GITPKGVTAG that uses 'git describe'
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
X-List-Received-Date: Sat, 18 Dec 2010 02:34:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 16, 2010 at 02:07:37PM -0200, Otavio Salvador wrote:
> Using ${GITPKGVTAG} allows for automatic versioning based on the
> repository tags. For those that doesn't want to use it, ${GITPKGV} is
> still available.

Thanks for merging it to one bbclass. IMHO looks much better now.
Consider providing examples and warning as suggested bellow.

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  classes/gitpkgv.bbclass |   59 ++++++++++++++++++++++++++++++++++++----------
>  1 files changed, 46 insertions(+), 13 deletions(-)
> 
> diff --git a/classes/gitpkgv.bbclass b/classes/gitpkgv.bbclass
> index bc1dc32..ebedcb7 100644
> --- a/classes/gitpkgv.bbclass
> +++ b/classes/gitpkgv.bbclass
> @@ -1,23 +1,46 @@
> -# gitpkgv.bbclass provides a GITPKGV variable which is a sortable version
> -# with the format NN+GITHASH, to be used in PKGV, where
> +# gitpkgv.bbclass provides a GITPKGV and GITPKGVTAG variables to be
> +# used in PKGV, as described bellow:
>  #
> -# NN equals the total number of revs up to SRCREV
> -# GITHASH is SRCREV's (full) hash
> +# - GITPKGV which is a sortable version with the format NN+GITHASH, to
> +#   be used in PKGV, where
>  #
> -# gitpkgv.bbclass assumes the git repository has been cloned, and contains
> -# SRCREV. So ${GITPKGV} should never be used in PV, only in PKGV.
> -# It can handle SRCREV = ${AUTOREV}, as well as SRCREV = "<some fixed git hash>"
> +#   NN equals the total number of revs up to SRCREV
> +#   GITHASH is SRCREV's (full) hash
> +#
> +# - GITPKGVTAG which is the output of 'git describe' allowing for
> +#   automatic versioning
> +#
> +# gitpkgv.bbclass assumes the git repository has been cloned, and
> +# contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
> +# used in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as
> +# well as SRCREV = "<some fixed git hash>"
>  #
>  # use example:
>  #
>  # inherit gitpkgv
>  #
> -# PV = "1.0+git${SRCPV}"
> -# PKGV = "1.0+git${GITPKGV}"
> +# PV = "1.0+gitr${SRCPV}"
> +# PKGV = "1.0+gitr${GITPKGV}"

# PV = "1.0+gitr${SRCPV}"      # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
# PKGV = "1.0+gitr${GITPKGV}"  # expands also to something like 1.0+gitr31337+4c1c21d7dbbf93b0df336994524313dfe0d4963b

> +#
> +# or

As we were discussing with otavio on #oe, I think there should be
warning, that GITPKGVTAG is really sortable only if the upstream repo
keeps consistent AND sortable tag names.

For example tags in OE repo will fail, because only tested_2010-* tags
are sortable but this sequence:

tested_2010-11-04
release-2010.12-branchpoint
tested_2010-11-12

is not. And only way to fix it when it's shiped with non-standard tag to
targets is to bump PE :/.

Even better solution would be to set something like GITTAGFORMAT in
recipe, to expected consistent tag scheme and if returned git describe
prefix is different then warn builder about it or even fail or ignore
that tag.

Proposed "warning":

# or if upstream repository is always using consistent and sortable tag
# name scheme you can get sortable version including tag name with
# GITPKGVTAG, but be aware that ie tag sequence "v1.0, v1.2, xtest, v2.0"
# will force you to increment PE to get upgradeable path to v2.0 revisions

> +#
> +# inherit gitpkgv
> +#
> +# PV = "1.0+gitr${SRCPV}"
> +# PKGV = "${GITPKGVTAG}"

# PV = "1.0+gitr${SRCPV}" # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
# PKGV = "${GITPKGVTAG}"  # expands to something like 1.0-31337+g4c1c21d 
#                           if there is tag v1.0 before this revision or
#                           ver1.0-31337+g4c1c21d if there is tag ver1.0


>  
> -GITPKGV = "${@get_git_pkgv(d)}"
>  
> -def get_git_pkgv(d):
> +GITPKGV = "${@get_git_pkgv(d, False)}"
> +GITPKGVTAG = "${@get_git_pkgv(d, True)}"
> +
> +def git_drop_tag_prefix(version):
> +    import re
> +    if re.match("v\d", version):
> +        return version[1:]
> +    else:
> +        return version
> +
> +def get_git_pkgv(d, use_tags):
>  	import os
>  	import bb
>  
> @@ -33,9 +56,19 @@ def get_git_pkgv(d):
>  
>  			cwd = os.getcwd()
>  			os.chdir(repodir)
> -			output = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True)
> +
> +			commits = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
> +
> +			if use_tags:
> +				try:
> +					ver = git_drop_tag_prefix(bb.fetch.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip())
> +				except Exception:
> +					ver = "0.0-%s-g%s" % commits, rev[:7]
> +			else:
> +				ver = "%s+%s" % commits, rev[:7]
> +
>  			os.chdir(cwd)
>  
> -			return "%s+%s" % (output.split()[0], rev)
> +			return ver
>  
>  	return "0+0"
> -- 
> 1.7.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


