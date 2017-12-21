Return-Path: <sledz@dresearch-fe.de>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 71EA760684
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 13:00:04 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id y78so22156411lfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 05:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:followup-to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fZG2myhdOsgRCIoD5xHO7Jo5PUYhBJv/GpiBmn3KBXc=;
	b=0CS65EKmhQSMIrBt6Rt12Xe3X3QsH+/jXJrpOpj+Pg5fMAB9E5ijEPFGKZvDf/V4L0
	bknPb2fKqY807a14foXfPFF8hZRC1O+ZfaAQPNKBpeZJcBOSzeMeboPZzOidCIa1rGgd
	SlNxXhkuGGABuaMlyDV571/VxaPOnlB1Wm92QGd+MGJD1SWpL8JNx9Fa0nQIq7Ej+ecb
	TXoVqP+gZhT6TAaVNkn4DfynvUXVyvuktzUqqqEgoiQNrky0OTU3AmT1uFenhPKU6mKe
	LX6jSsq8axTdBSSVkIPppqUsroV6Uz7awC+HTzPVQaYmXJ5l4exhEFaLTjMfBQrNFVUZ
	HCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:followup-to:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=fZG2myhdOsgRCIoD5xHO7Jo5PUYhBJv/GpiBmn3KBXc=;
	b=nvrar1ueCMSceLzeuh4vJdCL2SriRygN2yUwM0bkbxhebbltr/mT1xmbmILkkUxQUF
	t0hq8twdDft1Lj7pYpNJtz/ghWmp6q4qo6sJpv5OygT+Sv+nu1iv0S9xIHwEzGU2CmGt
	pVXVi7fQV9mUBvKJwU2zP+oEEqeh1wzMv2FCgmtk28T7zvEEshRpwjblwKkq7OzJqz8D
	FpcEf/hUZuspSqF7SSDDQFI5wVf2dIg7L5FkOqI4+OX3jhT9udmE4FilJq4gPGgoJj21
	rfikM0p8RpzD2D0ow7Gb2pAR6qb+DSmXld16I0QK+DljYxiKlr6OM7NF+3JyXqtoWaKk
	cGRg==
X-Gm-Message-State: AKGB3mJ5xvagW1JKXVt4ipx5uzXTK3mZvPR9v8Rqww72C7EYcvj8esbm
	QBFrUOgjycff+qxe2TFLuZPneQ==
X-Google-Smtp-Source: ACJfBos2io0cyWRQheB0YL/+/U8+9tzjJLC5MC4yTZ6taQuoaSQ1A9QIbXAdWG++aYvbwEzjsxoPKg==
X-Received: by 10.46.127.9 with SMTP id a9mr7277976ljd.44.1513861204963;
	Thu, 21 Dec 2017 05:00:04 -0800 (PST)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	79sm4126381ljq.5.2017.12.21.05.00.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Dec 2017 05:00:03 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
	<CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
	<6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
	<CAJTo0LYWwMnj4Wb6JC1y7uw4ZrPv6=SynfkSc0TU0dwi9Dezjw@mail.gmail.com>
Followup-To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <8926eabe-78fe-dfaa-d123-5d4ed39e0001@dresearch-fe.de>
Date: Thu, 21 Dec 2017 14:00:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYWwMnj4Wb6JC1y7uw4ZrPv6=SynfkSc0TU0dwi9Dezjw@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] MS Windows machine?
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
X-List-Received-Date: Thu, 21 Dec 2017 13:00:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 21.12.2017 12:39, Burton, Ross wrote:
> If you want to build for a Windows target then that should be possible but
> nobody as far as I'm aware has made the work public.  meta-mingw will
> contain most of the changes needed as that does build Windows binaries.

That's exactly what we like to to.

So has anyone tried this before?

What else would be needed to build e.g. for MACHINE=i686-mingw32?

Steffen

