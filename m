Return-Path: <marek.belisko@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 01FD36B677
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 19:29:54 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id l10so1301230oag.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 12:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=BdAaWLznmdqWgMlCjjPQkAbabKPrfZsFGGGAR/083Nk=;
	b=DGESweY69q4TiwD5T5aapp6dHDj/zDXyRZ7Xb+gUWvWp8p/savI2gOyZs/uRONC5Sd
	zyL9rrlhmNe03Sd1+KaF95LBSYF/xQee8hy5h92oV2NTkg5V55JwCScjoFhYmprIRv5R
	1EYGS1dmMclcJR7rzYvdeNV63+V4/BOeWUULFhbcvd9SMpXdretY3ba4vlKDaPPdle+U
	VoYFUmvMAwSoWiFcYWuBNVXw0PDeLxI1rKgkysO0lvmhdAOkcAuTpfV68ycbocZCO/q5
	VNb3pfELzbLp12Scl4A50pyeCHSpO2lKuXORmceMOmoUT0WhR9y3leouj9LWDYaYzuMp
	AZhg==
MIME-Version: 1.0
X-Received: by 10.60.179.84 with SMTP id de20mr12067863oec.40.1376594995609;
	Thu, 15 Aug 2013 12:29:55 -0700 (PDT)
Received: by 10.60.60.1 with HTTP; Thu, 15 Aug 2013 12:29:55 -0700 (PDT)
In-Reply-To: <20130815145213.GC17945@jama>
References: <CAAfyv35Cig9wH7tYx2b72_groQeqLeWO8jZdRrGmn+ZBonFaFg@mail.gmail.com>
	<CAAfyv379BfBtBff1yg4MDAVfYmSm2MuDi2UgO+JP2EQEgsWspg@mail.gmail.com>
	<20130815145213.GC17945@jama>
Date: Thu, 15 Aug 2013 21:29:55 +0200
Message-ID: <CAAfyv349y-S4+=miDs6aQLoqmcMKa=LLHqBTC4NsiusfFW-L4w@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][dylan] Problem with fetching qt5 sources
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
X-List-Received-Date: Thu, 15 Aug 2013 19:29:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu, Aug 15, 2013 at 4:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Aug 15, 2013 at 02:09:28PM +0200, Belisko Marek wrote:
>> Hi,
>>
>> I'm using meta-qt5 (dylan branch) but fetching qt5.0.2 sources failed.
>> Fix follows:
>
> yes it was changed again yesterday or few days ago, would you care to
> send proper git patch, so that I can pick it from patchwork instead of
> applying it manually from e-mail? Thanks
Done: http://lists.openembedded.org/pipermail/openembedded-devel/2013-August/091748.html
>
>> diff --git a/recipes-qt/qt5/qt5-5.0.2.inc b/recipes-qt/qt5/qt5-5.0.2.inc
>> index 0bf1404..c04b3a2 100644
>> --- a/recipes-qt/qt5/qt5-5.0.2.inc
>> +++ b/recipes-qt/qt5/qt5-5.0.2.inc
>> @@ -7,7 +7,7 @@ QT_VERSION ?= "${PV}"
>>  QT_VERSION_DIR ?= "${QT_VERSION}"
>>
>>  SRC_URI += " \
>> -    http://releases.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz
>> \
>> +    http://download.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz
>> \
>>  "
>>
>>  S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
>>
>>
>> Marek
>>
>> --
>> as simple and primitive as possible
>> -------------------------------------------------
>> Marek Belisko - OPEN-NANDRA
>> Freelance Developer
>>
>> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
>> Tel: +421 915 052 184
>> skype: marekwhite
>> twitter: #opennandra
>> web: http://open-nandra.com
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

