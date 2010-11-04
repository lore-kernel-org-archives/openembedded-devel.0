Received: from smtp1.irobot.com ([206.83.81.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PE3EZ-0006kR-Je
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 18:04:20 +0100
X-AuditID: 0a460614-b7b54ae0000032d7-30-4cd2e75e595a
Received: from webmail.irobot.com (Unknown_Domain [10.70.6.12])
	by smtp1.irobot.com (Symantec Brightmail Gateway) with SMTP id
	A8.50.13015.E57E2DC4; Thu,  4 Nov 2010 13:03:26 -0400 (EDT)
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	webmail.irobot.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 4 Nov 2010 13:03:27 -0400
Received: from [192.168.69.108] ([192.168.69.108]) by
	fever2.wardrobe.irobot.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 4 Nov 2010 13:03:26 -0400
Message-ID: <4CD2E750.4020909@gmail.com>
Date: Thu, 04 Nov 2010 10:03:12 -0700
From: Tim Harvey <harvey.tim@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288880282-13579-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1288880282-13579-1-git-send-email-kergoth@gmail.com>
X-OriginalArrivalTime: 04 Nov 2010 17:03:26.0579 (UTC)
	FILETIME=[326B9C30:01CB7C42]
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 206.83.81.187
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
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
X-List-Received-Date: Thu, 04 Nov 2010 17:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2010 07:18 AM, Chris Larson wrote:
> From: Chris Larson<chris_larson@mentor.com>
>
> show-ref will show all matching refs, so a "show-ref HEAD" will show not just
> the local HEAD, but the fetched remote ones as well.  This isn't what we want
> for this function, so change it to use rev-parse with --verify, and also
> change it to use --short, to shorten the hash to a more palatable length.
>
> Signed-off-by: Chris Larson<chris_larson@mentor.com>
> ---
>   classes/metadata_scm.bbclass |   22 +++++++++++++---------
>   1 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/classes/metadata_scm.bbclass b/classes/metadata_scm.bbclass
> index ffc6a8a..f79ea19 100644
> --- a/classes/metadata_scm.bbclass
> +++ b/classes/metadata_scm.bbclass
> @@ -63,14 +63,18 @@ def base_get_metadata_svn_revision(path, d):
>   	return revision
>
>   def base_get_metadata_git_branch(path, d):
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
>   def base_get_metadata_git_revision(path, d):
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

This resolves prior issues I had with revision mismatch

Acked-by: Tim Harvey <harvey.tim@gmail.com>


