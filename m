Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id A9797731B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 17:29:00 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o67so441114644iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 09:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=dGsKR9k7QguZdbVUsLVoun3+0aCK1JZvd/13LJ8i2bY=;
	b=u3zk36ypImjgQl0XO1SuWB53+9oeLoEfe5zHE9N9gpCn9/zfi/oybGgNfIekKit9YB
	AuGFbrCs7VNPNF96UJ+oO4vGds9ydnMqfiYYkqxxSUexPnzymz9EhJQEfnRt0cLXYTYc
	w56mJF4mP3RYROM3P8P0lxm9d0q5Kv8r/pf911LKt1AaCSMcaZlP+cr8jv+MjjXdtbc3
	pSnf8KtURIfhRQFCKfwXhCnHwFNKy5zHvNlD/KmqteSHx415GI3BjvgfBljQWnz3riaP
	3UtbJDr/f+Q/B8KqVPeN5ZinaFK+hP5arR6XZZZDXV/b/0utDd7kDkT26u6nIS5dlM6m
	oaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=dGsKR9k7QguZdbVUsLVoun3+0aCK1JZvd/13LJ8i2bY=;
	b=bqjqs7qP5k/c9BC3E95wSO9cXIA0HNm7cv4bKEmRLwmCAAiISBJaXZXjcMTD9oxZxr
	OpHa7hf7adP1ZKA7nc7oOVd+iOmoDbNrvz+08dUh1pK4DNxJjjgDMeDQDM3orEoz5Vue
	CCob0peqrekl8+MncP7dUIlgc4TKB5ozPAUENKZoSUyTXfg5f3N1TDJt9FzTvoyiu/2H
	gH3Fe3NLyHLIBmne9eDqtqdqsMXe1dfmBe/7qqv+MQsAmQ9KRTr98POypdDuWt9nUFV6
	z9pXUMAh3RhuKO3rYQudQQBinU+EgjVMZmbqNzjp7KgOmf2IuqUlRMlrp5tnQzwCyfpm
	/+aQ==
X-Gm-Message-State: ALoCoQnFdT+rwpeOFzSjOt7ZBAarkLydbsAZTHavWmMIPxPC57GKMMVVEwxTdLQvjux27inB/8oIsJ0TuRTdRtdvwQpZrOIHLjLzrtNMF+hQTTspJgwWliM=
X-Received: by 10.107.164.161 with SMTP id d33mr73739302ioj.148.1451928541558; 
	Mon, 04 Jan 2016 09:29:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 09:28:42 -0800 (PST)
In-Reply-To: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 17:28:42 +0000
Message-ID: <CAJTo0LY-O9ee3jGoSPOPjqpu=u9zCEo2vfh3jfyxvgC15MWxbQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Mon, 04 Jan 2016 17:29:03 -0000
Content-Type: text/plain; charset=UTF-8

On 23 December 2015 at 21:41, Burton, Ross <ross.burton@intel.com> wrote:

> So in the new year I plan on submitting a renamed version of this class to
> oe-core and adding it to INHERIT_DISTRO.  Any comments?
>

Technicalities time: should this be a new class that is in the default
INHERIT_DISTRO?  Or directly integrated into base.bbclass?  Does anyone
have a strong opinion either way?

Ross

