Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EED2278260
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 20:46:11 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p1so10254756pfh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=OKcWP/p5Qvem2uXXVeho1+EAjbGeX+hDk3oIxZLIbVU=;
	b=FHlP0OWaJW5lM/6T8BkV10Njoolr+ZHbZO3b45yYk1O8DZpV4OjYTNhXAVoqEBWudl
	+jbP7XZk2zMYyCyMqrvAcc3SUAKLSk5cscWMZrOfFR3IdEZobhARnMMc/HyuBEgMEARp
	KxAu6fdWNqexZkjnA479gEVDgsWh2NzG6h/bB12lV8B+odH5GQ1hKu2KAaYN1Nj4F6Sp
	qF/Z80JC9Ks4k4LGS7xZ67tHoI1cLq7OM6O8a/E+/PWrVLzKFz8/ge34Lo+KiyUGg3zU
	oBNZ1B0LOZNG8Aqc+y0TKuVvCboLy/0zEEY/mgvW1NjsRX+TiMd7MsOLY71qBHEqzUzs
	LW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OKcWP/p5Qvem2uXXVeho1+EAjbGeX+hDk3oIxZLIbVU=;
	b=pEMqPo81XWz8r4VDGrWuFv4f3nxOrb3yY5tQ8ek9MSr0WqmAtzV8Ocx9ZXZuGKIzq7
	tD1UQIxG4kfwGgcstEDI0quoiJ30hOSsBe4A9MOoUJx3ihgUdVv9h+/95zmfHfzKuHgv
	o+PfDi0OwQO5Mpsc18C0UDS7kNviKT29chJRbonzvbzAZ7TjrhRLrF6bco2BXt9AMSvo
	oBw8mn0pUoYGyGq5gY3y8IXdgDAQgFMBSVjcYcZhG6WTkyR+Nzm5ej19Ma0RDq8aFXCu
	m4/HWkC1vhfSLd2f0XI3SyEcfHYs4FZ25pr4Tw6wAcmyF8vwSTQW53LlX/GHKB/Uwj/3
	8zOQ==
X-Gm-Message-State: AKwxyteciZm0rlwxaHPHKOKut7uMHPGOxdaMSKTG4bAngVTt3cJp0dYZ
	6qNGK0lVyAo354dxHJWvfbuUBQ6U
X-Google-Smtp-Source: AH8x225DXiPvDi92VPzL9J6Y2uGnYqL28v25sysxCIsipc5sIT5OVms32JOyuNnCUt/YDIK8Tn7Iqw==
X-Received: by 10.98.166.195 with SMTP id r64mr31277675pfl.175.1517345172713; 
	Tue, 30 Jan 2018 12:46:12 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:4c3e:ac59:6e73:b998?
	([2601:646:8880:466c:4c3e:ac59:6e73:b998])
	by smtp.gmail.com with ESMTPSA id
	e26sm15947842pfi.76.2018.01.30.12.46.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jan 2018 12:46:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20180130113708.14018-1-cshored@thecshore.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <f8e096f2-bc45-4689-8af0-93207f41361a@gmail.com>
Date: Tue, 30 Jan 2018 12:46:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180130113708.14018-1-cshored@thecshore.com>
Subject: Re: [networking] [PATCH 0/2] Move openwrt-upstream packages to meta-openwrt
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
X-List-Received-Date: Tue, 30 Jan 2018 20:46:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/30/18 3:37 AM, cshored@thecshore.com wrote:
> 
>  ...01-rtnl_flush-Error-on-failed-write.patch | 34 ---------------
>  .../relayd/relayd_git.bb                     | 17 --------
>  .../libubox/0001-version-libraries.patch     | 28 ------------
>  .../libubox/libubox/fix-libdir.patch         | 40 ------------------
>  .../recipes-devtools/libubox/libubox_git.bb  | 30 -------------
>  5 files changed, 149 deletions(-)
> 
> libubox is probably uncontroversial and in fact was suggested by
> Khem Raj here: http://lists.openembedded.org/pipermail/openembedded-devel/2018-January/116565.html
> 
> relayd I'm not as sure about as it's in meta-networking and there is
> the off chance it's actually in use.  I'm open to opinions.
> 
> In any event I'm updating meta-openwrt with the good things done in
> meta-openembedded, as well as other work to meake meta-openwrt
> more generally useful (for use as a hybrid with regular OE, 
> as a more openwrt-built-with-OE distro, and as a pick the bits
> that make sense to you repo).
> 

it does. Thanks for sending the patches.

> Regards,
> 
> Daniel
> 


