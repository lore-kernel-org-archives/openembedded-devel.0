Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 527A7600E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 13:11:34 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id p42so371859840ioo.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=r/Z8LTb+BzUn/G9K84KHZoQepCCWizZRekeRX0DaRLk=;
	b=IWk0/G7bgDP0hCgHW3p9AQDqQGZ5tYlUTZ3nuLmHPg/JfcTBe5wRdeQxbTSdUxyFXt
	TJaeh1nERSfwksFCGP6fqcLD56jQlBpxAylPfKUNSMvnxP8B6l3EwXUJFeQ9y+MbNRF7
	OeqYkUX8Py3b1UyZz4rb4N0BNYSImRFUXuvRwjSS+DZvFBLh9Kn5u3UXIqqGuixdXDxK
	A+jjVmBH6t0zD2MKAVJB3EJBVPTd7t56tFNDTOWyeNOm9D6Hx73D48sGNWFEEP3U7h3I
	XsmOYzQJTL717tzqwgtBnD4iiPUKo6CFzpbKPrsBv/HrCwggQ0Ikn2s3Wrs7CyAN+AFb
	CLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=r/Z8LTb+BzUn/G9K84KHZoQepCCWizZRekeRX0DaRLk=;
	b=e8b8POTo5rLEhp/jf7BNP50fYWx0aT1L42JmHOMqd56wKpiXywJZfPoGdu4uFKs/kN
	tt+x44wyhJQR1PI3G1yYThml2zjtQlF1w0vlCvRcEhHjf3VV5x8sxqWgM39TsOkrst9h
	OgG6MU1SrWYKSxxNFsLHmX4jEubsvvVtNMffR4G8P4SwvDo2wTCD1bUBRuddn2B38AC+
	xfwHY4vrZyqX3w2oBcmRW39d+2ERhYjSfW10wdEW1jBqJCqiaMW8xQfjNCCC8x6/23hG
	YAb4Ny3o/hhowDKnS0Oxkk/WaKTtcKPg5uHqeBtWh7NBprSdAN/zNZ2L0VTobAyQu4+x
	X9Qw==
X-Gm-Message-State: AIkVDXJ53j5XXO/MecR+0MSw0tiYJjzKs1D0UBnWFckAHxBIdwIh1GpYqb+qhwy29uRLEfusvNInMk6QZ61ycdyT
X-Received: by 10.107.186.86 with SMTP id k83mr34153804iof.199.1483103496258; 
	Fri, 30 Dec 2016 05:11:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.144.99 with HTTP; Fri, 30 Dec 2016 05:11:15 -0800 (PST)
In-Reply-To: <CADnUhn0N6r3mia7iVBG8fN9oF84P2Jyx9dfkyGhmAUmGFOr14A@mail.gmail.com>
References: <CADnUhn0N6r3mia7iVBG8fN9oF84P2Jyx9dfkyGhmAUmGFOr14A@mail.gmail.com>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Fri, 30 Dec 2016 14:11:15 +0100
Message-ID: <CAKuJqM_kBQ=rnvH519uA6iQOPjWK4QHwZvgX6j-h5=sx1zZjig@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libjs-jquery_1.7.2.bb
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
X-List-Received-Date: Fri, 30 Dec 2016 13:11:35 -0000
Content-Type: text/plain; charset=UTF-8

Matti -

You can make and submit a patch. Here is HOWTO:
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

On 30 December 2016 at 14:01, matti kaasinen <matti.kaasinen@gmail.com> wrote:
> Hi!
>
> I browsed this libjs-jquery_1.7.2.bb recipe and noticed slight improvement:
> There is definition for JQUERYDIR:
> JQUERYDIR = "${datadir}/javascript/jquery"
>
> This has been used extensively in this recipe except on the last line:
> FILES_${PN} = "/usr/share/javascript/jquery"
>
> Should it not be changed as below?
> FILES_${PN} = "${JQUERYDIR}"
>
> There is nothing wrong in either way, but it would be neater/less error
> prone later on.
>
> Thanks,
> Matti
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
echo "EOF" >> /var/tmp/email

