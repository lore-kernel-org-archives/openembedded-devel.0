Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id B998571CB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 21:56:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1487800580; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=hmU4T8W+edrDg77iB9BfCfwZyd2xPJc/rOAO6SzaFQw=;
	b=oPjx0PTbGcfTfFLfXgC2o2z0Z8jf/EybZMm8WLMUAfd0OACKCDjhD8wmKyZ/Xmlo511SCQH0
	yrVHT7A6/JLMGylkWyaVXONGCtA5L+1DRxqs7Q/AHEVBczwVO/3vIXWq2CEqL4i2y8d4wgyI
	Wwc+cH+H3OcyYZEELXeijyc5umI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=X/tNs3dwO1Y3k6mnsXrtIsmzNGcOth3OParTO3JEO7K7xG5CZPsmVVlFv8TMW957cFd36I
	1PM498NHmjnRSij+xYYrNNjSiCYRRrtX5W2in2vJwH2WvtDK+64vKEp5ihYpUwQQLG2wX4SD
	ltiEBHoXLEmaLpyzVvNVKNZ7L8rCY=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mxa.mailgun.org with ESMTP id 58ae0903.7f24fc3038f0-smtp-out-n02;
	Wed, 22 Feb 2017 21:56:19 -0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id d9so42472050itc.0;
	Wed, 22 Feb 2017 13:56:19 -0800 (PST)
X-Gm-Message-State: AMke39livi2BKZL14cBzVyv+1eeQkLoILGzXJXF/v5DSOCNw8eli+08ab5FRkpDnXCB1v9SCBiZGEQrHiDT/Ig==
X-Received: by 10.36.94.66 with SMTP id h63mr663332itb.41.1487800578737; Wed,
	22 Feb 2017 13:56:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Wed, 22 Feb 2017 13:56:18 -0800 (PST)
In-Reply-To: <CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 22 Feb 2017 16:56:18 -0500
X-Gmail-Original-Message-ID: <CADNbA1pdESCdRAkKB2po-kZ2b26TMSQsas3u4vYFU=SKMOhVaQ@mail.gmail.com>
Message-ID: <CADNbA1pdESCdRAkKB2po-kZ2b26TMSQsas3u4vYFU=SKMOhVaQ@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, "Lamego,
	Jose A" <jose.a.lamego@intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] Patchwork not picking changes from the ML Was: [meta-python][PATCH] python-paho-mqtt: update to version 1.2
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
X-List-Received-Date: Wed, 22 Feb 2017 21:56:20 -0000
Content-Type: text/plain; charset=UTF-8

Martin - No problem.  I'll resend the patches.

Michael - Would it be worth waiting before I resend the change sets?  It
looks like at least a subset of them have made it through.

Thanks.

-Derek

On Wed, Feb 22, 2017 at 3:55 PM, Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> I've seen several issues with hooks. I was working on them yesterday and
> will continue today.
>
> These are currently managed by hand but we are moving them into
> configuration management which should help keep them working consistently.
>
> On Feb 22, 2017 12:47 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>
>> On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Straka wrote:
>> > Signed-off-by: Derek Straka <derek@asterius.io>
>>
>> It's not your fault Derek, but most of the patches from today and based
>> on the pings from today also some earlier patches didn't make it into
>> patchwork. This one is the only exception.
>>
>> Michael, Jose: are you aware of some issues with patchwork? Could it be
>> caused by the default Reply-to change from yesterday (or day before
>> during OEDAM)?
>>
>> I know only about issues processing merged changes:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10967
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10759
>>
>> And also UI issue in patchwork that paging doesn't work, e.g.:
>> https://patchwork.openembedded.org/bundle/jama/master-next/?
>> submitter=&state=&q=&archive=both
>> shows that there are 5 pages of changes (which should be in most cases
>> marked as accepted by the hook above), but clicking on 2nd page produces
>> link which drops the query parameters:
>> https://patchwork.openembedded.org/bundle/jama/master-next/?page=2
>> so it says "No patches to display"
>>
>> Regards,
>>
>> > ---
>> >  .../python/{python-paho-mqtt_1.1.bb => python-paho-mqtt_1.2.bb}
>>  | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >  rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.1.bb
>> => python-paho-mqtt_1.2.bb} (68%)
>> >
>> > diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.
>> bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > similarity index 68%
>> > rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
>> > rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > index b8f5f3f..c8acfc5 100644
>> > --- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
>> > +++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>> > @@ -11,5 +11,5 @@ RDEPENDS_${PN} = "\
>> >                 python-threading \
>> >  "
>> >
>> > -SRC_URI[md5sum] = "a6407b74eb5e5411e157be1de5c11366"
>> > -SRC_URI[sha256sum] = "0f7a629efe6e3a2c61b59d3550aa9
>> f2c4529b5689a65fde45e6f1ac36b9a261e"
>> > +SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
>> > +SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a2
>> 1eb66f436184691d0bf1f2a85a6213c6c1f"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>

