Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id DE8C374540
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 09:18:17 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id l190-v6so7772523oig.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2018 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RWcpraHm3EMyYMVndMa4PL/qkGfBZrmkuDpnIpXEQfU=;
	b=axWtQfHR2/ET6s5eLKYxQ7b0QcV2SMjU2rOQI13RSSeUycAWrxcLpsoi78UX7HhAt+
	zdXriNaTsBjaa0qsBjrTRmolTtlQ37lrdBVo/ro5tU1Hg9BT/DsyWTbpmvpERFaGSr/K
	QqudB54nwsjyJLv9hN1S3hRIB2t/dxJLgXknhFB3NbAB+HrZWbrkTzuU+CfL5lxIYpDL
	gA5LutIyAketiP3MzTfE6BtpnzKvUSetY2J/cwKmXeSw1BD8xvQTmeF+IXWdJybWHxIa
	OWOZsNPWee5YcUkIG7zzhsQjFYc1oKYXeSbnmfs7DvIRGnWRSwX8Ub/87RpqQE9DRbxz
	O9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RWcpraHm3EMyYMVndMa4PL/qkGfBZrmkuDpnIpXEQfU=;
	b=DAScebTNGQZOfsDibJL7jCEtrUGY2Hi5b2npaleyjKVVbeJayJKRSdPQXdV/4tWPaE
	kZDt9HRKROafPr93DarMZUv/hloEjGtAfiHtbMG+hYNLhRTg2AG2vhNtYZKkZmMJsCoX
	5uk1hh1qEsWcHc8wb/HHU5Z8KuDcjm8amJPOm28xpeIfCODeJ51Z/K3mx20P4f0cp2Pv
	1YRmPkM7mCBliBr0V/vV81/5kLA1qH4iQTITVe/1bPFoH8Q3t1CuXTECCLmxD5LlNg7A
	gr52yocj3umM7ZB0fcs9z4B1bPFtFrU+dnkXPzjV9CLM3J4csRyjL+5ZMHw8o4LtWBvh
	1Yhw==
X-Gm-Message-State: ALQs6tDP55e9w5ODCZHSQeAWlXkCr8OyJ8iPbe2zKiatlQ8UoCngyFhP
	tHthATi9f3BNpA+ISEemrRN4fSCWGrKk5Gp/K/8=
X-Google-Smtp-Source: AIpwx4+aYEf8wcEXVnyxYY/YHw8hs358eUig32KZ1t9j5NclzdADlz/35Qp3Q/54alUEr0dLwyzXvgnUx3/d6m2tA2A=
X-Received: by 2002:aca:d0d5:: with SMTP id
	j82-v6mr8116623oiy.276.1523611098657; 
	Fri, 13 Apr 2018 02:18:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Fri, 13 Apr 2018 02:18:18 -0700 (PDT)
In-Reply-To: <1523609863-13079-1-git-send-email-hongxu.jia@windriver.com>
References: <1523609863-13079-1-git-send-email-hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 13 Apr 2018 11:18:18 +0200
Message-ID: <CALbNGRRf+Dx67AvU-YO_6g2bre94pXtrMJOWqMiqU391TBwrkw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] networkmanager: enable gobject introspection
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
X-List-Received-Date: Fri, 13 Apr 2018 09:18:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 13, 2018 at 10:57 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> While networkmanager upgraded to 1.10.6, it disable
> gi which caused network-manager-applet build faulure
> ...
> Couldn't find include 'NM-1.0.gir'
> ...
AFAIK it should be in autobuilder queue already [1]

[1] https://patchwork.openembedded.org/patch/150027/

Andreas

