Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6DB6D838
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 09:49:18 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id ev20so132585lab.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rNjkbqHPFPw2QB4E30IFfBdf0ltG9ilA0kWNful0R9g=;
	b=CHBPdNtTjMjM6LA9pgkEI5g7zWN6lzBEpNa9eUhMC4YFlROpehzY10jTeAwABjVbQL
	TXtZYvvwEOTCeu0Wks+0FO2HHV5Xb495326t5zZsX/zkaOuOfhVgbIojEuAHi+VmmJwd
	RrFMwHX0XJ/7nAaCcoBw/5fmeBUH5rAH4hcGl6+W8oJ/aqaXoox73bvneLspaWrlrpWz
	tzGAmyuxVNU3EAxqUm2fN0ekY8FxBQD86ZJTzCfQfb9X+rzuIW//aRIRmBOWXRGvS5Ag
	JGkyh+VK8Y0nQtifHDiDWYcSHsiC/pww5//Gh4sVoulr2byUgcElixixajob4M3mhcSF
	PQnA==
MIME-Version: 1.0
X-Received: by 10.112.73.3 with SMTP id h3mr13862047lbv.4.1384336158837; Wed,
	13 Nov 2013 01:49:18 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Wed, 13 Nov 2013 01:49:18 -0800 (PST)
In-Reply-To: <CALT56yO=e=o-ZJQqjFS=tYGjeX6YcgfRosTuxn_NnM7g1dHB4Q@mail.gmail.com>
References: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
	<CALT56yO=e=o-ZJQqjFS=tYGjeX6YcgfRosTuxn_NnM7g1dHB4Q@mail.gmail.com>
Date: Wed, 13 Nov 2013 10:49:18 +0100
Message-ID: <CAAQYJAurVuJ8oW67e9Y+JbMQBc4H1uccZPNJ1F6LLJZ3_=B1OQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-handheld][PATCH] linux-yocto: collie: add pcmcia clock fixes for sa11xx
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
X-List-Received-Date: Wed, 13 Nov 2013 09:49:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 13, 2013 at 12:31 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Hello,
>
> On Wed, Nov 13, 2013 at 1:41 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  .../linux/linux-yocto-3.10/collie/collie.scc       |   5 +-
>>  .../patches-sa1100/pcmcia-clock-alias-sa1111.patch |  31 +++++++
>>  .../pcmcia-sa1100-device-clock.patch               | 100 +++++++++++++++++++++
>>  .../pcmcia-sa1111-device-clock.patch               |  44 +++++++++
>
> I'd suggest to get only pcmcia-sa1100-device-clock.patch and drop two
> other patches.
> They are not of use for collie, since they are for devices with sa1111
> companion chip
>
> --
> With best wishes
> Dmitry

Good to know, 2 patches less!
Paul, do you prefer a v2 or a successive patch for cleaning?

Thanks

Andrea

