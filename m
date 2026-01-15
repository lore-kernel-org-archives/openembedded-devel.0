Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE297D44C45
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 13:06:43 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35204.1768482393389577713
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 05:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jCzSBAXR;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so507579f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 05:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768482392; x=1769087192; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trUKwVs1yL0BJVmN8+KsIQIQ+0Bph10Gf2/5n1jjdLE=;
        b=jCzSBAXR4kbJImWjVZJNiltp8waDcXVTCh4xm0BdckBo+a9elTND1UtIuLQHGhtr7T
         XyZQosFq0fnMfGWt8bSwGgNEykWAO25GnovrpDTCkzyjO9abihdpE5lTMLNy+DupJ0ds
         j9jwxvJqn9oNZcpyjq77LP4jI9b1DfZNTZE3UGMdIOn+FCn6m74/3jt7nYGzC8hSxfvx
         Q0aewFTGjXxpfBTHbS58ZP1awmiVrDpXGoHGBO95uE7PXKFjXIZxr0XuhwnW7h2WKYl3
         vd/uADrRPyEnFJgOSMr4qTUlxm1PsoblCdo1L5f3oEbOsFIQb+nRBv6wzIay3A4CxP3A
         l5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482392; x=1769087192;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trUKwVs1yL0BJVmN8+KsIQIQ+0Bph10Gf2/5n1jjdLE=;
        b=cW2VDPD355eQy3tEvGqkhWOpVbGT+tmf2MkRG0gfemsg0BJPZL6VG77/t0cOaoL6Mu
         GJpH9Uz6gbMYRM1uaKTUsNyiWEqjrLAsvlhBVZx0oQUNuDUXc6v4ewmF4p2MqSJ703kz
         wSQGy017gDkawZRrmDdcC7Z+ALRygqaFrFqDvXkYLjiTDIqtjmUWvgbNfJAEOJFljYf7
         Ve44ZFDNGmJKojgo2oEf+HZrJbyjs8CgZ2biGeKsjtfHOKHxjg+eDNpoOW+eYrtSITv6
         QL4SPK4ndB+GNF2qshdVHmt400Tdp8povP4p3A4aomNTFQ1wHRn2u7pSM4Y2FY2/Lvyq
         KG1Q==
X-Gm-Message-State: AOJu0YyJ2QpglR8qgqEvTHgUUbV281H7D9aSf9uwpxrntAmAXRxEBNhk
	lN+4y57hiyOF+3PN4tSRI2wNOt/lFPe9t6wPmvW2zxZG7lJ43LqF8vtUUDvCIQ==
X-Gm-Gg: AY/fxX7YJAQSuIz3z7b2rdiBKHs6iGMNLkIfw/PFRUVQscrKGqOPWGCByjvtXjiVDKE
	FdSUfmsriy8JSPYc1o3FFKFUrgFqVteOddqiRC/DVBjgOYRp+rEDWkknZfF5p5qMvywzloOlKfi
	N/3QkWpPevL4gsgQ9xyu2FdGD9ek8IY4T+mZ4D58n4vmCKbO0LHVDYybb6U4hNt8tLMzsjxZ75h
	xq+7zTbrLtjw+7XYwYF4ec/Y/nlWakmgotXTGpMIzMPoiiDcuknLYr8EoZn5Ch4TFMBohuLhkX5
	5dfaxSSUeaCAqiQOwytYNVQxOwlqVaxwskb9Oqjv65GRQlDBVYb2Bam64bhE3AFAbEy0lmD1siH
	IjE8fBoKk6ZhdjLT6r4V9BXkuHGysIatU0nGEpTAxEKcMJt8ZLnbTfaBKJIt1fbTM72HFmztn4f
	9VNy42uA2dtbzMRV5RWSE=
X-Received: by 2002:a05:6000:2510:b0:431:8bf:f092 with SMTP id ffacd0b85a97d-4342c55e417mr7055027f8f.43.1768482391414;
        Thu, 15 Jan 2026 05:06:31 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6b1455sm5837773f8f.22.2026.01.15.05.06.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:06:30 -0800 (PST)
Message-ID: <e284d586-8981-405f-bcb0-ddcc7f10db40@gmail.com>
Date: Thu, 15 Jan 2026 14:06:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Django recipes in Kirkstone
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 13:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123507

Hello,

As the subject states, this is about python3-django recipes in Kirkstone
- if you are not interested in them, then this email won't be too useful
for you.

Motivated by Haixiao's findings about problems in python3-django/2.2.28
recipe[1], I wanted to add some (p)tests to these recipes at least in my
test layer, to avoid such regressions in the future. Django comes with a
comprehensive testsuite fortunately (over 10k tests, increasing with
each release).

I have worked on that in the past days, and have found some further
issues. Some of them are coming from our patches, some are problems that
come from changed behavior of dependencies - I hope that my patches from
the past days mitigate most of them.

The current state of Django in Kirkstone (after applying the patches
from Haixiao and me):

* v2.2.28: 1 non-selenium test fails, otherwise the suite passes. The
test is about sending emails with recipients declared as lazy_strings. I
was able to find a patch that fixed that test, but it broke two other
tests... for now this one will stay broken (unless someone else looks
into it).

There are some Selenium tests that are broken, not sure about the root
cause yet. (But it requires a very old version of Selenium, and don't
know if it is fully compatible with the latest Firefox version, that I
was using for testing)

There is however one important caveat: Django 2.2.28 does not officially
support the Python version that comes with Kirkstone. The latest it
supports is 3.9 - but Kirkstone comes with 3.10.

Though I think after the recent patches it works as good as it can
(based on the tests at least), if someone still relies on this old
version and must stay on Kirkstone, this might be a new reason to
migrate to a newer version of Django.

* v3.2.25: After applying the recent patches, the whole non-Selenium
testuite passes. 
Regarding the Selenium tests: there are 2 flaky tests that sometimes
pass, and sometimes fail, otherwise it's also passing. I have wasted too
much of my life on fixing flaky Selenium tests in the past, so I will
just ignore this. (If someone wants to fix them, I'm very happy to take
patches of course).
I consider this version of Django to be in a good shape (though EOL by
upstream).

* v4.2.26: The testsuite passes without additional patches. It also has
the same flaky Selenium tests as v3.2.25.

If anyone's curious about the the ptest recipes, you can find the
relevant bbappends in my test layer[2]. The test output is not yet
ptest-compatible, and note that it has some extra dependencies:
meta-firefox, meta-firefox-test, meta-clang and
meta-lts-mixins/rust-kirkstone.

I'm planning a Django-only Kirkstone PR next week (I don't want to have
very broken recipes for very long), but want to leave the patches to
float on the ML for a few days, to see if there is any feedback.

Any questions or comments -> just reply to this message.

Thank you,
Gyorgy

[1]: https://lists.openembedded.org/g/openembedded-devel/message/123443
[2]:
https://github.com/OldManYellsAtCloud/meta-oe-test/commit/0b5967e555f1f36c9c1384b431aeb0e50895ac1d


