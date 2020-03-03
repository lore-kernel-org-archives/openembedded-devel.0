Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id D881560899
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 15:27:31 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id e16so3745163qkl.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 07:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=puBEcbz0CKqVxHS93yYMTeeVnAaWdok+6hT+tC4qbRE=;
	b=rQCLJ+ugUPM9EUyr8n2XN4nRFVZSvaqjW6lLizGCTIA+ZYh9LTINIYwpYh24pUxwpw
	6p5ktxY4xdB2bVO9t6SRD32bfv2MWhAKkKPczTSxqY7tRjSOQ4+YL5nBU4ReIgOzwyyH
	dmKEFsHMg7XNVMuXgFGEEO6WY8RwYsp0Tb8lAaCJRSMhD57eKCMQNGntm9JntRR4UuuG
	uNYoGhUUAzqMKutFhgR3HhyBhKtorBpleRqdUPUYJ8Bm39rYnat9PAFcXqLjzCbCrl+v
	7vlMTF92nNxyJ+OGRYLQ0YEcxGKGxlcGWQn8Z5JZq4Y6tcXy7k5gVDwoQont8IIHi75m
	DiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=puBEcbz0CKqVxHS93yYMTeeVnAaWdok+6hT+tC4qbRE=;
	b=t1rTrPEnnmAkMpDL90Y6AsHr1arYHYEQsvPCJn1IfhCukfexsgEI7H21GGK9pVIOfx
	RCs7w6v8CURvSGQqMGZ0apcb5mAr9VNP7gdUIJ3msA970z4xbcixm5bP8H0pZ5Yi8CTf
	YmPYQAyOdphnI7VAvCCwl/eSM9APg9hHN+q04b6dfoXNJ42tN//+cZ3RbK5qRAyA1if5
	ru/4r45TbfcILJUHDGKoqMu6E/r6J7/DwdfEOnGErjvjBSXOzEVf4owW/HSVXsUwCel/
	q1Y6nW4k1NRHXLGsSGR0RYGpDk9ZDO1sxrK9pV+hbp7X6u+n1eDr9BJ+qxDQ6waUQCe8
	Hp7w==
X-Gm-Message-State: ANhLgQ15MBWEqjtmBm6+l6+dcAfcNl1H8kpNhv2eQ+cFnQ1h4hCDzkSJ
	ILy8kLWsmg/0nedtEe5KqP7fZk00rUXtMXeb5G0=
X-Google-Smtp-Source: ADFU+vvJMZ/L/Ln7hg9mG1P0lZwEQyil4Rj8wyrOHP6mOu1Y3PI3Y4OMKs4GmcUdj2hgGjsc0WMErMXks+nguK0qQP0=
X-Received: by 2002:a37:e47:: with SMTP id 68mr4537823qko.17.1583249252361;
	Tue, 03 Mar 2020 07:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20200229185539.3905864-1-raj.khem@gmail.com>
	<CA+chaQfxab4+mepbvxdNkoj4h9T1T5Qq4TWwne2teiexjyuwnA@mail.gmail.com>
	<CAMKF1srZjHaeuTD0FLv0kmmn+Gwq9QThHxhGXB0+WSBSo2bEJg@mail.gmail.com>
	<CA+chaQeF7U2C+t+zugHFry2bpxiFbfa294_A_dnfmdvJ-3pw9A@mail.gmail.com>
In-Reply-To: <CA+chaQeF7U2C+t+zugHFry2bpxiFbfa294_A_dnfmdvJ-3pw9A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Mar 2020 07:27:21 -0800
Message-ID: <CAMKF1spqvnHXTOMWX8VV4QponpKun+2tpZS4hAG5JpDDdv8xgQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sysdig: Upgrade to 0.26.5
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
X-List-Received-Date: Tue, 03 Mar 2020 15:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2020 at 5:53 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> Should I send the patch to move grpc from meta-networking to meta-oe to
> fix this or do you have it already?
>

Please send I don=E2=80=99t have it ready

>
> On Mon, Mar 2, 2020 at 6:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Mar 2, 2020 at 4:27 AM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> >
>> > Hi,
>> >
>> > added dependency on grpc exists only in meta-networking, so this fails
>> to parse now.
>> >
>>
>> I think grpc is common enough to belong to meta-oe as well.
>>
>> > Cheers,
>>
>

