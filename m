Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6795C60125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 23:26:07 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id i18so50250658pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 16:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=e/SYx9vApa/DT9n8BAf/sqG9mlQYz4ei3+ACIgz1BZc=;
	b=lUji/3xFERCGdcmV3A4VLGn83R6lcl32APmX1fTxCONcdHsbG83CjZxwilv8HodyHG
	l1zNFvlVcOF2BuC+dVyXCCyR1HgE4pL3BuNBEAUUbnU7Ue1Fe1pPdj4hifoEY6/ylUqG
	GfwyxwTT2D0tXDQJPGrxcPcutrBIv+IiXqRGR7XA1FMkfzj2xlG9fze/n6qdUcCAF35c
	RMfuK1eJMUEF+khTH4jZnRbHtR192BNfQx52A0HqYlCwNneqWXfS/5PHthVAJz5Qx2Nn
	wKNT38LpGPNCdWOZZsX9zoxOhQwC96VZflUxRv11StWgtllOqX83Ojvumztbz4zFXItF
	8I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=e/SYx9vApa/DT9n8BAf/sqG9mlQYz4ei3+ACIgz1BZc=;
	b=ak0IP77Hrh2B1rp7H+7Vjc/TuyiTbjJw+xjmeZp+UhrLZno+ETfpMlIKzE0HnV6ILb
	/g+svGXRqihhKwy3VyPQ69wyDRG4SiUF/Pl0V1q9SFCPO2RU+9eA3Af+yZtUI33YQ9lh
	viU2gxByplyZO6PBUmViXyRGWsz2y5/yUQkuj6aXKWeW5zy08eHqQGwqwR0HGDg4I7p1
	/JEEfx8apbynI5WDUCZMGYSmlAqpOUbAmOzEHeWLfLfXANHb1TwXftFee1SG9FTedYZV
	OfZ/Awj5WOW31gFWhKnZSOpCOYtlpjPZLG8zXtdNCyANZG7AMU1fN6PKdafd1xhmpXEo
	cfjA==
X-Gm-Message-State: APjAAAVJNcMaAiTIq2fjRQyaYmoUXEUf+jY5CQKnEV//KosMk1yhkaNo
	cZOXod/LF74JumoATpPtox5IRy/u8qk=
X-Google-Smtp-Source: APXvYqz5jVMun353pZLeF2mrmRV7xlgg6D/nwIAkf5XUVwc66zAaKHVNdRC0/IPm5zBCU3LTQyMTog==
X-Received: by 2002:a62:1688:: with SMTP id 130mr10130632pfw.187.1565652367976;
	Mon, 12 Aug 2019 16:26:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6:ecf5:55f9:1f07:fceb?
	([2601:646:8500:6bc6:ecf5:55f9:1f07:fceb])
	by smtp.gmail.com with ESMTPSA id ay7sm605347pjb.4.2019.08.12.16.26.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Aug 2019 16:26:07 -0700 (PDT)
To: "Slater, Joseph" <joe.slater@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <007BD92917A2324FA403BCF9A464CF84FA87E791@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <804bde58-346a-0906-57d1-54d27697b9ea@gmail.com>
Date: Mon, 12 Aug 2019 16:26:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84FA87E791@ALA-MBD.corp.ad.wrs.com>
Subject: Re: Recipe local variables
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
X-List-Received-Date: Mon, 12 Aug 2019 23:26:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/12/19 3:52 PM, Slater, Joseph wrote:
> Is there a naming convention?  I have seen some defined which look confusingly like externally defined variables.  How about lcl_<whatever>, or something like that.  All "global" variables start with an upper case segment, right?  Or, maybe just say recipe local variables are all lower case.
> 
> Joe
> 
which variables are you referring to here ? bitbake or shell?
I think its just style, syntax does not demand that any convention is 
followed but style guidelines could be updated if there is some good
solution

