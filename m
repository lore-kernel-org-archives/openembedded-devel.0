Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3E01D782A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 12:25:36 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id x47so1487288uah.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UvtFkc8mIxHxnhlBKWMjeODDbrjrAWJxPMDvCQvuk6E=;
	b=rNhuzJKtW7b+KVLEyBDpldCTJgMBMHOu6iHt+3b0yXxathiR9VPHD/rO6ZkG3dSwmv
	86mwhHnD1u7HLM2x+1sm+WuYMZ7D1ytPdXbc3bL69O97FyvAj/LqqaqrQt99PVrf3cis
	DHmJIZuHdrbDlMrLPy3T95KoXT/QHB83FvU7xhCkU1SK8Ir3GyoOD+yDdryddgJvR/96
	RhQD7S7IVe//2WzuVIciQlqqoYA3m8gV22cw40Ye8UMmaQagZOwb6IiHtJnHQaP7OAMu
	YXeDis5f68btMY03Up6rMghnQTBWa/OyCqORsml+vy3J7UvUSnHlvJylmIqMRxLE+Y5B
	+csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UvtFkc8mIxHxnhlBKWMjeODDbrjrAWJxPMDvCQvuk6E=;
	b=YB9FazXnz4+nMWXDNnfF8MGGSB31z15wz0WLCki5NpFuFQqSFxksDhYWXaOr0b1kPz
	YQnPoleFzbsUeSZ+OMKxFdVqXNTFHl5RowDOrKwE0O0bcyNrjs7MzgjfejUeWZAZNE3w
	S8WJOmrN4KYNVeB0vZW23ticYbWIVoIFgNq4p7IEnfuSyUMf0nBk34bnVvL0c5Y+CojZ
	Cx4qGgkwynsFyFTb56lok/kkNoBrK9OI/6HmNXHVwCb4hT5TEVYKCaRcxpFGX2nv4rrW
	Q3vbNqs/lLDx/SmMmiFB7FSGOz5ev1AZA97G10X0Pd8EUSPIqY5Pu6UFyvWuTU19jPla
	mn0w==
X-Gm-Message-State: AHYfb5gxd/EI0z3NcXo4wKE8piPoCcsqB3OJXFcyH5qR6KGVTXVWPnU8
	2ZgSHzprWJxVZ2XNC+ut7Y97dNzoIA==
X-Received: by 10.176.95.85 with SMTP id z21mr3566021uah.183.1503577538043;
	Thu, 24 Aug 2017 05:25:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Thu, 24 Aug 2017 05:25:37 -0700 (PDT)
In-Reply-To: <0b21ced3-5976-da19-7329-a3f7945d16f6@windriver.com>
References: <20170822142141.9783-1-Martin.Jansa@gmail.com>
	<0b21ced3-5976-da19-7329-a3f7945d16f6@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 24 Aug 2017 14:25:37 +0200
Message-ID: <CA+chaQd_SMSFAb5xihH399NwZpbxmjGw0=A835cRSmc13Dxwqw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-systemd][PATCH] meta-systemd: remove this now pretty empty layer
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
X-List-Received-Date: Thu, 24 Aug 2017 12:25:38 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Randy and Khem,

I think there was enough time for sending fixes. Some of these things were
broken and unused for years.

Nobody volunteered to step-up and maintain meta-oe or at least some layers
from it.

The meta-smartphone repository cleanup was much more brutal, 13 from 16
layers are gone.

Lets see how much faster my "bitbake world" builds will parse the metadata
and build remaining recipes.

Regards,

On Thu, Aug 24, 2017 at 1:54 AM, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2017-08-22 10:21 AM, Martin Jansa wrote:
>
>> * the upgrade path from original meta-systemd still isn't provided
>>    by oe-core, but hopefully there are only a few remaining users
>>    of this layer.
>> * some BSPs probably still use systemd-machine-units, but they should
>>    push it to oe-core instead of depending on this layer just for this
>>    one recipe
>>
>
> Martin,
>
> Since you aren't getting much feedback on these removals,
> I thought I'd say that this is excellent, albeit brutal, clean-up!
>
> I guess it's good news that no one is objecting.
>
> ../Randy
>
>
>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta-systemd/README                                | 26
>> ------------------
>>   meta-systemd/conf/layer.conf                       | 32
>> ----------------------
>>   .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |  4 ---
>>   .../recipes-connectivity/avahi/avahi_%.bbappend    |  4 ---
>>   .../connman/connman_%.bbappend                     |  3 --
>>   .../dhcp/dhcp/dhclient.service                     | 13 ---------
>>   .../recipes-connectivity/dhcp/dhcp_%.bbappend      | 24
>> ----------------
>>   .../recipes-connectivity/ofono/ofono_%.bbappend    |  5 ----
>>   .../openssh/openssh_%.bbappend                     |  3 --
>>   .../wpa-supplicant/wpa-supplicant_%.bbappend       |  3 --
>>   .../recipes-core/busybox/busybox_%.bbappend        |  3 --
>>   .../oe-core/recipes-core/dbus/dbus_%.bbappend      |  3 --
>>   .../recipes-core/dropbear/dropbear_%.bbappend      |  4 ---
>>   .../recipes-core/systemd/systemd_%.bbappend        |  3 --
>>   .../recipes-core/util-linux/util-linux_%.bbappend  |  3 --
>>   .../oe-core/recipes-extended/at/at_%.bbappend      |  4 ---
>>   .../recipes-extended/cronie/cronie_%.bbappend      |  3 --
>>   .../recipes-extended/lighttpd/lighttpd_%.bbappend  |  3 --
>>   .../recipes-extended/rpcbind/rpcbind_%.bbappend    |  3 --
>>   .../systemd/systemd-machine-units_1.0.bb           | 13 ---------
>>   20 files changed, 159 deletions(-)
>>   delete mode 100644 meta-systemd/README
>>   delete mode 100644 meta-systemd/conf/layer.conf
>>   delete mode 100644 meta-systemd/oe-core/recipes-b
>> sp/keymaps/keymaps_1.0.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> onnectivity/avahi/avahi_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> onnectivity/connman/connman_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> onnectivity/dhcp/dhcp/dhclient.service
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> onnectivity/dhcp/dhcp_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> onnectivity/ofono/ofono_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> onnectivity/openssh/openssh_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> onnectivity/wpa-supplicant/wpa-supplicant_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> ore/busybox/busybox_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> ore/dbus/dbus_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> ore/dropbear/dropbear_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> ore/systemd/systemd_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-c
>> ore/util-linux/util-linux_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-e
>> xtended/at/at_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-e
>> xtended/cronie/cronie_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-e
>> xtended/lighttpd/lighttpd_%.bbappend
>>   delete mode 100644 meta-systemd/oe-core/recipes-e
>> xtended/rpcbind/rpcbind_%.bbappend
>>   delete mode 100644 meta-systemd/recipes-core/systemd/
>> systemd-machine-units_1.0.bb
>>
>> ...
>
> --
> # Randy MacLeod.  WR Linux
> # Wind River an Intel Company
>

