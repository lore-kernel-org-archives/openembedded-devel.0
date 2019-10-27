Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id D325A7F8AE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:33:20 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id s17so573961iol.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=gChB5il3qP1nyVgnEP5WmxYLMQrvxRDVnxz5eWLzUC4=;
	b=gQ4zofPELzwm//r0iZe63wmuwF+goD+CJHkObxlwPMhj9IB7sMcAuyB98gZ+4IVa2y
	jBwxEeAmWTJSqzWP9r4vb0p4X8UvdCU2DKIoEL5ur6Sp8/evY60AQ09qlsPRBZ8XEgTQ
	IE6YDzXfgrB1O7uoxT4hq4KX03/qYD8J0gGOaw0xkxAa4IdBIrD0bsfUC+wC7eSe+/R0
	O7sqYnhtVnbu4TSaZ6UV7QAtJoUtVp/x8DU1Xj/HwlKQoIUpge6UvqyzLZZFqr6MaVmJ
	a2J3sfCrAMyWpkNRMSIzv9/gJAGW5jAeNyyD9MLTn9U/MuBVKjIBFUk45bBXcwNFlk36
	LzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=gChB5il3qP1nyVgnEP5WmxYLMQrvxRDVnxz5eWLzUC4=;
	b=jI7Db+RWjEHXc73KUX3nrzISkYejMTMq8UfwnBU/At3QMsRvx1A7a5zCbFT0UAAI0+
	T8Z5H8S+qjY96a0e7mPaQFeWKbOaLJj9HQH6TunXhMcTrfkwDsvO5HphwZ1Xbg9jM3Up
	w4Y97j29qxR8K6jW9CsogtyKqeBxxv8L9XUc2zqZ2Wz/h6O0Xh/fHT3q/tiIn76whukW
	lybZfvPYkuIW26dAKzNacMczjLYjRXPsYieMdpE8OgZYlinzeLEcC7wTTSUYlQm3/TGu
	GsIRF6HTxyFNq3stvjRzaN4di3hKqHNB7P9U7FyLfs3hGg2OT0yzfDROGSK8FId5GFpU
	589Q==
X-Gm-Message-State: APjAAAWn9TWNCcISUhmRMbz9ARxEz2J0lwlVigLbCisZey0Rfp5pXzSe
	wanfMqhx41b8e6hV5Vz631e5I3cahIfPHR5Q7RU69cTf
X-Google-Smtp-Source: APXvYqzE6UgUs6Yci6asL9pwEoxhiqUzYoQ4ivOpoVxh4MkAnEH5o7iusNgZqng2Dy2GhonRQHNMm26XFl6AzF6tpME=
X-Received: by 2002:a05:6638:6a6:: with SMTP id
	d6mr4693176jad.21.1572190401428; 
	Sun, 27 Oct 2019 08:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 27 Oct 2019 16:33:10 +0100
Message-ID: <CALbNGRShkF=Qn1nSD5MaavPUN0hr9VAYaZ9GfhUUh_ej7e7rsQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 00/15] Upgrades & GNOME preparations
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
X-List-Received-Date: Sun, 27 Oct 2019 15:33:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 9:21 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Upgrades & tiny preparations for GNOME crusade
>
> Andreas M=C3=BCller (15):
>   gtkmm3: upgrade 3.24.1 -> 3.24.2
>   geany: upgrade 1.34.1 -> 1.36
>   geany-plugins: upgrade 1.34 -> 1.36
>   libstemmer: initial add 2.0.0
>   appstream-glib: initial add 0.7.16
>   yelp-xsl: initial add 3.34.0
>   yelp-tools: initial add 3.32.2
>   yelp: initial add 3.34.0
>   zenity: pretify recipe a bit
>   glibmm: upgrade 2.60.0 -> 2.62.0
>   libsigc++-3: initial add 3.0.0
>   ibus: initial add 1.5.21
>   libgusb: initial add 0.3.0+
>   colord: initial add 1.4.4
>   colord-gtk: initial add 0.2.0
>
Hi Khem,

Just saw you added some of this series to master. Since the
zenity/itstool issue [1] requires rework on many recipes please
ignore/remove ALL the pending from this series in master-next - I'll
come back with a reworked series addressing all issues.

Thanks for your support and patience

[1] https://errors.yoctoproject.org/Errors/Details/274743/

Andreas

