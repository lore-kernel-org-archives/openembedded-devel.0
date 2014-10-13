Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa11-01.prod.phx3.secureserver.net
	(p3plsmtpa11-01.prod.phx3.secureserver.net [68.178.252.102])
	by mail.openembedded.org (Postfix) with ESMTP id F1DA56A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 12:38:07 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa11-01.prod.phx3.secureserver.net with 
	id 2ce41p0020BVjqb01ce4QK; Mon, 13 Oct 2014 05:38:05 -0700
Message-ID: <543BC7AB.6060908@pabigot.com>
Date: Mon, 13 Oct 2014 07:38:03 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1413180347.git.wenzong.fan@windriver.com>
	<0ba4f373d7be41147888b6a71728f7771ef28bb8.1413180347.git.wenzong.fan@windriver.com>
In-Reply-To: <0ba4f373d7be41147888b6a71728f7771ef28bb8.1413180347.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 1/1 v3][meta-networking] ntp: fix path to drift file
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
X-List-Received-Date: Mon, 13 Oct 2014 12:38:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2014 01:17 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> The default path of ntp drift file is /etc/ntp.drift, ntp daemon
> maybe fails to create this file since the user ntp is not always
> permitted to write /etc.
>
> Refer to other distributions such as RedHat, Debian, just moving
> the file to /var/lib/ntp which the home dir of user ntp.

Note that this new version depends on 
http://patches.openembedded.org/patch/81585/ which provides the 
packaging of ntp's home directory, which wasn't captured into 
master-next.  That would be obscured by the presence of the previous 
version of this patch which (IMO) improperly uses volatile to create 
that directory.

Peter

>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta-networking/recipes-support/ntp/files/ntp.conf |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-networking/recipes-support/ntp/files/ntp.conf
> index 875b7eb..676e186 100644
> --- a/meta-networking/recipes-support/ntp/files/ntp.conf
> +++ b/meta-networking/recipes-support/ntp/files/ntp.conf
> @@ -1,7 +1,7 @@
>   # This is the most basic ntp configuration file
>   # The driftfile must remain in a place specific to this
>   # machine - it records the machine specific clock error
> -driftfile /etc/ntp.drift
> +driftfile /var/lib/ntp/drift
>   # This should be a server that is close (in IP terms)
>   # to the machine.  Add other servers as required.
>   # Unless you un-comment the line below ntpd will sync


