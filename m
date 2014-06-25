Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0CA605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 04:16:01 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so1336394wgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 21:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AN09H8TsVUg7Zha48IUr66Rmw7TsNp0u5xL2HD2hGSo=;
	b=KG9aUdBCLiVWmbwPSbN9juGE/aAe1BympDIYlL11FdX9nW3+xIOoNJYwqGJzj8SgTU
	gwKPnYRr7XEZROlF5mZd29YRJB+IHARqFW4Ew3Aj2JT/4bwQ2VR+wtZvhTjgYIuegVKI
	ssWeufZBc071E7zJdi04x+kmh8c7zex8oXqXg2Ki9w/WJuP/a8qiieI5xbOhkzh9yo98
	Y+7kd5kxlUgy6Hb2BxIUGupGokJ3hbHIYSdW/8WpZUBag6JnuJ5pdobZQPP8kUG2wQED
	PETqaTTsieqKZ3lLEtXBv9NyAV8QA2TJKXBiDYSWR3+Hn+yOBMXwPa8tovabycuocj0O
	Hnvg==
MIME-Version: 1.0
X-Received: by 10.194.58.180 with SMTP id s20mr321981wjq.119.1403669762807;
	Tue, 24 Jun 2014 21:16:02 -0700 (PDT)
Received: by 10.194.34.65 with HTTP; Tue, 24 Jun 2014 21:16:02 -0700 (PDT)
In-Reply-To: <53A9E471.8080500@linaro.org>
References: <1403634363-18032-1-git-send-email-trevor.woerner@linaro.org>
	<CAOLEWZXqQ_tnZEiVi5JxLbWGktAXNnTWexw_+C0WY+GbyW6V0w@mail.gmail.com>
	<53A9E471.8080500@linaro.org>
Date: Tue, 24 Jun 2014 21:16:02 -0700
Message-ID: <CAOLEWZUbT17s1pxuxK7Tkvvf6Jk2AO2w5dk2iWuAVCfzTkpPsA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][MASTER][PATCH] lxdm: add libpam DEPENDS
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
X-List-Received-Date: Wed, 25 Jun 2014 04:16:07 -0000
Content-Type: text/plain; charset=UTF-8

Yeah, it would certainly make more sense with a packageconfig option for
that; currently it doesn't work either with or without the "pam" feature
due to the missing plugins.  So if you want hard deps, then the plugins
need to be included as rdeps.  Otherwise, adding an appropriate
packageconfig option to the flexible depends sounds good.

I still need an init script anyway, so...

Steve


On Tue, Jun 24, 2014 at 1:49 PM, Trevor Woerner <trevor.woerner@linaro.org>
wrote:

> On 06/24/14 16:02, Stephen Arnold wrote:
> > but not as "hard" deps (since pam is an
> > optional feature).
>
> I wasn't 100% before sending that patch, but somehow I assumed it'd be
> best as a:
>
> DEPENDS += "${@base_contains("DISTRO_FEATURES", "pam"...
>
> or some such. But I put it as a hard DEPENDS because lxdm has a
> "--without-pam" configuration option which is not being used, so I
> therefore concluded lxdm always wants pam support.
>

