Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3995B719A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 07:28:42 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id c7so60098094itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 23:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=5bpzLkSqJ9zCs/QGfMArEX8WwtwN0xEgAXCj7Ztf75A=;
	b=ZnEwi/JTwREeY8FGcSebj5gpQ6G65JxIQNlzEQmcTQaT48jtgfqlZReLGIBqYQPrTu
	SlWydhJULKwn9/LB6hy4cL9owLr3SCIghCC+cxaoiafHcRr5ONAFne7l/cEalzFy52OQ
	0D5UHZXPxOoJRsRKl9fx67P87sZnAgasd9Q5Nz7QV4J3i9s/0MPmWUyEOzA0hODwZ8X8
	nhuoP/gNYk6zy1aq8JMXOZ1YwRVLAkt+W4QHWN0139bWKMq0Cz1hLPe/MDlxqklc9g52
	F5V4BSUZI2TDziiW0DL5fFaXj2Mwk2tsi8q0g2UZEg5Ix4B191DRHrY7ot/HUUsrv7wm
	6/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=5bpzLkSqJ9zCs/QGfMArEX8WwtwN0xEgAXCj7Ztf75A=;
	b=VRgvacOnVadu8SfsE8CwVelc+lIjXS2i9OjInNIBHOIinf0mvylJqdoXg881u47qLO
	zWi7vqDN/iHcmLFkiAO5JBC7SCGwgHkIYOqO415FGlN8Qsaw8GZfhOH6rhaHGysQ2eOj
	HFCf+ieUmbioOZbwN0sP/CUs9ChU3V6YEsB2U89JZl9/XmTClyjTlXFL7cbZSdgsD8kQ
	KOf6Qc7TA8mkBQ9hSE9iLB+ekgwPDtswuqZV86CeK7t9/l1insFB7MRh4oCAyynpGlI5
	boaaMW+K94yI+o/MMGYZtsJdRxgYVE9iA8udGyDeM1RXA75KFB+wPth+JG488G3K58ov
	m92g==
X-Gm-Message-State: AMke39nWAtd78/nXI/n3MnOxBl/DzhHXbWZPZq1DqOFLdytnMKrW+YhCY2J/yjKL+Sb7vIOQ
X-Received: by 10.36.26.9 with SMTP id 9mr7646554iti.25.1487143723156;
	Tue, 14 Feb 2017 23:28:43 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E563.dip0.t-ipconnect.de. [93.232.229.99])
	by smtp.gmail.com with ESMTPSA id
	h15sm2380741ita.20.2017.02.14.23.28.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 23:28:42 -0800 (PST)
Message-ID: <1487143718.13854.368.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Feb 2017 08:28:38 +0100
In-Reply-To: <CA+chaQfovfgVG6oiWcc=SV5ssZ-6qDY5z_AWg2pGoHZqNaum7Q@mail.gmail.com>
References: <20170210082811.GA3021@jama> <1487086509.13854.347.camel@intel.com>
	<1487093290.13854.355.camel@intel.com>
	<CA+chaQc+pT3pj-MJFHY=AJBdqgdrhqNmqM+k1KDm8-Nfir02Sw@mail.gmail.com>
	<1487101608.13854.367.camel@intel.com>
	<CA+chaQfovfgVG6oiWcc=SV5ssZ-6qDY5z_AWg2pGoHZqNaum7Q@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: multipath-tools on arm (was: Re: [OE-core] State of bitbake world, Failed tasks 2017-02-08)
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
X-List-Received-Date: Wed, 15 Feb 2017 07:28:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-14 at 21:06 +0100, Martin Jansa wrote:
> Or you can try to force arm mode for multipath-tools build (by setting
> ARM_INSTRUCTION_SET in the recipe).

That's probably the easiest solution - I'll do that. Thanks for the
hint.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




