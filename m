Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBAE75932
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 06:05:04 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so50074320pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2015 23:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=VgatXOJ3aSjNRbD36K1+a8HXNzjnAVvFJMo5kaXmSds=;
	b=KCFqpEA5dAvFMCYOuAiF0rGdHyaJ5dDRbluFYzfwv2P20CkzHL3BDm2WrW4UgKL8Fq
	ssb7FSM0dS5WyVr4HZ0/LAWs0zxI15v4yJ6YjlVA1lZUOZgNjmPXoZB0cIDwZOfdE6cc
	+icpPbWBpHEYKvX17LwwywYldopHOYjXGxInzmHTPHeRp06uHonUBuLhx4nPoQj2TcpJ
	U9poAgJeeJ4ZZN9+QsiAJiePP7PP+JdLUZyEGDiv581UL/jloCCbKdauywJ3cWMXQHQ5
	dblfEFblyInMP9b9vrLF2AkPYA74Ww+bdsm96gIc+7nDPi6K1VXiRz59WD1MYBYqbZC2
	ylzw==
X-Received: by 10.68.206.7 with SMTP id lk7mr36600165pbc.52.1434261906073;
	Sat, 13 Jun 2015 23:05:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:a0d2:eb66:b71d:4aa7?
	([2601:202:4000:1239:a0d2:eb66:b71d:4aa7])
	by mx.google.com with ESMTPSA id dl5sm8275592pbd.78.2015.06.13.23.05.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Jun 2015 23:05:04 -0700 (PDT)
Message-ID: <557D198E.4010506@gmail.com>
Date: Sat, 13 Jun 2015 23:05:02 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1433777512.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1433777512.git.alejandro.hernandez@linux.intel.com>
Subject: Re: [meta-oe][PATCH 0/3][dizzy] several backports for iot-devkit compatibility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Jun 2015 06:05:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Alejandro,


On 06/08/2015 08:42 AM, Alejandro Hernandez wrote:
> I would like to include these backports from [master] on [dizzy] for compatibility with iot-devkit
>
> The packages to be backported/upgraded are:

Package upgrades and new packages are not allowed in Dizzy. Unless I am 
told otherwise.

- armin
>
> libftdi
> lirc
> p7zip
>
>
> The following changes since commit 5b6f39ce325d490fc382d5d59c5b8b9d5fa38b38:
>
>    gsoap: fold .inc and -native into one recipe (2015-04-29 19:24:09 +0200)
>
>
> Alejandro Hernandez (3):
>    libftdi: backport to dizzy for compatibility with iot-devkit
>    lirc: backport to dizzy for compatibility with iot-devkit
>    p7zip: backport to dizzy for compatibility with iot-devkit
>
>   meta-oe/recipes-connectivity/lirc/lirc.inc         |   14 +
>   .../recipes-connectivity/lirc/lirc/lirc.tmpfiles   |    1 +
>   .../lirc/lirc/lirc_options.conf                    |   24 +
>   meta-oe/recipes-connectivity/lirc/lirc/lircd.conf  |  315 +
>   meta-oe/recipes-connectivity/lirc/lirc/lircd.init  |   40 +
>   .../recipes-connectivity/lirc/lirc/lircd.service   |   20 +
>   .../recipes-connectivity/lirc/lirc/lircexec.init   |   37 +
>   meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |   69 +
>   ...do_not_override_compiler_and_do_not_strip.patch |   31 +
>   meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb     |   17 +
>   .../libftdi/libftdi-0.19/libtool-m4.patch          | 7377 --------------------
>   meta-oe/recipes-support/libftdi/libftdi_0.19.bb    |   31 -
>   meta-oe/recipes-support/libftdi/libftdi_1.1.bb     |   29 +
>   13 files changed, 597 insertions(+), 7408 deletions(-)
>   create mode 100644 meta-oe/recipes-connectivity/lirc/lirc.inc
>   create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lirc.tmpfiles
>   create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lirc_options.conf
>   create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.conf
>   create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.init
>   create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircd.service
>   create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/lircexec.init
>   create mode 100644 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
>   create mode 100644 meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
>   create mode 100644 meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb
>   delete mode 100644 meta-oe/recipes-support/libftdi/libftdi-0.19/libtool-m4.patch
>   delete mode 100644 meta-oe/recipes-support/libftdi/libftdi_0.19.bb
>   create mode 100644 meta-oe/recipes-support/libftdi/libftdi_1.1.bb
>

