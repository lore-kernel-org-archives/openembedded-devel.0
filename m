Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0007570D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 07:13:07 +0000 (UTC)
Received: by qgeo38 with SMTP id o38so140295258qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 00:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cdGIqRhLtbb74yanNoFAEmRqgp20OKgVj5rsYs5zDQE=;
	b=xxae9QIdwbMBYCQipjvx4Qs2RtivjXUlpM4AxtnK+MED4rsGACJFNxEaYNDpZL4NMS
	u8Q4nGhfq8cGp7srMzZClMmwJ2Zm2pvxefj2x/rAlYTVI/qdaDqHNcI4TwVPVq06dnCO
	hmcMd+R0rCSZUnKYd349swrBxnZeYCcUNhHB2iL9Q4ujE5PayKxeAIH+wYrHCL5rQaDl
	KL8UodBb2D1BQN5TlXWxXQyepKQDEnxyyGPv7z+iVMAxP95KihJdWUU66Mq6/MPEiN/e
	eLX2YAK2SVDUBuCp+zX8EdSREES1MF1gi9Bjy6MQYFMGy2SObm47vg/46PLDtZkDDQ5y
	26bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=cdGIqRhLtbb74yanNoFAEmRqgp20OKgVj5rsYs5zDQE=;
	b=SWtHPac6xDvHEeElVdGXAP2uYeVBkjrBnk0qJlRuWEPVL6kVd/cxO8JfXdBEdCg2Sv
	n6He6zqjE4ZBhFCfFeo7mIm9CqIdZ2alFEcuLu/wXDQnsdRp+2nK6bdDMCPqy2/aMAie
	WKRfq049f0xxY5Z+iOv0J3pGbu0xTv9yOTnVoDptGw00bY7n+BEiVqVXZ47OCMVyBJ+m
	ZINZcAoliF0a5STBxU3KiwKFvIg5eEQyYV2JEh6z0wafmV9yTiiuEOKfKfdWpc/nhyn8
	p1LOpJTb8l6xpJpaVa65cNYa9VC6/UITjmKl4NUtEjJfydC4hMw0+3AbQaMRnrEm53PT
	eOcA==
X-Gm-Message-State: ALoCoQmjT8MmNETqEC/NXATk/Svkl2aHQTtyCFujvFqQAvDvX9XB6s9al8trV7FCp0ik6lUUw3O1
X-Received: by 10.140.17.105 with SMTP id 96mr7495529qgc.34.1445929987346;
	Tue, 27 Oct 2015 00:13:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Tue, 27 Oct 2015 00:12:48 -0700 (PDT)
In-Reply-To: <562EB36A.1010109@webthatworks.it>
References: <562EB36A.1010109@webthatworks.it>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 27 Oct 2015 08:12:48 +0100
Message-ID: <CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: checking if a patch was approved
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
X-List-Received-Date: Tue, 27 Oct 2015 07:13:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2015 at 12:12 AM, Ivan Sergio Borgonovo
<mail@webthatworks.it> wrote:
> I saw many patch passing by and I submitted a couple about
> meta-toolchain-qt5.
> I didn't see any message from Otavio or Martin "approving" a patches.
>
> How can I check if it was approved other than pulling from the repo/checking
> github?
>
> Or if there is no place to check... consider this a ping ;)

all commits are published on
openembedded-commits@lists.openembedded.org mailing list, and in
general you see when it's pushed in master-next, then in master.. i
have a mail filter that checks my name there.. it's the poor man
solution.. but it works. Note that the email trigger has been broken
for 2 weeks.. but i suspect this is a temporary issue that should be
fixed..

