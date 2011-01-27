Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PiNL2-00077O-Ea
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 09:36:20 +0100
Received: by iyj18 with SMTP id 18so1295287iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 00:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=bB3BxDeRn8ZzlUZ7J0BVkRl3gRRQtStJwhsvHDjYMB4=;
	b=WR7J6Zzq9ew9wkGk6e+J5HzgtscJnNoG4gudK/FNlMoD0lNWMSac1GIUhBArCNVA+8
	JXEt2lpSRomxBzGzGvlzfysBLdgfs8Y5eR5X13zRjHPSbGfGPNck7okVDuKGCmms/prk
	khSdVtiSyeEyee7KU/XeJQDcWEs3t6Cs/wHXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xL2nOSXeja/PA4Gs59WrsBUpx1WhrHrNxD6BWwyfz8WwgvZ6y58RXRuHZrd8G5tyBV
	mUmQt94vEvnM1kEBZP/MtRwG3XZfQuWih8XVAQrInhRqRqntPZwuiNAJq/YjUZAcv+GJ
	SbUzq8BuYYTIDjJoti6fRnJV0s59DMIVrJFVg=
MIME-Version: 1.0
Received: by 10.231.13.203 with SMTP id d11mr589989iba.33.1296117307340; Thu,
	27 Jan 2011 00:35:07 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Thu, 27 Jan 2011 00:35:07 -0800 (PST)
In-Reply-To: <20110127081833.GJ3616@jama>
References: <AANLkTinEdQ4zqc4vPZpRAh0LebKQJbrAjOmfWZY0HUYd@mail.gmail.com>
	<20110127081833.GJ3616@jama>
Date: Thu, 27 Jan 2011 09:35:07 +0100
Message-ID: <AANLkTimp5U2puaTSZFYU+rMX8tkocpjK9f5smB8qrqwU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: staging_packager failing, anyone any idea
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jan 2011 08:36:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/27 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Jan 26, 2011 at 10:48:54AM +0100, Frans Meulenbroeks wrote:
>> Kicked off a build on our autobuilder (git head, minimal, 64bit ubuntu
>> host) and I get the following error (and similar ones at other
>> places).
>> At least some of the failing recipes did build for me yesterday at
>> home (32 bit opensuse host)
>>
>> NOTE: package pixman-0.21.4-r5.0: task do_package_stage: Started
>> ERROR: Logfile of failure stored in: /dev/null
>> Log data follows:
>> NOTE: package pixman-0.21.4-r5.0: task staging_packager: Failed
>> ERROR: Function 'staging_packager' failed (see /dev/null for further
>> information)
>> ERROR: Task 7024
>> (/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/xorg-lib/pixman_0.21.4.bb,
>> do_package_stage) failed with exit code '1'
>>
>> Anyone an idea on what is wrong?
>
> rebuilding stagemanager-native helped here
>

Thanks for the suggestion.

Meanwhile I've added kergot's patches (just before they were pushed)
and that also resolves the problem.

Best regards, Frans


