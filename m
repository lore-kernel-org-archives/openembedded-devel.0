Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id C07F56D134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 12:24:34 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so6067618iec.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=l487ACMcRubYx/vmxyDUAS0HkKMQcp77yXhrqMzhFDU=;
	b=m3chfTFGqAVlaS6Jn/Rv9mmqTn8BTVDq66kmhim6jbRh7rEgpCl/4y5YPHCgzq8l3N
	hjzK6yffgT0ZXeLk88kwf4iARQ7nzeVcYigsCFS341TO8OVDk8OXD2G59tX3UKnkAkfg
	RwzXtZPiJLBCUYwOYePtgtQ627asWuEKFaAJOxc5tJwpoxFmw8UTjwVCBb2etBSnyvsN
	2jV7RLffq81o6MIgK35Umx+9KDgAwyX+cLwjAik1+K/YxdgKHb1FyTtkIpGwCh0BV4d9
	9xGYHGvlrKVpTZYrRHY09Vk8T7lj2mKKrME8KBjUgtPeJY+yl2oCJc7njAveVGnHPghq
	ZPuA==
X-Received: by 10.50.61.179 with SMTP id q19mr1908918igr.33.1382703876631;
	Fri, 25 Oct 2013 05:24:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Fri, 25 Oct 2013 05:24:06 -0700 (PDT)
In-Reply-To: <1382681074-9340-1-git-send-email-rongqing.li@windriver.com>
References: <1382681074-9340-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2013 05:24:06 -0700
Message-ID: <CAMKF1sr=B9mcD7PAf0ANYiyC_d9mQKMb4EbyDHOQrSVFxM8FjA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH meta-networking] lowpan-tools: input python library and executable file dir
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
X-List-Received-Date: Fri, 25 Oct 2013 12:24:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 24, 2013 at 11:04 PM,  <rongqing.li@windriver.com> wrote:
> +EXTRA_OECONF += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR} \
> +               am_cv_python_pyexecdir=${PYTHON_SITEPACKAGES_DIR}"
>

use CACHED_CONFIGUREVARS variable to pass the am_cv_* autotools variables.

