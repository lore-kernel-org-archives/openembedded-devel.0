Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OemtL-00029N-IK
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 12:32:40 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id CA7A943F036E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 13:32:17 +0300 (EEST)
Message-ID: <4C52AA5A.5030205@dcombus.com>
Date: Fri, 30 Jul 2010 13:32:58 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280480631-23360-1-git-send-email-henri.bragge@dcombus.com>
	<1280480631-23360-2-git-send-email-henri.bragge@dcombus.com>
In-Reply-To: <1280480631-23360-2-git-send-email-henri.bragge@dcombus.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipe for scli-0.4.0
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
X-List-Received-Date: Fri, 30 Jul 2010 10:32:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

henri.bragge@dcombus.com wrote:
> From: Henri Bragge <henri.bragge@dcombus.com>
>
> Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
> ---
>  recipes/scli/scli.inc    |    6 ++++++
>  recipes/scli/scli_svn.bb |    8 ++++++++
>  2 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/scli/scli.inc
>  create mode 100644 recipes/scli/scli_svn.bb
>
> diff --git a/recipes/scli/scli.inc b/recipes/scli/scli.inc
> new file mode 100644
> index 0000000..abe341d
> --- /dev/null
> +++ b/recipes/scli/scli.inc
> @@ -0,0 +1,6 @@
> +DESCRIPTION = "SNMP Command Line Interface"
> +LICENSE = "GPLv2"
> +SECTION = "console/network"
> +DEPENDS = "gsnmp readline libxml2 ncurses"
> +
> +inherit autotools
> diff --git a/recipes/scli/scli_svn.bb b/recipes/scli/scli_svn.bb
> new file mode 100644
> index 0000000..45bd08e
> --- /dev/null
> +++ b/recipes/scli/scli_svn.bb
> @@ -0,0 +1,8 @@
> +require scli.inc
> +
> +SRCREV = "3285"
> +PV = "0.4.0+svnr${SRCREV}"
> +PR = "r1"
> +
> +SRC_URI = "svn://cnds.eecs.jacobs-university.de/svn/schoenw/src/scli;module=trunk;proto=https"
> +S = "${WORKDIR}/trunk"
>   

Meant to include some info about these packages too.

gsnmp:
http://packages.debian.org/sid/libgsnmp0

scli:
http://packages.debian.org/sid/scli

Tested with Angstrom on at91sam9261ek board, bitbake 1.8.18.


