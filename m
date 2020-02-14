Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7E961115
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:41:14 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id n21so11765474ioo.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:references:in-reply-to:mime-version:thread-index:date
	:message-id:subject:to:cc;
	bh=ho7y6bUqZkDmIrQpjMA3DVDbRSRdY7xVtusJOAe8Ba4=;
	b=H4ZgVClu2OnYvRBztYdlJdYnJFZCBhQSPRJH94xU/pRoQ/XbdXQFEDBcWAXCjX+Mil
	lYcXC46S2wQgncSClrrHBHsHH9eOanD9rokziUnP2i2NSa2jPG8ujMsANM7G5sa48oxB
	/BE2lRcxrOTfjutI5xjeyqubD9cJ/vAZjIAlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:references:in-reply-to:mime-version
	:thread-index:date:message-id:subject:to:cc;
	bh=ho7y6bUqZkDmIrQpjMA3DVDbRSRdY7xVtusJOAe8Ba4=;
	b=XfP3iJ3d7C/AkwJ6QoELML9Tn+SCsDnbSE7n17eAvKTisfwDb4iZPpCkyHp2URZ9u1
	4ntRleI6LHiqMc0XMbd7N0Vdf7nuQS3H5JczNKM19vAgpXfoDhMTEWvX1h7s5mKR05qz
	e6JK5ccsavhqZVvrJrASeV3hEOazVh9vK6lziuiQ22/ync7j4raW8F0ewpk8DwlZCpYO
	29brLXkKkq9VpwvYUsWDk6qK2Y6qZ2du2H+mjM8YCn4k6fllsBAT3Z4IZ4eMNSBulpGT
	RvZMlGIkUXy0s6gCPyluvMbYTVRVB10PQQidFQNyc7VxYWH5gyqOp/GQYlj8YedRgK6p
	GW/g==
X-Gm-Message-State: APjAAAV7IxACITfO0eK9lUgp5KpsJ8aXmFS/uEG+pwyQrJtwa3SNO/dz
	cptCnNhDVoXd+fOVSjJLkDsIFyKZ9kq/L/bZyxuFxWBa
X-Google-Smtp-Source: APXvYqzELpkxLpqTtzbb2lMgKFYgU58Bmf3pYBTxXANb/vQxcGz5JUO6NNkXp5PxxVY7Y8qofuv3Vv2hTZ/hNRu0PI4=
X-Received: by 2002:a5e:940f:: with SMTP id q15mr3321456ioj.218.1581709274682; 
	Fri, 14 Feb 2020 11:41:14 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
References: <20200213232346.109257-1-jonathan.richardson@broadcom.com>
In-Reply-To: <20200213232346.109257-1-jonathan.richardson@broadcom.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQHHKjtR3dZIphdvI6z5NyqgQ6N9Jag4iK9Q
Date: Fri, 14 Feb 2020 11:41:12 -0800
Message-ID: <f4129e1cc23cb42fd6d34e061cb3f132@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: Re: [meta-oe] spidev-test: Add initial version of recipe
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
X-List-Received-Date: Fri, 14 Feb 2020 19:41:14 -0000
Content-Type: text/plain; charset="UTF-8"

-----Original Message-----
From: Jonathan Richardson [mailto:jonathan.richardson@broadcom.com]
Sent: Thursday, February 13, 2020 3:24 PM
To: openembedded-devel@lists.openembedded.org
Cc: Arun Parameswaran; Jonathan Richardson
Subject: [meta-oe] spidev-test: Add initial version of recipe

From: Arun Parameswaran <arun.parameswaran@broadcom.com>

Allows for testing SPI interface using spidev driver and is part of the
kernel tools.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
Reviewed-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
Tested-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 .../recipes-kernel/spidev-test/spidev-test.bb | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/spidev-test/spidev-test.bb

diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
new file mode 100644
index 000000000..7dd199fe9
--- /dev/null
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Test SPI devices"
+DESCRIPTION = "SPI testing utility using the spidev driver"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM =
"file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6
"
+DEPENDS = "binutils elfutils"

Doesn't look like these dependencies aren't required. I'm going to remove
them.

