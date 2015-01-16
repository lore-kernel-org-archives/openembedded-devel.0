Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 539 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Jan 2015 19:39:38 UTC
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 78CD7722C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 19:39:38 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 61F35F811E7; Fri, 16 Jan 2015 12:30:40 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A2BA8F811E7;
	Fri, 16 Jan 2015 12:30:39 -0700 (MST)
Message-ID: <54B966E7.8010102@mlbassoc.com>
Date: Fri, 16 Jan 2015 12:30:47 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1421435951-15401-1-git-send-email-mario@ossystems.com.br>
	<1421435951-15401-2-git-send-email-mario@ossystems.com.br>
In-Reply-To: <1421435951-15401-2-git-send-email-mario@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 2/2] layer.conf: add dependency on gnome-layer
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
X-List-Received-Date: Fri, 16 Jan 2015 19:39:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-01-16 12:19, Mario Domenech Goulart wrote:
> This layer contains a bbappend file for gnome-settings-daemon, which
> is provided by meta-gnome.
>
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>   conf/layer.conf | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 5275778..06cb69a 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -9,3 +9,5 @@ BBFILE_PATTERN_browser-layer := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_browser-layer = "7"
>
>   LAYERVERSION_browser-layer = "1"
> +
> +LAYERDEPENDS_browser-layer = "gnome-layer"
>

It would be better to make inclusion of the .bbappend file
dependent on whether or not you have meta-gnome present, much
like many of the .bbappend files found in meta-fsl-arm.

In particular, I want to use meta-browser but don't expect
to need meta-gnome, so this change would break my systems :-(

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

