Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 64D12606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 18:15:04 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id e201so26748010wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jqIewGUtjTvWMtcmvuXIrg/ynjiCAlRDRnR6h8UWoMU=;
	b=hqlLNrbxanEL7r2vYoMrQdbde9IefO02mmr40erVrJnxAnBpXZsJ4Xe7m50Cbm0djb
	FvGg+yNWCETZz+VjCdJ+Y+skdeEi0QoOjgwEU9oCAE7lnH55GvupQJzLdlR0cTtvM33+
	P47e43auHSbqPb4z386+YjsOSDKhcuUIEBLKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jqIewGUtjTvWMtcmvuXIrg/ynjiCAlRDRnR6h8UWoMU=;
	b=OoYqibKXqGwRRpC6URmQpY0ul9huozGpA2BJ0Hy20I6rP5nSGv1c8kp/E4BFQHtkU2
	XTdA/nRIJMShYb37+U8ktF5HNycUytp9+cwo9roVTsOegKZWupgR7rz+l+LSV8189LHU
	Uw4eKgsyOQ9JnFQx06Qb3EAPkWASdlWX7g8Dw7xj1uYW/7LxEiw0HREIGOhf2AuotL1+
	5zGy191SbWaV7lYY/T0Oq25u43SOebJFCnkTNPQKLHeRnai3sPEGWM/MaFFGPTTwpX6f
	h5adKvcvOG6j0vqrGbmtUvgyLdXDV4QaaZIjxS5iumyclCsH/t6Kih7iazvWSgqIe0XV
	Z0/Q==
X-Gm-Message-State: AOPr4FW3GPbm2dkqoWWojKjgAxYj7zuir4UtKwXzHw0mehZf7iXbVjqpYokMrrqGASV8jzwDGWZo6RaA/gRSaNSq
X-Received: by 10.194.114.228 with SMTP id jj4mr21767703wjb.121.1461348905024; 
	Fri, 22 Apr 2016 11:15:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.64.196 with HTTP; Fri, 22 Apr 2016 11:14:45 -0700 (PDT)
In-Reply-To: <CAOd_LFx1kY4d6Gt=obRY3qf3gRD_SYbmrY+-Pw-yinbA85cE8w@mail.gmail.com>
References: <CAOd_LFyF5A_Xp5SGVM7cQXU=w3zhPeWsWVohb2V9VDVxMLwoTA@mail.gmail.com>
	<CAP9ODKrgiJvzB5NaH6GD2Sv8nt9nKAy=1kHzYXULQDLA9hd0_Q@mail.gmail.com>
	<CAP9ODKocX2ZV8SgatTYx6RhYfzngn_g6U7_Fq+jQHcHz7pYVgg@mail.gmail.com>
	<CAOd_LFx1kY4d6Gt=obRY3qf3gRD_SYbmrY+-Pw-yinbA85cE8w@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 22 Apr 2016 20:14:45 +0200
Message-ID: <CAP71Wjwp=NnRSsRj9=o6s4yTfMH+3LxhAOyDW_4pWjuor4XcyQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: anyone using docker for OE builds?
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
X-List-Received-Date: Fri, 22 Apr 2016 18:15:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 21, 2016 at 9:09 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
> Thanks for all the information.
>
> After a week or so experimenting with Docker, I've come up with a
> solution I like:
>
> https://hub.docker.com/r/cbrake/oe-build/
>
> Also wrote about it here:
>
> http://bec-systems.com/site/1281/using-docker-for-oeyocto-builds

thanks for the write up.. that got me into finally looking at it ;-)

is there a (nice) solution in case my host UID/GID isn't 1000/1000? I
definitely need to mount volumes for the persistent data , but i need
to be able to read/write these volumes from containers and host, so
ideally i would like my containers to inherit UID/GID from an existing
user on the host.

