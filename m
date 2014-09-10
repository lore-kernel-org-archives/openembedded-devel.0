Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7275B7142E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 19:09:17 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id j7so17736157qaq.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 12:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Wvpt/VwRMmouZNuzDV7O+0kGjwSHQyusQ4t+sPpRnqc=;
	b=ceDCd6YLzNxYGDw05y2+HR3FU0u4qiEZdBR4XBx7oDpNNFAl0EH27kOZ+0RN1JZ93n
	gL2s7tbxOHi7dO8kPXTdG2EayLm11uqLJRo5aDzq25YUgcsL34/SRTJ25KmKS5cUAWB9
	jEzlLUB8b2VzAxtzBoGV9YQtGSjqCUF0qOdrBscza0HKtWiDBJY8iDbr+5l1v3JehqVo
	TW7vInyv5t37UhinKP9mlRt+Vm15z+f14oULdMdX522FhNp1DHbwYCgiXeX350Um5VuE
	tPytNKA/QMl91RJhtv4VVz4TrepdSOb5QcQPHjzzlRIkkUVWjojdD9+kdvURnORU3H8D
	0cGg==
X-Gm-Message-State: ALoCoQmkFFEzSACvEphsHoGLO+50ppsYctVUwMnyZoiYEcXO32LQbeimNhec2KxQKGtWqEAcwbFO
X-Received: by 10.229.236.8 with SMTP id ki8mr63269730qcb.12.1410376158871;
	Wed, 10 Sep 2014 12:09:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 10 Sep 2014 12:08:58 -0700 (PDT)
In-Reply-To: <CAJTo0Lbm=FXWGK8BREL0hDuX1xs3_NTfaqoGNoS=2xu0H0MMdw@mail.gmail.com>
References: <1410374261-10233-1-git-send-email-trevor.woerner@linaro.org>
	<CAJTo0Lbm=FXWGK8BREL0hDuX1xs3_NTfaqoGNoS=2xu0H0MMdw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Sep 2014 20:08:58 +0100
Message-ID: <CAJTo0LbfOm7dWcO7DvuysVww4K5rJvt0XSo_9aCQ8+9b7cpjmA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] nspr: rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Wed, 10 Sep 2014 19:09:18 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2014 20:06, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 September 2014 19:37, Trevor Woerner <trevor.woerner@linaro.org> wrote:
>>  rename recipes-support/nspr/{nspr_4.10.3.bbappend => nspr_4.10.7.bbappend} (100%)
>
> Maybe use a wildcard bbappend?

Or even better, try and make that bbappend disappear.

A patch to add the BBCLASSEXTEND is trivial, the hacks may not be
needed any more as nss in oe-core builds on all architectures.

Ross

