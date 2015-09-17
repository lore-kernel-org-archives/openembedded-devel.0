Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id CE39676903
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 12:06:33 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so54703600igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 05:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=wLFbzqawgez8OAAw5thR9Ay4JeYuxjme0yAVuS4l5Bk=;
	b=IwCzF2F14UUC91s4NcglJCF7hLOu8aJVn/sAntBsHRx9msZBSkvcs20FbhO2iN/8zf
	y0yeWEdz85gBTAxFLY4QG4PTqO4RH7NNcEbF3IaThFgJNgcVxKUO224hcr8slaGLSxx5
	o34xgQx4papAN2gSVMoDzkzQ5HSkkGigjqCHmVNYCYV6QhLXTWnGd+/12lAqN4wzaC0L
	dgFgxVve5V0lZ+ZaudWst84dxIjnL4t5DPHDfu1WfGjmnk5ECXU01ZUdo88Ut6lkJU2E
	LfkewszNly/xISxmZGomnEYECAW1i/pS8hmngrGRD06FTH4ZiJtoy2Scr5MIvWgVo+mo
	NoMg==
X-Gm-Message-State: ALoCoQmDIpPfn5uAJWi2lSvFs0HO5HvquAf68xpW0ci3ZhIEIhCOatg3kCvH+bNOaGR6+Tw8mGOe
X-Received: by 10.50.2.39 with SMTP id 7mr23416770igr.86.1442491593768;
	Thu, 17 Sep 2015 05:06:33 -0700 (PDT)
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com.
	[209.85.213.180])
	by smtp.gmail.com with ESMTPSA id 67sm1152276iog.34.2015.09.17.05.06.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 05:06:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igxx6 with SMTP id x6so12221980igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 05:06:32 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.102.4 with SMTP id fk4mr5771589igb.46.1442491592244; Thu,
	17 Sep 2015 05:06:32 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 17 Sep 2015 05:06:32 -0700 (PDT)
In-Reply-To: <1442417558-14484-1-git-send-email-joshua.lock@collabora.co.uk>
References: <1442417558-14484-1-git-send-email-joshua.lock@collabora.co.uk>
Date: Thu, 17 Sep 2015 09:06:32 -0300
Message-ID: <CAP9ODKp1TJqgnR9GwVjE5=rVhH3rY9XGLvpgNJsLKoUfrKgYXw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][fido][PATCH] gsoap: fix DEPENDS to prevent link failure for gsoap-native
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
X-List-Received-Date: Thu, 17 Sep 2015 12:06:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 16, 2015 at 12:32 PM, Joshua Lock
<joshua.lock@collabora.co.uk> wrote:
> With a fairly high number of threads I can reliably trigger the
> following linker failure in gsoap-native:
>
> | /usr/bin/ld: cannot find -ly
> | collect2: error: ld returned 1 exit status
> | Makefile:402: recipe for target 'soapcpp2' failed
>
> Change the DEPENDS to include bison and let the BBCLASSEXTENDS
> machinery fix DEPENDS for -native and -target variants, only
> additonally adding gsoap-native to the DEPENDS for the target
> recipe.
>
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>

Once this is merged in master, Martin, please add this for Fido as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

