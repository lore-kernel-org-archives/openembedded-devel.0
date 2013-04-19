Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UT7Dj-00081R-Rw
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 11:03:07 +0200
Message-ID: <51710428.1050309@communistcode.co.uk>
Date: Fri, 19 Apr 2013 09:45:28 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1366267106.git.paul.eggleton@linux.intel.com>
	<f7b25f907b18cf3b37d192bc8d79e8b0262a6124.1366267106.git.paul.eggleton@linux.intel.com>
In-Reply-To: <f7b25f907b18cf3b37d192bc8d79e8b0262a6124.1366267106.git.paul.eggleton@linux.intel.com>
Subject: Re: [meta-oe, meta-webserver][PATCH 1/2] cherokee: move to meta-webserver and tweak
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
X-List-Received-Date: Fri, 19 Apr 2013 09:03:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/13 07:39, Paul Eggleton wrote:
> * Set SUMMARY instead of DESCRIPTION
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   .../recipes-httpd}/cherokee/cherokee/cherokee.init                 |    0
>   .../recipes-httpd}/cherokee/cherokee_1.2.98.bb                     |    4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename {meta-oe/recipes-connectivity => meta-webserver/recipes-httpd}/cherokee/cherokee/cherokee.init (100%)
>   rename {meta-oe/recipes-connectivity => meta-webserver/recipes-httpd}/cherokee/cherokee_1.2.98.bb (93%)
>
> diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.init b/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
> similarity index 100%
> rename from meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.init
> rename to meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
> diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> similarity index 93%
> rename from meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
> rename to meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> index 6c030a6..1510e70 100644
> --- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
> +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> @@ -1,5 +1,5 @@
> -DESCRIPTION = "Cherokee Web Server fast and secure"
> -DESCRIPTION_cget = "Small downloader based in the Cherokee client library"
> +SUMMARY = "Cherokee Web Server fast and secure"
> +SUMMARY_cget = "Small downloader based in the Cherokee client library"
>   HOMEPAGE = "http://www.cherokee-project.com/"
>   SECTION = "network"
>   LICENSE = "GPLv2"

Building this morning I received this warning:

WARNING: Unable to get checksum for cherokee SRC_URI entry 
cherokee.service: file could not be found

On a second build it disappeared, something to look into?

Cheers,



-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



