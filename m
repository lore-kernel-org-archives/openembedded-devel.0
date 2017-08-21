Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 089D4782C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:21:21 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id l132so134282vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 23:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AoBRrGuGcVb1ZaA/jHh8+zwE0I0YsIpGULRF1j1b7CY=;
	b=sYr6G0TSNp1Gzc8aE19SPY+KpO7IDD79xqAqu6jZkQSQAMeti2OBWUe69P8fgfngc6
	Fn1Ulp6nVUjgiEdqaYZLSMmp/ueRRl+kuIWXZmnMXZP8G30OK1ikjUERZRb3isb75GAb
	vrF3eIjCB6zCxjsVTgZrCp1Slj8meHUvk6cmszo3zw7ks4d2/tS7UyB1WKPxrBKLECIz
	mVacvQGITK2jalyRaxOyPXlIoSU8v8gI8RIdOSO2C7sIPmu0u+CmzUP0upKuti22oiS2
	/Zuob0xWTuRLSeZAae10zhtSJGWRXZnrdsfT/r01RfcU+01jxwvqlmN6iSWMEL8kMuPI
	DbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AoBRrGuGcVb1ZaA/jHh8+zwE0I0YsIpGULRF1j1b7CY=;
	b=infSVu8Ki7BV7pVhvKEYJvYGCThIMuDRpv/CuDkN6pq25cByn8wK9DXnGwfhATTPRO
	D4O5MmUt23wo0i6/Dscb8y1S+evxxxKNkJyWxUfy8JzErF0mjeS4JU5+TWWnpLPUjPhg
	rj+Ph/B8ztxEFi31Cn2ULAHt7dsBTFFTlhXG9Fy5xpgRED4zpVDC//GVUVI+WArUu1bA
	9o9/j43TaHrruPGjuxQjUvI09pGsmtyDZuyhxZhMLQDlkJAzhuaq1q16An42PPdFVahO
	1+WmtnCJy6tZFZX4RqMboZnYkcZfuY42CDC0346aaKBW9JtcCP4oaHYxh1ebBOgFcI0b
	jW1g==
X-Gm-Message-State: AHYfb5iNYS7YZrvktRLBgy5XPP0hxlQlPsTi5QwP5+DG0dhHstdqqRx3
	KkB5XXiCn9/gCmlOKwozoEsUwQQvVg==
X-Received: by 10.31.233.194 with SMTP id g185mr10376948vkh.56.1503296482917; 
	Sun, 20 Aug 2017 23:21:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Sun, 20 Aug 2017 23:21:22 -0700 (PDT)
In-Reply-To: <cover.1503295148.git.hongxu.jia@windriver.com>
References: <cover.1503295148.git.hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 08:21:22 +0200
Message-ID: <CA+chaQcNNKcae4OhNGLeUDG-c_007J2PYW=xxAN-Z=s_wLPmRg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/3] multipath-tools/python3-pykickstart/xmlrpc-c: fix file-rdeps QA issues
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
X-List-Received-Date: Mon, 21 Aug 2017 06:21:22 -0000
Content-Type: text/plain; charset="UTF-8"

Do you know why so many do_package_qa failures were detected now?

I was reading oe-core commits added since last world build and I don't see
where this QA check was fixed or why it reports so many issues now.

Is it thanks to this change?
http://git.openembedded.org/openembedded-core/commit/?id=bf017930036f19b3d6df8e5b50d9979ee7045c5c

On Mon, Aug 21, 2017 at 8:00 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> The following changes since commit ac2a6d2b5d69937577effcb8bb2149
> 651bac0176:
>
>   json-spirit: Add -latomic to LDFLAGS (2017-08-13 13:21:04 +0200)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib hongxu/fix-qa-issue
>   http://cgit.openembedded.org/openembedded-core-contrib/log/
> ?h=hongxu/fix-qa-issue
>
> Hongxu Jia (3):
>   multipath-tools: add bash to RDEPENDS
>   python3-pykickstart: tweak shebang to python3
>   xmlrpc-c: add perl to RDEPENDS
>
>  .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   |  2 +-
>  .../multipath-tools/multipath-tools_0.7.1.bb       |  2 +-
>  .../files/0005-tweak-shebang-to-python3.patch      | 25
> ++++++++++++++++++++++
>  .../python-pykickstart/python3-pykickstart_2.35.bb |  1 +
>  4 files changed, 28 insertions(+), 2 deletions(-)
>  create mode 100644 meta-python/recipes-extended/
> python-pykickstart/files/0005-tweak-shebang-to-python3.patch
>
> --
> 2.8.1
>
>

