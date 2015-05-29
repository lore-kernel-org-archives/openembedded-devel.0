Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 61F1C755F5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2015 20:26:34 +0000 (UTC)
Received: by igbjd9 with SMTP id jd9so23317518igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2015 13:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=luTXVSZViiQPZnrkWxmQbXAjRcOABo/0HsS3g/Q6vQk=;
	b=dSZgESWEwchOxFHNMqzbgSQJL7/1EARm58cv74pmpubtv5mc8VXjMiwfwnqXIAIp5P
	VLTdOw19jUObI2vZqnmaHl4M60QFEt/eepLdzMxKKyvkOvH1zyP7mjbISk1uaqLe8tfy
	VcBGPOsuaIhgQGKJO2IyDU46ZFOV/ckkn5SrCE2uLZNd4jzRXRCwGHo4zYWP3nCGcRga
	IhviulD5UVkNsp2JLat5vQ8Pw3Go67HkJr+jzAZx7x8KQ7lm2k6sLljgJs7jGp1PyODO
	YoaP/Qedzl2r3aU+OuOyPRupH+0qqk1SBZNJrsFQ48YOZ6yEqM2sNj9oVs7d+iwvgGaS
	FeZg==
X-Received: by 10.107.10.89 with SMTP id u86mr12369171ioi.79.1432931195580;
	Fri, 29 May 2015 13:26:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.166 with HTTP; Fri, 29 May 2015 13:26:05 -0700 (PDT)
In-Reply-To: <1432891017-8483-1-git-send-email-naresh.bhat@linaro.org>
References: <1432891017-8483-1-git-send-email-naresh.bhat@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 May 2015 13:26:05 -0700
Message-ID: <CAMKF1spr+JyN-wngYn9JgxvGtNny+EL_QrZe2EF2DLkFFEFG=w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xorriso: Add xorriso v1.4.0
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
X-List-Received-Date: Fri, 29 May 2015 20:26:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 29, 2015 at 2:16 AM, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> +do_configure () {
> +    touch NEWS
> +    libtoolize --force
> +    aclocal
> +    autoheader
> +    automake --force-missing --add-missing
> +    autoconf
> +    oe_runconf
> +}
> +

couldnt this be done via some do_confgure_prepend () ?

