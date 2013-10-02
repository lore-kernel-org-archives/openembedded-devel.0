Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id F01C06CA44
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Oct 2013 13:53:13 +0000 (UTC)
Message-ID: <524C254A.4030409@communistcode.co.uk>
Date: Wed, 02 Oct 2013 14:53:14 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1380018984-6478-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1380018984-6478-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [meta-oe][PATCHv2 1/2] lm_sensors: reset RDEPENDS_${PN}-dev for lmsensors and lmsensors-config
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
X-List-Received-Date: Wed, 02 Oct 2013 13:53:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24/09/13 11:36, Jack Mitchell wrote:
> From: Jack Mitchell <jmitchell@cbnl.com>
> 
> When building with dev-pkgs enabled I was hitting an error lmsensors
> not available. Resetting the RDEPENDS for the dev packages fixes this
> error as there is no lmsensors or lmsensors-config package defined.
> 
> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
> ---
>  meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb | 2 ++
>  meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb      | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
> index 058ae1b..349cee6 100644
> --- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
> +++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
> @@ -12,6 +12,8 @@ SRC_URI = "file://fancontrol \
>             file://sensors.conf \
>  "
>  
> +RDEPENDS_${PN}-dev = ""
> +
>  do_install() {
>      # Install fancontrol configuration file
>      install -d ${D}${sysconfdir}
> diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
> index 60df0c6..b3a208e 100644
> --- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
> +++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.3.bb
> @@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "ecc91ba3d918e96fb7d5eb9acce978af803b130e0b33b08d5ea05b2bfc
>  
>  inherit update-rc.d
>  
> +RDEPENDS_${PN}-dev = ""
> +
>  INITSCRIPT_PACKAGES = "${PN}-fancontrol ${PN}-sensord"
>  INITSCRIPT_NAME_${PN}-fancontrol = "fancontrol"
>  INITSCRIPT_NAME_${PN}-sensord = "sensord"
> 

Is anyone able to pick these up if there are no more comments?

