Return-Path: <mryndzionek@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 198A86AE73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 08:21:55 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id m1so9252303oag.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 00:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Rnc2MeffoQsbty0AyE4xy2bpE+ny67VksQLrF/biV2M=;
	b=ORQ359PvJGu3lZDpy5xtWaGBDkr75J+OUPooCvHDMifNdbJzF+yoWsoQ2OIzv3aiM9
	hBrHIReBRdOknZEiL5BSlCtyxXptGbEsQyma4SivguBuy7eVxeJHB/2lUS8OdHNFedPh
	V3+EBGeOAe6BeICM6ZEu9PXPBEpacFrxzyxdhw2YG9pW+VplbP2fYJpcOaO3rq1LH5kF
	zmftJRCnbEBsVYKE9jQT/j8tRIJxKKkK86l9lLlJ/XZc8r31CsW4KL+kXG5H91cAkcRN
	Nc4MfwFFLqPh55ulFg5lKlXOLIc3DHRpaJGofsdQbAcJBFvqhPKOPy4sRwNP4n3CUr7T
	JrIQ==
MIME-Version: 1.0
X-Received: by 10.182.135.194 with SMTP id pu2mr157346obb.38.1389687715506;
	Tue, 14 Jan 2014 00:21:55 -0800 (PST)
Received: by 10.76.130.204 with HTTP; Tue, 14 Jan 2014 00:21:55 -0800 (PST)
Date: Tue, 14 Jan 2014 09:21:55 +0100
Message-ID: <CADxgXkWFCkAADLWsZJPTv4bDuXkd706FyvmRxY1sntg0Tyqwvg@mail.gmail.com>
From: Mariusz Ryndzionek <mryndzionek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] openjdk-6-common ipk package - wrong dependency - unable to install
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
X-List-Received-Date: Tue, 14 Jan 2014 08:21:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

The openjdk-6-common ipk package depends on openjdk-6-vm-zero. It creates
circular dependency and opkg is unable to install Java. This issue was
introduced by the patch:
d0eeda3107951433db2b6d4ed602573ae52e166e
openjdk: link libjvm.so from hotspot to archdir

Linking the libjvm.so causes shlibdeps to pull the dependency into RDEPENDS.
Unfortunately I'm not able to fix this by myself but I think it is quite
serious issue and I hope it will be fixed soon.

Best regards,

