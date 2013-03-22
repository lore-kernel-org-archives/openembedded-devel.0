Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hirst689@gmail.com>) id 1UJ39l-0007up-4L
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 15:41:27 +0100
Received: by mail-pd0-f169.google.com with SMTP id 3so1644001pdj.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=hctBgZ8OLbKVLxFHFFS7e3ea9WDSGqsGtHBhPpShRzE=;
	b=p2QfSrfDQh7mJRxQgcVJ9D022rz+pAVYvuLL2i2w9ithvIfuj/kHuWiwa7OibZbgMl
	5bcsdFo0IMO2JKEaM54veGK2xIzImZqxpzyQ20vrk0UngkcLhlpn0WPjj9vEzKg1cQEW
	piveISir2XH/oYX0bKUaJx3lKMuhha9in8j4cK9yx9mRPtWrCzz12/vYk6mVUdwJhzAP
	I6DcVauwhCrLO/tQQGHWZTlwDOGDf7t3u6SG+ORcU9TOp6sL+RrNnTpzRGkIQg9wersW
	pCqITny8qltzZg5Ds54FADEqT5OTN8O2jBaN393l2mGvchf0EpNriLJgrBu4z8dpe2g2
	KJuw==
MIME-Version: 1.0
X-Received: by 10.68.33.98 with SMTP id q2mr2932644pbi.135.1363962266653; Fri,
	22 Mar 2013 07:24:26 -0700 (PDT)
Received: by 10.68.225.166 with HTTP; Fri, 22 Mar 2013 07:24:26 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:24:26 -0400
Message-ID: <CAHu+ux18fZzDuBjYj_d8r9P=y=khrCSjuRjKPKG9RzxEAO2vXw@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Adding a recipe to oe bitbake
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
X-List-Received-Date: Fri, 22 Mar 2013 14:41:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
    I have been struggling with a oe/bitbake issue. I wanted to add an
other .bb to the image file.
I have tried multiple ways but always end up at the same spot. I have
created a new task-XXX.bb file which includes my bb
I edited the XXXX-rootfs-image.bb to include the task-XXX.bb.
Once built I find that everything built fine and the new recipe was built
but was not loaded into the XXXX-rootfs-image.tar,gz.
If I look into the image directory for the bb file I see the compiled
application in usr/sbin.
I have tried this with my own .bb file and net-snmp bb file which comes
with the default oe-layersetup installation with the same result.
Did I not edit a file or miss some other required step?

-- 
David Hirst
hirst689@gmail.com

