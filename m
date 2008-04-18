Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JmhbX-0004vO-2N
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Apr 2008 05:49:39 +0200
Received: by py-out-1112.google.com with SMTP id y77so380071pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2008 20:49:28 -0700 (PDT)
Received: by 10.35.76.2 with SMTP id d2mr3884156pyl.5.1208490567584;
	Thu, 17 Apr 2008 20:49:27 -0700 (PDT)
Received: from ?192.168.199.91? ( [128.252.220.156])
	by mx.google.com with ESMTPS id f6sm31531110pyh.13.2008.04.17.20.49.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 17 Apr 2008 20:49:26 -0700 (PDT)
Message-ID: <48081A44.4000008@gmail.com>
Date: Thu, 17 Apr 2008 22:49:24 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1208473504.21779.3.camel@isis>
In-Reply-To: <1208473504.21779.3.camel@isis>
Subject: Re: patch base-files /etc/profile
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
X-List-Received-Date: Fri, 18 Apr 2008 03:49:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2008 06:05 PM, Khem Raj wrote:
> Hi 
> 
> I was seeing that on Angstrom.2008 I was not getting TSLIB_TSDEVICE
> environment variable set though it should be as it was
> invoking /etc/profile.d/tslib.sh in /etc/profile. However the 'ls'
> command in there was not really working well.
> 
> This patch fixes the problem. Now I see TALIB_TSDEVICE variable set
> everytime.
> 
> OK for .dev ?
> 
> Thanks
> 
> -Khem
> ============================================================
> --- packages/base-files/base-files/profile
> c1afd65b969f708eab144ec909358f3c8f22a411
> +++ packages/base-files/base-files/profile
> e24b90b96edb24d3af735f32c72528e6a01d617d
> @@ -20,8 +20,10 @@ if [ -d /etc/profile.d ]; then
>  fi
>  
>  if [ -d /etc/profile.d ]; then
> -  for i in `ls /etc/profile.d/`; do
> -    . /etc/profile.d/$i
> +  for i in /etc/profile.d/*.sh; do
> +    if [ -r $i ]; then
> +      . $i
> +    fi
>    done
>    unset i
>  fi

looks good to me, but why not keep the absolute path:

. /etc/profile.d/$i

Regards
Gordon


