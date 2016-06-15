Return-Path: <henry@kittyhawk.aero>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id E247160761
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 02:12:39 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 62so3398917pfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kittyhawk-aero.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SIhahkNGiHIzU1LH8QXhFjBxi0PSy12i1IRfv42M3H0=;
	b=A7wDbTPR1R07f0q80TmrfPPrJ8p/+lcGvqlektOOYa5g+tFiPdn+mL9zrP3pOVCICB
	9pxCKdVOvNEq1pGeCSNPqSeWjoO4LHidWeQbcuR/jz/By6BOCz7DAMAvSolhqOkIcaBz
	vVWcsoD7Fn/xiURfaIAzr/UHwpjiE9h/3zGP/3tYvRwmsynWTBZWZwTXiYd0xBK+YO1j
	mH7WNtACmOfM7sBCnXPg1zmo5HorKjwz4WLXKmJdnOan+ZMEpnt1Elwg0iDr/0ztq+2u
	iGbOMQSe1GaU4UARJNHl6iXtV8zQCDs/ljYRHyLHbmr/O0PJ0pCYmxmgCzu6ffwlBsFs
	YzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SIhahkNGiHIzU1LH8QXhFjBxi0PSy12i1IRfv42M3H0=;
	b=jyBO8JKv1/6Xs9N4QDt9WiKHD8rsE2zhDHENc/RzSuE7wwHgDmClbSSdlZn7UsSk4u
	TzW1s3Vt6rQJo6FWxla3iiRG9t+l50kuqdwjHj+Bw4rzksUVEy4eHrYWM/iPICQnnCl6
	DzPxkuyuMRDiR62+CeLPIPsOH6Htr6owh8ZsxlvHLpW/pwH++GUdsb1gEBTJM61pga6/
	tYkVxpXOCKBc0/ZwARpGqeY8waPy0N73jSI8UuRbWXn99uQ9WUlAGJ0GIHgOorpH+UAb
	Np3ZhuFAItlBEUvwuDfugs9O+DJwIHG3+rMVCNHNX6yWHO5Ecwowluq2wug5NsjXZUhS
	FsRg==
X-Gm-Message-State: ALyK8tKGwK2as5hKotLTSEw8s1NarMBgWSPuBIZajDJBN+3RUXa7ntQ07TM3uYkQIhHIaMez
X-Received: by 10.98.192.12 with SMTP id x12mr958678pff.106.1465956758873;
	Tue, 14 Jun 2016 19:12:38 -0700 (PDT)
Received: from hhz440.kittyhawk.aero ([66.201.63.226])
	by smtp.gmail.com with ESMTPSA id
	vy8sm48301871pab.22.2016.06.14.19.12.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jun 2016 19:12:38 -0700 (PDT)
From: Henry Hallam <henry@kittyhawk.aero>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2016 19:12:19 -0700
Message-Id: <1465956740-84841-1-git-send-email-henry@kittyhawk.aero>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <CA+chaQe1rcKeNpny-bpghrLtz8eOpghos9jBPf95obvbC8ucuw@mail.gmail.com>
References: <CA+chaQe1rcKeNpny-bpghrLtz8eOpghos9jBPf95obvbC8ucuw@mail.gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH v2] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Wed, 15 Jun 2016 02:12:41 -0000


Patch version 2:
- No longer hard-coding paths  
- Fix missing build dependencies, depending on PACKAGECONFIG features 
- Split off chronyc into separate output package
- Default config points to openembedded.pool.ntp.org rather than
  pool.ntp.org (which should never be shipped as a default)

I have applied for the above NTP pool vendor zone per
http://www.pool.ntp.org/en/vendors.html#vendor-zone

Thanks, Henry

