Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 48C3E7300A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 12:20:04 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id c32so20464463uac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 04:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=33tsr/Udi+fQL/76xZpC2EWk70Ve48DIIzrSfWEWxNI=;
	b=HxvWI1G20XcA0EMJ8FYh0WnSrgQWHQoQzt5BwOCBLRulSDYVwmxx9NXT7YfZofiJRP
	zrCxEojmEuRQdrCE6CsQYEgBWNqMJcHnL80MmFNKc21/HyXECYTFcIZ6jg2OKVZlq779
	APrFuGz8455q8f6Ea2xwWxWONSJIQtlqGDNSyAbYxPhQgMm6O7pDZ+hl6mBddJvretVD
	kvBZEwX9blH2sBOgYFc3MjNeSSaSWL77dr8vm1l+TDS/WQslpxpV+oqMqQSai7/WAGGA
	rGUDNYBjgCyLtnQLTfMX1m6QVCpHAmzkxNxSRX3zkteWJlNDq9Ot9hXgUVA51r7TRRpW
	837Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=33tsr/Udi+fQL/76xZpC2EWk70Ve48DIIzrSfWEWxNI=;
	b=bct8pk72AcSgPAztmBS3hYcEQgcz+hobqvlI+AllAnbgLdalFp7elU/yv8ld6bl/h9
	/C3a8/M8RAsjDI9ICacTlqCGullwxRtrE6bf3fiWfFBnwBnC4eldsCg46p79TD7G1nTF
	CD3pK8oEKSuLbLxR9ETTe1lIAI2pH50fnRMa1gs9C9kW6dJdvkZkEdWAnfqwzX4YGNju
	SaZKprPgJ+qTBMfjms///fBuUSYf8BQU7l0ZmMGNRpA+CkQVOc9//J96CZEmFtV7yGj/
	fY0h7NxziPZ6QJyrbvIC4gbU3r58p6biWLdU9dU+mmg5Gk2FWVCynWAbdbGW5QOFPqR4
	jQfw==
X-Gm-Message-State: AMke39mzhHqxxQAE55h/e3rp9MTS09zIfQsCtOP8zma5S15UyAI+hjjKJdLMDBlt64OjqpTBGvh/0Aqmtvqqxg==
X-Received: by 10.176.1.167 with SMTP id 36mr16023327ual.44.1487852406143;
	Thu, 23 Feb 2017 04:20:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Thu, 23 Feb 2017 04:20:05 -0800 (PST)
In-Reply-To: <20170223105259.GA3300@jama>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
	<20170222230250.30288-6-schnitzeltony@googlemail.com>
	<20170223105259.GA3300@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 23 Feb 2017 13:20:05 +0100
Message-ID: <CALbNGRSr2VNR6P=u23u=ecchFCOs=cNwPmDYGz92fwbtmB-xLw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 05/11] abiword: unblacklist - gtkmathview is back
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
X-List-Received-Date: Thu, 23 Feb 2017 12:20:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 11:52 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Feb 23, 2017 at 12:02:44AM +0100, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> Thanks for another round of fixes!
>
> All looks good except this one, see:
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170223_0=
05128.log
>
The link does not tell why abiword's do_configure fails - can you give deta=
ils?

Andreas

