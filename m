Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id E8979606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:37:25 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id f93so87428966lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=GkhRiRVyV7hAM0uAW1HvRE0Mx3P5a5SVlhm8NyRxCMI=;
	b=bmXmfU1s6lp+dOwMgRMRBtDO1jTiY2F6aRCMXoFHR3GhkMAb1eZqmkOXbvMyFnKpxg
	iusezR9ieeY9q9fZLQt/DkAsYErAwpOV+AiaJ7C2KrqDjCH8dFNcrAlI+z/A9SwB4GwH
	kQlNxGosqrOdU7sKnZEnCx+PVP/XYx+39VDaaawGeefCGeet7aneZt/fHFNA31jmTT1i
	8cs27yx/L8LNNdxD29RBM6i/+EbZ0J2KT/Pv6CbSSl+LEt7nkTnDn5xekCiZmNPkPNVr
	lkWyIDjjhTCKw/xFdlKy9vVaK+mHgHOb++CSjXAGXWO4BYueZc7pYJl3cJ3XMPQEiH11
	MCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=GkhRiRVyV7hAM0uAW1HvRE0Mx3P5a5SVlhm8NyRxCMI=;
	b=V8Y8NfyPq0CbxSC8j4CmmepNNwhZ/s8Tu+uTrJORPfZLlwv/jq7c3uiCjow/pXV1cJ
	0CFX2AjnMxWuiVDGNVH1UfBn78ty0F9pL+/avtERr9Njy3M0yzdKMFthmGpoZc1iH2RH
	SP4wATCY0bAoZ7U0eIiZK07xmXvhAut7KMm/SbhN2rgPWYNSu2Y/Nc/Az+wF9MS3nHYl
	c5pNYAjtScESX8t9blSv/DahdRI0RMw1bGoQiOBRTiIx1tbbr6QqvVK/lm/rwlEdw1rO
	uYGtDff6zXpxDnc1oxBN6eXhEb39hvgguwxobVjFCApumXWG2VaoYgn+rrraxvaZ2hHx
	MZYA==
X-Gm-Message-State: ALyK8tL4DcnpFi/BffgSi4AUFwjP4S+CNy3KfHV+sYmsmOTZ9cZeuDg5V+TZJlrOiH1iYZ6VaF61s4jthG4vng==
X-Received: by 10.25.165.211 with SMTP id o202mr9207943lfe.95.1468586245580;
	Fri, 15 Jul 2016 05:37:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Fri, 15 Jul 2016 05:37:24 -0700 (PDT)
In-Reply-To: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
References: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 15 Jul 2016 14:37:24 +0200
Message-ID: <CA+chaQf6a6n-89735f5tuiFYdocWy30AycpDKth72bUG6Wun2A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] grubby: add grubby with version 8.40-1
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
X-List-Received-Date: Fri, 15 Jul 2016 12:37:26 -0000
Content-Type: text/plain; charset=UTF-8

FFS, squash all 4 together, the first is already using all 3 files anyway..

On Fri, Jul 15, 2016 at 7:50 AM, <mingli.yu@windriver.com> wrote:

> 1, Add grubby bb
>
> 2, Fix the grub-editenv name
>
> 3, Add ptest support
>
> 4, Remove bashisms in test.sh
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

