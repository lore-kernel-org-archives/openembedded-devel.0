Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 03276731C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 19:21:33 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id j18so26631501ioe.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 11:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=P8mfIyTHOXDGHwQ1+emWbNGODDL83nNXlQWUwTTrObs=;
	b=1KFK/obB7CJIl967MRvYrjvzGHPAIFLslxW2pCSlzUYaxiZfcVszV+LWQmgQg4L75u
	mu1eho4GDh8/Nc05OwccGeV6PExU43F7lAagFcMOaqhdW7NvrU4b8d86HZJFlWImTuSl
	w1OcjIkjJq2sQS3Ph8npd5Hims88OW1AdtRk0xWosr+DaAjlUh1RzdW6MDoo9Vej7yAp
	94uqvYWqPh60eIO7Omb7evj2sNCnOII7T9gOf+G3zMYlmS3KzLOvLDGxmismk+Zh8efU
	Fd/GC61N1ajdCpvuhssAJPukwFkRNHkrJ3UXnHwqwVF45Slg7zj6CwJ9oBxEunLxAnjE
	TFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=P8mfIyTHOXDGHwQ1+emWbNGODDL83nNXlQWUwTTrObs=;
	b=NgEbPfszT9QTW6Zz1AVtVguyZbKh6A/YAtsvwa3deeAS2YGxE18Vw/RMeeSeuqjDLm
	X2Vbq9gaQOlD8zr8A9/P9DkC7IQvZIO/B3E1RDvsEpP/t/46nQpp7pUH/PNRDMT5uKMw
	joNdTeG40hliMHkkwYEK68LpFdvasUWeZeVJQ3RDJO6Bjzy2NbtvJ1XoShTO8nuBRHiU
	qAya5KwIWqTK62uSlf100HcYjfb2CVTKNwhgzFJHFOb25BErJ0WOOmGkdnOLtRmiVlWc
	JwbRCD5Bmkpu5XWMqLRBnIrj+l+WfZEjL6YIpUDtrIIeG07kJnpSwhdctljJen3lgAZl
	8/Ng==
X-Gm-Message-State: AMke39kXzQhCkzi9PlLFtjWzgdT7QDDE/frZlc6WnR0ZIoWOT/g9a3PFMGKsCkb7s7RcBN9B
X-Received: by 10.107.132.81 with SMTP id g78mr4890184iod.227.1486668093469;
	Thu, 09 Feb 2017 11:21:33 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DC0B.dip0.t-ipconnect.de. [93.232.220.11])
	by smtp.gmail.com with ESMTPSA id w75sm45203itc.21.2017.02.09.11.21.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 11:21:32 -0800 (PST)
Message-ID: <1486668089.13854.119.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org, Michael Halstead
	<mhalstead@linuxfoundation.org>
Date: Thu, 09 Feb 2017 20:21:29 +0100
In-Reply-To: <CAMKF1sqH1XGcG47CGp-CcgE5EYJ2_JE6wBw9V3=XDJ9-=LUHsw@mail.gmail.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
	<c480e4bea612959118bcdbc09e129084fd1d5866.1486546542.git-series.patrick.ohly@intel.com>
	<CAMKF1spq2eiKHXrz19ZzRWmwzWUKsSSHbunLfqRND98SjkHgVg@mail.gmail.com>
	<1486660318.13854.105.camel@intel.com>
	<CAMKF1sqH1XGcG47CGp-CcgE5EYJ2_JE6wBw9V3=XDJ9-=LUHsw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Reply-To (was: Re: [meta-oe][PATCH 1/4] lvm2: remove unbuildable 2.02.138)
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
X-List-Received-Date: Thu, 09 Feb 2017 19:21:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-02-09 at 09:17 -0800, Khem Raj wrote:
> On Thu, Feb 9, 2017 at 9:11 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > BTW, do all mails from openembedded-devel have Reply-To:
> > <openembedded-devel@lists.openembedded.org> set? openembedded-core
> > doesn't seem to have that.
> 
> yeah I guess reply-all will send to all but I never tried that

Depends on the client, but typically "Reply-To" sends a very strong
message that the only intended reply is to the given address. For
example, I always do group-reply in Evolution, and for this list it only
picks the list address, as it should.

See
http://www.unicom.com/pw/reply-to-harmful.html

Does anyone remember why the list is set up this way?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




