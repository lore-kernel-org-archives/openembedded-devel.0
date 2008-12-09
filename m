Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1LAC7g-0002PR-TB
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Dec 2008 00:36:12 +0100
Received: by fg-out-1718.google.com with SMTP id l26so108384fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2008 15:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Q03+nC5XP//UoETr3JkoflH14+mWuJqR6rx3POc376E=;
	b=rdoXJHQ7EaiJ6lHVTIGv95emgXwp9lAeeGvqg1Kjm0ta7Au8yW46dIPVT1o1rcTewP
	iW7Xjx7iHf8+QlMhEuLVS1y2566dVHxJft5Mr5BuEBeIR8dvZNtJ3F8Vn/kU8PGaTQmG
	L/2rt6tHY+++cRPwHPdY7pkeU0JrNL1Tob3Cs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=k74TJlMpM1ipjEz1nTUd4stwlXjzg0yamgmblbwaTaO/TJ/KmxzNNc1YMld1/WBHFu
	VwHODe8cqcFfOTbNsrik1gcVjXaF72wZm0kelG4ywOz4Q4Qwz8p/dxDkbh7WGwWSyKMO
	kxRAORP3aWpfwoLmfyW2rnzKlOhLoQ0QLJ7os=
Received: by 10.86.63.19 with SMTP id l19mr324374fga.40.1228865535046;
	Tue, 09 Dec 2008 15:32:15 -0800 (PST)
Received: from doriath.ww600.siemens.net
	(ppp89-110-16-162.pppoe.avangarddsl.ru [89.110.16.162])
	by mx.google.com with ESMTPS id 3sm1104958fge.51.2008.12.09.15.32.13
	(version=SSLv3 cipher=RC4-MD5); Tue, 09 Dec 2008 15:32:13 -0800 (PST)
Date: Wed, 10 Dec 2008 02:30:58 +0300
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081209233058.GA12578@doriath.ww600.siemens.net>
References: <1228807146-4208-1-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1228807146-4208-1-git-send-email-dbaryshkov@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: fb@kernelconcepts.de
Subject: Re: [RFC][PATCH] fbreader: split common packaging funcionality
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
X-List-Received-Date: Tue, 09 Dec 2008 23:36:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 09, 2008 at 10:19:05AM +0300, Dmitry Eremin-Solenikov wrote:
> To ease creating fbreader-opie split away common fbreader packaging
> functionality.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  .../fbreader/{fbreader_0.8.2a.bb => fbreader.inc}  |   42 ++++++++------
>  packages/fbreader/fbreader_0.8.2a.bb               |   58 ++------------------
>  .../480x640-buildfix.patch                         |    0 
>  3 files changed, 29 insertions(+), 71 deletions(-)
>  copy packages/fbreader/{fbreader_0.8.2a.bb => fbreader.inc} (65%)
>  rename packages/fbreader/{fbreader-0.8.2a => files}/480x640-buildfix.patch (100%)
> 

If nobody objects, I'll commit both patches on weekend.

-- 
With best wishes
Dmitry



