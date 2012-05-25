Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1SY1bg-0008Uc-8g for openembedded-devel@lists.openembedded.org;
	Fri, 25 May 2012 22:59:32 +0200
Received: by wibhm14 with SMTP id hm14so1174173wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2012 13:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=kDUXpNyq05QSVXOwYmaj+j6Ak3HkXmDkkA8UdEfpuXs=;
	b=WyiULvi6jkiH+aN7Ma8Gz4orVWOWAvqFd22kBz804Q0znk7D7dppzzm/bpvncY64sp
	N/EtFragfwG33N8UNgn2MlgRp2qOw3ATf7Fx9LdZG9+ocvJVuaJIEfp2IS1P/biXE6cO
	cgO6OUtpnFEa256IbSakdpftzht22k8WrJxArpzuzy395Awjns2cVTBxTpvY/jQgSl2Y
	EoX2o+mmAJrcoF9AhKJgSKYgHrZETPhhupEsbCSjw+gZqFE+q/vzrPXT6huCRgfGcpch
	QECFgqoni4+avLDkn7uHwJDrV2GRz96oHkSSd0gr1xirQ+gP9MwjPCorVw/SVAZVK2V6
	ldRA==
MIME-Version: 1.0
Received: by 10.180.104.168 with SMTP id gf8mr733177wib.12.1337978959471; Fri,
	25 May 2012 13:49:19 -0700 (PDT)
Received: by 10.223.17.14 with HTTP; Fri, 25 May 2012 13:49:19 -0700 (PDT)
X-Originating-IP: [69.180.64.152]
In-Reply-To: <CAP9ODKq9BBVhJyiYLww2adrW4qXiQAudVma4k7ijFXPcHe3oEg@mail.gmail.com>
References: <1337975688-31659-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<CAP9ODKq9BBVhJyiYLww2adrW4qXiQAudVma4k7ijFXPcHe3oEg@mail.gmail.com>
Date: Fri, 25 May 2012 16:49:19 -0400
Message-ID: <CAG3aBq71ngOy9DkVwai_On+MNUyz_BtqZoGcK_2wdZ_NxzQhGQ@mail.gmail.com>
From: Daniel McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlhqm2wm7S9kSnX78DsPk8kGCv0+Jdu0KB8TP825b0Qvwl1Q/5QcFW9N6sRPGw+y0pXk0O8
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] netbase updated to 5.0
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
X-List-Received-Date: Fri, 25 May 2012 20:59:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2012 at 4:17 PM, Otavio Salvador <otavio@ossystems.com.br>w=
rote:

> On Fri, May 25, 2012 at 4:54 PM, Dan McDougall
> <daniel.mcdougall@liftoffsoftware.com> wrote:
> > Updated from 4.47 to 5.0 (4.47 isn't available anymore on the Debian FT=
P
> > servers so this was blocking builds from completing).
>
> I like this patch but:
>
>  * did you evaluated the fixes that could be dropped?
>  * please move to netbase as we seem to be stick to one version of it
>

To answer your questions:

* No.  I just renamed the .bb and the associated directory then fixed the
checksums so I could build an image...  bitbake wouldn't let me continue
due to the missing file on the Debian FTP server--netbase_4.47 is gone from
the Internet forever it seems (googling for it produced no downloadable
results).
* I have no idea what this means.  I just followed the directions here:
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

--=20
Dan McDougall - Chief Executive Officer and Developer
Liftoff Software =E2=9C=88 Your flight to the cloud is now boarding.
904-446-8323

