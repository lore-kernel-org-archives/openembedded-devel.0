Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7605B62135
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 02:10:01 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 144so9198388pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 18:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=8H77N8kiGNXug5vLrSGdWZijEDdlA3238Pt+1eL9EFo=;
	b=TOHknW/wmVQPJ5cm5cCDEhIrWobq+R4XeOIbd+vzSYvOA5M7kG5Q4cpANzzIpcYDdT
	KPTvkzYA2tNIuUv6h4qJOZIfAKF9jRRJDJzVwER4UiVAZqHdR1nJOd3Onotkq8LlNLUY
	YxzDP5yunmxYn5QUVmOrp3c/13ZbeiijEg+jEr2mBSQvK+OhopzWeozE14aEeB2PJOgi
	bnl8syxRYlc+ucn5n935WDdPK/MpFAYi8lW+/4BqjR69AdoeV5WbqIeyVoqYeyt/2qt/
	qIr6FZcIJpd/67IXZIhBEUZG5BF6OUWb6n3cG62FT3+GncFeikbcCMU0MY75jMsxO4Fb
	IEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8H77N8kiGNXug5vLrSGdWZijEDdlA3238Pt+1eL9EFo=;
	b=mMeig9r+v+068XYPOmQTyVXB3e/bcfL0zhbdSBqFMC8lWfp9Vaj7W4TUjQDRXy3rcs
	3tVifQEFsm4m+GbnBwlONX4mK+3O2QLAPOR8B1KpOcXL3e3eUv9LiHGvqksFwoEXA4It
	UlnwRNYLZyLDMVNza3rkUTxkA643dK6wn1f3bH3XaM5EO99Q/+zY/4zvpgiLjtZyr6Dr
	9si2YTp1b3ykyXILjS55aShlJur+GhKGqbbkcfjyGRD8p5ojaUAToZ6momumGurjk42P
	KdT79NJjkpvTJrY0lyjMCilhZCoEzKpGAl9HAuTrt5vZc2EX75k0uXNV88iXsoG1Tup/
	TO5Q==
X-Gm-Message-State: AKaTC03tWHHkkIFKOwSQq2YLpgYsByn97wP4D3fa4KDGHUpuzkcWwP0cB8R5oA3SEbBh2g==
X-Received: by 10.99.166.2 with SMTP id t2mr55731874pge.40.1480471802626;
	Tue, 29 Nov 2016 18:10:02 -0800 (PST)
Received: from [10.22.11.46] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	y189sm97882107pfy.32.2016.11.29.18.10.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 18:10:02 -0800 (PST)
To: jslater@windriver.com
References: <1480371178-5052-1-git-send-email-jslater@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1204d0d8-6c6d-8024-59a3-21c755914e39@gmail.com>
Date: Tue, 29 Nov 2016 18:10:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480371178-5052-1-git-send-email-jslater@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/1] ntp: update to version 4.8p9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2016 02:10:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/28/2016 02:12 PM, Joe Slater wrote:
> This fixes two CVE defects.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>

Thanks joe.

I will back port this to  Morty and jethro once it hits master.

- armin
> ---
>   .../ntp/{ntp_4.2.8p8.bb => ntp_4.2.8p9.bb}         |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-networking/recipes-support/ntp/{ntp_4.2.8p8.bb => ntp_4.2.8p9.bb} (97%)
>
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
> similarity index 97%
> rename from meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> rename to meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
> index 202d1a3..9d74c96 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
> @@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>              file://ntpd.list \
>   "
>   
> -SRC_URI[md5sum] = "4a8636260435b230636f053ffd070e34"
> -SRC_URI[sha256sum] = "2ab3d0b5f0456e6311dda1cc27ab75da108762773a19e46abd938bd9407b97ee"
> +SRC_URI[md5sum] = "857452b05f5f2e033786f77ade1974ed"
> +SRC_URI[sha256sum] = "b724287778e1bac625b447327c9851eedef020517a3545625e9f652a90f30b72"
>   
>   inherit autotools update-rc.d useradd systemd pkgconfig
>   


