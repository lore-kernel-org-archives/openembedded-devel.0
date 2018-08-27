Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id E83C778EF9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 16:17:40 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id z8-v6so18659159qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ywBJ+Igfvs089VRTfjA54xD0EqkeVQvRioQgij8Vnuw=;
	b=Apx8Um956dz6Tl60m3JyFGuIbMVM3L0zNUq1rYpxnTKaiRfny7WR6p/i1gzm9ItsH+
	7B8x7MEMTuNqFw6KF6Xu349njYOjwyueJT9gYuAK2bKbZ/LBo3p0TSct8yeLwfMWbvTo
	H4BGKzu1t4XMK5Jfpd41T2WAKtfE7WLBvif0ZjNd5Qi6Jqmi4iLtp+Hc5+cEMIAlJvyz
	eTR4mrZwE42W0HcTU7zQ7vupN+Yq9gu+0FD9kq8ZwGOYC08oDlP4/V7NB89YU0hbv29l
	VahaQcVtkABqDP0mqbC1bFr25GGCYBQyQomdh9XNShdMsi37WOmPtSv5jQSVwPsH9WwP
	ebjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ywBJ+Igfvs089VRTfjA54xD0EqkeVQvRioQgij8Vnuw=;
	b=QXJay7O0zxfYiIlhl377jXo6c8MlmYlTdcvFMW22h38c1JaK4YMR0zLSBMPLDyoKbO
	pK2K+S6Ym/AdwOlu4JIJuE50ZxdV4Nhu09L3N6jTbA9CxiA/QhDX4z1P3vsvu/qDSTsl
	BiC53ejLQfzDXqJd0PpeIae1IlkGwY6GpH0ftVUWi6k5I9bIO2427cteFxGNTditj35o
	8+s2fCSxkM+u8xMulrdj+B0yFdbK/B/tuWYDfm2zcw4t3fiDyy8rXqZHU69etmEg2FaC
	wb86VLaxwu3mpEAsOEIxCK9lHPeAua475FYxLd2vnzT9Evbe1uhjZhFtOylHqpxfAz/b
	2Zvw==
X-Gm-Message-State: APzg51AiAoUZBJQSURohwEFpdjfoxZPIL9e6Iqmk/ZBFzildhkKkNff+
	yWZZSwZsmVikqE6a5NizcnouspxQwqrgqNGZSY0=
X-Google-Smtp-Source: ANB0VdZq+ifAEc+g3ZslreOoKsIvixovu1k0mfZrqtDbhWnk5uPHBHfe0LGx50GJBZHkyoDtQ0qnJDzAZCZfc54I8jc=
X-Received: by 2002:a0c:87f8:: with SMTP id
	53-v6mr14324800qvk.228.1535386661720; 
	Mon, 27 Aug 2018 09:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20180827105403.6207-1-sno@netbsd.org>
In-Reply-To: <20180827105403.6207-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 09:17:16 -0700
Message-ID: <CAMKF1sqWwxHF0rU8AxYM=Uz2zqjBJN_wd7fxyDyMX3Ur03zDZg@mail.gmail.com>
To: sno@netbsd.org
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] grpc: update from 1.8.5 -> 1.14.1
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
X-List-Received-Date: Mon, 27 Aug 2018 16:17:41 -0000
Content-Type: text/plain; charset="UTF-8"

> +FILES_${PN}-dev_append += "${bindir}/*"
> +FILES_${PN}-dev_append += "${libdir}/cmake/${PN}"

We can just use FILES_${PN}-dev +=

