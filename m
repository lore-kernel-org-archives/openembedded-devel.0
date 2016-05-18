Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 443A06FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 18:17:12 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f92so30502273qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=/e0De4E+o2IJ8SAp+F9jzfrXmZEhkYxpM3HJ7FRQFr8=;
	b=SnDhdOTbwaLfsYycgplbJmvx87SpAcf+OCj4jlH9IVu4Fgk4jD5P5NEyNy4TUAoX+1
	zDJ8zRwN67CZRUoecMUVyVzR/UY1DDGmlh+QYpOorClA48CS1ljxWqIOf5wvv9N7oRSX
	X8Yc5ukeMBejtf9jcGO0T5QAGuFNPi3k/gttmUB55Z8hzeYi5/9/7r4n9mh0SjJyAQsz
	rf05+VobjQl266RXUsEFo3tOppYOMU+iR/IjOhN0b76P1WBpBYRLfIOQiR+U5a0uCrMF
	xCL0dABJeuXyw46OYvi2gIwHy8KFa+XHTK7CB6W33dNKtTgG9gY9AZ6kF1ZLwM4X84Ca
	xBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/e0De4E+o2IJ8SAp+F9jzfrXmZEhkYxpM3HJ7FRQFr8=;
	b=U3qVHHFCqB26avSXnvCv+6WubsIzT7NEkO3+rX3VSdMjLFbxysw5uqoOgx/8FpNOla
	B3l460vUhQOx4gYHZErRnDnvT+sgaCnaxwQ0L+eD0yykJn9/no8Dl4BKvzX0OD4bzuRu
	LpFYGhKwdBi30MiZA/ueXtgt2F6wpc7ocjZjQX+rAeSaq2RoeVY1sdF9yXrtDMtMHdCa
	OTB9+43OgHmkjfbUuZIeK0lKyRZeTlFrwIt3M+ODkutY5oo1EBDaxVO0EjQH8PdRlaLG
	a5N24OdRb51MnfwnhjNu0eTYYA5KJxKi5rf6+cO5++e9xbvYeJMyH4fpJp6jhOTNqE+T
	KfZw==
X-Gm-Message-State: AOPr4FW3IZi96a3E2DIhJySmF/SdQVYd1vXLWAYYpp7APwZZ7qEIWHbTgQ0K37GEK3RgaQ==
X-Received: by 10.140.93.103 with SMTP id c94mr8995946qge.74.1463595433245;
	Wed, 18 May 2016 11:17:13 -0700 (PDT)
Received: from Pahoa2.mvista.com ([50.233.148.158])
	by smtp.gmail.com with ESMTPSA id
	f19sm4744845qgd.21.2016.05.18.11.17.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 May 2016 11:17:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com,
	akuster@mvisa.com
Date: Wed, 18 May 2016 11:17:08 -0700
Message-Id: <1463595429-8748-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][jethro][PATCH] Security fix backport for Jethro
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
X-List-Received-Date: Wed, 18 May 2016 18:17:13 -0000

Ntp updates are currently being done via package updates as they are 
just patch series updates.

Armin Kuster (1):
  ntp: Security fixes via update to 4.2.8p7

 .../recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb} (97%)

-- 
2.3.5


