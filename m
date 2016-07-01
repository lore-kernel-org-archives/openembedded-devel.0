Return-Path: <victorascroft@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 85C0160124
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 18:27:20 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id bz2so40849175pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2016 11:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=50oogiYf70JfgTt/hiKE86vqcKeNacAtlDRqv1FgJg4=;
	b=PEAB3uqVwXANIG1CDhc8VzIB9GhKBbpIMnfYMsyyL8dh4fjsTxdI6XcyepDhmrKbZE
	x0UIL8HmkSeib3yVKAFUlqOhIKDWEGG+X752S7/iqRGJgRalBpTNdzbRyEjDjQK5W9AZ
	BK7I9VKkiGrdvoBqK7CBtZP1BKmPsKzhOa/4fE5Ejo7ffSbI14Gyn5yTXIagnGZvT+UA
	MEG+JUvXwsTrhKrhjTxHVsMcxNAyV7BOcBYJ0HoZP56diR0yFZdIKXJUbydFyHMaqzx5
	cE2oSAg0BxczBCGM/GfJzVDx7TziiiZbQriqwQKAfo+XKnCwln6iTfMoO2CPhjkQtggN
	kOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=50oogiYf70JfgTt/hiKE86vqcKeNacAtlDRqv1FgJg4=;
	b=P0LOXrdzLhjGmlspPAF0sNaySWKU6qfwtFXbcI/r/sqsQiMWU0OzfXgNC75DzzjAdx
	fUQoH2Kl8cizM6R1Tf1dQxReqbcnUW7OibvNdfpFZR8i23gmpHtopMmXOPj90ua4plys
	xQ8vgxuAJxqO0iwe+IQBViJsTgmq8B1F5obf1clyY2VzrC6mhnvnfPp8fjGrF1Xd66Wj
	sCDGbgcyBITQp87qgxtS5vQZ+/hNMSCSwFs64uoQS9tEvvtc8mjP9Nh88lkS+vy6o0Jf
	hDJdYf+KisZNmTYk4T7nj8a4tHRTyUAovXMr2FidevQmTl0nL9/9nIWK0kE9rOjct8xg
	Dptg==
X-Gm-Message-State: ALyK8tJRWXxSFYOa9kcwm32dMczEaAETYT0oBd+NcrkkbsBSin103/GbhBjuXMpcaEq25w==
X-Received: by 10.66.89.228 with SMTP id br4mr34047262pab.110.1467397640563;
	Fri, 01 Jul 2016 11:27:20 -0700 (PDT)
Received: from localhost ([106.51.137.1]) by smtp.gmail.com with ESMTPSA id
	o22sm7333909pfa.15.2016.07.01.11.27.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jul 2016 11:27:20 -0700 (PDT)
Date: Fri, 1 Jul 2016 23:50:08 +0530
From: victorascroft@gmail.com
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160701182008.GA20145@Sanchayan-Arch.localdomain>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Building php with postgres support
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
X-List-Received-Date: Fri, 01 Jul 2016 18:27:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

I want to build php with postgres support. Am using the jethro
branch. Looking at the php.inc file

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/php/php.inc?h=jethro

postgres doesn't seem to be enabled by default.

Tried enabling postgres by adding the following to EXTRA_OECONF

--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix}

based on the PKGCONFIG defined in that file later but that does not
seem to work.

Checking phpinfo does not show postgres support enabled.

What would be the required change to php.inc file for enabling
postgres with php?

Regards,
Victor.

