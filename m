Return-Path: <garbados@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 60C626007A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Aug 2017 20:44:40 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id m85so28368385wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Aug 2017 13:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=vvdaZIuS15OkTeLRuS9bYqgLT2t53rN4OKVJZ92TSa4=;
	b=AfUUxPgZR3JXUoPUP/2WvaQgCqk3NZ0Yj6Gjp0h7T5lUYtL7VplMQEXiF2J1AOtfgk
	GFtEtLGv183nLoCoEFsvvKVNRQMql3lm4e+4e8uDYRniDp4coDNE8q8BbAM5ovMjcJQh
	S1Q5uaYaS3nojTxIUoDAhA20TEttMEH9HJ/xDpKrTxoPAykirxttGnV+xCbEo1PaECsv
	jzVFQyxsxEzBeg/MLYhgani0IXGJWiisRa9FE+lbkFkFEoTkRdjTgABT6MFqQc3iCk1J
	uUFSvD3/ND4aztyChpjUL2Qki/n9GE/ebTiWNH4xX9yuHLsHcH7TddeTJNi1XZkVl8aC
	QmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=vvdaZIuS15OkTeLRuS9bYqgLT2t53rN4OKVJZ92TSa4=;
	b=dVEcODcQZMpJr+Y4g/xWWfXq2hD/gxqVuWDtCftNCK/NgsSZmAUv4Lq9JfT3pasu0/
	/YkVb3N3sJ3B21IsDd76x2NreiCl/JEJNDlHsDSQZ95zBB27yzb5achMWCWibglw0XHd
	d7gR1L14bnz17FCZ7qctJlJpy3sVekupIDEOybkzKmCiF+ZIlWYiH25Cs8IM0SU9oZGI
	w9Yu3oiG8M8Y+qYrTMoUqIsR3uY1wFZJP/MswsLpSdsB/3bAnLiwUSGMhL8iDYBOLJDE
	hnFPhNRzOwZIKYmTbiwcVGSEYkK4t1iDXOdIEB3WkP+rCAx0VLzIU6W2dMUvlUFkUDg9
	u6lA==
X-Gm-Message-State: AIVw110aeAdkyOjFeT2CWiebDRIHx6MjVoVWcdSzbjATu499BsyqlWsX
	4F+sxCjel1HtRvyT4QyUp1pKCHzAvTlm
X-Received: by 10.80.138.6 with SMTP id i6mr3620909edi.247.1501879481858; Fri,
	04 Aug 2017 13:44:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.167.164 with HTTP; Fri, 4 Aug 2017 13:44:01 -0700 (PDT)
From: Diana Thayer <garbados@gmail.com>
Date: Fri, 4 Aug 2017 13:44:01 -0700
Message-ID: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-openwrt] Issues adding layer using readme instructions
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
X-List-Received-Date: Fri, 04 Aug 2017 20:44:41 -0000
Content-Type: text/plain; charset="UTF-8"

Hello!

I'm experiencing issues building with meta-openwrt. Following the
instructions in the readme <https://github.com/kraj/meta-openwrt>, I get
this error:

```
$ bitbake-layers add-layer ../meta-openwrt
NOTE: Starting bitbake server...
Loading cache: 100% |#############################
#####################################################################################|
Time: 0:00:00
Loaded 66 entries from dependency cache.
ERROR: Parse failure with the specified layer added
                                                          | ETA:  --:--:--
```

What failed? Why? How do I debug it? I followed the directions step by
step, both within openembedded-core and poky.

Thanks for any help you can provide.

Best regards,
Diana

