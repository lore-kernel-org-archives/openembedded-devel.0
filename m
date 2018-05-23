Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 51403605BA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 11:54:50 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id t11-v6so8243170wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 04:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2l5pOAzXrPgYiqov9hP+ohHRfcRbKpaFSKj+tSEhBjI=;
	b=WSZaihbX5lNnjwE6YKapme4H4rLU6OChuqR5FRiLuIjlXMP0geBPXfJLn5UTI7c7YE
	o1YeEZdNkdRgm1+6fltbX6EBnK/fQblR0J7sgnZggN+WhPIWESKKdJ42odiC8HBxOsCX
	3A03lV2ibL4eVFPh2Md5lmW8aURNO70t4nDDRDFhjPxqEDybUNiaxpgVdlL+eJKICMGF
	4ap6qVguKHNJllO/vBxEyrecDrwhWxrU5WJpUS0SSh/HaevGPPGpdRO3hANhdtUwm5FS
	SlUlrq2QW1RxS/T+TPBrk+v7IkKfNW/nji4aKge7R/LVNhdlqiF34fGLhbHzgJXOLQ2l
	/PFw==
X-Gm-Message-State: ALKqPwevKVBLDjjxqLSp30QFYvAm80FoH2zASXyOcNlqLJ7leYpEbjJ6
	dL1EJQpuiUncVEB/hfyTO/rk4iZ5
X-Google-Smtp-Source: AB8JxZp6I3cG886ylZP55fhYNfJ93XxbPFUz0y5mIgNDUCGfv85xudLuuLoHOKRUXLqCx4Y2S4dkbQ==
X-Received: by 2002:a50:f4ca:: with SMTP id
	v10-v6mr6879192edm.162.1527076490578; 
	Wed, 23 May 2018 04:54:50 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h30-v6sm9803828edh.73.2018.05.23.04.54.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 May 2018 04:54:49 -0700 (PDT)
Message-ID: <461d98906ff085c98d1c1738d3df0d8d910945e8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 12:54:49 +0100
In-Reply-To: <19e8db9186f9b2d072389e82461daedf0cb58cad.camel@andred.net>
References: <20180425150724.9102-1-git@andred.net>
	<19e8db9186f9b2d072389e82461daedf0cb58cad.camel@andred.net>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-8: update aarch64 version to 8u162b12
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
X-List-Received-Date: Wed, 23 May 2018 11:54:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-05-23 at 12:37 +0100, André Draszik wrote:
> It looks like the files have changed, as the checksums for this 162b12
> update aren't right anymore...
> 
> Starting to look into this, I wonder if the URLs used by the OpenJDK-8
> recipes are actually meant to be stable? The URL pattern is
> 
> http://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}/archive/${
> OPENJDK_FILE}
> 
> Considering 'archive' in the URL, and considering you can download an
> archive of tip if you want to, and the fact that the server doesn't send
> the
> size in bytes of the file - are these created on demand, and can thusly
> change due to timestamps? (Similar to the github archive problems we're
> having).
> 
> On the other hand, the previous checksums for the 161b15 release are still
> valid.
> 
> I'd suggest to switch the OpenJDK-8 recipes to fetching from hg://
> directly,
> rather than using those archive URLs?
> 
> So, are those archives meant to be returning the same file forever? Any
> thoughts?

Luckily, I still had my originally downloaded file lying somewhere :-) So,
the only difference seems to be a file called '.hg_archival.txt' (all
timestamps for all files / directories within both new and old archives are
the same, even for the .hg_archival.txt file)

When I downloaded originally, it contained:

repo: cfeea66a3fa8ca3686a7cfa2d0ce8ab0169f168d
node: 917454da25c1735c001ad84fae01c61e0dac0f07
branch: default
latesttag: aarch64-jdk8u161-b15
latesttagdistance: 1

Whereas when I download now, it contains:

repo: cfeea66a3fa8ca3686a7cfa2d0ce8ab0169f168d
node: f8e58f4c29aecbadcd7f1ee0e28a4ab8c8a7e3b1
branch: default
tag: aarch64-jdk8u171-b10


Any thoughts why a snapshot of an older tag (162b12) would suddenly start to
reference a newer tag (171b10). And why does the snapshot of the even older
tag 161b15 still doesn't reference the 171b10 tag, even when downloaded
anew? I don't know enough about mercurial to make sense out of that...


Cheers,
Andre'


