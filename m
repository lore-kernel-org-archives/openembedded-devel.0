Return-Path: <damien.riegel@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id A7BB16BCDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 19:56:01 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k11so2203357pgb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=solHvECE1IblLHbaDCTRReRB96fJKww8azcJnYgL2CE=;
	b=IiBRW+HC2JwKCgkTfIL5tkkPZLQ8FCg4ylaCy5rA2QKROcezUCeMu/ETfKiOKrqg/0
	kvFYJJF5CWk5/+8JHlJvA/E5ZivF1ZJkwPZdtx1wqaAKseqeAV9U3RDAJvKHqBnDwRUk
	aSXxDljgAuMTslierT3fd+rxXyK3tj+CfIOhv0NubJMdeF+oe1EGMdBoQiwcO3sRQFLu
	Sfe4KaMl8eIBpyy13/l19lI827cw7TGNQK/G5EsrJrhts/cc4AFTezlOUogVTM7j0shL
	XIt5P2/eE+Q0fP40AM5FSWCo6ozt89oUV2/kmHoQExUU8N4LmGhbmnDKDZkJU9Pw2+Td
	M6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=solHvECE1IblLHbaDCTRReRB96fJKww8azcJnYgL2CE=;
	b=YYpBKSQoOa+/66KS6TW9bjPEgolefxTX+MR9kdjPuq6nnhXyakGLn8mtkRn4HzwJQe
	80lmdfJqACgwucYxcC0RKffkH3Z+dlJI5CFv27fuphOYV63r8Do65hTrbDWMEDWZt1d2
	jpKkqY+tNssgdI371/xwxqifNlGGLBvGlk+aEQgRXDvHCzK6F79HXkgRRNTI2BO9qBUe
	Y8c4B0NAhMZM7iTWpGxssz6pQPrZzJvUqEf3O3d6roZGYNMDbcGOJ65lK2TFLI63xEZp
	vwgWwXqP0OrmyR2BgbZpxclMgKwybPQaOZCEFylbc3uplGFle9v9Z0BjSFo5zwM2kvgC
	UijQ==
X-Gm-Message-State: APjAAAXUEO1xMIqbOn5mh2J7DAKRcx26O4K8G4rnww3E8nu0LzX8Hpil
	6jj3qo851rW7z5SqTJ5IZd9E2BPPCTkBbWRuQpI4QA==
X-Google-Smtp-Source: APXvYqxeFzQcea/ERCesIzuR//Z+9kgcPPpYWQ4wBopUnxJAeG6i7cFFksCiS0SqYNBY6HcKDMUP0uaF189gEbG0mQ0=
X-Received: by 2002:a65:60c7:: with SMTP id r7mr10950535pgv.37.1553284562542; 
	Fri, 22 Mar 2019 12:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190307211112.30386-1-damien.riegel@gmail.com>
In-Reply-To: <20190307211112.30386-1-damien.riegel@gmail.com>
From: Damien Riegel <damien.riegel@gmail.com>
Date: Fri, 22 Mar 2019 15:55:51 -0400
Message-ID: <CAL4iiOexopa=xYiKTWojG-=8n7-UdeCEujbFhSsJ=Z7wrJFk3Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>
Subject: Re: [meta-networking][thud][PATCH 1/2] mosquitto: fix build in systemd environments
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
X-List-Received-Date: Fri, 22 Mar 2019 19:56:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Mar 2019 at 16:11, Damien Riegel <damien.riegel@gmail.com> wrote:
>
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> The mosquitto systemd service file instructs systemd to wait
> for mosquitto to notify systemd that mosquitto has started
> correctly. This isn't working as mosquitto is not *compiled*
> with systemd support enabled. As such, systemd restarts
> mosquitto every few seconds.
>
> For reference, this was introduced in commit a483d344d9fb
> ("mosquitto: Make enabling systemd also enable build dep on systemd")
>
> Because we build mosquitto using the provided Makefile
> infrastructure, the solution is to add PACKAGECONFIG_CONFARGS
> to EXTRA_OEMAKE, so that the required make flags are added
> to the make command line.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
> [Damien Riegel: backport from master]

Armin, did you get a chance to take a look at these backport patches?

Thank you,
--=20
Damien

