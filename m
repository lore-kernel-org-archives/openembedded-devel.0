Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id EE38B600BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 07:10:24 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id y8so2885771ual.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZZzzECcNzNDc2GumSomYVDiu0eybfZGx6g+lgw/MaLw=;
	b=Qy+3Dl55uISF1lXvfFKUaukf7D1pmt7XXPipAWtkUtIKszY7XfuFROH5JGPeFXlSOR
	Nv/pP1eAf+36xZeRrVfCQiS1qZZqThWmwnk9EHqnFQNO1fsPkgbwwyCupk3tA9IFlVJ7
	GjAEL7t8h/O2Gwxzwy5AlqzGaCi8KP0u+F1dNO++lE2m63TZr29cQM2MfbIvtt5IoEoX
	P0zy75rkkmtPRXA6adgicW/yXecSn69BD5F9Rq9u4PLZiBEuXVoXBN4EJazLvUKh3ncX
	K36FVczUAWv/5Z17Ija+wENddT2RO+rlVBBGoVdcpELvLW0xnf6BXb88gGL88tdoCDuL
	pL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZZzzECcNzNDc2GumSomYVDiu0eybfZGx6g+lgw/MaLw=;
	b=nmkUhT4G19tlBGxmRptFpFGqTRiCqLOmnFJBxPerrUcjXksiEcqEcI0lYZvzzt6k4K
	87Q5QSiRf1UY3epXoBH1PekNKvuJVxIzZU2UCPqDYfrIcPsBm8HODj10Qz06fJ1jU1OW
	qq4eTmrx2BUiIZHhu3xjcLkoyAr3QVBXXH2JdgsQVUytRTnWhWuc+NuqJGNANAJEyv+t
	GwTpPto21qqoWAU5R+2xczsIcEg7NrIkKp3Y31H2LqPqrSM5V2K57X+aJlhqUh+W5D9J
	FnFj4bge0fqXGZPsH084lHq9Gf8xnKd01cpJafQl62Sbd+lyUDi6ceD49xXOWbJJfyzY
	yYfg==
X-Gm-Message-State: ALQs6tCega452RP5ZM4jvSVhNQ2Rp7K5qNxh8wzqndvxlfkeIKcL4iue
	S6g8mee0vgGrjSj5ZruThYPM0HcGwRS+ewa0yQSFeQY0
X-Google-Smtp-Source: AIpwx48XOoVBEl1a8+X4ep6HQ7yvKSjDIHZFeHMu8+DJ6McfJtBqH92tPKkR7hCkNDQ6bh95f7ryp4pnBnoeX2nwwnU=
X-Received: by 10.176.10.129 with SMTP id d1mr16529578uak.39.1524726625201;
	Thu, 26 Apr 2018 00:10:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.70.130 with HTTP; Thu, 26 Apr 2018 00:10:04 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
Date: Thu, 26 Apr 2018 09:10:04 +0200
Message-ID: <CAC+thW3RAbh6_2b8_Lzqx-UnE8xzFsW=1z0E9C1KXBukD02ecg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-python] README: contradictory indications?
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
X-List-Received-Date: Thu, 26 Apr 2018 07:10:25 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I see that README in meta-python contains conflicting information
about layer's dependencies. The introductory paragraph states that
"modules in this layer need to be independent of openembedded-core and
meta-openembedded/meta-oe", then a few lines below both of these
layers are listed within meta-python's dependencies.

To me, looks like the sentence in the introduction does not hold true
and can be removed. If you can help clarify what the correct
information is, I can send a patch to fix the documentation bits.

