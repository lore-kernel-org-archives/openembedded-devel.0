Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxSm4-0007SM-Ta
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 01:31:09 +0100
Received: by eaal10 with SMTP id l10so148964eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 16:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=dkBqGDlxeBZzjsO6FO2BKOLwIG2kis5VqyIPDmVapKo=;
	b=v3kWzuLYLiX6Bp5jAK9oEGpJF3vCk0DTorKpVgIdoByGTSx5OmcxBDGjTy1WEwmgF4
	mh6/P0gZKDmcNTjJqAwmukBSxxcuxI6PlXLTIQ371J1YPFDZmZqy6jFoplWnp4+Hau+2
	WlrItp/6iB3NlfVNjfsAAa7A9WYLSQSQ+ZnQM=
MIME-Version: 1.0
Received: by 10.213.14.147 with SMTP id g19mr910926eba.126.1329265377807; Tue,
	14 Feb 2012 16:22:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 14 Feb 2012 16:22:57 -0800 (PST)
In-Reply-To: <CAO-TFnHKzoDatgkFEtmv6=wtioTkUsAto0k6FE63Qa9V7rCpGQ@mail.gmail.com>
References: <CAO-TFnHKzoDatgkFEtmv6=wtioTkUsAto0k6FE63Qa9V7rCpGQ@mail.gmail.com>
Date: Tue, 14 Feb 2012 22:22:57 -0200
X-Google-Sender-Auth: WkDaRgqCw0AwsLhqXfUvaNXxTSU
Message-ID: <CAP9ODKr+q9NXxvbTyqfDdxS7Ku0U3sMduSZjitT=_HN=JmEeYQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] vlan: Port vlan 1.9 recipe from OE Classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2012 00:31:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 14, 2012 at 22:14, Kelvin Lawson <kelvinl@users.sf.net> wrote:

> ...

 create mode 100644 meta-oe/recipes-connectivity/vlan/files/ip
>  create mode 100644 meta-oe/recipes-connectivity/vlan/files/vlan-post-down
>  create mode 100644 meta-oe/recipes-connectivity/vlan/files/vlan-pre-up
>

I'd prefer if you put those on vlan-ifupdown that depends on ifupdown and
vlan.

This allows for people that wishes to use ifupdown integration to use it
and others to not have those on rootfs.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

