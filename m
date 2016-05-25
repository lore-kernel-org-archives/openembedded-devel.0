Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 78D6F62135
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 11:37:49 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id r140so60232993vkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=twcNiS11l1eD/hobvOuMTAQAfuPDArOWPWSsan6BpNg=;
	b=vYASUOcsfxp1w5AKDoaXZkB2DzHza0nrdwU0sv87+rput1Ifqu67JIV9E3U5D85Z/E
	SSXhVcr5hv1lExHBdOXfTg+s3Cc/v/Qyl6neHuZ5BtrclCiKc+6uFcqachscpdYYxkPa
	tuZMHqJXh0LbITkjyhgFeD8qxHFLLDmOvZ0YHO4Y4qflKAqK0eCM1lJDONWAakwKbHvv
	FQ2z6j0YvL2JgkQnD4vOROJejsqRgykUiEA8cZuHeBq7as+FfnPCvE+ef+8KyXFpcI2p
	zTBW7WAxw4yqk6JmQ3ZCsJYF5PvCnvTm+A5htcSeb/XaDkEvHmnTaW/2iKO8+aPdSg/N
	KYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=twcNiS11l1eD/hobvOuMTAQAfuPDArOWPWSsan6BpNg=;
	b=XMQtIclhRiGb2WgauQcEfvEQ7Nq8V0c4KTX8gSvtgq1ef3PkpFWywnXebxIh64MwWG
	xe23P0C4ILAIx+boLTaO66yHW9Bg+iY5hfvrQJNtW6NGDqvS7jteZ8AFji3yEEE1eG8X
	N4KNYWBarKYqXS9PRmSQzTDZzvQVQz7/+qoNTz+/n67+rnJIXTcO8oK6hn89g3+AGyaT
	WEncR/TejT9MINQYkZgW3JBu1BxAJde0kL/X4SL0vtMAHgtOxduvyf4gh2lYe2F3jTNg
	ymcfwIkpkRKdlUTNk1lPXqrT72smAINSE5i9W6i8GWPyZpSWCGsUKFoN+wSSdRwhSqlh
	N2hg==
X-Gm-Message-State: ALyK8tIZCIC3ypyfCeeceocSGQyyhNWctu4k18pYKyMUW2Rb3gGtQgOUd4ZuhrBDQBZ0UNXP2AbZ8ZVYbBsDyg==
MIME-Version: 1.0
X-Received: by 10.31.220.2 with SMTP id t2mr1805415vkg.113.1464176270348; Wed,
	25 May 2016 04:37:50 -0700 (PDT)
Received: by 10.159.39.68 with HTTP; Wed, 25 May 2016 04:37:50 -0700 (PDT)
In-Reply-To: <574569EC.7050601@windriver.com>
References: <1464159700-16254-1-git-send-email-zhenbo.gao@windriver.com>
	<D9C8A333-331C-4D27-A60D-EDB3DDC244D3@dominion.thruhere.net>
	<57456517.1030405@windriver.com>
	<94DE3B87-251D-431D-9BD2-AA3B841C130D@dominion.thruhere.net>
	<574569EC.7050601@windriver.com>
Date: Wed, 25 May 2016 13:37:50 +0200
Message-ID: <CALbNGRTAq9kD6whZkHdbD-qwTmx1iB-a7TtG9cXf3MMmiEDcng@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] networkmanager: add alias for networkmanager
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
X-List-Received-Date: Wed, 25 May 2016 11:37:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2016 at 11:01 AM, zhenbo <zhenbo.gao@windriver.com> wrote:
>
>
>> So fix packagegroup-self-hosted to not specify a connection manager,
>> crippling the connman and nm recipes with a virtual isn=E2=80=99t the so=
lution.
>>
> Ok, i will give a try.  thanks for your feedback and suggestion.
>
> Zhenbo
>
Maybe a bit off topic: Isn't it possible to make newworkmanager a
packageconfig for xfce4-power-manager?

Andreas

