Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 93B3F76417
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 12:05:00 +0000 (UTC)
Received: by iofb144 with SMTP id b144so19102392iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 05:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=9r1OpDacMx+/QxAOfNF165QT9LQP1EKV8aX3Mxnc+iw=;
	b=Swr14hIQRx2NPeBqEJb6/kOnGYZGwwN04YRCAuti9LcdS1OYTpDQ9U7qdho61qa/cm
	C7HRGJKrgKYFNELqK6ljw+l9BiqttI7tniJrbFT3ZtsrmDJ8JNF9BR6RIAzJE3QXB4kO
	i62ibOaefac+eCzpeoG2MP1Oab91unM81sB6a/bWxe+kmERpJfBvjxKW72MZ/n0kWrRQ
	Kh1kM3gRuLAEBmUQ4mzqS+rI9tMc+tG5nOBt6/oeRrK+0W+QZpNiOwmwrSc23v9eDaIC
	qE7br3KEm0rI6WzHvBw+i6LiaxK2bf1qd5rmF/xYYQzMflzuGwwDq6L0tdTtR7AQ3CAZ
	LTYA==
X-Gm-Message-State: ALoCoQmFLuDAYccV5I3hAwqZf7dldo/EPItl/oHp6h16hJ6yD6Y2ucgQpw20ZOZjNF1luvlPCS6P
X-Received: by 10.107.131.16 with SMTP id f16mr5556648iod.100.1442491500384;
	Thu, 17 Sep 2015 05:05:00 -0700 (PDT)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170])
	by smtp.gmail.com with ESMTPSA id d8sm4023662igl.13.2015.09.17.05.04.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 05:04:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so19100710iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 05:04:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr5172583ioe.37.1442491498937; 
	Thu, 17 Sep 2015 05:04:58 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 17 Sep 2015 05:04:58 -0700 (PDT)
In-Reply-To: <1442326033-20744-1-git-send-email-Martin.Jansa@gmail.com>
References: <1442326033-20744-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 17 Sep 2015 09:04:58 -0300
Message-ID: <CAP9ODKqsBLanbOsTZsyJxKM1TC==0Urb9vDtcUtTjN18uG0tvg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][fido] dhcp: fix parsing warning
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
X-List-Received-Date: Thu, 17 Sep 2015 12:05:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 15, 2015 at 11:07 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> * fixes:
>   WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf)
>     replaces original key FILES_dhcp-client ( ${systemd_unitdir}/system/dhclient.service).
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

