Return-Path: <rcagley@gmail.com>
X-Greylist: delayed 332 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 18:48:51 UTC
Received: from mail-yh0-f43.google.com (unknown [209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3017265EE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 18:48:51 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id v1so2075921yhn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=zNdEOgK6J/XaBeiJxpn3Ukxa/rI8xNp04XS/r8RiyOk=;
	b=t0c0DoQSr/M7/QKUu0jv9YOrq+st3t6lwMaDSdP79uEOXiQMAk6cEgWqcOmJyAYxFo
	aR89m2y/tv3hkEAQLVQ+MQulYSxnvxFDGsn5J21dwGntAGTQBwr9EV5Z+2CoIviRLeri
	RA7vzNG8SjkNw6XBSNJfGXUHEDoc+7ue7dErVcmFJCj3aqHn6HVqoPUPfsBDCecw8H+J
	xs54Lcd+qecQxw4/peyOKijQ8+4BenSZnrd8/PNC9ZWlXs0YbQCEsRjma7NDjvuenaV1
	tbWm9Mb6Ogj89wEp79wQK7ePA9nDByohPjcXVnQxSxVbHzwRyLHs5SO/tWk/+p1DhNiv
	qtTA==
MIME-Version: 1.0
X-Received: by 10.236.26.193 with SMTP id c41mr43439225yha.151.1399920200649; 
	Mon, 12 May 2014 11:43:20 -0700 (PDT)
Received: by 10.170.110.8 with HTTP; Mon, 12 May 2014 11:43:20 -0700 (PDT)
Date: Mon, 12 May 2014 11:43:20 -0700
Message-ID: <CAN-NoH3xAYL_GdgvtYzNChD0VneKjT4EoJzPLigAeCZXegcBCA@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: kernel config/rebuilding
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
X-List-Received-Date: Mon, 12 May 2014 18:48:53 -0000
Content-Type: text/plain; charset=UTF-8

This is likely an incredibly dumb question.

After I do this
bitbake -c menuconfig linux-xlnx
Then go through the menu options and select the kernel changes I want.

How do I get the kernel to rebuild?

bitbake linux-xlnx
and
bitbake core-image-minimal-dev
don't seem to generate new uImages.

