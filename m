Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 85E716FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 14:09:10 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id r129so132650740wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TzGFceA/hUdNgAkpgJBa04yFDnEE+p99aw6MD27Qo6w=;
	b=LT7PNpu/QiFPjWyOoPv4xc5ujjVNRIFz/rDrvby6PCfIOcwfUAFkRjir7Isgqzd+6v
	w0f/yTzGhDEoUnp5eCoquQAqJWHJhqzuyA6oFChJrznesLQcX52xVu4XE6SHzWsbb62x
	Wy8nwCwXK+3Ci03wfdn8WYXKAfPAYxyUGRBPSuQDZXfz85ucZun8HabDp53irp6TmhSQ
	WkGf1Uypi9n4YDUIsK29LHr5O4Ynur3T06zBmff0gxIUSJ9D4m67BW+0KaDHdLlAVIDf
	kweYZaTGgiMtHs9flQXMe+ly3h3oNfgRjMrPx42cBkFs4tDMtYASnYkwGTwiMe/sB2zk
	Iuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=TzGFceA/hUdNgAkpgJBa04yFDnEE+p99aw6MD27Qo6w=;
	b=h6sdi7+8yvKXxgUqFwUH+ZybwEPXSzaghezE7WKhfcueObY32BsdZ5/AgoeCuoUylq
	nK7zg08qjs8EhNA163lLlPvIispNjKwb+mOhHz7/Po5XBr9bVKCPtLdeBXnLXoFHasub
	PI/RptOl+XM4aKW6gefFhuXI73BXAziBF+KzO1LnJmwDmxA5VnI1zWbGMTXkNczHI45r
	IlXes1RZPOTXJZ4McguKB1SFOWvyho1+3SfkICq6LblJnrLhMTjz+JelghjaGHZggyhk
	+fbVFviNFON5JLFOjjQYcYv5fjPrQO69hAygiMxZ1lSSmVR+zJAy4SFXwpY3Q98s+K+q
	Md9Q==
X-Gm-Message-State: AG10YOR8ZZnvN4QIMgyeCG+gKoInM3naT/7VtqcfScoXeAeNMkQgnaKk+WkrED6K787hHCqiWJfjDjrV/eTapA==
MIME-Version: 1.0
X-Received: by 10.194.5.193 with SMTP id u1mr6616178wju.166.1453298949923;
	Wed, 20 Jan 2016 06:09:09 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Wed, 20 Jan 2016 06:09:09 -0800 (PST)
In-Reply-To: <CAAtXAHer2aQjARHBa=7KQNQzuYJsnThii=_GgRsOC5BiGB2PZw@mail.gmail.com>
References: <1452197854-12728-1-git-send-email-moritz.fischer@ettus.com>
	<CAAtXAHer2aQjARHBa=7KQNQzuYJsnThii=_GgRsOC5BiGB2PZw@mail.gmail.com>
Date: Wed, 20 Jan 2016 15:09:09 +0100
Message-ID: <CA+chaQfrChmeq+xc3trxXhPxPw9ZWa2J0n0kAwXWsuvvfVsFNg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] gpsd: Add patch to fix broken ACTIVATE hook.
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
X-List-Received-Date: Wed, 20 Jan 2016 14:09:10 -0000
Content-Type: text/plain; charset=UTF-8

It's in master-next waiting for next round of jenkins builds to finish, no
need to resend.

On Wed, Jan 20, 2016 at 2:56 PM, Moritz Fischer <moritz.fischer@ettus.com>
wrote:

> Hi Martin,
>
> do you want me to resend, is something still missing in v2?
>
> Cheers,
>
> Moritz
>

