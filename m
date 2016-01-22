Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 47BFB6067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 08:08:00 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id b14so118980139wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 00:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=14HgXMOv5uJPWFjqM9rcWy6hLkL1tXdXJqLnmoetyfY=;
	b=TzIxZ8z02KswaYzz77WwhJF5nDBstlNC05rECRUZnC7DhEWpR95+UvVfqviiWZb7ER
	M37Qb9vPuvP3vvkTaNmfUfUU65kWd3coxPIvEBs3wZda6aWFLsFXOY/3oilfIxLw9g/H
	CSpB0nSJQRPYeIG+UKTytEoEPkJLMXj4Vl5NLV3wgh6maz7u/A39sj4C7W/pjnS1HvqC
	JgaGwG/JThJAXQsGCvLhRMg27Xayhy8aQfGWCm6J7qIeSPcF38PZb1MQPaB1T1CqSdMu
	oeVJUbfwDRKSi/qaN5NfgGHIhOMqdQlu5S2J7gZkBTzpOoH8zFbkOQsn0uz2npSlvfL5
	35PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:mime-version:content-transfer-encoding;
	bh=14HgXMOv5uJPWFjqM9rcWy6hLkL1tXdXJqLnmoetyfY=;
	b=c5qCnOqZnw/evbizuiU7fbKJSTE1Not7oz3NF+OlHmHxiUpc1KVcg9gbNARJeF5ZLO
	zdhltqqpcXokvv6WTNpRLFFgphpsE9EepGHES2JG3h9jC0ltEwSlFSVfcdSSI3EIGuVs
	SSxad39LGhNGLNl256HmW31Uasaea/zv+HszhSOlhUk8kxhbqjuKe50i+3Y7qZn8tOBm
	CUZDgWAwAadZyDQYR3eRbo8oFsWImg1ZliknRzesYA249m1uEopokdBpgvLDxLfKg+2r
	Pwe0eQ5NnAhoGIDROpAG0Es7xPn48nLB1qF/Ngci4yqy9OShCxQ+MnQobx0RGVWVMY3L
	kHhQ==
X-Gm-Message-State: AG10YORrYv5POvQMzB2xTWr3cioeh2HPuOuPOiCR1GfsRGqeuxV9VAEKPTyj2wczaWikzA==
X-Received: by 10.28.216.134 with SMTP id p128mr1874263wmg.59.1453450080071;
	Fri, 22 Jan 2016 00:08:00 -0800 (PST)
Received: from minint-s4ms3ka.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	u69sm1745739wmu.20.2016.01.22.00.07.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2016 00:07:58 -0800 (PST)
Message-ID: <1453450077.2577.16.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: lixin.fnst@cn.fujitsu.com
Date: Fri, 22 Jan 2016 09:07:57 +0100
In-Reply-To: <1453368103-1800-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1453368103-1800-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.18.3 (3.18.3-1.fc23) 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] networkmanager: Warning Fix
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
X-List-Received-Date: Fri, 22 Jan 2016 08:08:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi

This is not the right approach to fix this warning.
Please try something like this:
RDEPENDS_${PN}-nmtui += "libnewt"

Notes:
- I never saw this warning.
- I would expect that pkgconfig does this automatically.

Regards,
Adrian

On Thu, 2016-01-21 at 12:21 +0300, Li Xin wrote:
> WARNING: QA Issue: networkmanager rdepends on libnewt, but it isn't a build dependency? [build-deps]
> 
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-
> connectivity/networkmanager/networkmanager_1.0.6.bb
> index 1ddb66f..72b4e46 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> @@ -56,6 +56,7 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-sup
>  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
>  PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
>  PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
> +PACKAGECONFIG[libnewt] = "--with-nmtui=yes,--with-nmtui=no,libnewt"
>  
>  PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion \
>    ${PN}-nmtui ${PN}-nmtui-doc \
> -- 
> 1.8.4.2
> 
> 
> 

