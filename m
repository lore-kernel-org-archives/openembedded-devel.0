Return-Path: <mats.dev.list@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 261BF731C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 08:01:12 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id s64so44986014lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XMIZmTMSMgvDWbNn2/l1kc97JU2YZviOmXdza3g1ruE=;
	b=vhcGv3IVmMVQc3c4Q1wZC/KjQ0FL0SB5xfd5jb4NFi/P3tT/bxQNFD/vpofliZzZ+8
	s56wuonRNyX8B3Aj93JzKG6uKiS3prcThXN2+FMHgQAntVdng1+0WuLBRfTz8QZidWvV
	k7/1dhHnPY/siNu9RRZ17FU++rBbO6CzQ2vQIof5aV66FIUryuljyv48/Nodv9fvcB68
	81lJvjZ94kZKA64oPNhcm/GM5ffDP1Lqt3bF/5DG/tq12nRbGxjygOucsCw5XeyPSgGq
	fFfQMjN6MWbjld0xMR4IkS6iuYwWlarWpG6w7QNbpmgecB9QIAd2CR6GbL6CkEaaEfnR
	k+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XMIZmTMSMgvDWbNn2/l1kc97JU2YZviOmXdza3g1ruE=;
	b=RSccEl0fFelSlU46fYEYvmmSQUk7MZUpLYK9IurcR3o9ERqXAWbeHMJlIqiHPR/k+A
	lQIEFiQjglaOwn/S+MQ5JKcmmgXZg4s52fQ9lvpti8Z0tjNavpy4aWSW0QaphOuBadb/
	dEKjG3rZaeAVG0JsbxFZ52nCQAOHiU7f3qof5OzGArUbA5hKPn1dkaasVUmjHYRu+Lv+
	Otw23lAlvAfSVOtVaTThcESZ4JlO9HNrw7XRQHdN93VRhjw+OqT9h99fbefQ7qty9Bcs
	Sv6WQx4aAOZfZly00iETiGDbYOiUqR+tAFIpTiSU8S5zUHo/AEBWv2L3BeW32j713+wb
	HPPg==
X-Gm-Message-State: ALyK8tL0xCdcpq0YYMluc2PR09BWnrLrm/QmBLimIb+fsm9RbLDApJ1jmz0IyBR/Xh/iZA==
X-Received: by 10.46.5.194 with SMTP id 185mr5177166ljf.65.1464595272051;
	Mon, 30 May 2016 01:01:12 -0700 (PDT)
Received: from [10.10.1.129] (h217-27-188-82.cust.tyfon.se. [217.27.188.82])
	by smtp.gmail.com with ESMTPSA id
	xx7sm4295655lbb.19.2016.05.30.01.01.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2016 01:01:11 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1464054649898.9b34c448@Nodemailer>
	<17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTxYZ-+ZFmxOCguBMbO5X4m6KTaM+jXVqmSBQ8pHuR9UA@mail.gmail.com>
	<1614711.s4bvBbSZBc@peggleto-mobl.ger.corp.intel.com>
	<CAGiJk9f=t2VZrN1URi7uZuz-ChgT1QTEN0vaECM-t9jCcmPmHw@mail.gmail.com>
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <574BF347.4060609@gmail.com>
Date: Mon, 30 May 2016 10:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAGiJk9f=t2VZrN1URi7uZuz-ChgT1QTEN0vaECM-t9jCcmPmHw@mail.gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [OE-core] Unmaintained layers
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
X-List-Received-Date: Mon, 30 May 2016 08:01:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2016-05-30 09:36, Samuel Stirtzel wrote:
> Or add a page with a list of all unsupported layers and the last known 
> web repository address, and use HTTP 301 forwards to that page. 
+1 for that

// Mats

