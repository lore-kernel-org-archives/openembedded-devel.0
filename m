Return-Path: <amit.k.chaudhuri@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 731B460043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 08:34:44 +0000 (UTC)
Received: by oiev193 with SMTP id v193so95472703oie.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 01:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=8XxcBvDOF+AcWZvgx5XIT1VXrgFLqkO4wRAtEvJqJ0Y=;
	b=q7MoJJIpEu7EVrK0KhDrHth3bHvZJFHFTdS2gDrLv8oOeeK9TdzH38AUDtHCP6E6uQ
	J5t/ayKpzpcs3NVaH+dO9aNPLnn+1uoq009t6ueqctxg5XgtLKirkPjiIKicyGkebtvZ
	xMk2NsZbEYuDNsABOVWQ2QmX63TF47t4V6AXh1F8iI7KsW6TdyxegDrzLSRC3RSej0Nv
	4jGGv4Lnd6dDo26rhEra2nlLjgOfyyfmyRgAKmdRbrbTVFaNlS8Z8y9lnlYpmHON3xJZ
	2Z4i5mx5jKVzZ+RQAo07X8n1ddwUKe0pGGcjbqmXKt8z4bJlLcRjPB7gI8Y7T6oXhA3n
	cOog==
MIME-Version: 1.0
X-Received: by 10.202.0.206 with SMTP id 197mr4729221oia.15.1439886884663;
	Tue, 18 Aug 2015 01:34:44 -0700 (PDT)
Received: by 10.76.36.2 with HTTP; Tue, 18 Aug 2015 01:34:44 -0700 (PDT)
Date: Tue, 18 Aug 2015 09:34:44 +0100
Message-ID: <CAH=VbNdYaP+Q7e0JduUG9i7i64hZjre3bPZLaWErhDXW1KHwTQ@mail.gmail.com>
From: Amit Chaudhuri <amit.k.chaudhuri@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] inconsistency between autotests and ssh support
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
X-List-Received-Date: Tue, 18 Aug 2015 08:34:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am experimenting with tools-profile and qemux86 and qemuarm. Autotest
failures make me think there is an inconsistency in the recipes and
possibly also somewhere in the docs.

I was under the impression (from docs?) that core-image-base would add ssh
support so I switched from core-image-minimal. Whether I was looking in the
wrong version of docs or not, the failure of the autotests makes me think there
is a problem. Examining the ssh log listed in the test output I can see multiple
"connection refused on port 22" messages" and there is clearly no ssh server
in the image. The test output shows that some tests are indeed skipped because
the system knows ssh is not present. But multiple other tests are not skipped.

Same experience on both qemuarm and qemux86.

After greping to find ssh-server in a .bb file I switched again to
core-image-full-cmdline and am now able to ssh in. I still get an error relating
to something else, but ssh works fine.

With fido version:

meta              = "fido:6546771a502a09c63e33679be8784818be0ef93b"

The main changes I have made are to local.conf where I have:

MACHINE ??= "qemuarm"
....
EXTRA_IMAGE_FEATURES = "dbg-pkgs tools-profile tools-debug debug-tweaks"
....
TEST_IMAGE = "1"
....
#
# Enable build history
#
INHERIT += "buildhistory"
BUILDHISTORY_COMMIT = "1"


Regards,


Amit

