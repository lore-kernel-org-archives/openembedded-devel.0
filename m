Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED9C6B181
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 21:52:53 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kq14so7309789pab.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 14:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=lrJ/jwRraGuGYIShAIEwgI1gle36EiKDBWItn1gmrW4=;
	b=ZfpJ7s4+nJfNYboAkkyn0D99j1yL+rWxj5J9bizjsMMwbq2vWXT4RfZhZssCnLSHHr
	fxXwk+1m/zEOzUNob4X/c80RqPJXq/iCxdlv1IRzn53EDAo4gxEsAWe2Ju05ecnhZD1Y
	W30MJt4W3y7oIiH498iKYmtsSbKIqgzlP6qI+kZyuBjQIEuJyaoomjgm6Bk+9OMviJdk
	pTmkL74jXlCk4lc9F3fB9ZDXJCYq49cDqg2vc7bG5qZrlED1BaiKoXRBUmbsZsZgoFgb
	qgkXJtlw01UK8TDys+bfQeSO7CCIAd4hEK6k+EnqdTSP+NQNWjxqZmOEmZKOXQcYyaAJ
	3Evw==
X-Received: by 10.66.66.135 with SMTP id f7mr21394104pat.22.1396216374572;
	Sun, 30 Mar 2014 14:52:54 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	nc1sm39098975pbc.32.2014.03.30.14.52.52 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Mar 2014 14:52:53 -0700 (PDT)
Message-ID: <53389231.2020209@gmail.com>
Date: Mon, 31 Mar 2014 08:52:49 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>	<1394664760-8615-2-git-send-email-net147@gmail.com>
	<CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>
In-Reply-To: <CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH v5 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sun, 30 Mar 2014 21:52:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2014 1:01 PM, Otavio Salvador wrote:
> Hello,
>
> On Wed, Mar 12, 2014 at 7:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>> This adds the necessary target packages for development with all of the
>> Qt 5 modules.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> | Computing transaction...error: Can't install
> qtwayland-dev-5.2.1+git0+573d0ee5ba-r0.0@cortexa9hf_vfp_neon: no
> package provides qtwayland = 5.2.1+git0+573d0ee5ba-r0.0
> |
> | Saving cache...
> |
> | WARNING: /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/run.populate_sdk_image.29400:1
> exit 1 from
> |   smart --data-dir=${target_rootfs}/var/lib/smart install -y
> ${pkgs_to_install}
> | DEBUG: Python function do_populate_sdk finished
> | ERROR: Function failed: populate_sdk_image (log file is located at
> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/lo
>
> Please fix this and test the combinations of enable/disable features.
> They seem not well tested.
>
It looks like qtwayland is not being built properly in your configration.

Can you provide configuration and steps to reproduce this failure?
I have not had any luck in reproducing it.

Regards,
Jonathan

