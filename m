Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4347E49C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 20:23:53 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id cl9so1006129plb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jun 2019 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Zxbt4Coe054CsyZjEaWU95JAuIfCh+KaxG5vq7UgADU=;
	b=lwY/uk4IQmE5N8lCuzSYfa+fXysm8523yeSignbRsj96EW1WPBxa6fqfsUN20y82nu
	7BXrthaEvv/P6ucvNM/idR9q82c+1gd2uwYDPSUNd0nGoiaeXq7dLeerUi68FaGO/pIV
	bpxy5a4KFLFLpazTSi/EJO3vDaiM3Q+5IJrnDYSvY3BmPYooYb99sl8KOQEzDCvSxqkT
	OLm37tdQLpuxRJTj10xNURmHQ71lUn4KY8YOHbpD7zACRPVU1GqAxzBtryPmbQw8CJ/5
	XMArNYJnPIlMZslYUpxGiivIWvtSpQOzvJ2h0gYVgstdz1PZHT8BLIU0ryK7YWwYtwty
	JpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Zxbt4Coe054CsyZjEaWU95JAuIfCh+KaxG5vq7UgADU=;
	b=JpsfZpASprwR83f9e6YFn/XsaYkARS+O2sTi0BQwcYgoHMHasYVR6E3oiR2DHM6ASr
	8bAoOZVJVefH9Yj+zeZ1TdvSqaKz2fONKWzCrlXIpT0A7D1Dw/njHdxrDJTc++1dzR5x
	29KhpRjpeykwGss17hEgnQeuqoR/5KR5vv6ewkrJcszv+Rd1q61pk/ddsnZq6+WkGZOB
	ac1Jh8hwgnxzXjSdDxuTGB8v8DFvgx57zfYxXGntfFs/KjjNDj1yLxGDpTTRottDSbV9
	CsDz+8fF3gK9n5uc72diX8GPUJd+LVRo5wfjXjs2gK3j7WfBayu2XGJnT0Zzl7C8GidH
	/bHA==
X-Gm-Message-State: APjAAAXSsUbQqbULiCCvJD7EEQR+pGZsVJtZ0JSOtBJEcQT3HrVbp8N4
	0QPNqfPSn4CbnBec+g5fVvgq9GLS
X-Google-Smtp-Source: APXvYqyYyQb4lsCq2M3iBns1A1YoLicyvAJHQyIdlT3aS9wkBm6nqdeiXArZP3BPZbgilLNESN8a+g==
X-Received: by 2002:a17:902:1003:: with SMTP id
	b3mr25834643pla.172.1559507029766; 
	Sun, 02 Jun 2019 13:23:49 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1148:3840:7bb3:6bde?
	([2601:202:4180:c33:1148:3840:7bb3:6bde])
	by smtp.gmail.com with ESMTPSA id
	k2sm11817246pjl.23.2019.06.02.13.23.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Jun 2019 13:23:11 -0700 (PDT)
To: kai.kang@windriver.com, raj.khem@gmail.com
References: <20190531084423.172617-1-kai.kang@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <974dea6a-ad6c-3c82-5fa7-b36f1368d3f7@gmail.com>
Date: Sun, 2 Jun 2019 13:23:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH 00/10] Update recipes in meta-xfce
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
X-List-Received-Date: Sun, 02 Jun 2019 20:23:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/31/19 1:44 AM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
>
> Kai Kang (10):
>   thunar: 1.8.4 -> 1.8.6
>   xfdesktop: 4.13.3 -> 4.13.4
>   xfce4-panel: 4.13.4 -> 4.13.5
>   thunar-volman: 0.9.1 -> 0.9.2
>   xfce4-appfinder: 4.13.2 -> 4.13.3
>   libxfce4util: 4.13.2 -> 4.13.3
>   xfwm4: 4.13.1 -> 4.13.2
>   xfconf: 4.13.6 -> 4.13.7
>   libxfce4ui: 4.13.4 -> 4.13.5
>   xfce4-power-manager: 1.6.1 -> 1.6.2

Are these bug fix only updates for possible Warrior backport?

- armin
>
>  .../{libxfce4ui_4.13.4.bb => libxfce4ui_4.13.5.bb}          | 4 ++--
>  .../{libxfce4util_4.13.2.bb => libxfce4util_4.13.3.bb}      | 4 ++--
>  .../{thunar-volman_0.9.1.bb => thunar-volman_0.9.2.bb}      | 4 ++--
>  .../thunar/{thunar_1.8.4.bb => thunar_1.8.6.bb}             | 4 ++--
>  ...{xfce4-appfinder_4.13.2.bb => xfce4-appfinder_4.13.3.bb} | 4 ++--
>  .../{xfce4-panel_4.13.4.bb => xfce4-panel_4.13.5.bb}        | 4 ++--
>  ...-power-manager_1.6.1.bb => xfce4-power-manager_1.6.2.bb} | 6 +++---
>  .../xfconf/{xfconf_4.13.6.bb => xfconf_4.13.7.bb}           | 4 ++--
>  .../xfdesktop/{xfdesktop_4.13.3.bb => xfdesktop_4.13.4.bb}  | 4 ++--
>  .../recipes-xfce/xfwm4/{xfwm4_4.13.1.bb => xfwm4_4.13.2.bb} | 4 ++--
>  10 files changed, 21 insertions(+), 21 deletions(-)
>  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.13.4.bb => libxfce4ui_4.13.5.bb} (89%)
>  rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.2.bb => libxfce4util_4.13.3.bb} (64%)
>  rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.1.bb => thunar-volman_0.9.2.bb} (76%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.4.bb => thunar_1.8.6.bb} (86%)
>  rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.13.2.bb => xfce4-appfinder_4.13.3.bb} (69%)
>  rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.4.bb => xfce4-panel_4.13.5.bb} (90%)
>  rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.1.bb => xfce4-power-manager_1.6.2.bb} (88%)
>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.6.bb => xfconf_4.13.7.bb} (82%)
>  rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.3.bb => xfdesktop_4.13.4.bb} (76%)
>  rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.1.bb => xfwm4_4.13.2.bb} (89%)
>


