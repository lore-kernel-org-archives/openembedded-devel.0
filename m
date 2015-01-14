Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 279DF7226D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 17:49:20 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id n4so7644110qaq.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JaK/obZEdxFfdta6Pw/Hpn6EHN0z/AIuHoPjUpXmPmA=;
	b=D8eS7NxAV2m7PRiyyH2krgM6S1BT+XlzTZ6cD9wo6ktjsakhS3B0HJcjiLQaKZTvLO
	ArBfTYfeXCvWzT4FNaGPWlSrhzrYnU7ttqvbWmdin7WSIweuPt6pdgqnxhvKnD1Y7GF1
	DKezljBJatefqrlOfRb3z6BQ2g8JNYd7ogDudithsqkx6iczx3QcmcyffvokkdcNMobr
	RsxsF4HgSlu8ibo9E6WYMfSY48D5qJSWalMgI7MHIvPXSBwq0VbhKa/9XRt8aTcY+BGv
	E8H0NEFqsHNCevKouuhtICtxGPL7rfKtBz2gWN9AXF71G94DB6TUzQu7uW9lhjhIb5QA
	CdHA==
X-Gm-Message-State: ALoCoQm37k/WN98+T8DMKZC+DkjYsPfme1GRtelOdVF/a04W4/avq2jB+nt7uKoJ4mz+ikAiQnxq
X-Received: by 10.140.94.168 with SMTP id g37mr7470036qge.80.1421257760986;
	Wed, 14 Jan 2015 09:49:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 14 Jan 2015 09:49:00 -0800 (PST)
In-Reply-To: <27871649.cr5e5TgsPA@peggleto-mobl5.ger.corp.intel.com>
References: <5476192C.2030204@pr.hu>
	<27871649.cr5e5TgsPA@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Jan 2015 17:49:00 +0000
Message-ID: <CAJTo0LbyE_Kk=UZJrzAQCOgMzovN1En=-z+4Byk1E0h5XQKrhg@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Escaping in PACKAGECONFIG
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
X-List-Received-Date: Wed, 14 Jan 2015 17:49:31 -0000
Content-Type: text/plain; charset=UTF-8

On 14 January 2015 at 12:18, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Sorry for the delayed response. Basically, if you look at how
> PACKAGECONFIG is
> implemented in meta/classes/base.bbclass, we simply do a python split()
> call
> on the value of each varflag value (i.e. each individual PACKAGECONFIG[xyz]
> value). However, because we get that value using getVarFlags() without
> passing
> True for the "expand" parameter, the value is unexpanded, so variable
> references such as ${MYSQLND} above won't have been expanded when the
> string
> gets split. I'm not sure if that was intentional but it is how it has been
> implemented; I don't think anyone has given much thought to cases like this
> where you need to have commas in the value since it's relatively uncommon.
>

FWIW, Mesa has a similar problem and that's exactly how it's solved.

Ross

