Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 961C27FFAD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:39:05 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f5so1024888ilq.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 18:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6Lxzep3LU6fydNjW99uF57pLLFHdtFQNX/uebPG7cTg=;
	b=YJqnVn3R/rTVS70tL+zV4ShBVUmRCKbPWXnkyWu8OELEl9AGtDKq26o877cl8r2C3p
	2X6xwHCbxHfM1x2ySozv0Q0914sN9m17UGt0/6pikK4T4OxrlGD/Qk6PZbWom/VZIgfr
	It+/+JN99mFJVW7MbrAA/0XQsCQu7khkIr101JyGh/Szypu/7qKKCvhudTPpGBHeFEn4
	HHY3KE2bDg0OW588m91eXaNjEUBFRDT8mpGtgy6myuQriPHDQYXE/Vhv3ixQhdRLxrjD
	MnqYPAXwHToy84LuVKeG0oJlvZ7znWexGAQ/6uJQXiKO23r2yTStlqkgj2Fe8U4tmOUK
	ygsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6Lxzep3LU6fydNjW99uF57pLLFHdtFQNX/uebPG7cTg=;
	b=hxzXbwX3e0XPhi3tQTBSLCHKdTyVMEwS80zZ8FuhqoMmQXbDJW/dHNVmAEV2HAYkvn
	sCERy8u7/yVogXDp4kXYHHLm+SvJwfyrLr/LZ4vxFNwXVcP7riqf2BrKnvBJ+UQSMTsS
	6duXFBZW3zedzUu0ryMajSxMbFUK+PHOG7fJv6fXZHegSNAQZz38RrUV5LLGrHmJh+Xm
	TWAvPdYd2Zo0tjHoJ4JihZJGxGxlzxKJgicVhMK0iYM2tk8B4mz/X5wJ4Q71CyXeLwT+
	XNTX7JwNp6B7uSD2AEXW/ncsbJNQ7ruy+ZC/GqhPnVt+soxyJmqPKX5+u2avF45QlZFV
	oSpw==
X-Gm-Message-State: APjAAAV5pcO5Z38OhsYqw0FZbY+KMnEefLiBKGn0jbU+Fax/0ApDFFkW
	H8noNzGTowMfZB3kroJ8W7DD/QUGrDJNyEb2PBU=
X-Google-Smtp-Source: APXvYqwvUdyjWPnsLAfX5i8D5x6T2S6Ofwoyz/2HOGILjXfzJPNcQbFhuFZeQo26mdzsa8fNFC8CC/aNyBoO90BEySY=
X-Received: by 2002:a92:911b:: with SMTP id t27mr10673547ild.142.1579747146683;
	Wed, 22 Jan 2020 18:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20200122185355.3258860-1-raj.khem@gmail.com>
	<CANx9H-A-rJjCOawq09wCp97DcX0N5nJRQq=rgvVUTGK9KmFnYQ@mail.gmail.com>
In-Reply-To: <CANx9H-A-rJjCOawq09wCp97DcX0N5nJRQq=rgvVUTGK9KmFnYQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 22 Jan 2020 18:38:55 -0800
Message-ID: <CANx9H-DL28TRJ_fCAxbKE7rn8pk6P=ABcyr-ct1zvMdq1MxYKA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH] python-pyconnman: Fix conman -> connman typo in rdeps
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
X-List-Received-Date: Thu, 23 Jan 2020 02:39:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 22, 2020 at 6:38 PM Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Wed, Jan 22, 2020 at 10:54 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
> Reviewed-by: Tim Orling <ticotimo@gmail.com>

> ---
>>  recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-connectivity/python-pyconnman/
>> python-pyconnman_0.1.0.bb b/recipes-connectivity/python-pyconnman/
>> python-pyconnman_0.1.0.bb
>> index 761ce08..264d2dd 100644
>> --- a/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
>> +++ b/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
>> @@ -10,4 +10,4 @@ SRC_URI[sha256sum] =
>> "46c64c0692063fd0c9fb0216d49f7884bec9fa9760d8473db4b1e2f816
>>
>>  inherit pypi setuptools
>>
>> -RDEPENDS_${PN} += "conman python-dbus python-pprint"
>> +RDEPENDS_${PN} += "connman python-dbus python-pprint"
>>
>
> Hmmm. Not sure how that happened as it was proper once:
> commit 646505a63b6903d1328f5e24784bb7bd854eed9d
>
> Thank you. This will merge tonight.
>
> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

