Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 34E936E87D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 19:05:56 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id n15so3630771lbi.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 11:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ehp50+SJrb+Cmxb3ucnDLrMTp0wKd/RxfVPvUIHsA9g=;
	b=N7AqhVDZus3Dfa7WuKlKfmR7mV+FkYX4Xt6eoHPy6qClCXiFv8a5/nmkJFWnoCwtIv
	ostsTvDwJ3+xxrRFQ+HwfO2qoHf2wDTbgPn3eTE15DxETg6Vz8J/zX+hG9i/O1I3zz22
	pyRe/MDJC4JZCc0OJqQiMLO2r1L3dv15qQjAPN1N6Hr9FwtObG58OLROZpVClSL5RUzs
	1RRokk0LAv5O1Ca4/EhO0nHhfdxT43kc+vRY8Z1CJ3cybrt+kLjrNK8JjZdRDpC6zXTS
	ER4qZMWPn/9Tmb2QuSaWE62C4YsFqZR90FeAk4jZVS4zkx41IeX8Cx9ZL/oIpD4tMTYE
	Ic7g==
MIME-Version: 1.0
X-Received: by 10.112.142.230 with SMTP id rz6mr8361929lbb.0.1391195156444;
	Fri, 31 Jan 2014 11:05:56 -0800 (PST)
Received: by 10.114.75.130 with HTTP; Fri, 31 Jan 2014 11:05:56 -0800 (PST)
In-Reply-To: <20140131172647.GE23583@axis.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
	<20140131172647.GE23583@axis.com>
Date: Fri, 31 Jan 2014 11:05:56 -0800
Message-ID: <CANx9H-BFw=B2zXXz3JAw+4Zb8=TfKrG02iv7B1T==UwmjRqsvQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-perl][PATCH 1/9] perl-module-metadata: add 1.000019
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
X-List-Received-Date: Fri, 31 Jan 2014 19:05:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Koen made a similar comment via private email. I am happy to follow the
Debian convention. I will resubmit the entire series.

Thank you for the input.

Regards,

Tim


On Fri, Jan 31, 2014 at 9:26 AM, Olof Johansson <olof.johansson@axis.com>wrote:

> On 14-01-31 16:11 +0100, Tim Orling wrote:
> > This module provides a standard way to gather metadata about a
> > .pm file through (mostly) static analysis and (some) code
> > execution. When determining the version of a module, the
> > $VERSION assignment is "eval"ed, as is traditional in the CPAN
> > toolchain.
>
> For me, it seems strange to skip out the first part of the module
> name, just because it's part of the recipe perl-module- prefix. I
> agree it's a bit ugly to call it perl-module-module-metadata, but
> I think it would cause less confusion.
>
> On the other hand, the naming convention within meta-perl seems
> to be consistently lib<module name>-perl, like it is in Debian.
> Same for oecore, except the core modules provided by the perl
> recipe. This would make the proper name for this recipe be
> libmodule-metadata-perl. Why use the perl-module- prefix?
>
> Regards,
> --
> olofjn
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

