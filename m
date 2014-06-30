Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 624BE60CEB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 12:48:56 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id x13so6867200qcv.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 05:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=va1Rcjeb+9w1XkzzbOhPzsc5BRIav2JHv6VDk46YIaE=;
	b=l3SCEhiqMDuN/koXSYRpHqxyyNa+3DrQFT9kLQosfnjM8auXLSX7zA/CvCkKKYKTd4
	lCTkL2UH7o3MYLaEOpyj3NJSEs+V26FvXweWE4b8AhJm8owAPUGkpqWczRJFWP0yBhF5
	6yJX0tTPQ9LxJdXZ5bMJV9eooIqWh2j8vxHMOLPmcUcfam6eZzIKdPQqX212DGsiJ4Ka
	ZAHOE7ij8Q3PHMky3+pIxm9WhDTd8Fj8uMRPC4UQNnbUeWgoc4LGwwlmHe2aSLuDTFqW
	AujJWMoLkNKv7inOoKbqhiNG/Rg3FpbXZ0Hkh7Usb/s/N7NoIebqR6OwVpnl4ED1t143
	FKng==
X-Gm-Message-State: ALoCoQkSFnhwLfJh+wjKagXy+mOX830SZmhUcUvl6qpmjYtXFzM+aGACIa1DnS88sUZwpkfWrAht
X-Received: by 10.224.124.74 with SMTP id t10mr34725474qar.78.1404132537705;
	Mon, 30 Jun 2014 05:48:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Mon, 30 Jun 2014 05:48:37 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jun 2014 13:48:37 +0100
Message-ID: <CAJTo0LZvpZCFPYxsF21b1gvzr7TMMRwrLMdthGLzWFcm3JWqbQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: package_name_hook in debian.bbclass
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
X-List-Received-Date: Mon, 30 Jun 2014 12:48:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

package_name_hook in debian.bbclass is tagged using EXPORT_FUNCTIONS,
so that other classes can "inherit" it and define their own
foo_package_name_hook, calling up to debian_package_name_hook.

This seems unlikely to actually happen, and I was thinking about
removing the EXPORT_FUNCTIONS tag.  Would this break anyone's code?

Ross

