Received: from [209.85.198.188] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JKql1-0001rl-2b
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2008 08:56:19 +0100
Received: by rv-out-0910.google.com with SMTP id c24so756753rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 23:56:25 -0800 (PST)
Received: by 10.141.78.14 with SMTP id f14mr2040462rvl.119.1201852585054;
	Thu, 31 Jan 2008 23:56:25 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id 34sm4835727wra.23.2008.01.31.23.56.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 31 Jan 2008 23:56:24 -0800 (PST)
Message-ID: <47A2D0A5.3030806@gmail.com>
Date: Fri, 01 Feb 2008 01:56:21 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1201531952.5882.32.camel@hammer.suse.cz>
In-Reply-To: <1201531952.5882.32.camel@hammer.suse.cz>
Subject: Re: [patch commit request] kernel fixes for Zaurus akita+spitz
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2008 07:56:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/28/2008 08:52 AM, Stanislav Brabec wrote:

> ============================================================
> --- packages/linux/linux-rp-2.6.23/defconfig-spitz	b7ae462871d969fb588349aa16c4991646c4ff65
> +++ packages/linux/linux-rp-2.6.23/defconfig-spitz	b071f674a2ac8b9b060cc5de413b281a6f19e5c6
> @@ -579,7 +579,7 @@ CONFIG_MTD_COMPLEX_MAPPINGS=y
>  #
>  CONFIG_MTD_COMPLEX_MAPPINGS=y
>  # CONFIG_MTD_PHYSMAP is not set
> -CONFIG_MTD_SHARP_SL=y
> +CONFIG_MTD_SHARP_SL=m
>  # CONFIG_MTD_PLATRAM is not set
>  
>  #
> @@ -821,6 +821,7 @@ CONFIG_KEYBOARD_SPITZ=y
>  # CONFIG_KEYBOARD_STOWAWAY is not set
>  # CONFIG_KEYBOARD_CORGI is not set
>  CONFIG_KEYBOARD_SPITZ=y
> +CONFIG_SHARPSL_RC=m
>  # CONFIG_KEYBOARD_PXA27x is not set
>  # CONFIG_KEYBOARD_GPIO is not set
>  # CONFIG_INPUT_MOUSE is not set
> ============================================================
> --- packages/linux/linux-rp-2.6.24/defconfig-spitz	f65cb0f276b3dc6b756efc00689ee05903f1c6d1
> +++ packages/linux/linux-rp-2.6.24/defconfig-spitz	1c089b38d34a93c68659ef90bec902bbbcf436ae
> @@ -589,7 +589,7 @@ CONFIG_MTD_COMPLEX_MAPPINGS=y
>  #
>  CONFIG_MTD_COMPLEX_MAPPINGS=y
>  # CONFIG_MTD_PHYSMAP is not set
> -CONFIG_MTD_SHARP_SL=y
> +CONFIG_MTD_SHARP_SL=m
>  # CONFIG_MTD_PLATRAM is not set
>  
>  #
> @@ -839,6 +839,7 @@ CONFIG_KEYBOARD_SPITZ=y
>  # CONFIG_KEYBOARD_STOWAWAY is not set
>  # CONFIG_KEYBOARD_CORGI is not set
>  CONFIG_KEYBOARD_SPITZ=y
> +CONFIG_SHARPSL_RC=m
>  # CONFIG_KEYBOARD_PXA27x is not set
>  # CONFIG_KEYBOARD_GPIO is not set
>  # CONFIG_INPUT_MOUSE is not set

Shouldn't defconfig-akita be updated as well? Pleas advice.

Regards
Gordon


