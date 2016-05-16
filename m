Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 63284731C6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 20:00:52 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 77so70523450pfv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 13:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=3YweL8QVzKGsZ+BQ6PQ3Npt1En8ByQD6nMSyXkhguNA=;
	b=NaJruLVfdt+tJdsi9A5EsC7c58vf8zHmdODHbDcX1uqMQtOE8p2s6I7rnPTmsuuhwl
	bEbQB206RnMtsQI6TK3rbcMjvALcyU3lABPpPAxbY/sHF6a3OIcy0b7EV9+sw2SqZdtz
	Ab/Jb8ib2FxpqjgXcmqJxdXK4COF+RYaTVkjUddsROtN6I6XW4bQvw/3kvwWOMMUqZff
	MQZjg9966pKJoktw2oTLt6VQ2zC2JRPz5zbPFYnbDOEFl3dvwsiSj9Pq6wtwTOa4Cqah
	+FKZBlWYdOVkwPtm3zHTTJ7pDh5med/kr1cd2z4iKv0hq1jgIDYen4CrIblWAmeKQNCn
	MPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=3YweL8QVzKGsZ+BQ6PQ3Npt1En8ByQD6nMSyXkhguNA=;
	b=WnXQsvkfN5sOsWAI0Ly/HMMbqTCS1pP46qvj1AmELdtK6dM6lRMIwolsX7vb7DHvu7
	XPpDPM0HOuWf4+IYww6pcqyTpbFM6TOZOqjd3FHf5LJjrhDtmzG47U6F/xo/cyi/8BfA
	PvIFjYxZCHb1s6UsaNsqThNgGMDYB0ow0WQc0kaWkbdJjWtacqrlDo/2CDrGonRCcJGi
	T9GAfeVBNto0tY6c4JB6HMEZpFQzc5f8QlEezQqgMTjygWkUA5PuEHqgP/gfVzuPD6Qq
	jfIaAfeXy0a9r+iYb5jxc1hazVEY56RsAGxnniWh1xkVPTg4QMmXQ8kw83UwcrlCRY4v
	nH3Q==
X-Gm-Message-State: AOPr4FVDz+1QucKsrAJeSysy6J7Oyg3XJl+Jwcw7gfzH9dyjFpFVVNY/36lONom6jbbkog==
X-Received: by 10.98.34.141 with SMTP id p13mr48228004pfj.156.1463428853021;
	Mon, 16 May 2016 13:00:53 -0700 (PDT)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	y2sm49122675pfi.39.2016.05.16.13.00.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 13:00:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f51.google.com with SMTP id xk12so68307825pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 13:00:51 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.14.7 with SMTP id fc7mr48149333pad.1.1463428851148; Mon,
	16 May 2016 13:00:51 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 16 May 2016 13:00:51 -0700 (PDT)
In-Reply-To: <1463153913-32514-1-git-send-email-ann.thornton@nxp.com>
References: <1463153913-32514-1-git-send-email-ann.thornton@nxp.com>
Date: Mon, 16 May 2016 17:00:51 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqsqUg1Gg0Y=2mOWkgjZtj2UVMPod7uDhsGAtoEG7AQaA@mail.gmail.com>
Message-ID: <CAP9ODKqsqUg1Gg0Y=2mOWkgjZtj2UVMPod7uDhsGAtoEG7AQaA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] packagegroup-qt5-toolchain-target.bb: Add qtdeclarative-tools and use Ruby tools only when Ruby is present.
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
X-List-Received-Date: Mon, 16 May 2016 20:00:54 -0000
Content-Type: text/plain; charset=UTF-8

Hello Ann,

On Fri, May 13, 2016 at 12:38 PM, Ann Thornton <ann.thornton@nxp.com> wrote:
> Signed-off-by: Ann Thornton <ann.thornton@nxp.com>

We can assume Ruby is always available as it has been included in OE-Core[1].

1. commit 10fd3b41449d1af15ac9432bc1a7fe26c6f1dae1
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Jun 4 13:17:31 2015 +0300

    ruby: add a recipe from meta-ruby

    Ruby is required to build webkit.

    Use trim_version() to build the major release, and remove
redundant S assignment
    (RB).

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

Also this commit ought to be split in two:

 - assume Ruby is always available
 - add qtdeclarative-tools

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

