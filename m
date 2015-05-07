Return-Path: <johannes.pointner@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 33FF073D59
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2015 06:33:08 +0000 (UTC)
Received: by qgdy78 with SMTP id y78so16393300qgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 23:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gDVG4gPm6kMBiXEFjMMeLD9VC9GunIOhuk7fsdev9CY=;
	b=faqymfkhtboq+AG4mzGZrClCu1x6jR3BgQ1XlqwBLtqKJGjU8VSsQpytyn2+1NsJYy
	KAsovFobGAzflik6HIbkfheq3IBNV1kkERbJo8PELPyGG+1lbyiwGekWJk4diWZjfHPS
	zkjg3hXd3f0Bwv2g17xIwUtrVsPA4ucIq4UJI3fRu8gOAtR2e1PhwJ80ASY2q8kHncoN
	zC6dsAp4MEx1+hQwyjiH1AsXm2orjS4MyFO+LHKKS55LaDUZgK4HP4OzgEjTogxg1tQU
	TDPCdpCyF9F65GyKyI/UM9dF5y58rnXJkkyqFb0xLzikC7OU3aWL9LjNIGb5uoE7cUi2
	u1TQ==
MIME-Version: 1.0
X-Received: by 10.140.38.167 with SMTP id t36mr2981440qgt.69.1430980389965;
	Wed, 06 May 2015 23:33:09 -0700 (PDT)
Received: by 10.140.42.48 with HTTP; Wed, 6 May 2015 23:33:09 -0700 (PDT)
Date: Thu, 7 May 2015 08:33:09 +0200
Message-ID: <CAJKbBDArH-fotyKehWv5zOPJsZgCAAYb7Gi+fDFzMVY5gDUFqg@mail.gmail.com>
From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] build error using read-only-rootfs with samba
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
X-List-Received-Date: Thu, 07 May 2015 06:33:10 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I recently upgraded to fido and tried to build core-image-x11 but I get the
following error if I include the samba package:

Collected errors:
* extract_archive: Cannot create symlink from ./var/log to 'volatile/log':
File exists.

I think I was able to find the cause of the problem, it seems that samba
package is trying to install /var/volatile/log/samba as well as samba-base
package by using the volatile script.

But I'm not sure, why the samba package is creating /var/volatile/log/samba.

Thx,
Hannes

