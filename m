Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 263C6601D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 18:53:44 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id p42so391087648ioo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2016 10:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ap0KVWeG16AlM3MfMGCV97XvAbETCuw2yVqUsovxof0=;
	b=N5luig3KFRSlTVwU28zFkzv1jDQqkbX5H7+oEi8ojDZWmp2ueriqdmbaovht7iGS6q
	qC+0hki7HfyAc4luBhTeOMcaEdhjppv7LeFgRdiWCm217bBvbtVhQiHO6we/6UrS7SCL
	fK1y+NoFZNT52rw1ZpGK3COfQAsPwiv8LWCJs1afXxvGDc/co9q3nrsPtYfLg6hZwFBW
	LQuXhWbJhKLsXsuBmjh6uD+eQiIxMe8jtZj96Vg5TmBYsc6LksJpIK3YLnoPkCuhZ46k
	t5GRRLyWDV6kqWmruWpHAF8Uyi978NhimjpqOGhg37gw64zKvb3wB6qma/x1cdhHijbR
	n6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ap0KVWeG16AlM3MfMGCV97XvAbETCuw2yVqUsovxof0=;
	b=nCgu8XKXy8+7BIJOfZ34cj7PnQRE9Gk9IbtjKtcyOfr3Ykh31r4IK93Ot/8VOGEqpa
	fjQK/PbT8/Wb/45cDiyRoybcdhhViLy7Qk8sNzU/YWwjO2IqJwhIV2U6+XEPaocdGH0p
	y+cka5QToi+pjHwlfIvAhhJJbUIUkGdnhFf68HM34UWcJdzRqad40DytQWZNIrI4gR45
	0xSAV8VIbnVgjI64YnCAk1lPkeWjyk3/O1pRFPFsQzXx299ilDkiRnYn4XE6rz6yeAxK
	u3qSAV7oWQl/kYilryYQ+23/Y46mrsjLdBtkYDQ/xVIsU//qleGz0YrXYl7wPguuSffQ
	3OJA==
X-Gm-Message-State: AIkVDXKRRjUCWlXFj11bKt3QlzaRzlUGg7yvWCvQXSxaKklTvTRKKxpjx0uBma4/H5hxVUB68EqwnnGmT6rnTUOz
X-Received: by 10.107.186.86 with SMTP id k83mr38449463iof.199.1483210425351; 
	Sat, 31 Dec 2016 10:53:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.144.99 with HTTP; Sat, 31 Dec 2016 10:53:24 -0800 (PST)
In-Reply-To: <CAMKF1srr_XS4X8QOVs6f_YvKs_F7=h0Ng-+9CLHToz9ufu2_1w@mail.gmail.com>
References: <1483077771-28877-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<CAMKF1srr_XS4X8QOVs6f_YvKs_F7=h0Ng-+9CLHToz9ufu2_1w@mail.gmail.com>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Sat, 31 Dec 2016 19:53:24 +0100
Message-ID: <CAKuJqM990m=kPC6c4J94vKaYjaSoOTj5yeMxeyGOFrHCwv+6Qw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] tcpreplay: upgrade to 4.1.2
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
X-List-Received-Date: Sat, 31 Dec 2016 18:53:47 -0000
Content-Type: text/plain; charset=UTF-8

Khem -

I have the feeling you did not look at the change careful enough. It
is extremely simple and straightforward: the package has been updated
to next minor version.

Since the tarball is physically different, the checksum is obviously
different as well.

On 31 December 2016 at 19:44, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Dec 29, 2016 at 10:02 PM, Oleksandr Kravchuk
> <oleksandr.kravchuk@pelagicore.com> wrote:
>> +SRC_URI[md5sum] = "3105b10b07dbc0b07ce2da07a2368359"
>> +SRC_URI[sha256sum] = "da483347e83a9b5df0e0dbb0f822a2d37236e79dda35f4bc4e6684fa827f25ea"
>
> explain this change in commit message as well. what change is causing
> the checksum change
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

