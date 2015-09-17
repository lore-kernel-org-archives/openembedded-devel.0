Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 70E8777003
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 20:21:11 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so5819846wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zGn1EvgVXd4PPI+lUusdjy/KK7fsw7mk7M7BU7Hk4Os=;
	b=rQf9sLITTWie7hl33ae4N4G+zpOsfV2RIjAKHWIAnXvSYJ4tmyoSlkZAND/dDbiisA
	ANLBSsMal6n2i5HqfUNABCUj3fy/wgyeqs5M7KlHvu7U0nlBUrVU2CeY21ee2gxZzeM5
	D5hdfHGjZ2RSIzHc623NyQf2vLcbN2UZ5ect5uc4sKdzUqUM8EpnYz1JuUiW9qDqwVnY
	WPtTFoYdzIDi7owgIYwkjJRjTlA/9kz/+ogf+zwyfh8lVU4Fk3m0G9Od58QyD2H9/PCL
	M6ATQBTU2F7h9GVW1YTLdQO7su+zVaZzUpv7ULGL9LPyN0EQHzWQNzftCUHcU/8u/EQ4
	uzzA==
MIME-Version: 1.0
X-Received: by 10.180.37.76 with SMTP id w12mr11714665wij.0.1442521271722;
	Thu, 17 Sep 2015 13:21:11 -0700 (PDT)
Received: by 10.28.59.138 with HTTP; Thu, 17 Sep 2015 13:21:11 -0700 (PDT)
In-Reply-To: <CALbNGRQFrAp858jfOe33wspTGbpc+GJ65UTvR1f=SOGMSm82Ug@mail.gmail.com>
References: <CALbNGRQFrAp858jfOe33wspTGbpc+GJ65UTvR1f=SOGMSm82Ug@mail.gmail.com>
Date: Thu, 17 Sep 2015 22:21:11 +0200
Message-ID: <CA+chaQczwhoF1ah1N7Fp+4+JYoMjHJRxnk8hhMm74jKMQY1N-A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: gnome-icon-theme in master-next
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
X-List-Received-Date: Thu, 17 Sep 2015 20:21:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

True, I've seen the patch with R* combo om adwaita recipe, so we should be
able to drop this, I just forgot when rebasing master-next today.

On Thu, Sep 17, 2015 at 10:07 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Hi,
>
> looked through meta-oe master-next a bit to see what patches are to
> expect. I found:
>
> commit b5aae54f9ad4aaff228fed64f8b5d992f451b2cd
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Tue Sep 8 11:24:19 2015 +0300
>
>     gnome-icon-theme: add a recipe from oe-core
>
>     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> If I remember correct this should not land in master. We try hard to
> replace it by Adwaita - right?
>
> Andreas
>

