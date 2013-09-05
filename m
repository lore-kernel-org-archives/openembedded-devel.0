Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7D49A61617
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 05:06:09 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so1292424pbc.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 22:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:cc:content-type;
	bh=ujZqLxa9Ld6fXlODEPfq4pp0YblwU/8ERmVf5d4aRVs=;
	b=OMJSx7DNLWd4ITlL1sL9O87ufl8uvEmTxGV8rgtc4+SS6Ea+v4X6SyXE+4AQTmPucN
	aYxrEi/D6sT1vLV73aOlkEoWMye0lv3UbHDDyQxdoL9pzNMzcoOVV44hjIOSwLn6pF8t
	Ipoyou1lEsdBpCXXKEXHSVatneORFizr68+3oKEuL5mvBgWwNOMG1xJ7Sg2HvhIvKEnq
	GU57FNbxqSx2wilEevOm4vKLuhKDjKKHx9Aor/yEyh/cITQMJxxxPo87tWCWOClVfKW/
	k5pbKsRnOxGhGrWxZ5kESOIu9ewnkNhL7RxWjqOKrWC4NhKhJCHxmogBq6lVKicgZPNq
	c1zw==
X-Gm-Message-State: ALoCoQmi/PyihZ4bUTzTNPKsggFft4pF+JG3z6S0w7eldzSl8rRyILnyYTPNIe6k5M2N0t/yMQX/
MIME-Version: 1.0
X-Received: by 10.68.76.34 with SMTP id h2mr7254080pbw.20.1378357571701; Wed,
	04 Sep 2013 22:06:11 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 4 Sep 2013 22:06:11 -0700 (PDT)
Date: Thu, 5 Sep 2013 06:06:11 +0100
X-Google-Sender-Auth: WgbobC53JoUw26qSyuqZxfoovU0
Message-ID: <CAOMwXhN2MBV=1pB7ZUsm+Qt7aN-c7tuOY8u5F3s8VrZ2iR5zJA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] stunnel: Add 4.56 version
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
X-List-Received-Date: Thu, 05 Sep 2013 05:06:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Seriously: ping?


On Wed, Sep 4, 2013 at 8:47 AM, Laszlo Papp <lpapp@kde.org> wrote:

> Ping?
>
>
> On Thu, Aug 22, 2013 at 8:07 PM, Laszlo Papp <lpapp@kde.org> wrote:
>
>> Signed-off-by: Laszlo Papp <lpapp@kde.org>
>> ---
>>  meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 14
>> ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 meta-networking/recipes-support/stunnel/
>> stunnel_4.56.bb
>>
>> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bbb/meta-networking/recipes-support/stunnel/
>> stunnel_4.56.bb
>> new file mode 100644
>> index 0000000..0ee8cc8
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY = "SSL encryption wrapper between remote client and local
>> (inetd-startable) or remote server."
>> +SECTION = "net"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=f41ebed8571077706fee0b860c4d6666"
>> +DEPENDS = "openssl"
>> +
>> +SRC_URI = "https://www.stunnel.org/downloads/${BP}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
>> +SRC_URI[sha256sum] =
>> "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF += "--with-ssl='${STAGING_INCDIR}' --disable-fips"
>> --
>> 1.8.3.4
>>
>>
>

