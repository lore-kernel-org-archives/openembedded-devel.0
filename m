Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SEqCP-000516-MP
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2012 00:58:09 +0200
Received: by wgbdr12 with SMTP id dr12so2713603wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2012 15:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=0tcNDU37Y/g3sARZZRVulo/+fDmenOgD3Lu5VB4Dg0k=;
	b=ij2puqJTm4qzCte6KtTCX0rkNNCufVi8VFnpQ1oFYBQiJB/5sv6PDWE4KsLUnUgAH3
	I372WT9q/t4dA9+mjN86E55oMgRlLWPj+Nl1JbwXfvnY+3qlOV95h59S3LZGqUx4/Al3
	O2kjPxvoZ2yKZA3ZtkV52MSfY3aVYqryLQ8BCT6/s16ty5wRH4at0gwZmyNMg6IHXUvP
	Oqn1kITxBnx6s+BjYb9yQZedQgM5srgog35tySCqop2pTw5zdU7ccitoT+06yGxXO4yA
	j/arMzt1y/f+ATkm77gROwNVoTWZXU1ivjxJ1Ua++/twBk3R4cAtTXWWMbpVBrDevVIR
	e3HA==
Received: by 10.180.76.240 with SMTP id n16mr29590632wiw.10.1333406940774;
	Mon, 02 Apr 2012 15:49:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.158.16 with HTTP; Mon, 2 Apr 2012 15:48:40 -0700 (PDT)
X-Originating-IP: [79.115.103.32]
In-Reply-To: <20120402210435.GA10553@hermes>
References: <20120402210435.GA10553@hermes>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 3 Apr 2012 01:48:40 +0300
Message-ID: <CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnf6c68Ibo1iBY7CPI9tSnuThJBCTxGOkFRTroy16X3UITAfw1bk/7hLzIyQVP0EH8hnEic
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Package build failure
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
X-List-Received-Date: Mon, 02 Apr 2012 22:58:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 3, 2012 at 00:04, Apelete Seketeli <apelete@seketeli.net> wrote:

> Hello,
>
> I'm currently trying to learn how to build OE packages. For that
> purpose I set up an OE 'classic' (not oe-core) environment with the
> following configuration:
>
> DL_DIR = "${HOME}/devel/bitbake/sources"
> BBFILES := "${HOME}/devel/openembedded/master/recipes/*/*.bb"
> MACHINE = "ben-nanonote"
> DISTRO = "jlime-2010.1"
> PARALLEL_MAKE = "-j 2"
> BB_NUMBER_THREADS = "2"
> BBINCLUDELOGS = "yes"
>
>
> As a test I issued the 'bitbake nano' command, and after a while the
> build fails with the following error:
>
> svn: OPTIONS of 'http://svn.openmoko.org/trunk/src/host/opkg-utils':
> could not connect to server (http://svn.openmoko.org)
> NOTE: package opkg-utils-native-0.1.8+svnr4747-r7: task Fetch failed:
> Unable to fetch URL svn://
> svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http from any
> source.: Failed
> ERROR: Function 'Fetch failed: Unable to fetch URL svn://
> svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http from any
> source.' failed
> ERROR: Task 70
> (virtual:native:/home/apelete/devel/openembedded/master/recipes/opkg-utils/
> opkg-utils_svn.bb, do_fetch) failed with exit code '1'
> ERROR: '/home/apelete/devel/openembedded/master/recipes/gcc/
> gcc-cross_4.5.bb' failed
> ERROR:
> 'virtual:native:/home/apelete/devel/openembedded/master/recipes/opkg-utils/
> opkg-utils_svn.bb' failed
>
>
> It seems http://svn.openmoko.org is unreachable.
> How can I resolve this issue ?
>
>
You actually cant solve this issue as the upstream link is down. You have
two simple choices:
1. Find an upstream mirror
2. Use a local archive instead.

