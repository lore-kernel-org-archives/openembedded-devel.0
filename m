Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tfqky-0003Rz-GF
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 12:33:45 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 03:19:20 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so17667259oag.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 03:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=XGoTpu8VThD+J0KtTpDz+E64tXKe3J0QwrAXCCiMDPU=;
	b=f2YllkksZ4vCiVK/A1NAYcG9cXUj4I9QPPVbtK07xMm1dQEGs34poKzTPrcb+0DU3U
	PtiQLUoJWRNjcR95smCB2vjHfJqroHpy3GNxmU1IG+N9DfIaVntSSgEJFM24erHIzC8l
	rkG9OX4rLBNvN+VCZvTACgdPpJCtqoX7nWslhmw0G6pA22E7GEpADPlLjHDBRDwhDL09
	JVa9l0sonNi5mrgpTrdkE7bYf+9fGV+PBrLE5kkrAYePqpcJ+XoanNeoAZoZ2h9G+uY8
	JCtGAkyD8tV+c0yiKASwI77X+yre/yiXiq4085+N167RtiZGvbCl23B5ywtwnpuqi7dG
	TUVg==
Received: by 10.182.89.103 with SMTP id bn7mr7433421obb.35.1354619959127;
	Tue, 04 Dec 2012 03:19:19 -0800 (PST)
Received: by 10.182.89.103 with SMTP id bn7mr7433416obb.35.1354619959009; Tue,
	04 Dec 2012 03:19:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 4 Dec 2012 03:18:57 -0800 (PST)
In-Reply-To: <20121204101412.GB14870@jama.jama.net>
References: <1353937823-29509-1-git-send-email-ross.burton@intel.com>
	<20121204101412.GB14870@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2012 11:18:57 +0000
Message-ID: <CAJTo0LbFWM01+1T6yB0WO6VA3bL+=GJe+-nypizr3roAzRNJpw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmubDjl7RfyMp/2ijBk4vQHFCHnSxLAUG1jKsXFNt1tQeAglUJD7uCYcXtayroP2f1PUCpHoO50Qg9nanYJO1WRN/72X+xu0TJxamp4AGOIMpTvAKtB496innftN283vG+1Z5X7aw23EkTYKZxyYZ+pRD8YvKKtdOpX/vT8XYVJk0SDQe1PL/uJumrmXAtYoKn661ST
Subject: Re: [PATCH] meta-oe: remove guile, it's in oe-core now
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 11:33:45 -0000
Content-Type: text/plain; charset=UTF-8

On 4 December 2012 10:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Nov 26, 2012 at 01:50:23PM +0000, Ross Burton wrote:
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Also there is bad charset defined in this patch:
> Content-Type: text/plain; charset=y
> Content-Transfer-Encoding: 8bit
>
> $ git am -s patches/cur/1354615270.14870_19.jama\:2\,RS
> fatal: cannot convert from y to UTF-8
>
> I'll apply it manually.

I had the option of not sending a patch via email, or sending a patch
that won't apply cleanly. :/

Ross


