Return-Path: <marek.belisko@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2DD77FD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 20:44:33 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id m18so90148652lfj.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 13:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qfA7zoGtLOkCMpIoepMrdeOFkRxjWbpuki5SlSn/sc0=;
	b=VJodHrcd+yNEapxOf7vKYoLPlZbYP9xkYWY+er/4XlcQdz5AAnrVSUS/X3k+HOejk0
	dCUxBMscIPCdILEyGMheMfseA2lB1zEJQqctp9fEH1Sjla/oUlVDaw7VSYEBUZgCReEK
	mTix+KmWr7CL+WLsRRNV+aI1+qrbhmCkIAj4HsjpeYFvTcsyToPNUmNUUBxf9ArALYkc
	PG0nOzkGUgpM0TnceC1+bRd5LBEHDewyoDMJYTpP8nw/K02BlJRDtEmNpJn8utI+xPl0
	7HP3P40hZYqTzYaGIqKlrPovgVdLOlem3i7x7ioyEellw+dXFNVLCr7yaV72Ai+/1L/P
	WNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qfA7zoGtLOkCMpIoepMrdeOFkRxjWbpuki5SlSn/sc0=;
	b=XwMY1AHJT6pkvvBhQ7USTlm53yiiXIEoRG0lnPEntoP+vSgj0oKst06938gujDR/KR
	oKzrx/30NL+z5GsnMiM4aQwz3Fiscl0EXeKo/GuJb5lyt79TUe3364/wBMhbwYP77aC/
	3bcMJIP4LHlMGqX2yLrbbhgqqgC9LwIZ2BkIAnzK5nenPYZOC/KuzfTLzv1c+B4VDagm
	BFkVKB8QwO1VRusyHsZBRGKPQ91RCIZnyvh3pyZbXKPEAn0PHWdHOMT45IFnDHZH4+xu
	M+A5QKIQtr9HfwWwQtrL1az1zsXfx7vXq8OOjyKiDe5HNPtzASp3OMh0usLgPcOidGpp
	yW2w==
X-Gm-Message-State: AODbwcAhAWrbZigmSW+Bzg+qyhUwd5FVIYWQwRN74SE0/sNMweMfnsrP
	qIgkJTvnqO/cNiWc7AfhrsKebtn9mA==
X-Received: by 10.25.196.207 with SMTP id u198mr11732664lff.20.1495745074652; 
	Thu, 25 May 2017 13:44:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.141.202 with HTTP; Thu, 25 May 2017 13:44:33 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1705251637150.5533@localhost.localdomain>
References: <alpine.LFD.2.20.1705250847490.19265@localhost.localdomain>
	<CAAfyv3517VgOHsPWRRHs2vdTr3hBt-dp+u=UGmwHZ+jdNh3sMw@mail.gmail.com>
	<alpine.LFD.2.20.1705251637150.5533@localhost.localdomain>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 25 May 2017 22:44:33 +0200
Message-ID: <CAAfyv34V=J2dHaF35QUFASGP=-QWS8V8zj_Oe4cv7CKWpx6SZw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: is there a reason meta-openembedded/meta contains a lonely libgpiod.bb recipe?
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
X-List-Received-Date: Thu, 25 May 2017 20:44:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Robert,

On Thu, May 25, 2017 at 10:38 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> On Thu, 25 May 2017, Belisko Marek wrote:
>
>> On Thu, May 25, 2017 at 9:10 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>> >
>> >   is there some rationale for libgpiod.bb to be the lone recipe
>> > under meta-openembedded/meta? would that recipe not fit into some
>> > other layer?
>
>> I posted few days ago recipe for libgpiod. Please look at:
>> http://lists.openembedded.org/pipermail/openembedded-devel/2017-May/112810.html
>
>   but that doesn't really answer the question as to why that recipe
> went into meta-openembedded/meta and not meta-openembedded/meta-oe.
> even the subject refers to "meta-oe", so why was that recipe placed in
> a directory named "meta"? was that perhaps a typo?
Yes probably type. First version of patch was placed in meta-oe. My
bad. I'll fix that but didn't get any feedback on patch yet. Thanks.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================

BR,

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

