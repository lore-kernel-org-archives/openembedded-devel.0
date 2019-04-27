Return-Path: <beniaminsandu@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 960B27D8F3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 18:32:26 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id i68so4753868lfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=cF/B3cSHw+78+eIqRdkAQi08PgKIZX7UfDGEBVKlzYo=;
	b=ACeDc5ezPJJR4YiOtGM31NxWsq9aQy8IC6gW+Go1DF9vxBvzCByI+lDQSIVzY8jN7k
	MI/e176tJ064gayVO6V2AMUTiMraBUD7uxbxKWq2J5LTpmaQvPKZmLvuW20t2od8D9yA
	N76Vcq0pdmAUc1Rz2XssbPPgDBHa37I1eZWkxZIgD0uKRbYPvcrGGZgl6BDsTJUTNJbK
	2kFlr1IPX4rdTDxZwcihFuq8b/jZRNiU7pYMG+H+c8iVytdlLE8jrNQvu/L0IPIPa/ZZ
	SruzF6QyocSegGdYMKIh33p2hKka5cusHrSBFfop3zT0DOa846a3xfV/TOW01hPS/dD/
	UosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=cF/B3cSHw+78+eIqRdkAQi08PgKIZX7UfDGEBVKlzYo=;
	b=I5YoSbZydwIGzMQIeI/Y/kbImtXUV6n9yZK/RY60zA5RSxmRWBht1svR2m9/Pp8vfM
	lEAmBpjYcmkGWYOvH+eH0JUUM1kke0RIxNv02WQGsRRhp9pq7MifPcRrPoewx74zro9/
	DLoOx6nu5akGAjNboInP44C/5OiEBUFXib+tmt461rhhFm4Dt9Fg1uX0rBIql1LWdhtu
	iv8uFMqfgQtyNNt5dfG9koIBjOhueaLMCkIEDKYS3jfrFDzOOmKmGpRI/ehds1xQTHL7
	SEDO5XOHLryYuwTeAphkDIpFddGUnxB3UIycQW1luOrtcrW92t5OfkjizAj+nts8NDoo
	BQVw==
X-Gm-Message-State: APjAAAVwdX1WtogQfhZ7gVr1IL9DOgAnHPV3EnEz5meB/+Ww5gF+jQDA
	GQrd0VM4PQpE0qKI7rDiDQc=
X-Google-Smtp-Source: APXvYqx0qo0AXLKD4ynX9t6k7mSjDSx1qtxlbjqLJmuRtWwVAj0q8hMvX/hhu+8X5nGS+2LzM4Pblw==
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr730618lfp.60.1556389947194;
	Sat, 27 Apr 2019 11:32:27 -0700 (PDT)
Received: from [192.168.2.101] (5-13-153-104.residential.rdsnet.ro.
	[5.13.153.104]) by smtp.googlemail.com with ESMTPSA id
	x2sm1188202ljx.13.2019.04.27.11.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Apr 2019 11:32:26 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190418153432.16745-1-beniamin.sandu@gmail.com>
	<20190427182651.GD10144@localhost>
From: Ben <beniaminsandu@gmail.com>
Message-ID: <53236768-b7ab-0400-1b6b-1b7996a98552@gmail.com>
Date: Sat, 27 Apr 2019 21:32:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190427182651.GD10144@localhost>
Cc: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Sat, 27 Apr 2019 18:32:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 27.04.2019 21:26, Adrian Bunk wrote:
> On Thu, Apr 18, 2019 at 06:34:32PM +0300, Beniamin Sandu wrote:
>> ...
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>> ...
>> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
>> +SRCREV="61a28c2ee5e60132f26725583b66c1cf8214bb78"
>> ...
> Has 1.9.2 even been released?
>
> This looks like a random git commit some time after 1.9.1 to me.
You're right, I will create a new one based on the latest released tag, 
which 1.9.1.
>
> cu
> Adrian
>

