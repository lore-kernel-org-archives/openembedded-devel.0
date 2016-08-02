Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id C7CAB7319F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:20:19 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id m101so205718567ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2016 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VHNnMbGNQi95KBzwGdwJXrjin19ccR3xbvd6duLRKhM=;
	b=cyU9BI9i5Fqeaki0GyBIiQVvo2+fYmJ41K+MsqxhVlMgqdvX7GjLUxC/EmzHIIBG0p
	P9WsUPBEpao7qss0RJBeJvAgZLoQShk3QOFwTqFBlzCMs9HMsWzJ3gPoxfLfXPlG+k27
	6TH82v4I5ulSq/kEeich3jdrDEVLsRz9WNSakiGBATU0cMSBR0oMtlenACk2jtjzgyuO
	FF1jaegsRt0J90EIhYqjvC8r4A4bUqSGC8fYfWk9Vecb5iJn2ROdd3YLU4P77j6MtZop
	g2rKBeGTseEYi4tmm854E5csbyQqzU2GZOjBJ2PFQsP4RMpQPQmLl1DmNnUW0QpLd8eB
	5L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VHNnMbGNQi95KBzwGdwJXrjin19ccR3xbvd6duLRKhM=;
	b=h0Sl8JKHz3toBwFQoiKJJXh5LHSJW0g7WEaNXrzITjRgGUhlOaJIm2R6GQ4Rzm2BcK
	dR7K3dWMxHoBrqMSwqt+7vd7SL1C1FaaEPYP4PtgPTdld5prCs1f8865Chccliq8gm1t
	Rpst+CcJg/SjFpciS37mkdcQ2ZQsQPRSXvwbeiCgSvYoSnPKi7dCiTY4SR23lGNxQEjv
	QFWJI7dlAjdbzGkLyFpw8hJDbQRtxYqbPMwLNfV4Lo50yhi6GglT6GXSu//5qbxjfrW0
	o9OwXZB9ZWHw2zEFwz8I8Qu0mfIFYPHfNrBkUyO2+gEdyprPvGGvkqw9h+huBLaPK2Cx
	6A+g==
X-Gm-Message-State: AEkooutfT4PHYf1SN6m2nED+F+P8Pp8mdUsFG66MxRcR6842fCNdxdXgLusccrhdrJOj8LGIV4eS+ixd2KujR58q
X-Received: by 10.107.154.196 with SMTP id c187mr57587801ioe.99.1470126020628; 
	Tue, 02 Aug 2016 01:20:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 01:20:00 -0700 (PDT)
In-Reply-To: <1470148001-61634-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1470148001-61634-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 09:20:00 +0100
Message-ID: <CAJTo0Lb87euCxRhLR+LgqB2YUsfZoTsmdkD+4tCRmUzA0BxrBw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: huangqy <huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] cronie: 1.5.0 -> 1.5.1
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
X-List-Received-Date: Tue, 02 Aug 2016 08:20:21 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2016 at 15:26, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> Update cronie from 1.5.0 to 1.5.1
>

This should be on the openembedded-core list, was already posted last week,
and you made the same mistake that the previous patch did by not testing
the PAM-specific patches (which fail to apply).

Ross

