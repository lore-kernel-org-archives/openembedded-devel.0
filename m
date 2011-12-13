Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaYbx-0003c1-2n
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 21:06:01 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2011 11:57:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="86172501"
Received: from unknown (HELO [10.255.12.219]) ([10.255.12.219])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2011 11:38:50 -0800
Message-ID: <4EE7A9CA.2050904@linux.intel.com>
Date: Tue, 13 Dec 2011 11:38:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1323789098-6941-1-git-send-email-ulf@emagii.com>
In-Reply-To: <1323789098-6941-1-git-send-email-ulf@emagii.com>
Cc: ulf@emagii.com
Subject: Re: [meta-oe] tz*: download location has moved
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
X-List-Received-Date: Tue, 13 Dec 2011 20:06:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 07:11 AM, ulf@emagii.com wrote:
> From: Ulf Samuelsson<ulf@emagii.com>
>
> Signed-off-by: Ulf Samuelsson<ulf@emagii.com>
> ---
>   meta-oe/recipes-extended/tzcode/tzcode-native.inc |    6 +++---
>   meta-oe/recipes-extended/tzdata/tzdata.inc        |    4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
This was fixed in oe-core, What's the reason that a tz* set is needed in 
meta-oe?  Can we remove them from meta-oe or is the older version needed 
by someone?


Sau!

> diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native.inc b/meta-oe/recipes-extended/tzcode/tzcode-native.inc
> index b946e71..2f9f176 100644
> --- a/meta-oe/recipes-extended/tzcode/tzcode-native.inc
> +++ b/meta-oe/recipes-extended/tzcode/tzcode-native.inc
> @@ -1,9 +1,9 @@
>   DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
> -INC_PR = "r4"
> +INC_PR = "r5"
>
>   SRC_URI = " \
> -        ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV};subdir=${BPN}-${PV} \
> -        ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV};subdir=${BPN}-${PV} \
> +        http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode-${PV};subdir=${BPN}-${PV} \
> +        http://www.iana.org/time-zones/repository/releases/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV};subdir=${BPN}-${PV} \
>   	"
>
>   inherit native
> diff --git a/meta-oe/recipes-extended/tzdata/tzdata.inc b/meta-oe/recipes-extended/tzdata/tzdata.inc
> index ceec924..94f73d8 100644
> --- a/meta-oe/recipes-extended/tzdata/tzdata.inc
> +++ b/meta-oe/recipes-extended/tzdata/tzdata.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Timezone data"
>   SECTION = "base"
>   DEPENDS = "tzcode-native"
>
> -INC_PR = "r10"
> +INC_PR = "r11"
>
>   DEFAULT_TIMEZONE ?= "Europe/London"
>
> @@ -11,7 +11,7 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
>                timezone-australia timezone-europe timezone-indian \
>                timezone-iso3166.tab timezone-pacific timezone-zone.tab"
>
> -SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;subdir=${BPN}-${PV}"
> +SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;subdir=${BPN}-${PV}"
>
>   TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
>            factory solar87 solar88 solar89 etcetera backward systemv \


