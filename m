Received: from mail-bk0-f54.google.com ([209.85.214.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1TwDfg-00011p-Iu
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 16:15:58 +0100
Received: by mail-bk0-f54.google.com with SMTP id je9so2046517bkc.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 07:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=TS4V3q9m3qk5BOwpUv/JWenYi+Sm1mhFUxfSzCUVwLM=;
	b=BkPzDZ7M6S+VRSGW9dWD38N/LSK+DziyBMhyov/JURH4Sv/iUOL6VQzm8DqCu1/+8S
	FuUb92jTC1oAJ3r3ooVLqTbSbWtqv/Ia8Y3cgJ3ulC0ybxjOFEEnLKhla9fUfR0Vd7je
	zejyXUgTLcH2nl6Esg+XcsLbPDGO+jtbiIoBB1LhOKE1i8KbetECQvkwAzysykvCO5jQ
	JqnmqwQYLn/WLz5ezpfWtKHJEhRhde8uhwzNmtvm202XGFY7Ud0m3a+o6IcO+yRBu4kC
	hCBxU0cUaKthajc3l64rtOgqGI7Cm7LSQLFLgC2E/IPpGWmeAdb6ALMX2lKZ1MgUGWr6
	rv6g==
X-Received: by 10.204.133.219 with SMTP id g27mr2618360bkt.65.1358521231287;
	Fri, 18 Jan 2013 07:00:31 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.205.102.72 with HTTP; Fri, 18 Jan 2013 07:00:10 -0800 (PST)
In-Reply-To: <CAPESJy5XQKweZqj8GAsp3HEtgVDgDc4NgbjTqMQbfQi6n_uG9Q@mail.gmail.com>
References: <CAPESJy5XQKweZqj8GAsp3HEtgVDgDc4NgbjTqMQbfQi6n_uG9Q@mail.gmail.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Sat, 19 Jan 2013 00:00:10 +0900
X-Google-Sender-Auth: Gk8ts-TxtKVnwTZ5IqdnO3QoWXQ
Message-ID: <CAPESJy5rag4289ihZMcEyJ=Q+12o1xuCJyFJ82mYYGKgh_g5dA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Solved] Re: /etc/init.d/networking from netbase package
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
X-List-Received-Date: Fri, 18 Jan 2013 15:15:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

> After the build, I noticed /etc/init.d/networking is not installed on the
> rootfs while netbase_4.47-r1.ipk includes this file.

this problem has gone after refreshing build directory and
correction of my conf/local.conf file.

I cleared some files and directories including related sstate-cache,
work directories in build/tmp-angstrom_v2012_05-eglibc/ ,
and issued
 $ bitbake -c clean
for related packages,

corrected the patterns for BBMASK variable,

then retried the build, issuing a command:
 $ bitbake sysvinit-image

where sysvinit-image is my local project, inherits task-boot.

Now /etc/init.d/network file appears in JFFS2 image.

Regards,
-- 
Takeshi Hamasaki

2013/1/17 Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>:
> Now I'm trying to build a simple image which includes udev and netbase.
> (I know that main stream is using systemd, but my C7x0 has too short memory
>  to operate systemd.)
>
> After the build, I noticed /etc/init.d/networking is not installed on the
> rootfs while netbase_4.47-r1.ipk includes this file.
>
> Is there any magic behind that prevents this file installed or removes this
> file after the package installation?
>
> According to https://bugzilla.yoctoproject.org/show_bug.cgi?id=2486
> there is a plan to split /etc/init.d/networking out of netbase package,
> but this change is not applied yet, for my understanding.
>
> Now I'm on the denzil branch, angstrom-2012.05.
>
> Actually I want to make a new bug on yoctobugzilla,
> due to the mail server problem on my side I can't
> finish the registration process for few more days.
>
> Regards,
> --
> Takeshi Hamasaki


