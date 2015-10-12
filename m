Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id E09BC76E3F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 13:54:54 +0000 (UTC)
Received: by qkap81 with SMTP id p81so58469479qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 06:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ryJHWo3T2mEOq/yPblgKPkYtfLIqi1dqeSEhpQppR90=;
	b=M5hgO4f+EopBOsBTyBSsEK6BwQq6/aOOtoki60WsGUySWzKhKkAObL3NQ+0STxY34U
	7zmvvAn4LxaSLfDqkkhn18L/Zr+VUANuP2hRgQKLV35VQN/nEG3iaXuKa15RNAe95G9l
	jgvFRS9Wie4vw155gvrSq1Z+L/8ToFBFSvkIVs1PzpE4nhmH/vSH3gI9ZzlfxNv8qyvK
	y0VYgY7Rnkzdj+11AXo/+TsJplfWV2o5xiOvvOoFvD9FwLjrV3/uitiH4duw849CrTa0
	Las+2O4igTEpzs40H8hrGBsNXzZmKHbqk/HQyLauXkCPFiGJ4ztoqmYcX5898dqfI7y3
	WhjA==
X-Gm-Message-State: ALoCoQnWd5dFEbAZkTaYLecRBQk+E6Y8fT04IF5wFIoGt2SGsivEYkdlZwTvcqbvc7nynt7SDI/A
X-Received: by 10.55.209.147 with SMTP id o19mr31974825qkl.61.1444658094636;
	Mon, 12 Oct 2015 06:54:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Mon, 12 Oct 2015 06:54:35 -0700 (PDT)
In-Reply-To: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
References: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 12 Oct 2015 15:54:35 +0200
Message-ID: <CAP71WjyDYcoZTUt8osX-B=kwR_Opis8te0EFdn7vypKaztHoSw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Recipes draft for Chromium V45 and V47
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
X-List-Received-Date: Mon, 12 Oct 2015 13:54:55 -0000
Content-Type: text/plain; charset=UTF-8

hi,

On Fri, Oct 9, 2015 at 1:31 PM, Zoltan Kuscsik
<zoltan.kuscsik@linaro.org> wrote:
> So far it is tested on Wayland builds (ARM 32bit and ARM 64bit):
>
> https://github.com/linaro-home/meta-browser

just for the record.. I am using/testing this set of recipes on
IFC6410 (armv7) and DragonBoard 410c (armv8), and so far so good.

it would be good if the helper script google-chrome could parse a
'default' config file, so that as a downstream user it is easy for me
to hook my own customizations in this script, something like

. /etc/default/google-chrome

nico

