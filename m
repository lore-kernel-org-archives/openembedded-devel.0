Return-Path: <timothy.godfrey@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA0F74AD2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 01:11:28 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a8-v6so3983265wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 18:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=+gSA2yFyHOXNBE+bk+8xWjHj5GuEIftIIdXgTDOYlpE=;
	b=B8IdD9YYhSmmf20yfmLQD+wIqyVQZSJzUgHYDx2eS9WNuMHJDPOpeT00zS1bQtU0RU
	k+vMrURS3hWYJ2mVbz9mUmGrFgVPCLGMpvGohy7yC7t99aCAcKru5C6pu+Q1L7zjamXC
	KIEo76y8zGTDt+XYt8iohs6UNgxNNRUwu0GZtP/4wZZyvaHL3mF7Jubq/GBdKk1xGOXr
	S66/oASzBkyqLvoRIAvx4iopaZO/GxExulw0qX53BzuppGMMImLz1NQqmEond24oRMsX
	ApFixg6xWXBZtLgy8WRptu3ZzQpKi7jr0twjEFsPqt7PK4+xQQpGBmblct5MFabw1b+O
	M6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=+gSA2yFyHOXNBE+bk+8xWjHj5GuEIftIIdXgTDOYlpE=;
	b=fKSLJ3DkVrKFmNROoUh0xBIW9QYtrTw8zFfdlt2PSwy/iMj69p7BIjOe/YtSjIB1Hh
	7dhzLUeCSZrsJcoKtBgqbcc/H9oQL4Wb6Ml/Qm/xJkjNem5+wEYT4EZDbyamQTP40aH+
	qWVcBXvLJn6mS5qoknBwMoPlu8Hkf92Uy/EOyxDJWE/XNv3O5pZ84r0ydlKIn3+YHbgq
	ikGBlQVmkPxVXGsONr6BSBpY4jox02nVFWZpobMogRz7gZrSsWagCLDXRj16e7cISrZn
	sKfEVwZdJQ2VbQ8m3ApRBFXuPTEUN3mcwXMkdgBVNOlQ+hWJUDVKQqYLqUhzw0z5uHdz
	0Q5w==
X-Gm-Message-State: ALKqPwfaOrbxZ0wyFSzA0vBBAxUrIU7qdumYV3CBzZh8jYpJAoODv90X
	B46meQuaKD85lfqYxQNDoSQbWFsuZH0taQq9lA==
X-Google-Smtp-Source: AB8JxZpXpms6wxWY2CdJOs6RnA1ySAgpbmQ+ELzaxW57QPPORZZ8SjE2kQq/pJwkwSVbrSC2Yw2QxWzmbXKKLaZg2jo=
X-Received: by 2002:a1c:37c2:: with SMTP id
	e185-v6mr143918wma.20.1526433088606; 
	Tue, 15 May 2018 18:11:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.65.6 with HTTP; Tue, 15 May 2018 18:11:27 -0700 (PDT)
From: Tim Godfrey <timothy.godfrey@gmail.com>
Date: Wed, 16 May 2018 11:11:27 +1000
Message-ID: <CAHb6uwenTne-a-uAiM0cB-xfjM5gH7324M+_UcOgm7y4b=KSTA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: libatomic RPROVIDES
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
X-List-Received-Date: Wed, 16 May 2018 01:11:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hello!

The packagegroup-qt5-toolchain-target recipe has a runtime dependency on
(among others):
 - libatomic
 - libatomic-dev
 - libatomic-staticdev

and I got an error (building the meta-toolchain-qt5 recipe) complaining
that nothing provides it. Meanwhile, the external-linaro-toolchain recipe
makes packages for each of those dependencies but doesn't list them in
PROVIDES or RPROVIDES.

Is there a reason they are not listed? Would it be more correct to list
those packages in PROVIDES or RPROVIDES?

Thanks!
Tim

