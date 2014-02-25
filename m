Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7F27E6E7D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 14:26:21 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id vb8so8595589obc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 06:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=zk28TtRDZnJU9w5EyLX6XFtCEFp8GocMiFC4aEDzEO0=;
	b=iBC1SpscA9sS4BUmyAwbp1AfDb4vyWsTyj1o7BM4BCujEHFM0bAkozyIApE+SdTWCP
	i/ehihaYWFEzGyKBQrk4WelMDwXU+Sjf7su7yIATXEmDEhG2j2bSMgdnlOlfmREOY/3q
	2WYn0KmpvivZLezC5XvxRiI6EqucTX2ZgJLHwhfdVioiCbfvC00u0QoiyoAKGFcI/DgF
	5DcnuCo9GoM948pECU91hYJ2rC/M5SjH2qfWqeZ9v3il2ZEShE+HySNDSleWYZ7eRshX
	4mFHqQB50AB9IvcitrYOG0K6UYB4+xeDc23T6+jt1nCvTpB2Vl/R+6YPpJoaNfWjzpJa
	Q4rw==
X-Gm-Message-State: ALoCoQl+bi8sUrHg0u91sHCetTg05xYrVFHOMafKl3owwMMvF7QndvsiQCGIjkm+gBziBXdiVuPs
X-Received: by 10.60.44.232 with SMTP id h8mr1485903oem.54.1393338381270; Tue,
	25 Feb 2014 06:26:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Tue, 25 Feb 2014 06:26:01 -0800 (PST)
In-Reply-To: <20140224182814.GK26981@jama>
References: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
	<1393047007-20507-2-git-send-email-armccurdy@gmail.com>
	<20140222063919.GJ3854@jama> <20140222082502.GL3854@jama>
	<CAP71WjzXR=qCBBqHLK1UtvtwJ4Cr8wy60tjvmsHsB5ajr4HU0Q@mail.gmail.com>
	<20140224182814.GK26981@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Feb 2014 15:26:01 +0100
Message-ID: <CAP71Wjy_mrSgefOiwVAx3QPaZwgPx+WxoC5zG+GuUxJrK5y7QA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 2/2] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Tue, 25 Feb 2014 14:26:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 7:28 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> because qtwebkit-examples is checking PACKAGECONFIG from qtbase recipe

right... this is quite ugly, no? I understand what we are trying to do
here. but do we really want to do it like this? is there a way we can
read the qtbase PACKAGECONFIG value from within qtwebkit recipe? even
if it's using some internals "sauce", that might be better than what's
currently done, no?

nico

