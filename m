Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9060572491
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 20:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SKP6BY024293 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:25:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EFsWzYWH2rj5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:25:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SKOqsZ024279
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:25:03 +0100
Message-ID: <1430252692.13022.246.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Apr 2015 21:24:52 +0100
In-Reply-To: <1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
References: <1429801172-30602-1-git-send-email-paul.eggleton@linux.intel.com>
	<1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: Re: [oe-classic][PATCH 1/1] README: update for current status of OE-Classic
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
X-List-Received-Date: Tue, 28 Apr 2015 20:25:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-04-23 at 15:59 +0100, Paul Eggleton wrote:
> OE-Classic is no longer maintained, so update README and MAINTAINERS
> accordingly, and just in case someone might miss reading those, add a
> file clearly spelling it out.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

> ---
>  MAINTAINERS               | 16 +++-------------
>  README                    | 19 +++++++++++++++++--
>  THIS_REPO_IS_OBSOLETE.txt |  1 +
>  3 files changed, 21 insertions(+), 15 deletions(-)
>  create mode 100644 THIS_REPO_IS_OBSOLETE.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f12832..e88d14b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1,18 +1,8 @@
>  OpenEmbedded Maintainers List
>  
> -Please put you full name and email-address here for the areas of OE you want to support.
> -
> -Note: For the hard of thinking, this list is meant to remain in alphabetical
> -order. If you could add yourselves to it in alphabetical order that would be
> -so much easier (sort by firstname). Thank you!
> -
> -Person:     Real name
> -Mail:       Mail patches to
> -Website:    Web-page
> -Interests:  Areas of interest (e.g. subsystems)
> -Distros:    Maintained distros
> -Machines:   Maintained machines
> -Recipes:    Maintained recipes (should match package names, can include wildcards)
> +WARNING: this repository has been superseded and is no longer maintained -
> +please see README for details. The maintainers list below remains for
> +historical purposes only.
>  
>  -----------------------------------------------------------------------------
>  
> diff --git a/README b/README
> index 1264ca6..778efd9 100644
> --- a/README
> +++ b/README
> @@ -1,3 +1,18 @@
> -This is the OpenEmbedded packages metadata repository.
> +This is the OpenEmbedded Classic (OE-Classic) metadata repository.
> +
> +WARNING: This version of OpenEmbedded is no longer supported or actively
> +developed - it has been replaced by a new model based upon
> +OpenEmbedded-Core (OE-Core). Users are strongly encouraged to migrate
> +to OE-Core as there will be no further updates to OE-Classic as part of
> +the OpenEmbedded project.
> +
> +The OE-Core repository is available at:
> +
> +  http://cgit.openembedded.org/openembedded-core/
> +  git://git.openembedded.org/openembedded-core
> +
> +For further details on the differences between OE-Classic and OE-Core,
> +please see:
> +
> +  http://openembedded.org/wiki/OpenEmbedded-Core
>  
> -See http://openembedded.org
> diff --git a/THIS_REPO_IS_OBSOLETE.txt b/THIS_REPO_IS_OBSOLETE.txt
> new file mode 100644
> index 0000000..a283c1b
> --- /dev/null
> +++ b/THIS_REPO_IS_OBSOLETE.txt
> @@ -0,0 +1 @@
> +Superseded by openembedded-core - please see the README file for details.
> -- 
> 2.1.0
> 



