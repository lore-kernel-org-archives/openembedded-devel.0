Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 74FAD71ABB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 00:47:51 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id x23so62611089pgx.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=JW+EuELFBrzSPq9JUZP+dmSfyHZiVtr+0U8KlPhavhY=;
	b=sFgHRl7ifab9exhkhM8CvDfOysqFPZVsvbPGPhSstakzOsmMKROiW3Jq+edwj9AidM
	fbfUerVKU7yzjNhz24LueUVjCl9RdimyhpqDu4lErMe0lIUlIL9Ko9IYuEhaPpgJ7D5X
	LN4NWYnR/vpFN8a8zDEKx8b2D/f0BKo3pbo6N6BIn7prF9+y+jUZr8olry7CGKwiU1Am
	02Dw4/wuLm2AYw/LYt84zm3oq4oCQHZkq5dsLqi2QWtjpEfpomiFyR+Hu7KyZniPTIaN
	JaT3byIf//nUmRZN1K0dHNtyH99vgiaLlbTwyFZaoGbHq/6NDST5e6CiKdRNIxghIsnq
	+qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=JW+EuELFBrzSPq9JUZP+dmSfyHZiVtr+0U8KlPhavhY=;
	b=HvyJvwn2saBxN+ZP1kaSSeSLw6NZWlhje4cLsdY0LT1whsIyPj50deV07U1fOCeUU/
	Fu7Q44Npr/T+JUDuQkf/VFCIxhpqFFsFp6iIW1TvIrKKYub9knnQtkwGFLy3a0fgNRzx
	XvOr9rsmgUaAjddvSNSFlr27y6Z4vd+ieXwwPBcyaUuEU8oWpydY0KHa9mGMhNQ6fBLZ
	gWrqJVsLY7h9qPNDDRqWfunJxmGAvJHokEpc4CQRhN9BY2CD9qnce56aTsPwKu8SoWcb
	4VYenlqQegXI4WWShFGxTFZDtk+6kG/uAnnxkcFZtfpSgOx5J2VN1u1mgGAlJy5SIfaA
	n+PA==
X-Gm-Message-State: AKaTC01a0Y/kTMoSy1inW4KrHHfi43h7ct8X2qjdwINbaARstjoasQ+irJDdUy3dzYF5wQ==
X-Received: by 10.84.194.37 with SMTP id g34mr55602834pld.36.1480380473041;
	Mon, 28 Nov 2016 16:47:53 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:f08c:19b4:e718:7b0b?
	([2601:646:8882:b8c:f08c:19b4:e718:7b0b])
	by smtp.gmail.com with ESMTPSA id
	r21sm89834423pfd.44.2016.11.28.16.47.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 16:47:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 28 Nov 2016 16:47:51 -0800
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
Message-Id: <0D59333C-B782-4056-8E23-E9E94E8FE861@gmail.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Tue, 29 Nov 2016 00:47:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> On Nov 28, 2016, at 4:35 PM, Burton, Ross <ross.burton@intel.com> wrote:
> 
> On 28 November 2016 at 22:57, Khem Raj <raj.khem@gmail.com> wrote:
> 
>> This recipe is used by intel and amd BSP layers
>> additional copies are also there see
>> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libva
>> 
> 
> Or maybe it should be in oe-core then?

I thought of putting it there, if there are enough yeses we can move it there
given the number of layers carrying it. It needs to be in a common place.

> 
> (let the fight commence)
> 
> Ross
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


