Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1583F7CE4E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2019 06:43:11 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h6so63034191iom.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 23:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7RonPC+WGJY/AIsJ6dYLZhIRhTbj/snkSHCz7rWlREc=;
	b=VWnVmYMs71Tcd/HxrQxEl7nQDLEcMX95YPJmz2ol8zc2TpSPfj15wwtdZfLaGtF6/8
	WqpBdcHSQdu17OFcyG0ogQbVOHxJGDEdHmw98/Pi/wsT0OKwUT5nHl0kL5eGU9JNrbem
	3YRl8ToGS0gokPuDvLvuLUrjZsmnaeKElnMw9XbQqCByOohIZixCsjxouo7MFH9BRVoA
	sL+X3SuiHxYbqKVNWNpPTcISv0Jpbbn7qOiTy2NLeGOJm7OARqziyuDjHKu46a5k5q79
	bdM/0YuE/YZzAhizuZuNz0vRPPklV6IrHOIp9++5/rESlEWYR8izsd4pzr6gRBgDfgpj
	zb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7RonPC+WGJY/AIsJ6dYLZhIRhTbj/snkSHCz7rWlREc=;
	b=ngscAFJoT4F0ax8oCREjLlfL8B+7DQLpRddprDd/QviDYVjX8JCAcBAgaDJVJOld6a
	fPdPWU3cJz9OQ+p8hbxcIpwUcBrUvgm97jO2LGYIjxJ6j9PTyZafLf1CY01vgJKjszgR
	alVSelNxOcURlOLbCO3ic4m/STk9CXXjoVEPhgVCiE9yx0t4tpjbOv1x+lWQ1XTRvYEq
	90RrWSuovicVTuWmUjRRef5i4lCkoqs7uOL5G/sAnYXIbjvQo9SKGXAslbAQMU+QZWrH
	hbsmmo5w1Az0FfPWekkcLQvoGNTEG4XktVB6V9Ouc0zsUj/ono0DyLz+z91k8b849AHO
	KKzg==
X-Gm-Message-State: APjAAAW4tWJbtdFuZdDflDxEoa9+fhU0R0ndZsx4BROd10Fg1oq9ehBt
	wrHn42+lUNuxqX696Hazr5W5r94vjOymaP/iSbI=
X-Google-Smtp-Source: APXvYqxNHZHEGiV7K4tQqN+61MNZ2j3ALpe+ASLYfBTP9utIiy0D0oaNNdlJ1VuejkXjXzKkXBsDXgjfRbXBNEI1a24=
X-Received: by 2002:a5d:87c6:: with SMTP id q6mr31384566ios.115.1563604992948; 
	Fri, 19 Jul 2019 23:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190719134256.1854-1-alex.kiernan@gmail.com>
	<CAJTo0Lb7E-oe-X_mZS9ESDqOfQyGnJQ=D=SBAGpmCh=MOZsgQA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb7E-oe-X_mZS9ESDqOfQyGnJQ=D=SBAGpmCh=MOZsgQA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 20 Jul 2019 07:43:01 +0100
Message-ID: <CAO5Uq5QeCwrEOkVLtqG8MkZ3dku+PM0cz2kfzLheVwTmZ=z6eQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] zstd: New recipe
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
X-List-Received-Date: Sat, 20 Jul 2019 06:43:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 19, 2019 at 9:45 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 19 Jul 2019 at 14:43, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > +PACKAGE_BEFORE_PN += " \
> > +    ${PN}-compress \
> > +    ${PN}-decompress \
> > +    ${PN}-frugal \
>
> Is there a good reason to do this?
>

They're cut down versions, so it doesn't make a lot of sense for them
to be in the main package - I guess you'd really want them as
PACKAGECONFIG, but upstream builds them as completely separate things.

I should probably pull them out to a local bbappend as they're likely
not of general use - my use case is only for zstd-decompress where I
want the smallest thing I can to go inside an initramfs which then
lives on a 3M boot partition.

-- 
Alex Kiernan

