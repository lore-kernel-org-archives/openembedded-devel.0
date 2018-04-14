Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4E40A60279
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 16:27:38 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id f63-v6so10978975oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 09:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f+fWMz4AJa2jkZ6UAdBurE1U23gEZbJxxCM53WqcGkI=;
	b=ZX5S1UnWUakxn2lbINP6H/7wK8xTUNpknL7wCXAIdbt4xIkDp23/qrhk1PmG7y8BKW
	cp0fgFgTRqxFBusZbP1ENY2ZqrZ2jmQWXudBHqkZP/0viFo8pLTw3vfLg4Bjcxzj3bS+
	wG4y79ohHNVaqSaPAiruxF6PjCN1IEo6HqbzSQXbEpghAVFF3zq4ZxHLwBsMSX/vh8EK
	PAHRlrTS42lFFtnJVS1GOgVkPwhcidEdBFi/W3/F00lL7/9SWgXrDYtjcSNNGDTdPsC+
	CbJ4iTmbyV1N8TMFc1VBQc6U+RUPNz7QPhesEq/EqoYRZu6zZwIlf0EOf/Bml0+MeATq
	x6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f+fWMz4AJa2jkZ6UAdBurE1U23gEZbJxxCM53WqcGkI=;
	b=GKEPU2/aRMPNlenIhegdbo5qDQnxfzV0/Ufr+IQusqnalwIiBho9MfVwIo1wzOaBUZ
	zpc9u6LOa+XrjnjJ349buE8/tShRDiWgTj2iiCahSkFZfUrrEWhTOq1M4Pz+ug8FXocf
	khcoajiFJjIjwzXy9FvYG2F3sWfes5iNxqrPTZezCGVNsc6dtN9MJGkQnEG9n/+3ndB1
	lFO9fHzkb68KBQfaUjFkrLal9jLE8Y58hc/+z9dDMLI+HeIVXvyaXIL9dFTVussII8lV
	abgThMQ0jDLhmxb4CPU+VshJhsPizoXItAJOeg68S3Sz5hrJ0dTuTbPmEK2vES2dB9EE
	HqWg==
X-Gm-Message-State: ALQs6tDWCXgba5/cHhtdT2z26+j7NujDF95IyRE+gXyrrNg1mVHWCLdq
	hBRYtr5TolykGsQ6PVRtJ9Y5h1+R3Bi0UROFLpY=
X-Google-Smtp-Source: AIpwx4/W8O1tP0oQW9YjMs+pryisOrRYt9ldEl0bOFeMZRRGpAEYpQ81MEY2HTfBT5HRryhkR6QrPzUWLcdbC91VmH0=
X-Received: by 2002:aca:afc7:: with SMTP id
	y190-v6mr11510441oie.285.1523723260156; 
	Sat, 14 Apr 2018 09:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Sat, 14 Apr 2018 09:27:39 -0700 (PDT)
In-Reply-To: <cf4f38db-e5bc-4e80-242e-89df77365fbb@windriver.com>
References: <20180322213741.29876-1-schnitzeltony@gmail.com>
	<0032ee42-750c-7913-52fe-332cff0f7643@windriver.com>
	<CALbNGRT+gzQURfbnL26rU7CCvdhEgBhHOLtQnY9F=979_27uwQ@mail.gmail.com>
	<cf4f38db-e5bc-4e80-242e-89df77365fbb@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 14 Apr 2018 18:27:39 +0200
Message-ID: <CALbNGRQve4fmeUsSfKd4r94v73zV-iTNfhm5o__=KWwb6YvHZg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/4] networkmanager: fix gobject-introspection/musl and cleanup
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
X-List-Received-Date: Sat, 14 Apr 2018 16:27:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 14, 2018 at 4:22 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> And the musl build is still failure, the patches of void-linux seems
> could not fix the musl issue.
>
> Would you do the build with musl?
>
> My build config:
>
> edit conf/local.conf
> ...
> TCLIBC = "musl"
> ...
>
No sorry I don't care for musl.

Andreas

