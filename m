Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PE4O2-0006BI-BB
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 19:18:10 +0100
Received: by ywo7 with SMTP id 7so1124991ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 11:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/vOYruajmEE5KUOrJ/ZbQhl4wZ9rs/M1ctRhFUW0mTo=;
	b=XBlkiXvj7bKd0eHhL6Y5Xe/kIT9OzbnBcJpTQeCsM6GxKNNbzVHB2iXZs3P6xxKRQd
	JmCmm1nTUMXK5Unjeld+TKH8XOJlo+iSyxfHXGzdsTlSvTyqCy5/WNnaMr3qGzTGFt7D
	jJbFWbK162i2vgTcz/N5XXX/iyBxIpuC4SG38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=v6oja9EjqSTer22xKRo99rb24wbPDY7W2UB8UarTAR/HIX9mYpB9kABfv5f7W4/oDt
	Dr3pebrLQ88odE5QdMEFguhDvQl9VWxH8PYSjvGFQe87ORB4C8gvP5LNDkbf0AIzA6Bq
	jYHhrWA6m7F6pa9wmYTkW96ti00yeoxYluS5w=
Received: by 10.150.92.21 with SMTP id p21mr481047ybb.129.1288894634001;
	Thu, 04 Nov 2010 11:17:14 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q36sm181917ybk.6.2010.11.04.11.17.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 11:17:13 -0700 (PDT)
Date: Thu, 4 Nov 2010 11:17:41 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101104181741.GC21548@gmail.com>
References: <1288880282-13579-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1288880282-13579-1-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] metadata_scm: use rev-parse rather than show-ref
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
X-List-Received-Date: Thu, 04 Nov 2010 18:18:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/11/10 07:18), Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> show-ref will show all matching refs, so a "show-ref HEAD" will show not just
> the local HEAD, but the fetched remote ones as well.  This isn't what we want
> for this function, so change it to use rev-parse with --verify, and also
> change it to use --short, to shorten the hash to a more palatable length.
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

seems to hold on my limited testing

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  classes/metadata_scm.bbclass |   22 +++++++++++++---------
>  1 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/classes/metadata_scm.bbclass b/classes/metadata_scm.bbclass
> index ffc6a8a..f79ea19 100644
> --- a/classes/metadata_scm.bbclass
> +++ b/classes/metadata_scm.bbclass
> @@ -63,14 +63,18 @@ def base_get_metadata_svn_revision(path, d):
>  	return revision
>  
>  def base_get_metadata_git_branch(path, d):
> -	branch = os.popen('cd %s; PATH=%s git symbolic-ref HEAD 2>/dev/null' % (path, d.getVar("PATH", 1))).read().rstrip()
> -
> -	if len(branch) != 0:
> -		return branch.replace("refs/heads/", "")
> -	return "<unknown>"
> +    try:
> +        rev = oe_run(d, ["git", "symbolic-ref", "HEAD"], cwd=path).rstrip()
> +    except oe.process.CmdError:
> +        rev = "<unknown>"
> +    else:
> +        rev = rev.replace("refs/heads/", "")
> +    return rev
>  
>  def base_get_metadata_git_revision(path, d):
> -	rev = os.popen("cd %s; PATH=%s git show-ref HEAD 2>/dev/null" % (path, d.getVar("PATH", 1))).read().split(" ")[0].rstrip()
> -	if len(rev) != 0:
> -		return rev
> -	return "<unknown>"
> +    try:
> +        rev = oe_run(d, ["git", "rev-parse", "--verify", "--short", "HEAD"],
> +                     cwd=path).rstrip()
> +    except oe.process.CmdError:
> +        rev = "<unknown>"
> +    return rev
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


