Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 77B3777288
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:54:20 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a4so30800248wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sRUB2B1TsYlk82XUZ2hLWIxii6QEP/yj7r4h3u/B6UA=;
	b=c5AwUvw9wZA0EXOpvTJLOIehbm0Q2FUT1iaWZOhc1o8MwMANa1fI2P9C8c9Fwhv5el
	P5DM8jBErTBnwpDV0DRdtG/jRwvmbkKEzRbRVcS+GZfWd1atIDJddIsJKvw080RO0YNo
	/KW4nsRgDKCE23QAPmWUKbzlkEZLVSEfhnLNrbe2xd/xe8XjCQwSAgOL5Nlj9433pU/6
	4Zdvb4G9PrwpKsUmTUMlge6bXY28OSc4B/HMzfghg/QoxJAkLDNrmKtlcaja62jWgSCs
	+XY5fR/kVv2zIfmLbWsuV6LYu/Qa1i8+dSrIG8KE1rqN91+mPp1mKR8p93CAarveUJl2
	8OAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sRUB2B1TsYlk82XUZ2hLWIxii6QEP/yj7r4h3u/B6UA=;
	b=BTyaky7NsqBWd4b6JHfQN7q4i7fOqcmlCLA5/LnE39LkFzgJLQuxRnpKp37VzpH41o
	bC93FkIpjUEgT3I6the/utLvWENLpJQfLVqBUhDaTl5Cx5QogfdOyOkzBcqRSdwFkT7W
	QHWEsjTU2Jj3BBxbycZqGwcgoT6O/PeJeuAheL87I3kLEsQ+YRWr/zrMwLJweGkYymm4
	EoeOR2O1b68yIRf3ADko+69/kswh2aIUyugZIkdQD1LmXPw+Qvct03p3clGzT65WnmnQ
	fWESeg8uXkXpjvGdOzC1UZGXvprLH0XG15bQaRx5UQyUvb/CsMtlZnWMeUlCCt40UaMA
	IPwQ==
X-Gm-Message-State: AG10YOT3sBE6n1r4jYsZ108yJjBi0f1bL0yhME4Z8iiAqVIKR5SvXYjpiSwlghg3FBhvog==
X-Received: by 10.28.174.72 with SMTP id x69mr23824550wme.68.1456322061342;
	Wed, 24 Feb 2016 05:54:21 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gb9sm3151537wjb.26.2016.02.24.05.54.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:54:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 14:55:26 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160224135526.GD2560@jama>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
	<a6251a68aec9415e6c46845fece5f9742abf89e7.1456236552.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <a6251a68aec9415e6c46845fece5f9742abf89e7.1456236552.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 11/34] tracker: fix gobject introspection
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
X-List-Received-Date: Wed, 24 Feb 2016 13:54:22 -0000
X-Groupsio-MsgNum: 60186
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNtk0ACgkQN1Ujt2V2gBzapQCgthFKKWiXba2GLiZv+YZWO3WF
8tsAoJ2lsmrOsBqfUNXTHRnFWEqkacF6
=WsQx
-----END PGP SIGNATURE-----

