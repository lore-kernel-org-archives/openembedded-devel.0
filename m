Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4750271D86
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 20:28:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r18so35186591wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 12:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xoxlUaNAddhNm9rRMyoQYdmEcpROrOIuSTCJYOiFUD4=;
	b=ql0SQpu6oE50shztcaKPeB/oprmUaD0+1bXBNrwJOTD8gqpD6kdqIoRNxWlBTVe2KB
	WEmR4Zqtap96upyPtiHZCh/XnfTFDBxnfXlCyIeUR5HriG3yMESERZfWjf+fRFZgGhUe
	v8pj5P+tnWRI4AQ3uCbowJKY2lWofFfCzmqutLa1eVzSsXb/vWrWnpquGECpOYJ3zv1F
	+Ca7CnQDbFS/Nr/I4FNqbWBH/biDIXdp8ijVxHlga4kA4sfhO5R0M2rQy3L8etRVwBwB
	d2sgCgwQPkHH1yKvOmTgkDR0m2+ozmXIdTN5XNC+7qcKqofExAv0dLi6VCYavSBTLbX7
	88Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xoxlUaNAddhNm9rRMyoQYdmEcpROrOIuSTCJYOiFUD4=;
	b=MwqmU68a9dlOcMTiRrf7zZUvS5p2D0+CfmXKBVzQI4kJc+WUOJ2gVo31hXGQb9Ir9U
	1jQHG3LZuP62Plfc2mCyKDycnV19RbF6Nw5gz5H3uEjbBmi4wYsi1WYv61LYRi6+J+iC
	A7+Pi5dxW1Ifqdc1vP5WaRd8+ULRvqL52fDtvRT6Tu7H7GOOjwRtRDzOZdokT6Za/Ml7
	e7L6vfRAFHjXfWHrFEPb08VOTwnnY5cdFvEg1p0pkFp/Rd6IyF1VnwLqYwA4h40rgWBN
	P0KWmK3gprTs5UFJjpzyw0w0pj1oC8YLuuJ+PehJBCJcQYyYOK72+4T5emKISgaUjONo
	Xclw==
X-Gm-Message-State: AMke39mul3FMXI487PJLxoJWU0caLbDufIcFQhBzfUxHLHqQ+57PAsPzxjoUSx06j7EJMqj5Be5drRMdCZf0cA==
X-Received: by 10.28.170.213 with SMTP id t204mr18223363wme.29.1486585681020; 
	Wed, 08 Feb 2017 12:28:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.195.17.228 with HTTP; Wed, 8 Feb 2017 12:28:00 -0800 (PST)
In-Reply-To: <CAMKF1sr8UGiK8OHaPfw1ArJoRNBV3Qsy8NxoVuB5V4Xv6=8ouA@mail.gmail.com>
References: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
	<CAMKF1sr8UGiK8OHaPfw1ArJoRNBV3Qsy8NxoVuB5V4Xv6=8ouA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 8 Feb 2017 12:28:00 -0800
Message-ID: <CAJ86T=X_CqvAb1G5t+_v2H8CHf0Po+ACg9PnbirvxRYCb1rp-w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/3] libev: Add recipe for version 4.24
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
X-List-Received-Date: Wed, 08 Feb 2017 20:28:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 10:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Feb 8, 2017 at 10:13 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> ---
>>  meta-oe/recipes-connectivity/libev/libev_4.24.bb | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 meta-oe/recipes-connectivity/libev/libev_4.24.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/libev/libev_4.24.bb b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
>> new file mode 100644
>> index 000000000..f236eacab
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/libev/libev_4.24.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "A full-featured and high-performance event loop that is loosely \
>> +modelled after libevent."
>> +HOMEPAGE = "http://software.schmorp.de/pkg/libev.html"
>> +LICENSE = "BSD-2-Clause | GPL-2.0+"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
>> +
>> +SRC_URI = "http://dist.schmorp.de/libev/Attic/${BP}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "94459a5a22db041dec6f98424d6efe54"
>> +SRC_URI[sha256sum] = "973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821"
>> +
>> +S = "${WORKDIR}/${PN}-${PV}"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OECONF += "--with-pic"
>
> this looks good. I also have an after thought where libevent will
> conflict with libev when it comes to who provides event.h file.

The libevent header <event.h> is deprecated and everything should be
using <event2/event.h> instead. So the simple fix would be for
libevent to stop installing the legacy header.

> So we
> need to note that conflict down as well. May be a follow up. It wont
> show up as much when we have rss now however SDKs and dev images will
> show this up where we will unify the rootfs.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

