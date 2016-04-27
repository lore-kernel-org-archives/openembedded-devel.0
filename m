Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFA7731DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 08:02:30 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id u185so45535228iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xzY107jOBTLu9LSJhH41o1pUGJuuyJozMAbT+OT/Jo4=;
	b=wpzQDB7KDjLicsSEDCPULhYN6dLGevMl67xPdHICD1EIJOrCPaLt/Xw8BiU2QIptsw
	35KD1B25ogH+MWU5pykEFfWOAJFM3mpmncZqUPenLOqlWC88vFnozVN+h2vPjFlW8sO3
	QixCcJlC02woh4oLGclnAsEWWuA6lkh6N6gv9Fel1oxdpljPu0aOjlArqhugMqmKsNg8
	+o9xG3Yatu05f6uz6J38mt65fuLj0XJL3avotvqZsOIskxAB4rquhyxM/rDyWnsioOXT
	rLD1mxJvGWqzuGoeIpvgno0VEeXZHwFgfvcEkWb72uF/fKYIAhYtg9wpXYsVYX7w50Rb
	XV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xzY107jOBTLu9LSJhH41o1pUGJuuyJozMAbT+OT/Jo4=;
	b=e4tMLa2a2taw6xSNAcTFh2lruTwyOluM7II1B6hd0WA7oohCCVW/GVqm/ooYNnwfi5
	B8KJB7lJqOqBKlgIi4GeVxKof90kZoksZqeiINMQ1VlZ7C1BJ/QMPAVJRoh9QnIilDqJ
	To1c1S5LrYNpu01hCfQeQFQw71om8moGi0qMW2bXitnj9ELEBPnTAHhQKA0MXilmdMu4
	9Y2IN0C/OQgWlLCKhnu13zEM0aldak7Mt5wgcva1QDE5fKv8k9Ar7MvXymZfW/aVQH/9
	GLgD7G8QoNZSs5MVrz++r1h90q6dpimM70Cz3QmR+fplVpYXmcNSg+B/dU02WV6Wda3l
	Azew==
X-Gm-Message-State: AOPr4FViCPRzKKD9qJ6cLdF2T2F+pZ1XuE2I4ggnKdfjeSZI0X9uk8j30O15RqC9PSKWg/y8fdtwt/gYjiCP9Y6E
X-Received: by 10.107.179.136 with SMTP id c130mr8274655iof.99.1461744151369; 
	Wed, 27 Apr 2016 01:02:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 27 Apr 2016 01:02:11 -0700 (PDT)
In-Reply-To: <CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Apr 2016 09:02:11 +0100
Message-ID: <CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Wed, 27 Apr 2016 08:02:32 -0000
Content-Type: text/plain; charset=UTF-8

On 21 April 2016 at 04:06, Khem Raj <raj.khem@gmail.com> wrote:

> I have updated
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-6
>
> With few more patches added now. Most of packages in OE-Core are
> building fine except linux-yocto on mips and ppc
>

I threw this at the autobuilder.  Lots of c++ failures on various
architectures.

https://autobuilder.yoctoproject.org/main/tgrid, the row for SHA 91ef.

Ross

