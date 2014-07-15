Return-Path: <stephanoc@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 459B27044B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 00:06:45 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id i17so1738205qcy.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 17:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=BMGavLm52JkL5lf/LJzcOz6ujlY7deP1NxMqkAsobsU=;
	b=g1Dlw5rgfiFDpUOL8R5bbFH0qZ7tudogXIvrCp3rTnDV4i5OtqBtq84CHfn84+gWXq
	AJcziq5WvojnNIsK4y1Znt8JWhWUEBxsZpSeKILuLWTfn1ZRwT/Uodwk8rmlVLhpznUB
	cdRC63oIf04xim/jarPpfBxxYzWe8qRfi4/LRxyzQ2dDVfX+zqgBgA385eljGXBxH2Rg
	i/U4sf9Q07G4ja6Gktt+/RjVF6dPk/ZPu3/oF1Xg1fuFjyynD1EherJu1JyKs7M+pjqB
	1LyCZrHtBJTxjdSJ+F45+5WexFNFWsqULTr6YYD/MCb6L+83gK0knd7itDRuF9unA89D
	9kAg==
MIME-Version: 1.0
X-Received: by 10.140.83.49 with SMTP id i46mr27942064qgd.22.1405382807000;
	Mon, 14 Jul 2014 17:06:47 -0700 (PDT)
Received: by 10.229.88.134 with HTTP; Mon, 14 Jul 2014 17:06:46 -0700 (PDT)
Date: Mon, 14 Jul 2014 17:06:46 -0700
Message-ID: <CAB25Ju7BtR02ePz-O5Q5Vi=3jfDbktr8NfGcp-wkU7rBG0V7CA@mail.gmail.com>
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: php.inc removing directories that do not exist
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
X-List-Received-Date: Tue, 15 Jul 2014 00:06:53 -0000
Content-Type: text/plain; charset=UTF-8

php.inc -> do_install_append_pn-php:


    rm -rf ${D}/${TMPDIR}
    [...]
    TMP=`dirname ${D}/${TMPDIR}`
    while test ${TMP} != ${D}; do
        rmdir ${TMP}
        TMP=`dirname ${TMP}`;
    done


Added in this commit:

https://github.com/openembedded/meta-oe/commit/357915b6d11dfa612fbadaa4966a0b3e0f332467



This is failing when I try to install PHP using Ubuntu 14.04.

Here are the variables being used:

${D} (bitbake destination dir) =
[...]/build/tmp/work/cortexa9hf-vfp-neon-reach-linux-gnueabi/php/5.4.14-r6.0/image

${TMPDIR} (bitbake temp dir) = [...]/build/tmp

The combination of ${D}/${TMPDIR} doesn't make any sense to me.  Maybe
the intention was something like ${D}/tmp?

I've removed these references to the dubious directory ${D}/${TMPDIR}
and everything builds fine without any warnings or errors. Anyone know
why this code exists?

Kind Regards,
Stephano

