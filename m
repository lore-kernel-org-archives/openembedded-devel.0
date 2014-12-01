Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id E5652722AB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 05:07:17 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so10357935pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 21:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=KI7/4nBKJnJBCYT91IWmkQhL3SFB85l9rzV3u6SPkH0=;
	b=RbWsi4gC1trE897LW5OnIJl06Zn9JUldAZ434+RXF7BnvfUux3VJjStV2vpKezZkr5
	Ny7dYXviCRHMeH4gErpwrWiZn+5PImFs8EwVTU9hHQnYRTVsRMfbwh29GzTiXnHp9wPr
	4SwdY42KyYlxo5NuUq3zR6rwdSKXYxbty1OuqUlKlIEkOy2QpAkA1nAdV8BUsW9u7E0D
	yyMToxDCqlbL9V0bu/LDfdMvFNe/UJS9XPD2SOb2JQVk39BaiTz0wn0jkbPqVA7ATcoi
	/ImAnB4/FfMl9x0NHo+bpPnoN8QUDi9lX1+skBrT47JwCFX68TTEyUhJmINY8IhfLmuU
	EGdQ==
X-Gm-Message-State: ALoCoQlQVQsmSKIHxzcQFUaA15YgZ57Im1Da6VNndUoBpKGpZmXigEPa9IYJaGSEMiOccpuJT0oC
X-Received: by 10.68.97.131 with SMTP id ea3mr7980107pbb.144.1417410437933;
	Sun, 30 Nov 2014 21:07:17 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:6175:482f:87f2:5c37?
	([2601:c:9380:601:6175:482f:87f2:5c37])
	by mx.google.com with ESMTPSA id
	lm3sm16357274pab.34.2014.11.30.21.07.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Nov 2014 21:07:17 -0800 (PST)
Message-ID: <547BF782.4020806@mvista.com>
Date: Sun, 30 Nov 2014 21:07:14 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Joe MacDonald <joe_macdonald@mentor.com>
References: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
	<20141201034817.GU3886@mentor.com>
In-Reply-To: <20141201034817.GU3886@mentor.com>
Subject: Re: [meta-networking][PATCH 0/2] two more Netkit packages
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
X-List-Received-Date: Mon, 01 Dec 2014 05:07:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/30/2014 07:48 PM, Joe MacDonald wrote:
> Hey Armin,
>
> I merged netkit-ftp.  Could you put together a pam-optional version of
> netkit-rsh?  Or is that going to be a huge pain for you?

no pain.

  I'd really
> like to provide a version that uses PAM if available rather than
> requires it.

many thanks,
Armin

>
> -J.
>
> [[meta-networking][PATCH 0/2] two more Netkit packages] On 14.11.27 (Thu 21:34) Armin Kuster wrote:
>
>> Please consider these two packages for inclusion to meta-networking.
>> I have placed them in their own recipes location for others from the family to be added later.
>>
>> Armin Kuster (2):
>>    New package: netkit-rsh
>>    New package: Netkit-ftp
>>
>>   .../netkit-ftp/files/Add_ARG_MAX_define.patch      | 28 ++++++++++
>>   .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   | 46 ++++++++++++++++
>>   .../files/rsh-redone_link_order_file.patch         | 64 ++++++++++++++++++++++
>>   .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 61 +++++++++++++++++++++
>>   4 files changed, 199 insertions(+)
>>   create mode 100644 meta-networking/recipes-netkit/netkit-ftp/files/Add_ARG_MAX_define.patch
>>   create mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
>>   create mode 100644 meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch
>>   create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
>>
>>
>>

