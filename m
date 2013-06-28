Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE8E6AB81
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:45:42 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 14so1558683vea.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=83jZA2y2WFgf4uROZi27f74UiWET/nscy8KZhszhJiE=;
	b=bW3oiwiJrosd6cr8dr8+HRQX01mNByMs1HTStbA0Oo3H1q9Hhhio6Lv0tfv8q4LA8b
	QH6wn3CR0GQZQGFr3QPExwWDX6tpy6n3ycIJuDcrE4O7FyL/Y6X7N3hn6WOkRMFmD8cA
	IDjV3qYAybKHli+MbzF245Nx+HfGbg5YBePmm9kgV3T+oGVy8rfwMwWrY/tEcF/X/aLk
	IwdeyOj18JSXvP8WNsPwpoKX2T/xkntyxOvGJLi+ERbpxuY2mbnplC78LD32giaqqjY5
	us0CVOgUk/QgA8BfpOpW8j3DYzwYnQw+HRMrPd9ytJFNEaW3YIIviLOt4zHnTS1RmcEr
	1ltA==
X-Received: by 10.52.94.142 with SMTP id dc14mr4316446vdb.86.1372405542523;
	Fri, 28 Jun 2013 00:45:42 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Fri, 28 Jun 2013 00:45:02 -0700 (PDT)
In-Reply-To: <CAHsH0E8fpqeSnFRoigJY=3oXR98RFXQ2tc5bKh75Z+o_CCp6CQ@mail.gmail.com>
References: <1372326719-11068-1-git-send-email-lei.yang@windriver.com>
	<CANyK_8cc7LLLDJssgeWhRHkBy4AshZsGByvjUdwJUZPeBzprgw@mail.gmail.com>
	<20130627123859.GA3812@windriver.com>
	<CAHsH0E8fpqeSnFRoigJY=3oXR98RFXQ2tc5bKh75Z+o_CCp6CQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 28 Jun 2013 08:45:02 +0100
X-Google-Sender-Auth: -eGytDXnFTQzSJ8E21vonSM2kWo
Message-ID: <CANyK_8fVm2JRBojCOkh1vVGsy1-32WyLUYKnjY=dzHkv5AweBg@mail.gmail.com>
To: lei yang <yanglei.fage@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH:V3] vlan: Add vlan recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2013 07:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 June 2013 04:39, lei yang <yanglei.fage@gmail.com> wrote:
> 01:54:34 DEBUG| Sending command: vconfig add eth0 1

This is definitely a candidate for a short shell script which maps
this to the correct invocation of 'ip'.

To quote the upstream webpage for vlan-1.9:

    It is very unlikely that you need to download anything from this
site, the packages are left here for posterity's sake.

    802.1Q VLANs and MAC-VLANs can be created with the 'ip' utility
(vconfig works for vlans, but is crufty and deprecated).

If upstream says it's crufty and deprecated, I wouldn't want to depend on it.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

