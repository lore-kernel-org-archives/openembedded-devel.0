Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 72B9165C8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 19:45:14 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so65947324pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 12:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=JAYggL9R9vN2FdKFvRTmPw4apzk66oTq2FSmOKDhfUo=;
	b=xZbMk+WrlKKCCIuk+/SojMY2doE+fYVjJs1F2VxInd8dtM6qlSxsJE242sDksjm6p0
	JQV0gRcLxzfLoKZA5ZiniIK+xT9Ykk5aOl9mw9COfmJmI9n3H+uJguuWRhCveOetcrdO
	+AmHQMfSAKmzhT4ZWzUzhahMiIiuDqgh1u3r93wXnTouAR5lRQmV2q2PyjjmnnCk4vMr
	b2vGRQDJ6uTpDX302gmtrDS+o3HU0MfOcEKEkrPTePIzviCkqFdDtf95bA4Jnu3ln1La
	32QSSVvXd38LMqYqYGnXcg+NYsIZF1wswxjVjprBlznWS0X3WCFxgJ49wSIpEBLgXZPz
	8yDg==
X-Received: by 10.69.26.7 with SMTP id iu7mr12491405pbd.27.1445456714619;
	Wed, 21 Oct 2015 12:45:14 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4000:1239:8c9d:98b4:6b27:2e8a])
	by smtp.googlemail.com with ESMTPSA id
	yp5sm8880073pac.38.2015.10.21.12.45.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 12:45:13 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <5625864A.4000007@gmail.com> <20151020154109.GA2557@jama>
	<20151021153508.GF2556@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5627EB47.6010409@gmail.com>
Date: Wed, 21 Oct 2015 12:45:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20151021153508.GF2556@jama>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: dizzy-next sync to dizzy
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
X-List-Received-Date: Wed, 21 Oct 2015 19:45:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/21/15 8:35 AM, Martin Jansa wrote:
> On Tue, Oct 20, 2015 at 05:41:09PM +0200, Martin Jansa wrote:
>> On Mon, Oct 19, 2015 at 05:09:46PM -0700, akuster808 wrote:
>>> Hello Martin,
>>>
>>> Are there issues with the changes in dizzy-next? need Otavio to signoff?
>> No issues, I was just waiting for one of you to request the merge.
>>
>> Pushed now and new pull request pushed to dizzy-next.
> Hmm there seems to be an issue after all.
>
> At least
> 7f1df52 fuse: fix for CVE-2015-3202 Privilege Escalation
> is missing in fido branch, both are using 2.9.3 version which is
> affected.
>
> I haven't tested other patches (except testing that they don't apply
> cleanly to fido as they are) and haven't checked if we need them in
> master/jethro branch.
>
> But older releases shouldn't get fixes which are missing in newer
> releases, otherwise people upgrading from dizzy to fido will get
> suddenly vulnerable to this fuse issue probably without noticing.

you correct. Will work to correct that.

- armin
>
> Regards,
>
>>> Dizzy behind by:
>>>
>>> e3dbf78 ipsec-tools: Security Advisory - CVE-2015-4047
>>> 0fb90be mariadb: Security Advisory -CVE-2015-2305
>>> c580b62 libssh2: fix CVE-2015-1782
>>> e00844e ptpd: disable libpcap detection via pcap-config
>>>
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>


