Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 43BD66C8FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 14:12:21 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id z5so6849382lbh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 07:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=v9Mz/wT2q8BOI3kDwZxV8Gc5y6vKnJf5fSf/9yiONoc=;
	b=kNSCSNz7MlrYnaWIs92pEHdLjKDLIW1oZmtOJ/VlCBwonoC7Nk+TnWfIsha+1O2CTk
	lW7NoQGOgd2YWNKnjrikU2YjZCxnpMLEl3Pucma+JoUni+wyg2xGyQrhOW5agTtLXOax
	keopyrxA6Y5PfI0cdZxKLqH9S0DF4j3o4/dy6ItZ28T1Rdv7b2xlfgQy1Ze75wc94iXP
	nvNZCXQEJMN+5jeRFO2iv+R0qttCS0xSj8OZ7cNtjoB8p72JXL4VDInfhIzvHzHPNbU1
	UWhdHxcEtEtxdzYrWX3MRpqyJRtVNJ0Vf7iErQFS9oyL06U4OgNn9Mz+Fpr5qulIw4B2
	c+pQ==
X-Gm-Message-State: ALoCoQmBXzkVq80bDF+7UPWWMW5TF0gsYUbP6nKnuXjIxy2P1eAZ7KjC7LcAAC5kTXSVvcsBy7Qg
MIME-Version: 1.0
X-Received: by 10.152.120.73 with SMTP id la9mr34760546lab.3.1379513541682;
	Wed, 18 Sep 2013 07:12:21 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Wed, 18 Sep 2013 07:12:21 -0700 (PDT)
Date: Wed, 18 Sep 2013 16:12:21 +0200
Message-ID: <CAKS01ok2XmnwqMz2i0radhW3UB87AXmMa3zW2nxZpGmmBeE60g@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: help with building image.
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
X-List-Received-Date: Wed, 18 Sep 2013 14:12:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

When i try to run build images in HOB, i end up with the following error.

dpkg-scanpackages: info: Wrote 4631 entries to output Packages file.
dpkg-scanpackages: info: Wrote 38 entries to output Packages file.
dpkg-scanpackages: info: Wrote 14 entries to output Packages file.
Reading package lists...
W: Unable to read
/home/akini/oe/openembedded-core/build/tmp-eglibc-eglibc/sysroots/x86_64-linux/etc/apt/sources.list.d/
- DirectoryExists (2: No such file or directory)
W: Unable to read
/home/akini/oe/openembedded-core/build/tmp-eglibc-eglibc/sysroots/x86_64-linux/etc/apt/sources.list
- RealFileExists (2: No such file or directory)
Reading package lists...
Building dependency tree...
W: Unable to read
/home/akini/oe/openembedded-core/build/tmp-eglibc-eglibc/sysroots/x86_64-linux/etc/apt/sources.list.d/
- DirectoryExists (2: No such file or directory)
W: Unable to read
/home/akini/oe/openembedded-core/build/tmp-eglibc-eglibc/sysroots/x86_64-linux/etc/apt/sources.list
- RealFileExists (2: No such file or directory)
W: You may want to run apt-get update to correct these problems
E: Unable to locate package libgcc1
E: Unable to locate package busybox
E: Unable to locate package libglapi-dev
...


What am i missing here ?

-- 

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

