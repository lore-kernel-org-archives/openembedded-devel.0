Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMpfd-0007L0-K3
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 22:20:04 +0100
Received: by iwn32 with SMTP id 32so3490767iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 13:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+D4ziQycR9cjOpszXcIjaEvNxLQSCjkRARHgP1tUyHw=;
	b=b4vC9ILA8u8cZQIE6akv5UKW2rGsNs//q+eHvKeugkrYz8+AJkFgSqi3j1u48xTQPs
	kaFlEa6zDnyfjGZJu4y8vEhJSZTY0NLqG+ngJssPx+4627Ct+xkWBZAwGfOODoJxXuBM
	E7skZUyukWZ54Hyoef7C3pG5NiRxIViM/aMMw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fv/Wm0MjPxlaBPxSebxMJOcho6jx97/3vl5ZL1ZuYMqVnYLyWCqi3E/t8TmrXWqD23
	HMx6aTCapwnlttwtWQS4+1tXx3NcJEGJLtq6d5Wcav3z0vkMPKclA7hs6/Sw68lXForq
	Jv191m2qsKdjWb2RJtKz+I52aNfnFr4vA9Kys=
MIME-Version: 1.0
Received: by 10.231.167.65 with SMTP id p1mr965240iby.20.1261430289257; Mon, 
	21 Dec 2009 13:18:09 -0800 (PST)
In-Reply-To: <BAY127-W4FA6C5C1EEBBD693C15EFD8820@phx.gbl>
References: <BAY127-W4FA6C5C1EEBBD693C15EFD8820@phx.gbl>
Date: Mon, 21 Dec 2009 13:18:09 -0800
Message-ID: <19c1b8a90912211318q284815c1m73a6667d45a0bfaf@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Building "console-image"
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
X-List-Received-Date: Mon, 21 Dec 2009 21:20:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2009 at 7:30 AM, saleh usman <salehusman@hotmail.com> wrote=
:
>
>
>
>
> Hello
> I am building "console-image" =C2=A0and aftrer bitbaking what steps I sho=
uld exactly follow to run it on my board b.I've bord which has an ARM GPP p=
rocessor runing =C2=A0linux on it, means which files I need and how to run =
them and also my board dosn't suppot gcc.
>
> I am new to both linux and openembedded so plz help me in moving forward.
>
> Terminal window is looking like as below.
>
>
>
> [saleh@localhost build]$ bitbake console-image
> NOTE: Handling BitBake files: - (7634/7634) [100 %]
> NOTE: Parsing finished. 7045 cached, 303 parsed, 286 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1399 of 2472 (ID: 228, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_setscene)
> staging-angstrom-version-omap5912osk-angstrom-linux-gnueabi - 2009.X-test=
-20091221-r2
> Removing package staging-angstrom-version-omap5912osk-angstrom-linux-gnue=
abi from root...
> (offline root mode: not running staging-angstrom-version-omap5912osk-angs=
trom-linux-gnueabi.prerm)
> (offline root mode: not running staging-angstrom-version-omap5912osk-angs=
trom-linux-gnueabi.postrm)
> Installing staging-angstrom-version-omap5912osk-angstrom-linux-gnueabi (2=
009.X-test-20091221-r2) to root...
> (offline root mode: not running staging-angstrom-version-omap5912osk-angs=
trom-linux-gnueabi.preinst)
> Configuring staging-angstrom-version-omap5912osk-angstrom-linux-gnueabi
> (offline root mode: not running staging-angstrom-version-omap5912osk-angs=
trom-linux-gnueabi.postinst)
> NOTE: Staging package found but invalid for /oe/openembedded/recipes/angs=
trom/angstrom-version.bb
> NOTE: Running task 1400 of 2472 (ID: 229, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_fetch)
> NOTE: Running task 1401 of 2472 (ID: 230, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_unpack)
> NOTE: Unpacking ../openembedded/recipes/angstrom/angstrom-version.bb to t=
mp/work/omap5912osk-angstrom-linux-gnueabi/angstrom-version-1_2009.X-test-2=
0091221-r2/
> NOTE: Running task 1568 of 2472 (ID: 231, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_patch)
> NOTE: Running task 1569 of 2472 (ID: 232, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_configure)
> NOTE: Running task 1674 of 2472 (ID: 233, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_qa_configure)
> NOTE: Running task 1675 of 2472 (ID: 234, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_compile)
> NOTE: Running task 1676 of 2472 (ID: 235, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_install)
> NOTE: Running task 1695 of 2472 (ID: 238, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_package)
> NOTE: Running task 2064 of 2472 (ID: 240, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_package_write_ipk)
> Packaged contents of angstrom-version into /oe/build/tmp/deploy/glibc/ipk=
/omap5912osk/angstrom-version_2009.X-test-20091221-r2.5_omap5912osk.ipk
> NOTE: Running task 2065 of 2472 (ID: 236, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_populate_staging)
> NOTE: Running task 2433 of 2472 (ID: 237, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_package_write)
> NOTE: Running task 2434 of 2472 (ID: 239, /oe/openembedded/recipes/angstr=
om/angstrom-version.bb, do_package_stage)
> NOTE: Running task 2467 of 2472 (ID: 18, /oe/openembedded/recipes/images/=
console-image.bb, do_package_update_index_ipk)
> NOTE: Running task 2471 of 2472 (ID: 10, /oe/openembedded/recipes/images/=
console-image.bb, do_rootfs)
> NOTE: Running task 2472 of 2472 (ID: 0, /oe/openembedded/recipes/images/c=
onsole-image.bb, do_build)
> NOTE: Tasks Summary: Attempted 2472 tasks of which 2456 didn't need to be=
 rerun and 0 failed.
>

Your image has build successfully it seems. Now how you want to boot
your board is specific to your board which you don't give
any details about. but I guess from your logs that its a 5912 osk. You
can flash the image or you can you netboot to boot
it using the new root file system and kernel. You have to find
information on this this link is userful
http://www.celinuxforum.org/CelfPubWiki/OSK

there wil be numerous others if you search

-Khem


