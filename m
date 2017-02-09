Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id B7BED601D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 17:12:02 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id c7so20884226itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 09:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=adS7mEszfHvlaBHWeQD85h3i+M6T6ScEQnFd9pgSrSw=;
	b=fSDuvuxBpnPS4pT49/Z24OC7hD9xdnipXvKH3a+RMYKY3wzY0qrjjFfkx7E6S0TCab
	8HmnKLkKA3JF0qe0QRVCPu6KHyI4cjDtlpXzdR1iNRel71hbyra3y7pMB3YveszKkjq0
	6Y89BmrAEhvzNNi8AzUDXlkxbI6Oxc9mtr0XyoC3l//M6/fRu/CGolxAQu06haJiJ8zk
	7zU7OkHaMdVZf+Djc03XdH9NtyAXMYOcHcyRRYro9ogEJ0CAB7/Ep4q3YNIcWigiAN/L
	vlMScFjvfz1M64/SgCcmIC0zYBFRjs7bX78xUZy5Kfka6OE1RMsb9v+k9wGeUA6aNqVg
	nCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=adS7mEszfHvlaBHWeQD85h3i+M6T6ScEQnFd9pgSrSw=;
	b=opCmDYpNoOuw4LvZ1kb0HiAo0UGG3XkTI7qjO1X1NLS2x8qisEvs06EXnshxik/KFv
	EwwwK/YPb4LX329YcD8a+iSXJCqsFPv9yyBtu473aFU8H07QUnMzQqOp9XjPDNMff+k4
	sE8zEYxY8yn8FRVb2Fir1qG8Owt4VAjUb/EyJqv14+47tAS9A2bM8fdRV7Al0ZXsQZPV
	V3Y7e+qiCB59fqiMtZ98Zpvvy+NW1XOKyHdN4+SKBJKT7Z4PL+ZioRlHzmPS98bq1CJU
	VbPzIh1SK0J+rT8OeoMzCxqe/ak100GxNn2NJyrO0vPGYFwbTG5ttZMJONUQAWI8sONe
	fjhw==
X-Gm-Message-State: AIkVDXIilZweEmfYg+MpiPrYHqutEWWWJfTggy12tR0yyXUPHQP4tqiS+K4H5e87YMZ99VcA
X-Received: by 10.36.107.194 with SMTP id v185mr22277112itc.59.1486660322220; 
	Thu, 09 Feb 2017 09:12:02 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DC0B.dip0.t-ipconnect.de. [93.232.220.11])
	by smtp.gmail.com with ESMTPSA id o13sm3184778ith.5.2017.02.09.09.12.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 09:12:00 -0800 (PST)
Message-ID: <1486660318.13854.105.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 09 Feb 2017 18:11:58 +0100
In-Reply-To: <CAMKF1spq2eiKHXrz19ZzRWmwzWUKsSSHbunLfqRND98SjkHgVg@mail.gmail.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
	<c480e4bea612959118bcdbc09e129084fd1d5866.1486546542.git-series.patrick.ohly@intel.com>
	<CAMKF1spq2eiKHXrz19ZzRWmwzWUKsSSHbunLfqRND98SjkHgVg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/4] lvm2: remove unbuildable 2.02.138
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
X-List-Received-Date: Thu, 09 Feb 2017 17:12:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-08 at 20:21 +0000, Khem Raj wrote:
> Can you check if this is the last gpl2 version

According to the recipe, both 2.02.138 and 2.02.166 are under LICENSE =
"GPLv2 & LGPLv2", and that also seems to be what the current code is
licensed under: https://git.fedorahosted.org/cgit/lvm2.git/tree/

So GPLv2 vs. GPLv3 wasn't the reason for keeping the old version.

BTW, do all mails from openembedded-devel have Reply-To:
<openembedded-devel@lists.openembedded.org> set? openembedded-core
doesn't seem to have that.

I have a mail filter in place which will bring personal replies to my
attention sooner, but Reply-To to the list defeats that.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




