Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id AE669605BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 03:34:47 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y26so7358966pfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 19:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BXMy36FqF8WPizjh7lfxTmQRM2hTVZ5iP8Es9ozJ3Rw=;
	b=BPn+gKzcXntdffHNW3EyUDyKfaR+XDpxJfH7dx4wudi9ZWikLMdmes0Ti8g66mYDkW
	ZZQicIhTbK2d/uWcOWN+omO+9QuU0H39wiyuX9hNVg53Kh2IX4gwnaH9bnaW+A1NAsPj
	wfC8becq31+VOC9eUdKd4wWu1+DCR1Q0rGBRzKCym3+eMXpNSaejEJqQbJerzL8stT15
	ZKRSe901Itzhax5HsH1PiBMIRU02bEMlcNd4CbbPSVz0TrZluxdJrTLVc5tLZkOia8OD
	YL2f6RRfX+HR+NTt8T5JePd5fWJx//As6Z2W/oFhOqC06XNbar2qiVllfzWL6cSFCMr8
	CuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=BXMy36FqF8WPizjh7lfxTmQRM2hTVZ5iP8Es9ozJ3Rw=;
	b=YTUk9hkN5r7GEUgofv25lQc4tpfMOkcDz9OyFEpmjkOUqf9T3kXKxRNXO6QIXWSRuA
	MPUo1vf016sqxxvhkQuqJWhdwXlT3M2T62seGLtXjFwbvlOyiemK4lL/5c/hoZXNyV0I
	JTrECvNw7zj5JqSfF3wkkMFIvXIZ2RtMSMLUoA0CXwgTYecXiHSwKZoZIkgY2p6AxWG4
	shXsMGgL4lO1DLfrwMZPqLOm5U3yjjvJ134aslyMwnYGLlTUY3st8XI9mrkS3L4u4GHQ
	mo/qBMmHSzIv3S9WKljaJ64cOVLvGsCjHJ8FQlVirFdVyFD5eNUopOuCFcIo+QqUEUtQ
	5NaQ==
X-Gm-Message-State: AKwxytcZZteJi9CIjOM3gfoLkrOV0d8KSrMNrOJqhmlrVor2mqizHAIx
	eVIG6qRKUnC/mHhGIVZq0CwV2gIw
X-Google-Smtp-Source: AH8x226OzyDocPZk8n0p4psYftHkr8YQT7RuFjYTtRXpCK33bMnBRJMOVe63OL06Itvrf6jXb2IByA==
X-Received: by 2002:a17:902:40e:: with SMTP id
	14-v6mr13103940ple.64.1516937688494; 
	Thu, 25 Jan 2018 19:34:48 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:3012:7af4:dd04:6cda])
	by smtp.gmail.com with ESMTPSA id
	x64sm5758457pgb.79.2018.01.25.19.34.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jan 2018 19:34:47 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1513954266-110130-1-git-send-email-changhyeok.bae@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <aab8ace0-fcf7-eaff-563f-f54dfb882b15@gmail.com>
Date: Thu, 25 Jan 2018 19:34:45 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1513954266-110130-1-git-send-email-changhyeok.bae@gmail.com>
Subject: Re: [meta-multimedia][PATCH] rygel: Add lms PACKAGECONFIG item
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
X-List-Received-Date: Fri, 26 Jan 2018 03:34:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/22/17 6:51 AM, Changhyeok Bae wrote:
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>   meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> index d2eda6b..e94c9ff 100644
> --- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
> @@ -30,6 +30,7 @@ PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
>   PACKAGECONFIG[media-export] = "--enable-media-export-plugin,--disable-media-export-plugin"
>   PACKAGECONFIG[gst-launch] = "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
>   PACKAGECONFIG[gtk+3] = ",--without-ui,gtk+3"
> +PACKAGECONFIG[lms] = "--enable-lms-plugin,--disable-lms-plugin"

I guess it should add rdep on lightmediascanner too when enabled.

>   
>   LIBV = "2.6"
>   
> 

