Return-Path: <will.newton@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id D544377CD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:20:32 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id h80so4153466lfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BfIFbstrigeX4STkt6tn75uL2f700MjgdIqdl6XgjwA=;
	b=h94L63GT/kpTokNXWhp0KxBjlFA/d/2pGvUq//CPp+K6C/8nWDL8kk1NRNTs7nNFO9
	V5kWWUpQqm+4IwQ/p2/mM4yupdNJF1ywi9PKqzPAsvvg7PhjC6hpTe6GAcrX1bzLLbDR
	qvsZpLBrezGUQW1h3Lc13YC8GR7aA46xnQifOYJFacX+QdsVxBlTENDt037753ge7uir
	AU4B771esopJ3KlNsy0VtrmBSgRlaeIazf6m5fZxNBgo1C5faegw8Azc17jzTfM+txgr
	CXhJJiWNVz6GWnbyyCgbVi5fTnzoxU96BUDhAQ8EhO8oGudTTKWN0JSVNgplCf0YHe4v
	377w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BfIFbstrigeX4STkt6tn75uL2f700MjgdIqdl6XgjwA=;
	b=YYzD2SXoPoQzo2acrwVv1G1wecXWEsiwRp9maYQpAoPjdoMj9arlJvYYuTi+EjD4zb
	KfzVgJcV3Rk8a2YIj0td+2PbyjvEC4fZ+uwAHXx2YcfDK0Te5LFkQtw9ZI125PA4H+2e
	DQJUSMmEIl0pscxz0sfj18a7VfqdGStnEliQIskMAUULDxcrw8I0hToEghhxTZKZbdyx
	T4Cz/XEwsOhXLHNofhJoIyQvXYfKiRMlrezIMYW6086OdggkNWMpC1vN5jK/MmkGOKzP
	tNOpko3Egteb9LAsVg2Bi+SH+5OoFpr0OGsa5yRT808cItYRWEE894cCTdxi4jRJ4wUQ
	itJA==
X-Gm-Message-State: AHPjjUhN0+rtSHW87n72+0FVrSgaqX+4GqV4dfW5GgB08lcszmAka7o7
	CZOIcgLq83Pb3UH0xMrSdQsH0sZ9PQ==
X-Google-Smtp-Source: ADKCNb5CBxKCdOIuX8uJ5Hbxwp8XrRRRlwdGCW0eS2VPYQnDhYHSAlvq+XBMepgk5W4PUdu2AGI8XRc4+T+HRZMxO9k=
X-Received: by 10.46.64.74 with SMTP id n71mr761007lja.59.1504776033385; Thu,
	07 Sep 2017 02:20:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.179.66.9 with HTTP; Thu, 7 Sep 2017 02:20:32 -0700 (PDT)
In-Reply-To: <CA+chaQc=8OV73nEFd2zhQ+7kGaEB0zAki5SJ9_342JmU0AgX4Q@mail.gmail.com>
References: <20170907091744.27071-1-willn@resin.io>
	<CA+chaQc=8OV73nEFd2zhQ+7kGaEB0zAki5SJ9_342JmU0AgX4Q@mail.gmail.com>
From: Will Newton <will.newton@gmail.com>
Date: Thu, 7 Sep 2017 10:20:32 +0100
Message-ID: <CAFbHwiQgzwPctvRJ5bDQKzjDGZx9XyvABU2Ldbew_OPNCELWmA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Will Newton <willn@resin.io>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 07 Sep 2017 09:20:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 7, 2017 at 10:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Wrong ML

I appreciate you taking the time to craft this response, but it isn't
very helpful to me.

> On Thu, Sep 7, 2017 at 11:17 AM, Will Newton <will.newton@gmail.com> wrote:
>>
>> The previous logic applied a regex to TUNE_FEATURES which could
>> set the GOARM value to 7 incorrectly, for example when dealing
>> with an arm1176 core. Simplify to check for the presence of
>> "armv7a" instead. At the same time add a check for "armv6" and
>> set GOARM to 6 in that case.
>>
>> Signed-off-by: Will Newton <willn@resin.io>
>> ---
>>  meta/classes/goarch.bbclass | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 4a5b2ec..35f2987 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>>
>>  def go_map_arm(a, f, d):
>>      import re
>> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
>> -        return '7'
>> +    if re.match('arm.*', a):
>> +        if 'armv7a' in f:
>> +            return '7'
>> +        elif 'armv6' in f:
>> +            return '6'
>>      return ''
>>
>>  def go_map_os(o, d):
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

