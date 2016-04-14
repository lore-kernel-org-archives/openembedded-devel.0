Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id AD04A607F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 15:14:16 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id er2so17207004pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=3uhaV0DLqnASw+CnSnI9nY+hyzF1f7Q0kOSHwLA+CJE=;
	b=QHJKhILSLE8C8ySnNmhq5rB/gswDoSJu4Ev2kFL2PblepFRkWV2lZg0jvhrjV6UxtM
	Uw+OkJf1GJXJFIpSKKQYu/OhFfKOyZA3jAJ0VD3edI07im0Peg6dF1h40Ryxcr57GGgi
	SRTltyIxrsdOBkpVCUDS1lMgeJ5bAxSsWexOF2ooqzKSSIK/wwVvpn7vw+ZPD4blzGxs
	KvX/yeZ0+aUUwAoob6xjuK/szK1NPqlvIxYqg8iG7ofvjVtdHyYd45xvyq5qWGo6j7ZT
	E3Vz42p8qP+138sxQsT9HOxHqKdotPHPmlo1Z7XLdlH9NLxBjEPb4L3I4ubaYSASBP5/
	W5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=3uhaV0DLqnASw+CnSnI9nY+hyzF1f7Q0kOSHwLA+CJE=;
	b=RjNuQHhI8DDAk8qMU+j291K418/zXI6Ds3sYkFiSWWZmoXAfJj8knFKeJNcteLoUrU
	f0++luqsSoztoO2/p0Uj/WyoRpX2osFnqpbMYF2K8p2esrXm1+ZSqIlNCK7cpW+jEj9r
	+f6GXAH22wfb2REgdcFB4ulNYo7Ph2wPjU/+8ekkWvGRo/HjWDY4wx3beR5MXh179uA9
	eQBspobCdkTOMZBiqh0fA+B4VlCVVjGceWH2cmkptuiRP8nhyQEaT3UVLWjlKUzYWn+f
	UoYHYDrTLb/BSVftQl5yoqdI2L27RL+6Dvh/o2RzNVbamPRfjRCAqqFmz0dBYdWm7QXl
	GS5g==
X-Gm-Message-State: AOPr4FXG7fvRnrhC3usZ6dkYyx6/1kOym/k0zU/00jZjXpCKeeS0KHubH8ZIPdCQADC+cQ==
X-Received: by 10.66.164.39 with SMTP id yn7mr21959194pab.107.1460646857209;
	Thu, 14 Apr 2016 08:14:17 -0700 (PDT)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	w27sm58630044pfa.67.2016.04.14.08.14.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Apr 2016 08:14:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f50.google.com with SMTP id zm5so45805819pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 08:14:15 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.160.201 with SMTP id xm9mr21787513pab.68.1460646855294;
	Thu, 14 Apr 2016 08:14:15 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Thu, 14 Apr 2016 08:14:15 -0700 (PDT)
In-Reply-To: <1460645190-15886-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460645190-15886-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Thu, 14 Apr 2016 12:14:15 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrE2r7af1uEEx3C3M8fdf5yMZk-J4mtBczQs6YdCcmF=w@mail.gmail.com>
Message-ID: <CAP9ODKrE2r7af1uEEx3C3M8fdf5yMZk-J4mtBczQs6YdCcmF=w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] lldpd: Update to version 0.9.2
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
X-List-Received-Date: Thu, 14 Apr 2016 15:14:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 14, 2016 at 11:46 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> This new release has following changes since version 0.9.0:
>
> lldpd (0.9.2)
>
>   Change:
>     - Ability to add/remove/replace custom TLV from lldpcli.
>     - LLDP-MED capabilities are displayed differently in lldpcli.
>     - Limit the maximum depth (5) when trying to apply a VLAN.
>     - Change JSON output format when using json-c to match Jansson
>       output.
>     - Integration tests for the major parts of lldpd, including use of
>       address and leak sanitizer.
>   Fix:
>     - LLDP-MED POE TLV are now displayed in lldpcli.
>     - Ignore lower link when it is in another namespace.
>     - Fix various problems with interfaces being enslaved.
>     - Fix a memory leak when modifying port-related settings.
>
> lldpd (0.9.1)
>
>   Change:
>     - Rework packaging for OS X to make it work with El Capitan. To
>       simplify a bit, it is not possible anymore to build fat
>       binaries. Latest version of OS X supporting 32bit was 10.6.
>   Fix:
>     - By default, when using port alias as description, use port name
>       as port ID.
>     - Miscellaneous fixes with netlink cache.
>     - Ensure large netlink messages can be received.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

