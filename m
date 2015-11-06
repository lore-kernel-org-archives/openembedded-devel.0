Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2D53776104
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 19:58:46 +0000 (UTC)
Received: by ioll68 with SMTP id l68so134413423iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 11:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=i7E9MrJWQeWqnhwIMr2vLG+MLkpEXZSVkhI2ZtWSogc=;
	b=SEEeynIG89btzsrd1xgPbXpx3XQQSmPmgaBZ2Pf7amBBS5dROBT1CCubTBooPN9XLu
	QllWdWF2DbFQN7Dz/X7V9SEsU/yI1q6vqzL8rA3zq6Sz7/CsRat4+qvtci3AnJd1Tn30
	t7y0hjWwF8zgNm60qN1wySBQiSQ7lgzwC2+J0tcPzB270uTnFuzMxTUHMO8cNZUi6Q2N
	Hr3zH9j6fDH8CHt9g41RghskyLlE+3z0v2dKM+rROP9AQ47yR/I72yLhH77oNlBW7ttK
	saUo8qfp33Ajw1sZa1kedWR0MlTh4P3uuw4aVTJ1jqnHGX/2Bh4vlUUQz6Ftym7cpaKa
	EAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=i7E9MrJWQeWqnhwIMr2vLG+MLkpEXZSVkhI2ZtWSogc=;
	b=B6SOBk5ymCHE9klPylI8I33Juirbsdv+IyD0S81nicYKlJb7a9UbYDzhraaE6mRLwz
	BgMapoc21R2AQsaC7z45IlSPXYZAl03JtYrAKhtEUipNyA8AS0bQhshIXXiYcRlVMfFF
	EfR0h7QqhMlNVcyevhLEmkdW/WJtIWIa5MA03qJjw//XA36sxfdj4pJVkg6WMFrfs6D5
	wdjCei2bi/jXj69nQJKCqwESzWrgKX+IYQVRlfRIRk5MKrtgYhKtPUXvkuMkY/mFA7z6
	bvdFc1nf7Ji/u8ECgJ0k1gX4a7GGRx8RiURw6fzDXCR/EEzctIsmW+YmBvHOoqA03iKK
	eMAw==
X-Gm-Message-State: ALoCoQmZ9n9Wu8T8mg12R5qRy9w8libdr+eeV1iUayPIcLi5jFnFnM44DNvV+JuNBGPHc55cgoP+
X-Received: by 10.107.15.17 with SMTP id x17mr16811851ioi.196.1446839926689;
	Fri, 06 Nov 2015 11:58:46 -0800 (PST)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175])
	by smtp.gmail.com with ESMTPSA id ks1sm227048igb.2.2015.11.06.11.58.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 11:58:45 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd200 with SMTP id d200so133089225iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 11:58:45 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.160.198 with SMTP id j189mr8999202ioe.37.1446839925007; 
	Fri, 06 Nov 2015 11:58:45 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Fri, 6 Nov 2015 11:58:44 -0800 (PST)
In-Reply-To: <1446839474.2527.7.camel@Saturn.local.all>
References: <1446673803-2310-1-git-send-email-max.oss.09@gmail.com>
	<1E07998C-81FF-476F-A066-63266FFDDC1B@gmail.com>
	<CAAzKXnh3cJ7cLT4a48NUs7L0B-dYAfav3ckvwMds8aT=3PN+Gw@mail.gmail.com>
	<CAEHkU3WR6yyGb80CGF9vFBVaYnzOJy8fih6zU5zf755pL7bvNg@mail.gmail.com>
	<20151106171738.GF2550@jama>
	<1446839474.2527.7.camel@Saturn.local.all>
Date: Fri, 6 Nov 2015 17:58:44 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqR8SHDGvqUs4v82mTpPbFSSm_wd_mvE5H9QiCg23ScpA@mail.gmail.com>
Message-ID: <CAP9ODKqR8SHDGvqUs4v82mTpPbFSSm_wd_mvE5H9QiCg23ScpA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: fix gcc5 compile issues
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
X-List-Received-Date: Fri, 06 Nov 2015 19:58:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 6, 2015 at 5:51 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Hi
> Am Freitag, den 06.11.2015, 18:17 +0100 schrieb Martin Jansa:
>
>> After long time first successful chromium build in bitbake world..
>> Thanks!
>>
>> Can you apply the same fix for cef3 recipes?
>> http://errors.yoctoproject.org/Errors/Details/21442/
>>
>> cef3 for qemux86-64 doesn't even configure:
>> http://errors.yoctoproject.org/Errors/Details/21501/
>>
> I'll try to fix this.
>
> It looks like this never worked for x86-64 because of a missing config
> file.
> One probably can reuse the i568 one.
>
> There seem to be additional errors to the one fixed with the packages.
> So
> maybe I won't be able to fix it.

Send a complete patchset and we apply them all ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

