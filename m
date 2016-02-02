Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 91B3D74197
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 20:04:08 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id cy9so104474125pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2016 12:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=E94hFEcGOcJwzIZAgKXjeiWxZ/5Rtdzd6DWIC/Ma/Uo=;
	b=uy3Wvd/ACunruVRh9rhpP715Xp8ghlc7LGjRfQMQxRMIYn3rr27LNNssBG3g7W+Jek
	1MdkOadNS5zCKO6V+ZmyIUxeKVBdXXhVcLsSZi+zmv/7o+hlgZnxSaNEPrvSEwE41Dfj
	TO2VOXzTc8izwa5o6FRybM/tIi8o+h+NSidLhP1FWk/dowL3BgHELBpvnGq2AWsTOUhp
	BVwIPJG2/Vml5NSJTsWbQb405BMDmARh/bsoyHPwyyW2e6Pffam7JHvl8i10NI9VoCnY
	I2qz8EuO1wq77mT//2ucSXcGDlvYBl3JWKMuw/mOXPWyOvIieHj6KY6N7NT3DssRoaTR
	dDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=E94hFEcGOcJwzIZAgKXjeiWxZ/5Rtdzd6DWIC/Ma/Uo=;
	b=DdbhV3+X40Ukwogl3ER9NNJZajvJ9MqESLfghSPxRp1oSpiOUh5gPfjT4Xh7Z3YnJ4
	oAnHfoIHEtwC/1zlt72SOBGDFzW/PKD7MVrriMNb4cpaUkShFLrd6zBPR8Dk6E/eatOO
	Pb0UWHcW86un2YIGHZHubm9DcVfbDJjx5ZKI5ofYDP2LWa286BnnB6+R0pTKcxqTOF82
	445nFrpr05ny1KqXXKTU8hMiIAefEGKaXYkvX2rviRZIlePxqeu/8sJKZs8ax4dGfogK
	tmDwiWAOwXXA181WvG2NH5Nqx7MZZwIPjsACxirO/WR6U/C30OxOvEkSHkHQibaqAXKe
	PkvA==
X-Gm-Message-State: AG10YOQUAoEYwvpyit6mN9E9+5f3c4wgPyHAgtQEYDD5vwLDAgN/LPVlCmDSSCV38ejlNA==
X-Received: by 10.66.62.195 with SMTP id a3mr50586289pas.8.1454443448620;
	Tue, 02 Feb 2016 12:04:08 -0800 (PST)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54])
	by smtp.gmail.com with ESMTPSA id l62sm4615929pfj.7.2016.02.02.12.04.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Feb 2016 12:04:06 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f54.google.com with SMTP id uo6so106260455pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2016 12:04:06 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.227.73 with SMTP id ry9mr49906680pac.120.1454443446423;
	Tue, 02 Feb 2016 12:04:06 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 2 Feb 2016 12:04:06 -0800 (PST)
In-Reply-To: <56B07AD3.2080608@theqtcompany.com>
References: <1453906715-6881-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKopO2VAkJV_7-X0YpEaZfUSFLGxhHFvsqeXrUvAEWaPsA@mail.gmail.com>
	<56AF3715.3010402@theqtcompany.com>
	<CAP9ODKqVJez0K=6rGfAK3OUgqdSEO4PmzVhFjnjG94WMuhvXsA@mail.gmail.com>
	<56B07AD3.2080608@theqtcompany.com>
Date: Tue, 2 Feb 2016 18:04:06 -0200
X-Gmail-Original-Message-ID: <CAP9ODKreOfhmOGwmjVr7qWSu5F7uKmcX9SqWS4RmO0G3EnwEnA@mail.gmail.com>
Message-ID: <CAP9ODKreOfhmOGwmjVr7qWSu5F7uKmcX9SqWS4RmO0G3EnwEnA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: Re: [meta-qt5][PATCH] qtwebengine: build examples by default
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
X-List-Received-Date: Tue, 02 Feb 2016 20:04:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 2, 2016 at 7:45 AM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> On 01.02.2016 13:14, Otavio Salvador wrote:
>>
>> On Mon, Feb 1, 2016 at 8:44 AM, Samuli Piippo
>> <samuli.piippo@theqtcompany.com> wrote:
>>>
>>> On 30.01.2016 16:13, Otavio Salvador wrote:
>>>>
>>>>
>>>> On Wed, Jan 27, 2016 at 12:58 PM, Manuel Bachmann
>>>> <manuel.bachmann@iot.bzh> wrote:
>>>>>
>>>>>
>>>>> From: Manuel Bachmann <mbc@iot.bzh>
>>>>>
>>>>> Just as we do for qtwebkit, let us have a patch to build
>>>>> qtwebengine examples by default.
>>>>>
>>>>> Otherwise, the "qtwebengine-examples" package will be
>>>>> empty, and attempting to add it with "IMAGE_INSTALL_append"
>>>>> will result in an error message.
>>>>>
>>>>> Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
>>>>
>>>>
>>>>
>>>> This should be a distro option and not enabled for everyone.
>>>>
>>>
>>> Also there is no need to do this with a patch, same result is achieved
>>> with:
>>>
>>> EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=examples"
>>>
>>> Maybe this could be added to qt5.inc as a PACKAGECONFIG option?
>>> This would allow easily enable examples on any qt module.
>>
>>
>> It is:
>>
>>
>> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase_git.bb#L67
>>
>
> Enabling the PACKAGECONFIG[examples] from qtbase means that every qt module
> will build their examples.
> If added to qt5.inc, it would build examples only from a qt module you
> bbappend with PACKAGECONFIG += examples.

Agreed; I support this approach if you are willing to send a patch;
otherwise  I can do it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

