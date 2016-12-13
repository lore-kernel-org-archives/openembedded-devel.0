Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B02646E688
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 03:55:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e9so3039639pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 19:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=QfL9MIz3A+1LErsQmjoDhw/LQAMM07fyFCAFDidp2Wc=;
	b=zhTqx3j2CrDhw5dTYTiAhd5C0dbbnR1eg3K2mZoOhHMccVsWu203PrNigenw9mn4v2
	edDEHkwNw3b3VXo7N8c/WTMAjd+edyAv4CrZuhPdE65qcUYLQm+neNXDFDuxqtDNBDIO
	beYBm2JCXY+KA6q5HvxWy2I7aoyI3c1go/qDENj/HRVgTAi3c2OuGiGgi7YQguyXA5LX
	EEO7XgFFgKL8klvp43+oMb87CdIIgCr1JxDFfc2AYyWJkg81WIV5hGJzbYdZmy4F/NuR
	AbPcWueRgcw3nmizlvC4x42fmH8lKAfNAelVSB79bedExa5GNe4ifDhTfRZsDUSeYmyJ
	kqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=QfL9MIz3A+1LErsQmjoDhw/LQAMM07fyFCAFDidp2Wc=;
	b=RF9kIk7q4poPdpL4SfQrgTocSsgMgbumLAj/+UTPmdgqsiqbKVpCdk1XSZ3ygdDjFi
	lcc86nr6q1SK1+qWbm3a7KAdawxPD3pWneFRjB+jteUBTbjYtskrIf439H2dXqIytTWR
	W7mwDY5v/Akqb5oO58CfgbJ2wXxLKSs6vOT6Aiu6nuZtGW5mCPIkUh60T1gfU7hR8Xp4
	qgdeaNOXEIAZp9nRhoFxLlp4HUlDbmDde/tl87MFP/txNfMhseQJ4gOd2L+m2TQU25Ig
	rdb5W+dJsX7K7wooNOeHWfe2pfJT+VRTmWGYaJwzPrzIFfuKG7y8wFEOXfsA6r7I0vti
	K57A==
X-Gm-Message-State: AKaTC034fZojhbei+PbM3uWF1lv9yIS23u5KPJvljr2mILK4gw4lSJ+1PpyiOjLDToi9TQ==
X-Received: by 10.99.175.69 with SMTP id s5mr172560796pgo.6.1481601341856;
	Mon, 12 Dec 2016 19:55:41 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	r21sm78429340pfd.44.2016.12.12.19.55.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Dec 2016 19:55:41 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>
References: <1477587755-24666-1-git-send-email-denis@denix.org>
	<271f87f6-ac90-2389-3499-9c3bb8d80fa6@gmail.com>
	<20161114190940.GB22657@denix.org> <20161117035859.GB26131@denix.org>
	<af58f301-6a21-6f9b-3c87-26fa8d44935b@gmail.com>
	<20161207174015.GC30576@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8248cf6d-4dd5-debc-78fc-47987411b660@gmail.com>
Date: Mon, 12 Dec 2016 19:55:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161207174015.GC30576@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][krogoth][PATCH] syslog-ng: expand service file @variables@ earlier
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
X-List-Received-Date: Tue, 13 Dec 2016 03:55:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Denys,



On 12/07/2016 09:40 AM, Denys Dmytriyenko wrote:
> On Fri, Nov 18, 2016 at 07:25:48AM -0800, akuster808 wrote:
>>
>> On 11/16/2016 07:58 PM, Denys Dmytriyenko wrote:
>>> On Mon, Nov 14, 2016 at 02:09:40PM -0500, Denys Dmytriyenko wrote:
>>>> On Thu, Nov 03, 2016 at 08:20:53AM -0700, akuster808 wrote:
>>>>> On 10/27/2016 10:02 AM, Denys Dmytriyenko wrote:
>>>>>> From: Ian Ray <ian.ray@ge.com>
>>>>>>
>>>>>> Move variable expansion of @SBINDIR@, @LOCALSTATEDIR@, and @BASEBINDIR@
>>>>>> earlier during install, to before the systemd service file is installed
>>>>>> by an automake rule.
>>>>>>
>>>>>> Signed-off-by: Ian Ray <ian.ray@ge.com>
>>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>>> merged to staging.
>>>> Armin,
>>>>
>>>> Any updates on this? Also, I don't see it in krogoth-next - what staging you
>>>> are referring to?
>>> Ping again, this time copy Armin directly.
>> oops, Had it sitting on my system forgot to push to contrib. Pull
>> request sent.
> Armin,
>
> Thanks, this hasn't been merged yet, it appears... Any ETA?

is this the commit you are looking for?
http://cgit.openembedded.org/meta-openembedded/commit/?h=krogoth&id=5882ba7f378acc75385e8a3ab00a6bdbc7a0ef93

- armin

>


