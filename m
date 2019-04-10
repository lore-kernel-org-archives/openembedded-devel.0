Return-Path: <ram.subramanian@meraki.net>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id A38197D858
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 05:29:38 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id q14so1411487itk.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 22:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meraki.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=2OxzpmNIFx+DkBExGhekAI1j4tYdcA5W0jNXksxzAjc=;
	b=kJGtJYP7VkK0RN4Ayss5Il3WMWN+FC9NRuSMaQydnbUJXUD2b2f+cygzwSV5I3U484
	j+eUgbHuUR7cDw5g4za1Yu3aF0SiXqFhJUQjZxrbp+qX1yeVQwHAIMfH7Ux38Zyc/sHa
	6zPLQYmFasgt6A9tSSprKxUCUI8q1TZDzREjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2OxzpmNIFx+DkBExGhekAI1j4tYdcA5W0jNXksxzAjc=;
	b=UUBmc7qDdPHNgdUvDxIXksuDlx6W58uKAennZ2Uyl9RDsGMlbOpoDK2z8Os+iIwQBG
	G/1ckFdCt8vpb3GLvITJ6Ln/oUysaGg/x04z0Uh7zjeH1NWVA05dfHKmNrsgo5o3l1EP
	pu6/xfczAMlE9JvWvrLMAUex7XfShs/K33YYQQOgtb6I9cNvxIql8eBwDH97Sv6LdPpT
	Ef1jpICn0ehv+S1Sm/Mu4fvinfcn0hmSqlDnXg3MoDRqKLNIjOR2f1J+Ul8eXxsNnti8
	WQymgqp7nKkMPhpqFxM32+VI5s6k776KQmKN+DGyX2Qcs7v0UqE7+mA1rVQLAPdzJZWV
	1taA==
X-Gm-Message-State: APjAAAX5pUfIox6aXg/+h7IAkWENnJo6WnhwxMwFt6m3bBWd6+jM8ET0
	3tmXcISVOCOXIYMLDReQ/A8p/2fEUvXky1pnF6rFSa70P10=
X-Google-Smtp-Source: APXvYqwmGUVA6XJkqxUr0MfTJdiLaTocgBspKzkbOFQ7pDxqv9K5ZHcSlRDQr7zcg7WD0gdAcMKm3uHjlydztuLf8xY=
X-Received: by 2002:a05:660c:885:: with SMTP id
	o5mr1893565itk.63.1554874179252; 
	Tue, 09 Apr 2019 22:29:39 -0700 (PDT)
MIME-Version: 1.0
From: Ram Subramanian <ram@meraki.com>
Date: Tue, 9 Apr 2019 22:29:28 -0700
Message-ID: <CAMSkS0hfFUKN4Z3hQvindomzUeTnTJpmQeNVmTMOSG2+jstr8Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Will a commit currently on master make it to a specific future release branch
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
X-List-Received-Date: Wed, 10 Apr 2019 05:29:38 -0000
Content-Type: text/plain; charset="UTF-8"

Hi oe-devel,

I was wondering if the following commit that is currently on the master
branch is slated to be cherry-picked to either the (upcoming) warrior or
zeus branch(es) (or both)? I noticed that new branches aren't always
created at the HEAD of origin/master.

b42de097d - Pascal Bach - squid: upgrade 3.5.27 -> 3.5.28 (4 weeks ago)

Currently neither of those branches exist in the upstream repo, and knowing
this information will make it easier to plan for it accordingly; especially
since we're close to the next release going by the yocto releases page.

Thank you,
Ram

