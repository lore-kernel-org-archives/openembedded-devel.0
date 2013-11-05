Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id F21096CEF1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2013 16:24:13 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id y6so6687146lbh.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2013 08:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=Ae1QVLIFYaf4AqfbidUvk6pf2AzxB/qW73F7BIoh9OU=;
	b=PjTAdosnRZ0YUdWhzayK5MM3hUamvRa8Cr0qcuDbLvuJOFp6OMGqS/8IZ7uNJE90QC
	X5orqs3tV+ZZE4n4mLrZeoBNA3lVMLqNikXee8BPBoWiSTsGCG4+/4Nhe7MoFpoVNtPM
	O2I1sl/+i1Ytq81OEn4n8+v14xPI5N0I/vT9cgAKnlmntmK5wUKuYyyvlwStFR/rwYdW
	K7YgRdNJmpMFhgkbJCUJAjXFut8d18fEl9PECXuUTOzmQbJRCJJZ3BxGUBWMOC8y/H6M
	rHH7XgWK+SzPZ4eg/R9tjs7xkkvnPtvsJeefoTwELe2W9lEU0+KjZ+VnulbuXGWoaO1u
	D3vA==
X-Gm-Message-State: ALoCoQkii6no4JhIPD7ouFsRk8JgvcwABBNgePCBilkHh799EptkgJWHN6caGuC/bFJjiEx1XAP5
MIME-Version: 1.0
X-Received: by 10.112.172.137 with SMTP id bc9mr15964158lbc.21.1383668654820; 
	Tue, 05 Nov 2013 08:24:14 -0800 (PST)
Received: by 10.114.192.38 with HTTP; Tue, 5 Nov 2013 08:24:14 -0800 (PST)
Date: Tue, 5 Nov 2013 17:24:14 +0100
Message-ID: <CAKS01o=VYbkLvtM-sieawCtcjLRyB1_776qW3bSf4svjwBHVVw@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: libeigen - unable to locate package during rootfs.
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
X-List-Received-Date: Tue, 05 Nov 2013 16:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am trying to include Eigen in my rootfs and face the following error:

Building dependency tree...
| W: Ignoring Provides line with DepCompareOp for package
pkgconfig__pkg-config__
| W: You may want to run apt-get update to correct these problems
| E: Unable to locate package libeigen

When i look into the deploy-debs folder i find only
- libeigen-dbg_3.2.0-r0_armel.deb
- libeigen-dev_3.2.0-r0_armel.deb

Has ony1 else experienced a similar problem ?


Layers used-
meta-oe           = "origin/dylan:8aafddccb03f54923927e9d1c8c80223baf581de"
meta-ros          = "master:d783e0433e4e994ffa8aad241c2f73d1ad2b941a"
meta-xilinx       =
"remotes/origin/dylan:21c3cd3f058d736742ebc23a7a954f23456fbea5"


-- 


*Anup Kini*Systems Engineer
*------------------------------*

*Synapticon*  |  Cyber-Physical System Solutions

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:
+49 7335 / 186 999 1






synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

