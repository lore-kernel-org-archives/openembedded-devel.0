Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD61D58E74
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 07:25:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155269.1772436297748748765
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 23:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TUuqryuf;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so48477905e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 23:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772436296; x=1773041096; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RVPLf7Qsy4fLE4puakk8sxZkU2OSn5TLIJv8jcwfhc=;
        b=TUuqryufnTjiqZR/6gOA74QxR2+Q7D7XTxJdNPHH1k23VSWs6c11N7OoOVHVWK1DzB
         yFukzgZ3erDaE+zXxkfetcBH+N5zcsUs8rqKiwwtzpO/NEnLTYsluMkdHzSWTm5d2mvV
         sXoIdcUUOSK6W9zqgDER6ZzdfXIOY7k3jmaPVXP1j1099HZSp5xOSuihLJGqhHNSK9z0
         73rTG8Think31Ws4DpgwHYWoc/T56K54BD0TFsuQTv+lwV4vIv7wG5fuF7moMWUK5pIw
         J+JVGnHTFc+cATvbYwe7j1KwiZkabc31NaHyoHQdR8xcs7fg5aYgDtE8bg2bSWa6w+YF
         /Kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436296; x=1773041096;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RVPLf7Qsy4fLE4puakk8sxZkU2OSn5TLIJv8jcwfhc=;
        b=rljWS6p2IbxXGL5NBLGilFKYyZEJ/nt4kXrZqc0vP4+U6lSTR8R7V/+kRqKbB0RtWL
         AXxlj55hQgpyEKvwEJ72ofahPHHlZehuzvLFD7nkttx5NqBQ4+DuL3lVHuK4Rgqq4cou
         zndxRNOPZwnwOJD5m19hTcCVe2duMe1A3qRlU3GNNNoaZ02r4Jms5oWUrhuhN6wRewPX
         ZuwleDDx97JeZ1IBmxzZcXfDZcqIxOPCxnq7eAsBOZjYF2TDODJ8hk8vMkwOB+wl7yOK
         epkWFLxWJlXsiWOa8Svs3393Jcid/OcpYvDX7YssnihXgZhNdc8z9ug/FqIQWysIAsyb
         Tidw==
X-Gm-Message-State: AOJu0YyETlpxVeBPu185AXYHx1+h5ZmJFl3acofwXL5ZNhAhBvjG+3xV
	jJ9FskWOL7IUHbqyJGdVSIHXyAif4rwh2LpMnkVWV16pRLIvclqsHYqbpTzfWQ==
X-Gm-Gg: ATEYQzwFNSp+NDFqvVMgRjRz7AqTd28V9hA2MP3Wpzdbm+Zntw7HrfEr380LNG3ztMD
	lPaQv05mUhSf3Wg5v4hfaG0Svkx3G3d74PrvoOvCIl7FXAPIPy7SbOTWiHyXROCYTKEh+Gx6LEO
	VFFj7uoCSHDLCsQJlHMYfPwgrwdeMwYAoL3fx9KqcCJdPqMZgr3ChiEn7mAp90/wU6uOA6BGGh0
	kri4Za6MRlkQWsMgAoyQSSBtoKvClg1OvZgP4VQ2yUJ/tm+qnPQNg9Dw5bmIPRpemc5eHJYUkta
	BehV77fo5vRtWniG66kaoYdsLqTHB9Ml8tP2hVrhVjnDYQvc1F8ScHrNNh29qXqYZcWZDXG+/+d
	eZ1dj82JdC/caZ33Xa2JCEm1ridX+ZyR0OUbRpEEyDeP8Pj1izAFYFPqVTday7UXGpIL339YzwH
	B+7NQpvXyD1uh4/AT71kMr+GPmXk35RJvGMVHFtzS2GQ==
X-Received: by 2002:a05:600c:4f8b:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-483c9c204a5mr192786705e9.30.1772436295807;
        Sun, 01 Mar 2026 23:24:55 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4e771basm10160462f8f.0.2026.03.01.23.24.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 23:24:55 -0800 (PST)
Message-ID: <ec1c40a8-a20e-48f2-a7b0-5f1cd2207e5c@gmail.com>
Date: Mon, 2 Mar 2026 08:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Kirkstone meta-oe roll-off plan
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124804

Hello,

Kirkstone is not EOL yet, but it's just a very few weeks away.

Wanted to tell about my plans ahead of time, in the hope that it will be
useful for some of you:

- Have one more regular PR, around the end of March, about a week before
the last scheduled Yocto release would be built[1]. Until that, it's
business as usual. Please keep sending your patches, I will send mine too.
- After that I plan to slow down with sending Kirkstone patches from my side
- However I will still keep my test/build environment for 1 week after
the last Yocto Kirkstone release or until Wrynose is released[2], and in
this period I plan to keep accepting contributions to Kirkstone meta-oe.
- If there are any final patches arriving, I will test them and prepare
a PR that's intended to be the very last PR.
- If no patches arrive in that period, then there won't be a new PR
- 1 week after the last Yocto Kirkstone release (or after Wrynose), and
after the optional last PR I plan to drop my Kirkstone build environment
- After this Kirkstone branch will be final, EOL and abandoned - all
remaining bugs will be promoted into features. Patches arriving after
this point will not be processed for this branch.

Nothing is carved into stone - if you'd like to change anything of the
above, or have any questions or comments, just reply to this message.
If no one speaks up, I will consider that everyone is happy with this.

Thank you,
Gyorgy

[1]: The last Kirkstone Yocto release is planned to be built on 6th, and
released on the 17th of April.
[2]: Whichever comes later.

