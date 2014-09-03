Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4446B713E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 10:16:53 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id x12so7437538qac.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Sep 2014 03:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5R539BT28Z4wcPer5Rf3OBDYA3Z/CLP2bxFSBNCfNvw=;
	b=Qdb/ecj2OvZyFlLmhtcBlYkM+QIVE9Mjhp+jqAWHBEQ+Kox5CL/pEIZZtIZd+5SolT
	MaYURdgBnML15u1mg3Q0UrUuKDqPpY0rRyzOMv2O5L3FSsyvz0MPtrFXtSxnZvnIsHd7
	zToiqKgtLO/i/azuxtajOIv0akKX43haUX9xnmQMWBvv7ZR4wFmsTjnbg7do8OEsngqT
	xpXat1X6abk4myx3iJOX0s3h2JHjZ0ud0QthqxLtr4kJIT1X9KzqWKb0tSo7kwn7jOhM
	3BEf5qAlqCPclhHE7FrOxd9iTNv4HmKVbWtnokV4KUjdEvE0a+SuiQPun0MWndNhhtL9
	5VZw==
X-Gm-Message-State: ALoCoQnHyB/gGeXbS+OJuiX5ZOQwgo7e0NBB34JnaUrNLt71RVvnppxrAZWcZXIzfeUPGbL2/15N
X-Received: by 10.140.97.131 with SMTP id m3mr59597525qge.80.1409739415033;
	Wed, 03 Sep 2014 03:16:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 3 Sep 2014 03:16:34 -0700 (PDT)
In-Reply-To: <CAJTo0Lbb8uWBKYUTrqvbuo0VEQm=g3uRMv1KPOPi1YNrYL619w@mail.gmail.com>
References: <20140902135015.93AF7504BC@opal.openembedded.org>
	<54067424.8050600@windriver.com>
	<CAJTo0Lbb8uWBKYUTrqvbuo0VEQm=g3uRMv1KPOPi1YNrYL619w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Sep 2014 11:16:34 +0100
Message-ID: <CAJTo0LZCjHOZ_ve_DJDTHN2P6REWFVCWDSbmVouNwPVK1HUkWg@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [oe-commits] Richard Purdie : package_rpm: Add custom extension support for spec generation.
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
X-List-Received-Date: Wed, 03 Sep 2014 10:16:56 -0000
Content-Type: text/plain; charset=UTF-8

Actually, that patch has a typo in the logic:

+    extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA", True) or "0") == "0"

== "1", surely.

Ross

On 3 September 2014 11:15, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 September 2014 02:51, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Exception: NameError: global name 'package_rpm_extra_pkgdata' is not defined
>
> If you set the variable you also need to provide the function.
>
> Ross

