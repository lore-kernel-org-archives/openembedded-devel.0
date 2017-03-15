Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id C76337762D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 10:01:02 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id m27so15928657iti.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 03:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=7DPJAnxWHzIWUecEuKccLvHOsB+ii9jqIRY5GCBz4I4=;
	b=in0Iwr2XiS73nK+F2IYXoVyZCpJ/sdJMZJxu2fZqVvWydE95Dq5e0IvzLA4Wcl1vks
	qWT/rU09Z1Fn2Le4FEaGuN7TeI4k4nMuC9awaTiI0XVUKNSLjKFravpgIRUxP+uwL6l5
	40cssy+J03VCBsRhDdvIy7Hd4t9NDQOeAMxYdUlS9bBtQ8qfffVMoxnFsnC7nW3pmhVE
	n8GsHPsjFeT14Lc3cBJhyvSj/p20qrjU8Lr1lCaIorQd8ovx7T71jSZ9gUF/KkwdM0uj
	ZahaTWtEh8sVhDNddcFPyGAAsZBe9q+bX0onsqaBXzDxg3T5FDdRdYXPt4PG2h+foj71
	nUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=7DPJAnxWHzIWUecEuKccLvHOsB+ii9jqIRY5GCBz4I4=;
	b=efzYBBoABC8xgMCKvssgIbdVn+hTBatg85H13qVvpPPQL0NGqGZpVt8XBMlrT/FCUg
	0zuuChp54YEUiIzBMufHu0Ro1GoyQmIGGDiPZUdm5FAJiI6pajMeIdIYntGbkKx9b46K
	6eg6Q0HRxKHGTGELLFgoSt78ZuyzaL/0q0O9dIzdp/ebEsffhyJvsTt8xazNyc2n/W20
	ZuKV5If71WrjzsR8f38j5nrOT8UlVJv6DTgBwosKeMZqluNpwY3JK7FW36XAUa3DTIOX
	WIjrZDB4C/+BGrh/wjL6DwhMhN7mzYwCpb1XYOCXvAi9gTHGG6u12OMqwl8UPUXMf8Tw
	/Q4Q==
X-Gm-Message-State: AFeK/H21rH3qqMHqxgb71syG6NNzlzDCHmwRDfWN1H3hvkZI5fSoMS63sJKFOudxSjCg97SR
X-Received: by 10.36.213.3 with SMTP id a3mr4099072itg.30.1489572063558;
	Wed, 15 Mar 2017 03:01:03 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCEB.dip0.t-ipconnect.de. [93.232.220.235])
	by smtp.gmail.com with ESMTPSA id
	e195sm6484847itb.18.2017.03.15.03.01.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 03:01:02 -0700 (PDT)
Message-ID: <1489572060.6396.90.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Mar 2017 11:01:00 +0100
In-Reply-To: <20170315094841.4126-1-patrick.ohly@intel.com>
References: <20170315094841.4126-1-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: saul.wold@intel.com
Subject: Re: [PATCH] yocto-compat-layer: improve error handling in signature creation
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
X-List-Received-Date: Wed, 15 Mar 2017 10:01:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-15 at 10:48 +0100, Patrick Ohly wrote:
> When "bitbake -k -S none world" failed, the error printed by
> yocto-compat-layer.py contained the stack trace multiple times and did not
> contain the stderr output from bitbake, making the error hard to understand
> and debug

Sorry, wrong list. I closed the patch in patchwork, too.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




