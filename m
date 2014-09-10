Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2F2711EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 19:40:21 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id q9so3322527ykb.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Sep 2014 12:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=MDtpDps7r95QCotMkMcdXf20HVvdig0dy+4m2AKB7E8=;
	b=tfFjNHebnDStE2Puy+lMy41a81akbrCIy1l4krTJwujT8MujlJKPIQuEu1SQyF9TSe
	ygqOHw6p4lnvaKBvFoPvxWmFr9z3OezvgHfced8P1vigTWOTgL0fFYzUQDaQu6DJuNYE
	ZzNNaZxE085aVrzdYjRfCQ5kXMZeu5CBKkrCewIMu+rku3t26AA2tWHhg/ry12qyNUdC
	tr8mZlymrnMSFJMTRkj64BEs8FfnIfqKWGP3GgQjjBjyzt6w1jvWXOOE3nVBs3gZCOfy
	KdQVbYSRa28DUqBFoHvDPRLpva60mdVGvCNugmBbJmDrgWll1YS6PtD7McR69yOn074x
	RV3g==
MIME-Version: 1.0
X-Received: by 10.236.161.66 with SMTP id v42mr3732640yhk.117.1410378022827;
	Wed, 10 Sep 2014 12:40:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Wed, 10 Sep 2014 12:40:22 -0700 (PDT)
In-Reply-To: <CAJTo0LbfOm7dWcO7DvuysVww4K5rJvt0XSo_9aCQ8+9b7cpjmA@mail.gmail.com>
References: <1410374261-10233-1-git-send-email-trevor.woerner@linaro.org>
	<CAJTo0Lbm=FXWGK8BREL0hDuX1xs3_NTfaqoGNoS=2xu0H0MMdw@mail.gmail.com>
	<CAJTo0LbfOm7dWcO7DvuysVww4K5rJvt0XSo_9aCQ8+9b7cpjmA@mail.gmail.com>
Date: Wed, 10 Sep 2014 16:40:22 -0300
X-Google-Sender-Auth: QOUsCWjFB3WlGs87qcFkLLFOOJw
Message-ID: <CAP9ODKq-XUMyhEbCF=JX2B=_2Y=VnVTmu6GhpiDvWJ0=9+-xZw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
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
X-List-Received-Date: Wed, 10 Sep 2014 19:40:27 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 10, 2014 at 4:08 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 September 2014 20:06, Burton, Ross <ross.burton@intel.com> wrote:
>> On 10 September 2014 19:37, Trevor Woerner <trevor.woerner@linaro.org> wrote:
>>>  rename recipes-support/nspr/{nspr_4.10.3.bbappend => nspr_4.10.7.bbappend} (100%)
>>
>> Maybe use a wildcard bbappend?
>
> Or even better, try and make that bbappend disappear.
>
> A patch to add the BBCLASSEXTEND is trivial, the hacks may not be
> needed any more as nss in oe-core builds on all architectures.

I will try it here, and remove the bbappend. So we can be sure it can
be removed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

