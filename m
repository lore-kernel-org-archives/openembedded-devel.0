Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 57E746CAD5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 12:43:54 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i17so25890668qcy.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 04:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pHvLGsoIGnu9C5aoAPGgYnwpQqmKMDClNRuq1l0RGH0=;
	b=V8e7pktdCKg/z/0VnTFkggO8OWi/WMIfyHYYXYeRJXWYwmLyDPj+//pn1tdxq5zo57
	rocTE7cL/33s6gY592J0DUAHJc+vbIkYHT+LSgBYbJYvUQckLHSGHz6AYHOUNVZ01JFL
	GMQv3ez/cZ43bPas0Yxg3Ri30IyHIbMyfDCPAccrPKnJx58lXvCwjJT9ETYVUs6+Uhhv
	MgsauPnwwKixM8/AqBA1DCHxc65ze1JwuRncK9WB7+RQ//v36HMy+SnJ643+Ys7A42Dg
	/vccy4N0Qc6xDBO+U5X7qhT6xMqV7eTLhF72q3bo8QrxnZ956rZmdSt0guCA/Ira5/Jq
	VKNQ==
X-Received: by 10.224.160.83 with SMTP id m19mr41742942qax.21.1392727435213;
	Tue, 18 Feb 2014 04:43:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 18 Feb 2014 04:43:35 -0800 (PST)
In-Reply-To: <20140218123121.GI4067@jama>
References: <CAMCfZKFpTVoRJJ68m+vLdD_Pv-WkocXWKcxh6F0DnwP_sJ4t0Q@mail.gmail.com>
	<20140218114855.GH4067@jama>
	<CAMCfZKFwMmcmTmQ+EyYwaDJXu0o2kzh+KYwnH4h5Q4R2kuqQ0A@mail.gmail.com>
	<20140218123121.GI4067@jama>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 09:43:35 -0300
Message-ID: <CAMCfZKGNk3vBd007VD_8qxbq6DTn5NpLPBp3Lc998YseDLCqDQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: libao build fails on dora and master
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
X-List-Received-Date: Tue, 18 Feb 2014 12:43:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 18, 2014 at 9:31 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> > > > libao compiling is failing because of a dependency on esound.
> > > > Adding EXTRA_OECONF += "--disable-esd" to recipe fix the issue.
> > >
> > > Please add PACKAGECONFIG for esound and send such patch, thanks.
> >
> > Something link this?
> >
> > PACKAGECONFIG ??= ""
> > PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"
>
> Yes, just replace ??= with ?=.


Thanks.
Should I send separate patches for dora and master branches on this list?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

