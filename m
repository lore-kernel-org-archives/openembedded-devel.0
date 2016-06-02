Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3150577424
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 11:07:57 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id s186so3482558qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=T9hD9CmiYgKaXKXHXrLldS9tPD3cEhldoSEvKCmnn8M=;
	b=gPVxS1mpy2czZSZb6GoAnFxPJrqOwEnVNA2h62gdVJ9VeRMEMqNwQ1C/9dazhaAAzg
	OzkEA2+3ePaeN/heuESj8XC3wlN97Dq98Y43gS68PRNQaarbboFLg8NFtNxDJ9ziclUl
	t6LAeF4T1esVEVbGXCZ+eheYlbWeDzanQ60WI8Gy1gn3GUDuNPaLNb0/bdIlgSp5Wd2r
	Zzc3NxfcIJ9+M1gntov1BsKly4WpxN/nYybjmwJXfPku1lOSvPhBXrrBKz4RYdjHse2l
	5XSL2Blb6eXZsCVhMYufojqHorYzr4vo/CIKWYYnBIl5/RjYShD7OYpAKnPpof0eZgeQ
	Abrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=T9hD9CmiYgKaXKXHXrLldS9tPD3cEhldoSEvKCmnn8M=;
	b=BIC0l9DHOgDuDf5seGtMjDhVl0Ft/FeIi/jVT2kiPfAX0nSTDVDhuCyg3uG3MunDL6
	5BpR3GlDMJXQ2maS/fagkuHUdFKoJ8CvoOberu2TLdj0qsRZE3lfO9Ya0RvCjcnD07IH
	AOnUjZWP67RM6PFIN6ecZOWb/4k3Ketjs1tQlBWigHivkkgrLneBzVXjmjRNn5I85J0d
	/yo0W8nczAJqTcXClAQQHfM82Fw0tx2yvvauhZgNCwpPFCpJVd8rkiKYZ2+4d9ltgea9
	gSxg9VJtRvvvv+R6fQAZZdHkFepmvCe0qgLUV/1xxv4knDmQMEQO0ckz1Vv0ByqsjbZD
	bD7A==
X-Gm-Message-State: ALyK8tLLhn8YYPnQufJn/c1DbfTAz05hiD899SzLy1oWwJhZqkvVvYQg7qH/vwCKqmRfVA==
X-Received: by 10.200.51.89 with SMTP id u25mr8597255qta.58.1464865678289;
	Thu, 02 Jun 2016 04:07:58 -0700 (PDT)
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com.
	[209.85.216.174]) by smtp.gmail.com with ESMTPSA id
	n194sm13687825qkn.3.2016.06.02.04.07.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jun 2016 04:07:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt0-f174.google.com with SMTP id q45so3316842qtq.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 04:07:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.237.37.67 with SMTP id w3mr8351208qtc.75.1464865676455; Thu,
	02 Jun 2016 04:07:56 -0700 (PDT)
Received: by 10.237.54.197 with HTTP; Thu, 2 Jun 2016 04:07:56 -0700 (PDT)
In-Reply-To: <CAPybu_1SQ0Gw36wB8fiisLZ_zmo0B3gWF85T2M2t2i-X7oe3dg@mail.gmail.com>
References: <1464786802-11176-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAP9ODKp+wY9AVGxgS7HfKwgGmrKXadOmLYzL5R104-N5MNu7xg@mail.gmail.com>
	<CAPybu_1SQ0Gw36wB8fiisLZ_zmo0B3gWF85T2M2t2i-X7oe3dg@mail.gmail.com>
Date: Thu, 2 Jun 2016 08:07:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoww_v0Sq_E_H0KA2az7ULkmt0Cd9dgSxipMEFYewPufQ@mail.gmail.com>
Message-ID: <CAP9ODKoww_v0Sq_E_H0KA2az7ULkmt0Cd9dgSxipMEFYewPufQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] opencv: Reorder PACKAGES variable
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
X-List-Received-Date: Thu, 02 Jun 2016 11:07:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 2, 2016 at 7:08 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Shall i send a v2 with the empty line?

Martin?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

