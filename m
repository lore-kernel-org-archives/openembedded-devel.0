Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC06B60043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 16:39:47 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id a2so5632402lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 09:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=JqmhbDAfiCScq52ynaZNhmWV8w9Zqd2t83zwsBulwGI=;
	b=EYn9/tQ7SeuqxdU1QqL9Cg6MVMswikpsp7vBLn81C7EFh2p16qDRu0c9uhhX7fcBfZ
	zUwQYQTKd/50fOlIsXwLu7xbWzD3kF0TAQtijQ5swLf3gnxSdX88inW8CM3R8mjRD6d3
	vpX3KEamEGqO8oelUcN5qVj5rdKVdK8l6UAuZ9hxhHTleBNBZ5XvgPqjqy7WHhps4V4p
	fI61yVu+RkHa84BxyhJnS5rbfmikhFKdUyEBjssiznClNaUJl3MW2KnVPkHLmUb5tki8
	7zP1MOXywW14q1Sj+mgjLiMyqGFKZBm1ZpDKxhNX2asVyoBTP3DmYeQxWJrEzeTpWMDd
	1Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=JqmhbDAfiCScq52ynaZNhmWV8w9Zqd2t83zwsBulwGI=;
	b=mZfRMRDuzIOJm5SziPpH6FmEIHfXFNwQUQHT8muyBKg7nfGon+xRQbioit5YeTtQEd
	ipEtUyDNELwMuuhDwrg+2qiHTNLvmAnY6YBnJszmbDFmsN6Bh6aZrheAjakibbYloiUB
	uezfA/aHU3UH5LAZQpxWmDgGxBH+aHd+6MiHM5+xopkldGkZ78iuK6KtL8JsJnnS3o01
	74I3xewQhkDKrFQf8JkeYNTGRJaL8zZKFoPG1CpaGBNg36BlxTauOo/Z2s6V4HS7Semk
	lE6mApEwpF1uz4thMbi6GHmXFGaDWeiNuCSiJTQcn558XcyzA0a+OzYPe6bjAb7AkqZy
	rfCg==
X-Gm-Message-State: ALyK8tIvRiFPSnkHRD6t2IdNz1gp3yFyJxRtM6+vndEqCwAtRVR3tz1RzISu2Yq61D6K2JjmENUMUNOlT78KsA==
X-Received: by 10.25.4.202 with SMTP id 193mr3768652lfe.204.1467218387318;
	Wed, 29 Jun 2016 09:39:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.23.39 with HTTP; Wed, 29 Jun 2016 09:39:46 -0700 (PDT)
In-Reply-To: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
References: <1467188567-28145-1-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 29 Jun 2016 09:39:46 -0700
Message-ID: <CANx9H-A0M3O-CqZGT4v+YOs3jebP4fGkrEKDTQo892rBjsFmHA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] Add some python packages bb
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
X-List-Received-Date: Wed, 29 Jun 2016 16:39:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi Mingli,

In the future, when you send a second version of a patch, you should have
[PATCH v2] etc. in the subject line. Again, remember that these patches are
being consumed by automated processes. If you look at
https://patchwork-next.openembedded.org/project/oe/series/?ordering=-last_updated
you can get an idea about how the patches are organized by the automatic
patchwork service.

These are the guidelines for submitting patches:
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Thank you for contributing.

Cheers,

Tim

On Wed, Jun 29, 2016 at 1:22 AM, <mingli.yu@windriver.com> wrote:

> 1, Add python-pbr bb file as python-mock depends on
>    python-pbr-native
>
> 2, Update python-mock bb to add python-pbr-native dependency
>    for python-mock
>
> 3, Update python-mccabe bb to add python-pytest-runner
>    dependency for python-mccabe
>
> 4, Add python-pytest-runner bb as python-mccabe depends
>    on python-pytest-runner
>
> 5, Add python-setuptools-scm bb as python-pytest-runner depends
>    on python-setuptools-scm
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

