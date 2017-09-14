Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF95B780A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 10:25:47 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d16so17150613ioj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V3/AJb1aCB7gc1GF9J018dUYFIEPrpY/O3EvgqVlK5s=;
	b=TvDoEcwQ1WP2H99hqT9iX6NNAOqfZhBvk3Nx1xBjXPzSOGFLbSVVg0kOAPQKSTi46N
	VCD+rOVJChUvrlkZPONDzTThvodcNvjlOevJxSs8dCNDawTfAxZsuKlsfw9hlSWIg2f9
	Bu5zGBq42a1WdOd6oZCZCuYGGLtFGTl4kBZ9A1OUlbZJe97Urnh/+SIbtN86BQpOPf4v
	pLwngnjtHZeaH6D1SXk/smMT7iy02uY2tnFFmbk55BQcQvQE8Y6qWZU3aW28VZGh/MLC
	FXvfxt4RQw4MAykbGhYc3DyyNrQEohAbuA6t1cOH3TlZO8hzR9lbhMEpNNRo4U+etUy3
	8VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V3/AJb1aCB7gc1GF9J018dUYFIEPrpY/O3EvgqVlK5s=;
	b=iMYGYs05BlTzp+9GCjlA7bWb6TqWGYlVCQlv7DLXJ2NZYGD/F7I6tp2ehTBrfcYPvB
	FNeNo9aSu9rSNzwuo0JOswYLzIIemN2DvYj2boNrMy/Nt1NLVCHhIKjkSCl/y+KbUD0A
	BKbleWVKnAqA0NDNCJmwPmZ1kWIQoHFo2WZFb6gAp3uuY4rmvpfLtx4ENZrkYqQ01ClB
	HbKb/+S5TkyKd0xGhYexV/1H3pCa7JMf8Yv/B9fnMMPQ4etRR14/WOESVEO5kqdCuRhY
	Jf0NFl7TVNpCygH+ON4WL7279wVllrsHuEVIfM11xRSQ8CJqtA39jN68CiMgvHNuifzN
	7ESQ==
X-Gm-Message-State: AHPjjUgofDhLk22xHa3R1uoW1xj3Dee0a5aqgudoSlJmBnWiDCgVBzn+
	o6nlWHZpwEBtDsZiILUZMznNQg2CgJ12cDCEM8IM/Q==
X-Google-Smtp-Source: AOwi7QD8ihObiAP/Bq1sa1tntGxxwEpyNsFZvKNTG8wSqY+5ykbPrlMcqjn/IItGqjipWtpitwQ+B/bqZddNZwc/KI8=
X-Received: by 10.107.135.72 with SMTP id j69mr2091136iod.210.1505384748940;
	Thu, 14 Sep 2017 03:25:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 14 Sep 2017 03:25:28 -0700 (PDT)
In-Reply-To: <CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Sep 2017 11:25:28 +0100
Message-ID: <CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpng12: add it back from oe-core
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
X-List-Received-Date: Thu, 14 Sep 2017 10:25:48 -0000
Content-Type: text/plain; charset="UTF-8"

On 13 September 2017 at 10:54, Martin Jansa <martin.jansa@gmail.com> wrote:

> All other LSB related recipes are in oe-core, why should libpng12 be
> different and live in meta-oe?


Mainly because LSB compliance isn't a goal of oe-core, otherwise we'd need
to add Qt4 to oe-core too.

meta-oe seems like a perfectly acceptable place for this.

Ross

