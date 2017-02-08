Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7BABA6079E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:13:37 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r141so198594924wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 11:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ct1TL4+FkjWfuhY/8QLqjyeiF+5sT1oC90fDvhz2BhU=;
	b=fTxxdRXTVwI9tgrMxcNvcdq3gPyLFq1UivAu/TUyppUXiMN2VE5tNfscoO+LlF49Oy
	94n70iEuwTYZ5zgbmOW9QtklxezW+V6EWkI1BPpZ6ajkW7XdF03WOjxfcg+Sa5b31oHA
	PRUmKZ5TGzX/v0Bkq3GJLbZEqV+aC21hakyx1EFfWtYW0syootKwWUJTgVyidcEPne4s
	PxpcNeaK8a7CvScxuq7OJQ1FRMyTU3ZsgY8nEVMj0puigDno76dTk9givw0RYZCppwYl
	OInw3KOPsPlI08wJ3NN8rEopB8PiS5BvcvSQKDF+NfOKldWAcN2xspYJHvssRQdH/gZd
	XhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ct1TL4+FkjWfuhY/8QLqjyeiF+5sT1oC90fDvhz2BhU=;
	b=epRJAUvJKswD3KcJ60LxBEQIaNpI3Gjyx0EDi3I6V4Ek2DllL5PHpLjsxt+KrCTjL8
	AOxdyLXUEbU/JR7uyj/Vwqs3cMIPdkXsiKTLX6FNI17VBiPhX6GCn8FPxnlSLPRFEDjb
	pEEJILVh/Hsm+RdwyWVdDvseun3FNK2ZVtQCgBkLU27C1kqsxT68tqBUhEdw34tYKft0
	icGTCXtYzp1/RFwNQ6CTHRxOjUL459BGFql6rRfqBJKtmDctk08JpyNL5lrxTRAsWhzY
	EUd5jOcLJQZ1gYX7eg6OjDIsk1v5rbFHrNBiwhQiJsxVHhphyHY03kebvgJrHZn4jL9Y
	RWow==
X-Gm-Message-State: AMke39nxGle4E1GT2eEJ9UNOzaz7xNuLI9kwUCSfQqWj3gnj1I0abzZlsyT010XU9+DvsQRn/cWeQRcXCRvFYQ==
X-Received: by 10.28.184.133 with SMTP id i127mr17768177wmf.49.1486581217311; 
	Wed, 08 Feb 2017 11:13:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 8 Feb 2017 11:13:36 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1702081254110.22066@localhost.localdomain>
References: <alpine.LFD.2.20.1702081254110.22066@localhost.localdomain>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Feb 2017 20:13:36 +0100
Message-ID: <CA+chaQdnQDBex2wHG6EYqzpkzE1-XBr5fy+xKfMfKqeyxDNSjw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: why is the current version of netdata "1.0.1+git${SRCPV}"?
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
X-List-Received-Date: Wed, 08 Feb 2017 19:13:39 -0000
Content-Type: text/plain; charset=UTF-8

http://lists.openembedded.org/pipermail/openembedded-devel/2017-January/110784.html

On Wed, Feb 8, 2017 at 6:57 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   just noticed recipe file "netdata_git.bb", with the above setting
> for PV ... apparently, there was a very recent tagging with "v1.5.0",
> is there any value in upgrading(?) to that newer version? or at least
> adding a fixed version of the recipe to go with the git version?
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

