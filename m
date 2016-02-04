Return-Path: <asselsm@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 83B0677302
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 16:51:56 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id p63so221050133wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 08:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=jZIymVeCEzmrNjEnTaRDgIp6+8SEijQBwkmc4lM91OI=;
	b=rdgSB2KGeOYaL2jFmLku31zd0pTx0ffiSCbLtSiUl2jbXu4mlkAyJCVQT0kigjWoUz
	q8GvlzqRb8Ka1dhafSK5NsJX++ni0j5wFp2NVlC0LsNZ8fcj2YgztqwyM3YiY3jYS9oV
	kKX9rw0/WH3s/sWJCVrzp5Cz16reA4a2exHrUQK4DvvYNnqYyAjC2lsa9Kp9sjgaVLpN
	RsdxB5QrC/dJPqloeHJeNkTG3GhmbkvbAiDegsLhEgBo4HAVwZi/fWVyYh4yqIEduUfm
	BnHaJdPYZA47RZ4go8lwLO4CTuDhQB7izFRR82+IUH2vyMLjipzAnBFyBZmfAT2B4MEE
	p5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=jZIymVeCEzmrNjEnTaRDgIp6+8SEijQBwkmc4lM91OI=;
	b=Ljhnz6NwZLatFum9ytfQGAmdvCp1ycZXbxoucEDujh3Hq3O8b6xkTZ2md8gVCnwlgu
	Pk7bcQ4iu4YOpXdt7RCwBpkyFWitMC94smgW8JAKuG1PWTCvQBAoPlv06wAIcz0ayFcH
	Eudwv1ZtmyTn3WZSzj/p8TX8IEJWJH0je5ND3fEZUB20sGkC9cNKzBm8hqWhFhZp3NpO
	56H3OremB2lUysnT0OpvBCdUHUIu7XqO8Fbotyp6VqjkXeO+X2Lz1ZDmgOM54ivqPZ3/
	b0bUtNx9H5JasVQN7ei2SZCft0GrAuiuj1b1/V0nOb024zGq476AoekcFGRbKItgaoJp
	AZww==
X-Gm-Message-State: AG10YOTJKFgeNdfzu9+ySdbPJ97ogt56Ut2AK9eQVF74p3fpxEU6qjrZ3cS9oqXObnnOQGoSQd036EdeAyri6Q==
MIME-Version: 1.0
X-Received: by 10.28.141.10 with SMTP id p10mr11078383wmd.83.1454604716868;
	Thu, 04 Feb 2016 08:51:56 -0800 (PST)
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.194.203.130 with HTTP; Thu, 4 Feb 2016 08:51:56 -0800 (PST)
In-Reply-To: <20160204160759.GA2573@jama>
References: <1454598513-29263-1-git-send-email-mark.asselstine@windriver.com>
	<20160204160759.GA2573@jama>
Date: Thu, 4 Feb 2016 11:51:56 -0500
X-Google-Sender-Auth: BtDa5IHQQ6ZWlcsJT6siNiBfbxI
Message-ID: <CAPuovE+N45VRb-3hOM9gJYAmKkx_6Yp3ayMNcHeV_v+X77VUCQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ntp: remove empty libexecdir to prevent potential QA issues
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
X-List-Received-Date: Thu, 04 Feb 2016 16:51:56 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 4, 2016 at 11:07 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Feb 04, 2016 at 10:08:33AM -0500, Mark Asselstine wrote:
>> Depending on the configuration used to build ntp it is possible to
>> have an empty libexecdir. This can cause QA issues. Add a test at the
>> end of install() to remove libexecdir if it is empty, thus avoiding
>> the possibility of QA issues, regardless of configuration.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>  meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
>> index f9f900e..cb09e77 100644
>> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
>> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
>> @@ -94,6 +94,9 @@ do_install_append() {
>>
>>      install -d ${D}${systemd_unitdir}/ntp-units.d
>>      install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
>> +
>> +    # Remove an empty libexecdir.
>> +    [ ! "$(ls -A ${D}${libexecdir})" ] && rm -r ${D}${libexecdir}
>
> Isn't this the same as:
>
> rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
>
> ?

It appears to be. rmdir is not a command I use often so I didn't look
to see if it was suitable for the job. Want me to resend with rmdir or
you care to make the swap prior to merging?

Mark


>
>>  }
>>
>>  PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

