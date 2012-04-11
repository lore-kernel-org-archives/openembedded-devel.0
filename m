Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHspk-00045E-Mq
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 10:23:20 +0200
Received: by dadz8 with SMTP id z8so853370dad.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=xQ5gOe//p4nDoI10/RIHJfrAiC4VX1iGE2gDkL3GZDY=;
	b=Tl5SoguANI9ZUkSxLdiIecxyKgwA92L6Ro91MlEA/E/U8pTLkfXgg7q3iANrsi4E4A
	DcZBHEVsemkZB1JEximUTVQEwTz3vhwehTdxADDIWnrj3/2htyjjQM4D20q5efa8D8rJ
	BDxZMvPPU3AJ5LDjVvGxwHpv/3VJ4+UWBfghUsasD10k/ylaYwKcf2SfRZ1hH9XJCyeW
	vXzJLteKrXfHYHWZ9fbiA8emTqwFRFcz/xh+nrCWFCpsEaSYBIFxnui/QuB6lKuWYko6
	GD59PCadQygXyQbf2SCZC+l8wSr2C8/aE2NPfktbQ3UhdEkvPjZK5YrKhHJizgXQ/o1t
	ltvw==
MIME-Version: 1.0
Received: by 10.68.220.134 with SMTP id pw6mr35411912pbc.149.1334132041160;
	Wed, 11 Apr 2012 01:14:01 -0700 (PDT)
Received: by 10.142.180.4 with HTTP; Wed, 11 Apr 2012 01:14:01 -0700 (PDT)
In-Reply-To: <CAAQYJAs1049A9Re12=8925Y12eEQ=oCt6wA-OepbqEzSxFwJoQ@mail.gmail.com>
References: <1334011736-9053-1-git-send-email-andrea.adami@gmail.com>
	<1334013627-10533-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAs1049A9Re12=8925Y12eEQ=oCt6wA-OepbqEzSxFwJoQ@mail.gmail.com>
Date: Wed, 11 Apr 2012 10:14:01 +0200
Message-ID: <CAAQYJAvBiKE-njwGHr4cr_OC0N3Desd-YC1ZzQcdZBwzjP2Rrg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH v2] Initial commit of linux-yocto-tiny_3.2 for Zaurus
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
X-List-Received-Date: Wed, 11 Apr 2012 08:23:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

With the help of Darren and Bruce I'm smoothing the last rough edges.

The patch v3 was merging the two .scc in one but this was leading to
wrong .config.
The patch v4 did resplit the .scc and could configure valid kernels.

Patch is temporarly available at:

https://github.com/andrea-adami/meta-handheld

As it is, the linux-yocto-tiny recipe builds valid kernels: some more
testing and I'll resend.

Regards

Andrea


