Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 477096199C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:53:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id h62so4397463edd.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IyhR9QGXndK7MeCnnhrWJB0bhuZs28V/HprIH97nixk=;
	b=ns+vxubBze9rK5tCgs/Q78Y6rh368JZEegsK0Gp7PT8AzF52hBZbtL7tXfQzP6/2IX
	4YCvWaxBmc+go46cqGRcycEJ4L4Prke81YaS3X5kfkjvI/MPkfFKSKBe8LGQ+e0h6svw
	BHpigPaFyZyw+kY34DNf+uLrO/51mNn8ETTNGN+F7JgEjBAkhneKUCPEQvPAAAkT7giv
	YUHtvOuu3rECEYIWnKSADNjId5LjbgAA3dlT7A4vqWd83PaPFYTerOfUKLAmCSuvr/DD
	3kj1qTQoALInfJqekfv466Q91rSOhu7WqevXOF7z0JFYnQDoPcEihZtEWMuC+SIsywbZ
	obww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IyhR9QGXndK7MeCnnhrWJB0bhuZs28V/HprIH97nixk=;
	b=qKeyVmFPNGAlSF17TWMa17dwWgsmfyaYOWiFXYwl5kK5swdKtW+VKlE7+nEbVAU6CR
	5PiZIQF1JpwioUCWXSlcvRGnt7n3YQ7uhinT9PHkDKhyoVBrsRUSSwv/bXBYmSLrfjZU
	6237HQ2qrXfjA9uwRv9JL8/+NagxmQva/3Vhbw4K/B/p0KzRtqphBprCm3iDh1K2SKr6
	MU/x7aWqBfYdu6T/xAIphWCy7LbWei9jMFA1I1xQIkEX5jIjJlMHxNcAa3F3AxT6tHxU
	g8q8yCowMQ2RdujLHGasyDL59+V3LBCUCumjPGdfgY99V6BNp69pZAbVVwk7PfN8O1yk
	6PuQ==
X-Gm-Message-State: ANhLgQ0FUyxVHHWuNCqR9UO3mwvy2Fyq35FIxbH1WBCVLZG1CiXt2iqZ
	5o/tH1pVUc33Y+f8IvOvamYZC6HwtfWb1W0aAwo=
X-Google-Smtp-Source: ADFU+vsnrklWGYr9KZfL5BfuIEqKj7xdlpunVwDYCr7/qO96eHY5ajVL/DTM2kYzUM/6Sd7DwfVbvrDGl+QHlCmf/Wk=
X-Received: by 2002:a17:907:402e:: with SMTP id
	nr22mr1720989ejb.246.1583243619567; 
	Tue, 03 Mar 2020 05:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20200229185539.3905864-1-raj.khem@gmail.com>
	<CA+chaQfxab4+mepbvxdNkoj4h9T1T5Qq4TWwne2teiexjyuwnA@mail.gmail.com>
	<CAMKF1srZjHaeuTD0FLv0kmmn+Gwq9QThHxhGXB0+WSBSo2bEJg@mail.gmail.com>
In-Reply-To: <CAMKF1srZjHaeuTD0FLv0kmmn+Gwq9QThHxhGXB0+WSBSo2bEJg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Mar 2020 14:53:28 +0100
Message-ID: <CA+chaQeF7U2C+t+zugHFry2bpxiFbfa294_A_dnfmdvJ-3pw9A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 03 Mar 2020 13:53:39 -0000
Content-Type: text/plain; charset="UTF-8"

Should I send the patch to move grpc from meta-networking to meta-oe to fix
this or do you have it already?

On Mon, Mar 2, 2020 at 6:22 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Mar 2, 2020 at 4:27 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Hi,
> >
> > added dependency on grpc exists only in meta-networking, so this fails
> to parse now.
> >
>
> I think grpc is common enough to belong to meta-oe as well.
>
> > Cheers,
>

