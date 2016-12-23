Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 24DDE7775D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 06:06:47 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id c13so132348202lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=NCes3hsOoz72cYOnX3MdZRoc4VufB/7O/HkOh8EMxB8=;
	b=u/vPm/n1qq81YJKzjUFvc2ZUoUj8+ScInsAOcQ4EVDDNMIqRm3N3KTKHKjh6okdafF
	gWF38PZqTesNTIfDQDb/LpApJ8PEmTYiJrLW26D2G2JRYB/h7U7DLEIR37xo3QU+UQ89
	6xLiLMKljawVPJb3Vk43gz6sxoxCn0ROa+ttmjtgcDFrzEbBhsRNGrxgR3CiUHcA9vM4
	3FgwqYyhYDF8rDehc15JEprrGambta02a4SXRq3ftTZgMXIRZa7S76Ty1lPUp7B8+C+G
	iZwr7mGXS+D/sTAke9B7CGT8eySXALN2I/1oVZ2DvqYq9z9r+in6Q3xOc9DZGT5m4Uob
	ZObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=NCes3hsOoz72cYOnX3MdZRoc4VufB/7O/HkOh8EMxB8=;
	b=E2KVNqS1Dj5rJAPLCiL9zdhFMXxhNxFk6cBIl2zvfLudGA4l194cX2IEG7Yt7jdx9Y
	xSxeV70Yi2XZPeoZBuxtGu9wZBCdZpHYELdTAWkzpMjLSPjfsNy28jsg+qUi+t3GHiLU
	py/OmhdsxsDV+obxfOsgaFmnkzSDnDpbtaUhXNbLaHv5IAN/5eWDYF+dF6y+dMRqIFnn
	k3Mt84AqVCYlboR/mxKLg5sP6q+OTt/DxlDGvbOZz+pqWgN/Zpxzt7IK19BmRUaZ6Fzl
	haycKVrRDD5ZUgf3C4/k9qcA+DGRFrHOqPWgAodHrEdp7wAQWLYJKHxGjYpOywG7KEGI
	dzBQ==
X-Gm-Message-State: AIkVDXIX4YtkQxgfaTqq+alzMOJP8DlNKHclf+uTamRSolxpRvwjqu4bD8MkKR4x65lyUg==
X-Received: by 10.25.133.135 with SMTP id h129mr3835310lfd.127.1482473207875; 
	Thu, 22 Dec 2016 22:06:47 -0800 (PST)
Received: from ad.chargestorm.se (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235])
	by smtp.gmail.com with ESMTPSA id 9sm7517481ljn.20.2016.12.22.22.06.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Dec 2016 22:06:46 -0800 (PST)
Date: Fri, 23 Dec 2016 07:06:45 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161223060645.zxhknpoqi7bkfo43@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1482421531-29836-1-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1482421531-29836-1-git-send-email-derek@asterius.io>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20161126 (1.7.1)
Subject: Re: [meta-python][PATCH] python3-wekzeug: update RDEPENDS to pull in http module
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
X-List-Received-Date: Fri, 23 Dec 2016 06:06:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Derek Straka <derek@asterius.io> [161222 16:46]:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
> index af2d86a..145a1de 100644
> --- a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
> @@ -1,2 +1,4 @@
>  inherit pypi setuptools3
>  require python-werkzeug.inc
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-misc"

How much of python3-misc is actually needed? Just running du -sh gave
me:
4.2M tmp/work/armv5e-oe-linux-gnueabi/python3/3.5.1-r1.0/packages-split/python3-misc/usr/lib/python3.5/

If `http` doesn't require much of the other stuf in python3-misc, could
you split out python3-http?

Not that I'm using python3-werkzeug, but I've been contemplating it...

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

