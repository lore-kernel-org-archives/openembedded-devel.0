Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6379C65CD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2015 08:40:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 30 Apr 2015 01:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,675,1422950400"; d="scan'208";a="687907763"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga001.jf.intel.com with ESMTP; 30 Apr 2015 01:40:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Apr 2015 09:40:44 +0100
Message-ID: <7818681.j9iWecntyi@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
References: <1429801172-30602-1-git-send-email-paul.eggleton@linux.intel.com>
	<1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Cc: marcin@juszkiewicz.com.pl
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
X-List-Received-Date: Thu, 30 Apr 2015 08:40:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 April 2015 15:59:32 Paul Eggleton wrote:
> OE-Classic is no longer maintained, so update README and MAINTAINERS
> accordingly, and just in case someone might miss reading those, add a
> file clearly spelling it out.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
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
> -Please put you full name and email-address here for the areas of OE you
> want to support. -
> -Note: For the hard of thinking, this list is meant to remain in
> alphabetical -order. If you could add yourselves to it in alphabetical
> order that would be -so much easier (sort by firstname). Thank you!
> -
> -Person:     Real name
> -Mail:       Mail patches to
> -Website:    Web-page
> -Interests:  Areas of interest (e.g. subsystems)
> -Distros:    Maintained distros
> -Machines:   Maintained machines
> -Recipes:    Maintained recipes (should match package names, can include
> wildcards) +WARNING: this repository has been superseded and is no longer
> maintained - +please see README for details. The maintainers list below
> remains for +historical purposes only.
> 
>  ---------------------------------------------------------------------------
> --
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

From http://logs.nslu2-linux.org/livelogs/oe/oe.20150430.txt :

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

If I don't hear any objections I guess I can merge this tomorrow?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

