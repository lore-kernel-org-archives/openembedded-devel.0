Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9D21078981
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 08:39:25 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b15-v6so12443713oib.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=vS6MqXMs1yarbbkXgFhsIJiZb6Xcy3akwCNpb1e4psI=;
	b=iEHk/5aXd2ppGp9AMKI3OOzZDLJmQdlC92PDiR6TBIXyunp8IWV+Yk8YdJDI3BDQc7
	TJFasNMQDQhKilBtcys3gIHyFvCGFSusV5t77S56gO+yO4NeUOvFGdeL2GkXUvLATG4R
	kjgjem4Peup3lIu+G4GTNvRHmKHqDsdANFhx5aszS6nPCTz8MimtyMA7CDJosjPjr1Au
	u/n0fon58e+dwi2Pt+17j2EJQC5ZgMuftnTsMqUP2xtfQfa+5BbzI6zIesaeKM1LEn4+
	6xeQBcQxJ9mvmafIAA7vdZEPRVwBWF2opUmmxQx+//Ow/gYBACs1E9u/ixYP7vJrMfrO
	U/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=vS6MqXMs1yarbbkXgFhsIJiZb6Xcy3akwCNpb1e4psI=;
	b=GVYEM6iDlDuwglTJtwGE0ZVs3Z1Oxukeb+CMSfsb/Wp6kreK6a+nGXo3qCc1XbpUIx
	i5Srp2qvY8n976vcds3+FCy4KWUMfEOVo7vQeFeIQyAsMb4czqhydaaOobaaaopWEOkp
	Y7i4Gqi/weIW7+U3qwtJXccHHVAe7SnWA7HmBAWbRsednRrw7s07g36yUEy/KSNGa09I
	29TbvysM19rojmPT/+ymXv1tMwGLMHr8nfXexnJDLntDZj6ZD7ppM6dBXBDsn601ogoJ
	4Ca+HZ1FIoPMAO9d0AZLjjDkOjvBodNcDs3txAw09Mu0Z4FR8Jh3sb/W0FNonkcfB32n
	dvfQ==
X-Gm-Message-State: AOUpUlFqZN5tKRJlRQ+yEHFDFFz/ZVQj0ydx1muztXOLNqbModFMoc/p
	GlHwpYNpuBannjHnvR+7TRKdxtGcgVO+bw==
X-Google-Smtp-Source: AAOMgpeDNg+nanzXmp9cMG7EVn/ayclcKXIIWM0Jd2yjkoepMyT8bdn5z2+tIu34CWVEMRi2yVYCOA==
X-Received: by 2002:aca:44c5:: with SMTP id
	r188-v6mr2261113oia.280.1532507966046; 
	Wed, 25 Jul 2018 01:39:26 -0700 (PDT)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com.
	[209.85.218.42]) by smtp.gmail.com with ESMTPSA id
	n188-v6sm10124230oia.17.2018.07.25.01.39.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jul 2018 01:39:24 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f42.google.com with SMTP id k12-v6so12443005oiw.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:39:24 -0700 (PDT)
X-Received: by 2002:aca:e504:: with SMTP id
	c4-v6mr2575506oih.246.1532507964114; 
	Wed, 25 Jul 2018 01:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <a0731f9a-83e2-9ea2-a04e-191ef3793e74@skidata.com>
	<CAP9ODKqDEZ8ND4K3SEELY2mTjALCX5rzWLxjD0Vht7RFTVZ6cw@mail.gmail.com>
	<20180724152529.GA19585@mail.itconsulting-heinold.de>
	<CAP9ODKp3_1iQybyE0McSFUbd7YFPoPbD8HVy+qu05aP18zvwKw@mail.gmail.com>
	<CANx9H-BRdfmLO1vbeFocn6RSOmcd5F73hB_bYQqOMsc5o_nPSA@mail.gmail.com>
	<CAMKF1sp4c_LFSGWKvkQ_bdi3Qz3maQO5k+mo1ViYNxxKAQ_5sA@mail.gmail.com>
In-Reply-To: <CAMKF1sp4c_LFSGWKvkQ_bdi3Qz3maQO5k+mo1ViYNxxKAQ_5sA@mail.gmail.com>
Date: Wed, 25 Jul 2018 09:39:12 +0100
X-Gmail-Original-Message-ID: <CAP9ODKpyad5xfNkEf6+SxiW90xr=BT6=5Y3VFtv1+z5+NXFY-A@mail.gmail.com>
Message-ID: <CAP9ODKpyad5xfNkEf6+SxiW90xr=BT6=5Y3VFtv1+z5+NXFY-A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] bug-tracker
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
X-List-Received-Date: Wed, 25 Jul 2018 08:39:25 -0000
Content-Type: text/plain; charset="UTF-8"

Em qua, 25 de jul de 2018 06:38, Khem Raj <raj.khem@gmail.com> escreveu:

> how about gitlab ?


Personally I prefer github as most people have account on it and are used
to it.

