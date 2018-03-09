Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id A929B78942
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 00:00:44 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id o8so7401754wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2018 16:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B85wG4ZdaF654P38Dg9+6rQgH0FBLomQQ8vH/BHw8WA=;
	b=oAUMf/6WneZG3y2P1GhyRXT7JtDavbUoqoP/lgdl6vgcz0lePKXtxMV+ecKF1a3Lcx
	BhWnDMv7AmYnAXiLZ0sVPhhzTZu/3JsVFhnWLCAQBcFNlEySsZjcMIbtr+hqpnGgktJN
	nBxRZNoYPBkzdRV18G8bgyMiSwza/vlvTtvmUK2rJdiGkA2TeAfwd6EM8NuT2GEXMTQB
	pUO2kZyAF/MB0DyCMVcVL2b0eWKtmgYixOKBYL7Jjq49mt6Et3QDiW+iruxknhePFIW4
	b3AyVkl6ncVd8wJkS2LsiVRJ1T+3r2iXSzpcmtwAC1M2vEsayK+LhFlt1Tn1og4fZNu5
	KcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B85wG4ZdaF654P38Dg9+6rQgH0FBLomQQ8vH/BHw8WA=;
	b=r5k0V/qaKKNV3Bn01Xp30vvA8boDTGHXQEwrNhNC3MaQ9u95T0Z2e9COHRjud5VCKD
	v/UxYAcrqiOGV2YrmyaKNW7KdP99tWOLUjW5yDr5euCBdFLuOEb08/qMHGCExrOtjwqK
	ZPe4PtBfPHeWgnJaNrq2NggUWN+JC81H+BUvXa9tbjAi/QYkz4paOubrqNCvn58rOZtS
	1JISKp76PzCzxYJoBSDF1j8NGag210nPe8QNCmfF/bZ8TVPsn2VGjMRug68J7XXWhr0d
	azITlDne223teMlIFsJMmKVt7NXLx6N2UtlBgXvJlolPU4H8O7fALJHghNYb0F/icFRC
	ivzA==
X-Gm-Message-State: APf1xPCmriWrkDgirFlFYZUsOHn4wTDyzhv0L/0bo/hWdVif/zeORNL2
	uxzTatWALPa1CRYOw9PFVtRAtIozQnEidurdxbs=
X-Google-Smtp-Source: AG47ELs8DdyY9IhfoI8Y1aIvsdNpXgnXNRPN8b/mRIIS/TwoLSd+AzcI5Si0liOCDtT15xsC9VKL+eprmtq4osxETaQ=
X-Received: by 10.223.161.10 with SMTP id o10mr25589296wro.60.1520553645622;
	Thu, 08 Mar 2018 16:00:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Thu, 8 Mar 2018 16:00:44 -0800 (PST)
In-Reply-To: <CAMKF1srssLFbR5RzJjpg2R7xPAjLa8B7i50eyp+pbFujKtJ_OA@mail.gmail.com>
References: <20180308174316.36662-1-raj.khem@gmail.com>
	<CAJ86T=WNtG1GCk4AkR5Ysd6jTZYWeUKabbR724fouKueOjoXcQ@mail.gmail.com>
	<CAMKF1srssLFbR5RzJjpg2R7xPAjLa8B7i50eyp+pbFujKtJ_OA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 8 Mar 2018 16:00:44 -0800
Message-ID: <CAJ86T=X8QpVvOTmUG2XEgYm75V3YvYa8ENN7Njc2S1meT2Uxew@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Pass -DMESA_EGL_NO_X11_HEADERS=1 when x is disabled
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
X-List-Received-Date: Fri, 09 Mar 2018 00:00:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 8, 2018 at 3:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 8, 2018 at 2:07 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, Mar 8, 2018 at 9:43 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Some graphics drives e.g. mali/mesa depend on this define
>> > to use proper guards in eglplatform.h
>>
>> Would it be better to patch the header directly rather than try to
>> arrange that every application which uses it defines the correct
>> CFLAGS?
>
> It would mean to change all of driver sdk for Mali variants and also Mesa

So there are more recipes providing eglplatform.h than using it?

OK...

