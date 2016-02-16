Return-Path: <samuli.piippo@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7C160797
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 14:13:38 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g62so109512451wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 06:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=HTyReXS7ZNx7cQjv8JmV3wYw+IpXgR+VzhgFQhQUM2k=;
	b=e2vlLpPihOQAHDRXjRgS1z3wjbSyFQwwESo4pHhezo5VYJbkhLs7beDs0b3Y+DymSp
	DCgejjBGVUo50MW3aGbQ3upBXIhTtnWb/LB4bO60KvwQGNwB/+t1V225qtY/UXMIa2G3
	fgx9Xhr3AJLYeAkHVasVNyFSU03P2xXihmREFWTbFJ5PuP9S0iJKBrIiZRoq8Kk2jbiM
	Vl6jJSxIDvqzjwJAZNjFgt8cS/FKU0tqrusIlFBVRu0xl41cwOKm82xK92IFxOGdDwxc
	J1eg/WL/CNn3oPVWRi4jvZJWyWeRWbuMf8WSPfzbHjSaEiLbxBVqhptD3bo+zjmyNUjH
	e/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=HTyReXS7ZNx7cQjv8JmV3wYw+IpXgR+VzhgFQhQUM2k=;
	b=k1VzYJTJrrdU/zzzl008jyUv7+kwSHHUWhzqejNOMgSQACAsEmtNm5nzl2X/IPXhq/
	d/EPWvghcjoW617/zve/DbYS0I3jXnUHxemANhcwLoT4/PkOvg6LA2j3LSE8EFLn6A3j
	ml1hbqkm6AhBr3GbDPt8XR1HG3BoxVI2bb0fiCJFLW9kDGD4/7qIoFXuQ4QwwLbu3mA0
	TncXAy7xoCxBABLE6RMJ7B+SWofMEhiKM9DzENL535X2Y29zmMs3/50aDCkZMJWlHc0y
	GgR+Ic00p1IEJE3bADOVyJt97oNnZLVzpOhCDA8fHTZtg//02yr83NDovxiMkc3rpOIh
	F+1g==
X-Gm-Message-State: AG10YORQUqMTPaKZOWVMlQh3QlK0yly/upikWhkrHGvMHI8+q9WO4W7yfwR/slHgbMNugA==
X-Received: by 10.194.77.193 with SMTP id u1mr22454088wjw.73.1455632019197;
	Tue, 16 Feb 2016 06:13:39 -0800 (PST)
Received: from [10.9.5.47] ([91.217.248.11])
	by smtp.googlemail.com with ESMTPSA id
	jo6sm30472184wjb.48.2016.02.16.06.13.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Feb 2016 06:13:38 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1455467128-4533-1-git-send-email-samuli.piippo@theqtcompany.com>
	<CAP9ODKrU=fgJ_ooz4_oOpMWRxw+e_UHLc9VrNy3ne=wWdS3Msw@mail.gmail.com>
	<56C2E83A.6080908@theqtcompany.com>
	<CAP9ODKqw8CKiXfdkbpXXonKO52ap8Cw9u2zsd_+x=57s0_CAWg@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56C32EA7.20501@gmail.com>
Date: Tue, 16 Feb 2016 16:13:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqw8CKiXfdkbpXXonKO52ap8Cw9u2zsd_+x=57s0_CAWg@mail.gmail.com>
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase: use runtime linked dbus
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
X-List-Received-Date: Tue, 16 Feb 2016 14:13:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 16.02.2016 13:38, Otavio Salvador wrote:
> On Tue, Feb 16, 2016 at 7:13 AM, Samuli Piippo
> <samuli.piippo@theqtcompany.com> wrote:
>> On 16.02.2016 00:34, Otavio Salvador wrote:
>>>
>>> On Sun, Feb 14, 2016 at 2:25 PM, Samuli Piippo
>>> <samuli.piippo@theqtcompany.com> wrote:
>>>>
>>>> Remove direct dependency to nativesdk-dbus. Instead configure
>>>> qtbase to use runtime linked dbus library, if that is found.
>>>>
>>>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>>>
>>>
>>> Why? This puts a dependency on the host operating system version.
>>>
>>> Am I missing something?
>>>
>>
>> Currently nativesdk-qtbase does not package libQt5DBus.so, so there nothing
>> in the SDK that actual uses dbus, but it's still built as a dependency.
>> If "qt5: add Qml support to lupdate" patch is merged, then nativesdk-dbus
>> would be pulled into SDK as well, although I think it's still unlikely that
>> anyone would need it. If there is really need for it, then you can always
>> add nativesdk-dbus to your toolchain.
>
> So why not remove libQt5Dbus.so at all, from the nativesdk?
>

Point I'm trying make is, let's not depend on and build nativesdk-dbus 
if we don't need it.
On nativesdk-qtbase, we want to enable dbus, because that gives us also 
Qt dbus tools (which don't need libdbus).

