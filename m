Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1STzCi-0005aA-P5
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 19:37:04 +0200
Received: by eaal1 with SMTP id l1so1591946eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=25gZZ5abyIPDOP4SM6Gk0f1jUYx1PSOnhplRw27JHwY=;
	b=hrjRT8QOoIw6pUqhv8YxNN6t1soVRW4kYVOwmfNO7m8V8iSab9wceZbpmuH2kGPuP9
	MW5l+dp1m9iKDALc/mRBret5QjMvXZh47AJTC0Pc3hF6v7ACh2xVhkXVtYSlOW+AsPph
	5NClvon7rSO0U3NP337ajfGgNQw+Uv6+pkMQz6DHN+WacEMUNMPXfW3KVk5GqZoteMSP
	QRzav/CIAD6Q68CeHE/1cWJ2VY9VVxlrWZ55emQiDdkID3WhoK9cIcJIhoUrUq5BjBIr
	HdCnCFkS6SSjvPsmt63a/B+Eh6ZZYDtb+pV6S3hF1RfwLT3tXCuac0YSgbBqzVK3527W
	C4jA==
Received: by 10.14.127.198 with SMTP id d46mr1668999eei.101.1337016424597;
	Mon, 14 May 2012 10:27:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Mon, 14 May 2012 10:26:34 -0700 (PDT)
In-Reply-To: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
References: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 May 2012 10:26:34 -0700
Message-ID: <CAMKF1sqCxAnukfORLmDT9vxg-V8ABcUgjXYTP5b1jc=LZfDu1w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: New kmod {libdir} breaks udev 182 build
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
X-List-Received-Date: Mon, 14 May 2012 17:37:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 14, 2012 at 4:18 AM, Thilo Fromm <fromm@dresearch-fe.de> wrote:
>
> I've got an issue with
> openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, with the way
> {libdir} is set in line 19:
>
> libdir = "${base_libdir}"
>
> "git blame" claims this was added by Khem Raj on 2012-05-08. This line
> causes libkmod to put its pkgconfig ".pc" file in the staging area at
> "/lib/pkgconfig/libkmod.pc". This is sad because other recipes would
> only look at /usr/lib/pkgconfig/ and /usr/share/pkgconfig.
>
> Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for
> example. The build predictably fails with
>
> checking for KMOD... no
> configure: error: Package requirements (libkmod >= 5) were not met:
>
> No package 'libkmod' found
>
>
> So what's the right thing do do here? Use a different package install
> path for libkmod, or point udev to /lib/pkgconfig by extending its
> PKG_CONFIG_PATH correspondingly?

One solution is to fix kmod to install pc files in /usr/lib with right paths
to access libkmod

second solution is to look for pc files in ${base_libdir} while building udev
can you try this option.


