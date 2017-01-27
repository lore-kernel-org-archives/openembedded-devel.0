Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2877746C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 19:14:42 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f144so19109562pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 11:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=eO+MXt4TTwRMDI7ZnLcDhK8QgbJJ104Oejz0p0EE0F8=;
	b=WaVM2513xgUy7QNkpkdXfr77wGFHn/APO/Rewg1wd4XP8AMkfTBTOTofjPIhfmPe+7
	adS3X/iKy/7sNgJEtopDuXzi2rpz8QkPJC7F9IsTTCRn4d+q4jTztm9y8E88+4sITHjU
	XniagAnNKNEpJpEjTfd7DymT8E1FO+QnfiNzZ35ZwDl6Okx2TMx1QZ2IBLmJxGa8jzak
	oVtxaZZe7XB0WIbQbaM5qROfywiY/nCqdltRbZbCOecwRwakOn6mwjnu/KK+pv/o1xH6
	0pe4EnDemb5gO8UCINjxWLvSOaTlJHpBwASnAPMlX4Uq28hJSXD7s7K3dm3Nl90zFwgu
	8P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=eO+MXt4TTwRMDI7ZnLcDhK8QgbJJ104Oejz0p0EE0F8=;
	b=NnQyhpEoTII2f/sJuYVkkr3bJtn67HI2c9H6rqiSzkFrqnsKxgVjhkE407H9nB5nok
	HVTSO0xhTRGrfpDuQjSE8rnAsirLzkUC3tH+5CRkYbLILVasZTg9XpqmgZqIO2SUlZq3
	BrqPE7IjYEJPjxSJSA7hqPTdFa8qVJtux+PDeEEDDatT2OUljSRvcmiJSNhHZXHEwJJv
	HQZXg1IZzl/Yb/ugGNVU8kImxqHjZKYVwU0gIQNPIO+UxEHz/zI4euGAG593peWN6SOM
	PKw3/MkCs3q6lHK5oOz66zqTMYRS7CTbQZWeOq26IX+34hrPADd1VgvEuEAUGLPgTcqS
	LXaA==
X-Gm-Message-State: AIkVDXKrQc4ZKQORhRKCQdUZdpHSBkVLcQpZkAMbrrsa7PhWScAFDKoKxx2+qp9SnkN7rA==
X-Received: by 10.98.97.68 with SMTP id v65mr10861078pfb.124.1485544483095;
	Fri, 27 Jan 2017 11:14:43 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6d8d:a1ec:12d:52de])
	by smtp.gmail.com with ESMTPSA id
	e127sm13164090pfh.89.2017.01.27.11.14.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 11:14:42 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20170127190606.9365-1-alexandre.belloni@free-electrons.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <dde007b9-0769-58ad-86ee-62829b6821c1@gmail.com>
Date: Fri, 27 Jan 2017 11:14:41 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170127190606.9365-1-alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH][meta-webserver] nginx: handle systemd service file
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
X-List-Received-Date: Fri, 27 Jan 2017 19:14:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/27/17 11:06 AM, Alexandre Belloni wrote:
> Inherit the systemd class so the service file is properly handled.
> Note that by default, the service file will be installed but not enabled.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index 36f2ac6d71e8..fe943d7c290c 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -20,7 +20,10 @@ SRC_URI = " \
>      file://nginx.service \
>  "
>  
> -inherit update-rc.d useradd
> +inherit update-rc.d useradd systemd
> +
> +SYSTEMD_SERVICE_${PN} = "nginx.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"

why disabled by default if someone is including nginx he/she might be
interested in using it.

>  
>  CFLAGS_append = " -fPIE -pie"
>  CXXFLAGS_append = " -fPIE -pie"
> 

