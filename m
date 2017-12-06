Return-Path: <bill.randle@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF17C7017D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 04:13:04 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id t81so1730306oih.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2017 20:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IQui8JZZpV+FD9ZtRuju8MvhaGmsBGa9RoaNVkZ8uBU=;
	b=rJHZ472gzhygibto1ULMgH2onfP4yUMaDV3ttjTC3Bm763QhlrUl/Q/g9aeZLPDi/E
	mVEOWwg71Dsl0p47EB4RQwhNgDAq/0Faqn16uyaenzKCx5kVY5S/6jVN1GrY9kYj4yXk
	ZJXeYIkqIqruRnPYcj0HFhOFG44J2zO1jrQTVMBD8EHt9Thcey7GGFKKp3BsMmsbp/wz
	1ej3OJ6kIYLRVd+a6NV7eWfDyB8QDFWVa67X+YTjoSZrwGQTcmK9qvCnVY2roiteQp3I
	5Xh7LIlsbsLj+qd3EV4zKvfT1BkA+ezl/JDhjKpQOG6iXqowk9XuPLisDvZyuWYrn8bb
	jPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IQui8JZZpV+FD9ZtRuju8MvhaGmsBGa9RoaNVkZ8uBU=;
	b=cq5xDjtfgifzcCAHid5XdQoVHPkCsAwq/NoyX04sPv7jePC04vlwNQUBtuZZvUUwLW
	JNikJuBoY6TMUw9N49p7z4XWEeQYq8GWIgnKnbGvBG0P1DyX0731L02oyFIMkzX14oRf
	fy7JeY+OxwK+afEU3xeNqA4eEChsJZiNKPf8mTuH15UC0ThoBxA87MPJisqxwGDsD/D4
	dHXWw/tsDiB4TrgCr0DHbJlKchXzd5ou/dd9NsurLMV+UOPbt5cXWhLgGYvcDMY65Oyc
	peSSwVyJ8WbNvR6PKDx4MZKL9vsv5ocg/16+Xj2E0w6I+F1aFwvg1T8RcYOOwE+R94K3
	IceQ==
X-Gm-Message-State: AJaThX66AREMsFjql3DgQk6e4bvJRr9DeJZyGZordRQ2tBNo0WAHpt9Z
	LqYfmLbELIeG5HR0yLn+QWp8A7y5LM824kCbws8=
X-Google-Smtp-Source: AGs4zMaHls2C5zxjO9jYYQgef5e4Z71seYJC9CgiOWGsSovGGWzsfkcCLypb0M7+sXF3MBMlsx+D0g7I9J1irEnG7A8=
X-Received: by 10.202.253.73 with SMTP id b70mr19509850oii.279.1512533585402; 
	Tue, 05 Dec 2017 20:13:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.221.194 with HTTP; Tue, 5 Dec 2017 20:13:04 -0800 (PST)
In-Reply-To: <C4DB09BE-713D-4A21-83E3-FBDEB809547D@linux.intel.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
	<1512020828-4040-8-git-send-email-bill.randle@gmail.com>
	<2c075ea2-9526-2e2c-2136-523fecd5419b@gmail.com>
	<C4DB09BE-713D-4A21-83E3-FBDEB809547D@linux.intel.com>
From: Bill Randle <bill.randle@gmail.com>
Date: Tue, 5 Dec 2017 20:13:04 -0800
Message-ID: <CA+n--H8AJWR-_8EKXRNHAGQ+Q7UCBXxmaj5L4KuTtxoGeeb0jg@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: Tim Smart <ticotim@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 07/12] python-flask-wtf: move core of recipe to a .inc file
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
X-List-Received-Date: Wed, 06 Dec 2017 04:13:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2017 at 8:03 PM, Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
>> On Dec 5, 2017, at 7:57 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 11/29/2017 09:47 PM, Bill Randle wrote:
>>> Signed-off-by: Bill Randle <bill.randle@gmail.com>
>>> ---
>>> .../recipes-devtools/python/python-flask-wtf.inc        | 15 ++++++++++=
+++++
>>> .../recipes-devtools/python/python-flask-wtf_0.12.bb    | 17 +---------=
-------
>>> 2 files changed, 16 insertions(+), 16 deletions(-)
>>> create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf=
.inc
>>
>> I am getting this error:
>>
>> WARNING:
>> /home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-flask-xstatic_0.0.1.bb:
>> Unable to get checksum for python3-flask-xstatic SRC_URI entry
>> remove-pip-requires.patch: file could not be found
>> WARNING:
>> /home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/p=
ython/python3-flask-wtf_0.12.bb:
>> Unable to get checksum for python3-flask-wtf SRC_URI entry
>> import-simplejson-as-json.patch: file could not be found
>
> If you are trying to use a common patch file in, for instance, python-fla=
sk-wtf directory, you will need to add FILESEXTRAPATHS_prepend to the .inc =
so that the patch will be picked up by python3 version. One of the few case=
s where we want FILESEXTRAPATHS in an actual recipe, or at least the .inc (=
rather than a bbappend).
>
> =E2=80=94Tim

Thanks, Tim! I just figured out I needed something like that. Thanks
for the tip!!

    -Bill

[cut]

