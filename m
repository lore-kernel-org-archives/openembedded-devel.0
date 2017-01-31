Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 84B17731AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 20:24:11 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id v23so245094150qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qXwFk+XpRH1Y05d3SZ2J1HSYJ2V6n/sLKkikritMTEQ=;
	b=Y0uVJPvIg5kDOsnKHQbIag+qGbw3PwT38QfzZBuJWm6U6m9I35cC9TIDxKb/SJSWr4
	jv+bMA0JIx2CQjNjgyjYSleYj/MVeOkNZjCIhzu5ZXK0Hrfz/TmpXorpZqjLlRAkmz9J
	OYQWge4l7U80VsmXxT0m+aggMa11sOviunlm8je1pJq7+ToQWK3B41o96ITEiEOfPE3p
	Xl2pN8UttAtbFrpCGefkZSD5eoaUfbuGBX9NrsS+9YzBApSaklAJHTORSq4HJ3dCUkAh
	CJnGnvIEz+IF+Ud1leG83attPhwOKouQQUEcwwPZV4p7JwiUXZyqKQuyw9fTtX/Ks2gv
	MxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qXwFk+XpRH1Y05d3SZ2J1HSYJ2V6n/sLKkikritMTEQ=;
	b=XvHEl/214Q3j5+7nOZnDFe76L0VEwZjrUhcpvxPhvnsYgzYCPLOKh9WvoWv/WId1Kv
	/johwBZIWl21/d1bk9iLoAsbQ9nOdI172jhj+OOu9gbkN+dRw6VhEWdK5zRXnqc+gU4C
	7eANfoWXRETYdMAj3RYmZ9YgjnArL+UM38d6mjXROZOEq2iO6G9CuHtVd9oP4nid41mE
	MHZU1CZRlTOj3TD0QvDKNncgkEBD2wJ5bHutnRZJ2MVmwOyI2P21k6IAVCpxCMQKaBnv
	JNQw0njN4gC0DfGMliEzrPDTL+YUeo6iM2zHl22dvLvXsM2BFeCJJX5RAKJI7j4hD/RE
	pN2Q==
X-Gm-Message-State: AIkVDXLQRNcx3IeLIynKt+RO2V8O445zS0lGP8Ou81HSpS8fiSnKf4lU/o0mZ9YdXKcuvj0kaVemV150JKIXYxQh
X-Received: by 10.200.45.247 with SMTP id q52mr29289890qta.197.1485894252292; 
	Tue, 31 Jan 2017 12:24:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 31 Jan 2017 12:23:51 -0800 (PST)
In-Reply-To: <20170131171049.GA3273@jama>
References: <20170131171049.GA3273@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jan 2017 20:23:51 +0000
Message-ID: <CAJTo0LYAkjsJ2bJSzsVTWTxdVaNnN1_aSehw=uueF=EK+cLdEw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2017-01-31
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
X-List-Received-Date: Tue, 31 Jan 2017 20:24:13 -0000
Content-Type: text/plain; charset=UTF-8

On 31 January 2017 at 17:10, Martin Jansa <martin.jansa@gmail.com> wrote:

>     * openembedded-core/meta/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_2.6.bb:do_compile
>
    * openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.16.bb:do_configure
>      * openembedded-core/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb:
> do_configure


Already fixed in master.

    * openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:
> do_configure
>     * openembedded-core/meta/recipes-extended/cups/cups_2.2.1.bb:
> do_configure
>

Fixed locally, will send patches shortly.

    * openembedded-core/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb:
> do_compile
>
    * openembedded-core/meta/recipes-devtools/qemu/qemu_2.7.1.bb:
> do_configure

    * openembedded-core/meta/recipes-kernel/latencytop/latencytop_0.5.bb:
> do_compile


These were a very odd explosion in the sysroot code, no idea what happened
here...  would be interested to see if they replicate.

Ross

