Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id A458F780FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 23:24:16 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id k87so192360wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 15:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oYiNTaTJckxf5xdhh3HX8FoOv7L9X9ZrQUwCv8nHQsY=;
	b=uCzfO2w0FfUqGj1B2elVfW0eZb3Okc/dDOM+KoQ2SFDbFGYTIKY5AWk+bddJtKlMPd
	qC2vvOAjT7p1amCiLxejgBUeFgJ+0mjTlkWFFQFJi5QrSvDlnzhId11oaQ+G+ndQle3X
	9C5iKeZ5P2u47efR60boOX22oUw1dbP4nNjPz3bY5W9qCC8ifQbSX67Sm6LJoKcun1ZD
	VaVOxr8NQnlFuI4Qiii9dqti9kVCU1B0j46idil1JoHczgH0Rafh56HAFKv8TsWO8V8+
	CZr2q6mYkyHoqeAnPr5yPFqk+xnhpYiYl3wAqSWzeTsUEDzG7MxNJTwLVUUkLNsqwSxt
	xRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oYiNTaTJckxf5xdhh3HX8FoOv7L9X9ZrQUwCv8nHQsY=;
	b=XHUolwKdR/rvuT0IOja2mYIUNFsSB91Fquppjfo8feTpY0jA6XzL5t5ZRqaNwHWk9j
	ProRazIxndV1mE8JMrGfkJAcqAUSpxOvyZfXjF5/tLOqaczxjEaPhXZVMfKmrq41lDQK
	qidtf+EtX0TuFUSMvbT9A24UZYt4dvJ/ipPVMSF1rAuyx+yAsOFspoa1AoEmv9iQZIxi
	kWwJjAeQur+EjUCNR5XKAnJQ7IbyV6suz9IL+RXhfZlVuLj2X0hZJi0J9uWxFFn7BjeH
	w3REtXFo/WiT1nbVO4gmcBf64o289CMY3yjMTOrNQ5VrkZmShb/RJ9kCoyWbPI0iPaYp
	zd0Q==
X-Gm-Message-State: APf1xPA/FkEFHmTN9OsrvUxLD8f9ILFwU9qb1n0gFfj5asfUM04wDy+E
	n7jWXimm5TEzb3BeupBUVOwMWwucNZRp8BYAl3Y=
X-Google-Smtp-Source: AH8x226l/MQvkYKcAsfmy2xvAsm42/bgLqSCnnZaxT+TZ2s3M4fyQxFmHr7xxtethU+Nk9YDH6qbOeZBv+K0qX2uhYM=
X-Received: by 10.28.145.21 with SMTP id t21mr3776269wmd.136.1518737057436;
	Thu, 15 Feb 2018 15:24:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.193 with HTTP; Thu, 15 Feb 2018 15:24:16 -0800 (PST)
In-Reply-To: <CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
References: <20180215225339.GL2786@denix.org>
	<CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 15 Feb 2018 15:24:16 -0800
Message-ID: <CAJ86T=WS5dkQ8K9jqgK5vGG1vCpnOTNFzd4WA6Qvp6pFXEKV8g@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: libtalloc failure due to waf
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
X-List-Received-Date: Thu, 15 Feb 2018 23:24:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 15, 2018 at 3:10 PM, Tim Orling <ticotimo@gmail.com> wrote:
> Seeing the same and trying to figure it out. Also, seems there is no recipe
> for waf-native, so it becomes a new required host tool.
> On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
>> Hi,
>>
>> I'm getting below stack dump building libtalloc 2.1.10 in master. Works
>> fine in
>> rocko with libtalloc 2.1.9. I need it for cifs-utils. I'm not familiar with
>> waf, any help? Thanks.

Does reverting this help?

  http://git.openembedded.org/openembedded-core/commit/?id=aa168ee7f785ff007ca645db57698883922b5eb3

It looks like the new version may need to be a little more forgiving
if ${S}/waf doesn't exist?

