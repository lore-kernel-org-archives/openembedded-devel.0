Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id D95AF6DB3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 01:02:08 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id db12so3059498veb.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 17:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=AST/icQakFN4qhghgGiaeTia36U+E84gsya3gC+70tw=;
	b=H4Byh+DIAw30q31F7BcYnMpZ2+KTGM8G/WHiXn4NEf9Ztj+qKjWMT8gTdnjItfZAWj
	mqyCZkNUWWp7C7lSyURMbi7d+9w0ROojRtTRZ9iM/nT17Wl78ffCfrX50VDOMJt7VSuZ
	y6f+qoMEpowxxNrWfDVTg0k68eJtqrnO6NCVq7QPlZ6QY08LkjnPaz1VvAqU0SS6IShg
	ywyco6GA/GZ530s97L9aMTRHRmuOlNVQcMZU/OKPF0XuVB6cZ/7KPi2xSkeaa8C/5NqA
	DUH6tF6+bVXcEFBRtOxMfjFebAQol1/wj4KxXbfq4jvmOBN7fSsUMNMCQ+NnXXam9ax1
	9qsQ==
MIME-Version: 1.0
X-Received: by 10.221.29.137 with SMTP id ry9mr8312406vcb.6.1393462928980;
	Wed, 26 Feb 2014 17:02:08 -0800 (PST)
Received: by 10.52.169.99 with HTTP; Wed, 26 Feb 2014 17:02:08 -0800 (PST)
In-Reply-To: <CAJTo0LZVQMrn8bjH2YfTqufsQMHX5YWi61T3t8VRY4wW67uAbw@mail.gmail.com>
References: <CAFeBWL7cBFK-VH1NkGr-tMbM_wDvCGNxWaZwxEt9NJoECVS-QQ@mail.gmail.com>
	<CAJTo0LZVQMrn8bjH2YfTqufsQMHX5YWi61T3t8VRY4wW67uAbw@mail.gmail.com>
Date: Wed, 26 Feb 2014 17:02:08 -0800
Message-ID: <CAFeBWL4pt83gQBzKi0PddJUDto_uh99zs2eZfx4h5pW8cEk39g@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: NetworkManger's glib schemas are not getting compiled
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
X-List-Received-Date: Thu, 27 Feb 2014 01:02:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Ross, but adding gsettings to network-manager-applet's recipe didn't
work. I don't know how gsettings work, so I think I will take a look at it
first. Will update soon.

Thanks,

Adam


On Tue, Feb 25, 2014 at 3:35 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 25 February 2014 23:08, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Hello everyone, I'm on 1.5.1 at the moment. My image includes XFCE and
> > Gnome's Network Manager. The network manager applet cannot be accessed
> > because the schema associated with it is not compiled.
>
> Try adding "gsettings" to the inherits list, that should handle the
> schema compilation.
>
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

