Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3A65473695
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 10:46:29 +0000 (UTC)
Received: by iody8 with SMTP id y8so40778616iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=1ip+iBq0DXd48k5r0tHlsK80GWXd5zXKW+XnIIKKTZE=;
	b=QcOpWmEROgI9IfOLlKKfASU7u5rSh1V1UsfDAxeM3svcMxwm/tdydvBXqKdPMSz+XR
	5S6QWGsyFZ1yRepdLBwPOQfWS2r1wjuNMyzu/KOzczX7f2G9/Gdma6nj8+LvnaaCOpUv
	00aNIsG07u9E+1cthNNFEGwnbd1014WD7xnyE2BjXHheCfiias0lLFUzyt5QjL8gu3Rv
	JpZkd1XxzK7o8Uq7UPpL03CSkOrQukSGPjAJS8rH44nqXFbRYm9l3Cun1BkYzaHLWTiA
	Hr+VzOQFKl477tww6QjEjmcaiGrAAhw2RtKYyz87H+glIcNXxCuJPo+JnDdUbv1F49kT
	f84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=1ip+iBq0DXd48k5r0tHlsK80GWXd5zXKW+XnIIKKTZE=;
	b=kZ0BaeyWixg60ml6C1B1w+bfL3Try/CyLr0QD+NH3TYPKtEU4Oj4yXJhK9Oqi21aph
	t9syskItnQdYptCwbvJ3X662r/quMByYPWMRnb/M1vNzNgQzK4vd7NfXlZu7BxGDLLcI
	fuLySQSBxRnucote9LZ82om+HqftzeJGA1Sh3goEqCLt4HwGmX/6tlUj5I0NR0idylMN
	9VOlCLYGuTct1gxy5B2VUMnGIPUKI4xag8v8feuwNQrOtTFA0xtNsn4mNjTD6ek7Jy0c
	hvMAVuegB6cORvfi2qUnQqlZSjNg7lxxsSTwmPq1wxotQs/llBzUJZQwPm3n5A8nmWxP
	mErQ==
X-Gm-Message-State: ALoCoQm5Cv5Ynu+5EmlFzm2UIxVTOJ1PNfw6DbHXocj5DH/cmuYI5rhlcyFICPycpPXQO1SLZnV6
X-Received: by 10.107.32.17 with SMTP id g17mr2987759iog.55.1446115589399;
	Thu, 29 Oct 2015 03:46:29 -0700 (PDT)
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com.
	[209.85.223.178])
	by smtp.gmail.com with ESMTPSA id r28sm847439ioe.6.2015.10.29.03.46.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 03:46:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioll68 with SMTP id l68so41134683iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 03:46:27 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.198 with SMTP id j189mr2429128ioe.37.1446115587889; 
	Thu, 29 Oct 2015 03:46:27 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 29 Oct 2015 03:46:27 -0700 (PDT)
In-Reply-To: <A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
Date: Thu, 29 Oct 2015 08:46:27 -0200
Message-ID: <CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 29 Oct 2015 10:46:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 7:22 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>> Am 29.10.2015 um 08:41 schrieb Richard Leitner <richard.leitner@skidata.com>:
>> To cite Otavio:
>> We could rename the patches directory for openjdk-7 and avoid the
>> version number on it. This would make easier for upgrades and to see
>> the diff between the patches.
>
> So git diff -M doesn't work for you? I don't understand the reasoning.

It does but reusing the directory easy the upgrade and as the
openjdk-8 is in maintenance it is expected that it does not change
much in the patches.

>>> create mode 100644 recipes-core/openjdk/openjdk-8-common.inc
>>> create mode 100644 recipes-core/openjdk/openjdk-8-cross.inc
>>> create mode 100644 recipes-core/openjdk/openjdk-8-native.inc
>>> create mode 100644 recipes-core/openjdk/openjdk-8-native_72b00.bb
>>> create mode 100644 recipes-core/openjdk/openjdk-8-release-72b00.inc
>>> create mode 100644 recipes-core/openjdk/openjdk-8_72b00.bb
>>> create mode 100644 recipes-core/openjdk/openjre-8_72b00.bb
>>
>> Furthermore I had problems building OpenJDK-7 with this patch applied.
>> But I will verify that again and come back to you!
>
> Yes, please :)
>
> I'm sorry that I cannot verify on own, because OpenJDK-7 still requires X11
> and I have no X11 available in my distro and not enough resources to create
> a playground for such things :(
>
> But with sane errors I'm happy to dig and fix.

Once we merge this, I would like to try to simplify the recipes a
little. Maybe avoiding the .inc files as much as possible as it makes
harder to follow the code and in fact we just support (and this should
not change) a single version for each openjdk major version.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

