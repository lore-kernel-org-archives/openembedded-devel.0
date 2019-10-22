Return-Path: <marek.bykowski@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 97EE97F69C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 10:03:23 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id x4so6278585lfn.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 03:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kTmTqXnWvb7Os/wmGiiTSDM7l4t4EUFr25Rn3u9h/8A=;
	b=qn96Kx/ZwLNZ26SnXUHVcNeQUgfPu9KIQn4k8Kr5K9xuoYqhnpIwZv/StYMJoerJIO
	NITMPcakVF2qPJeab1pL16EptWcp3x2dAJv2fKMj3CG5VuWmHr74qG3nOQGo89teUnXA
	wQauXqebO1UhNPJguHYRzbVZ9eVMHVhwdl8ykcCvtklVySAhm3vZ9/TV6ucf70wKFzU0
	vl984DNxwh7VAnM9bHwQTKFhJcudwWfij42/5RYWBqUT0sH/SxNfnIPFpKgAx4etaoR0
	ZkLE9rETUohyaIqdhiasiEwPYrOMP6CzIIx9ulB4I1cTOU+hnOuF7QjNDFhPFGO5Pn+S
	oftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kTmTqXnWvb7Os/wmGiiTSDM7l4t4EUFr25Rn3u9h/8A=;
	b=PfQgGNy5p/ySElAlIuVetNbSfbrYaGpBGRTe2iN0FqKoWpU4mGJ/kx3Vl1PfxVp/U5
	PND3vo6pbgIyrYU04fElPP5SnpXxQTuKwwdW+iY3IGIiPMQ5ivkRVHVvM44Op4cKdDwA
	U8i8qM8UuoScbxXZWJ+mNARUvdPLAUDD0FCvaUljiOijUPUE0IPAl7U0LCtLpMDDWQnd
	KUpPHC/DWPShuoTslTKq8tul/ZKJz2kdYuHF47TZu5IouRkIvKM8acMFby1C/wTPwhKR
	dPBDplyRuXKTDB3PZZxx0X2ukz9Gy+PeTGzFR8sZr+VXOAEOUpSoheSwyeTDWesobtAi
	/F5w==
X-Gm-Message-State: APjAAAU/Wh+lzk2wW/r03q6Ppg7fHOJYcuBTi0ftDzPgodQQoBWjrCLy
	sa8q5Rq1/IjT/sHjAGiqlHE=
X-Google-Smtp-Source: APXvYqwJzjXJsGSH6rve8K9QQ7oiAl+LHGaotmnGbBdyg2iZSfo8/nz6DVo4YuyZzCJQFLdiFNCdXA==
X-Received: by 2002:a19:f107:: with SMTP id p7mr16450073lfh.91.1571738603788; 
	Tue, 22 Oct 2019 03:03:23 -0700 (PDT)
Received: from localhost ([78.133.233.210]) by smtp.gmail.com with ESMTPSA id
	n25sm6981496ljc.107.2019.10.22.03.03.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Oct 2019 03:03:23 -0700 (PDT)
Date: Tue, 22 Oct 2019 12:03:20 +0200
From: "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20191022120320.71fb6436@gmail.com>
In-Reply-To: <20191022091523.60d5434a@gmail.com>
References: <1571141621-20235-1-git-send-email-marek.bykowski@gmail.com>
	<20191016104557.GA7998@localhost>
	<20191016142112.10a645d2@gmail.com>
	<CAMKF1srjpre+zbi6Q2==McOEvV8njBdzqOf8nGxor9NN5tMoig@mail.gmail.com>
	<20191018134224.62ca6095@gmail.com>
	<83e0f896-8ec4-df4f-d14c-256cb70774c1@windriver.com>
	<20191021113018.3c684d51@gmail.com>
	<0411e8da-91a7-f586-2d65-490e8c327c2d@windriver.com>
	<20191022091523.60d5434a@gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCHv3] lmbench: Fix/clean-up the build for lmbench
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
X-List-Received-Date: Tue, 22 Oct 2019 10:03:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Oct 2019 09:15:23 +0200
"marek.bykowski@gmail.com" <marek.bykowski@gmail.com> wrote:

> On Mon, 21 Oct 2019 19:42:45 -0400
> Randy MacLeod <randy.macleod@windriver.com> wrote:
> 
> > We have had Intel employees working on oe-core / meta-openembedded
> > for years so I hope that you will send the commit to that repo on
> > github and indicate the
> > upstream-status in the patch what we integrate into meta-oe.  
> 
> Hi Randy,
> 
> I'm Intel (actually a subcontractor to them) working on occasion with
> Daniel Drogomir, Charlie Paul, and Chantale Ouimet from Windriver. I
> have put the names as chances they may be your colleagues. Even
> though I'm Intel I didn't know of lmbench Intel repo on github - this
> must a totally different team. Sure I'll send the patch onto that
> repo indicating these are the changes integration planned into
> meta-oe.
> 
> Regards,
> Marek

Done https://github.com/intel/lmbench/pull/9

