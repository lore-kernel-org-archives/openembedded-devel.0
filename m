Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF207CFA4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2019 19:17:30 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q21so7776211pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Sep 2019 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=bOANvwy0nnMr0iBUKtS/F6JCOmtJ5cXC+9Yqnwx+mVQ=;
	b=OIxAse4CylhXfB3OCsbMwjKPrNChREZWxglfoldRYaiUcPXsxXjIxB8fT9C/6jaTWQ
	g+PnRV160MhRTweRW7N0k5R5bXaKhHw4nJfm/dhOjOVLMD9unHKTZ/RIUk/8vg7YWnm6
	NMWxzSWrOROssvhFgA2+xivrf8vnZvUvmWUW5oSaE9hMQhfnunqE3vE8QVCjRilOYFZQ
	JzsYAmAI7hS0fJjjd+DwGn/7n0s3hWwKWjSBiFu+Qh3mF6rx6RDc70jvtBYFnISaM+/3
	8N4E5DdHum2q1EprF0SV30s0gjoiQmXbu3qyLCwIVIsShyusFxzccwKBPZkBG1c90Afn
	NEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=bOANvwy0nnMr0iBUKtS/F6JCOmtJ5cXC+9Yqnwx+mVQ=;
	b=EX53YWq1071maQ70VQvAEhbetKSHZcdRFosjvz+dtp8I/Ahdeo7ZNqoST0wY7tOsiw
	JotFPi5f64ucHk4RugjYNUZRrJUlc8CgDthohpwlt6QrltrGwsza6y1dePv0FpfLFVed
	Xr/A6AArr4sq00QYw5UdMek8u6Zad4D3blJdV406cpvIDORKcZIL5V5kzJ2hFDcqpqpq
	Yd70xgtuNccid5NX7sfssuM7KDsjC0DwRO1Tn9R1b6G4nXDMeQkp0AUqJD4J3NIBBYaq
	jjHzWFyLbTM695uK+30Q892wddd+iOSUb3r9ZiboCz+w1v9Ypxsp9744MiVErjG4UreP
	jbwg==
X-Gm-Message-State: APjAAAUFZDh9n+0Agz60/RC+HXior8RDwQRklyzww61h4UITnK4zh6Ts
	BvZ879tEDibjvbtCCFWUm9Y=
X-Google-Smtp-Source: APXvYqw3VYSKJjdNeM13yT4zS6wIHRY0qwD8r26yswVLfhR3L4GxHWZTbqC0tz864mKiiLPcrnA45A==
X-Received: by 2002:a62:1d93:: with SMTP id d141mr23876409pfd.40.1567970251331;
	Sun, 08 Sep 2019 12:17:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1e2:13d2:378e:990e?
	([2601:202:4180:c33:1e2:13d2:378e:990e])
	by smtp.gmail.com with ESMTPSA id
	i9sm29613769pgo.46.2019.09.08.12.17.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Sep 2019 12:17:30 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9543d463-3b85-42e9-6c51-ffc1a2e03d27@gmail.com>
Date: Sun, 8 Sep 2019 12:17:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
Subject: warrior-next pull request
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
X-List-Received-Date: Sun, 08 Sep 2019 19:17:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 0afee3eacfd18a9962013830028f9e54b4973657:

  apache2: upgrade 2.4.39 -> 2.4.41 (2019-09-02 19:39:53 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded
3bdbf72e3a4bf18a4a2c7afbde4f7ab773aeded9

for you to fetch changes up to 3bdbf72e3a4bf18a4a2c7afbde4f7ab773aeded9:

  oprofile: drop kernel-vmlinux from RRECOMMENDS (2019-09-07 15:30:50 -0700)

----------------------------------------------------------------
Adrian Bunk (1):
      postgresql: Upgrade 11.2 -> 11.3

Arturo Buzarra (1):
      lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules

Changqing Li (1):
      postgresql: 11.4 -> 11.5

Hongxu Jia (1):
      postgresql: improve reproducibility

Martin Jansa (1):
      oprofile: drop kernel-vmlinux from RRECOMMENDS

Zang Ruochen (3):
      wireshark: upgrade 3.0.1 -> 3.0.2
      wireshark: upgrade 3.0.2 -> 3.0.3
      postgresql: upgrade 11.3 -> 11.4

 .../{wireshark_3.0.1.bb => wireshark_3.0.3.bb}     |  4 +--
 .../files/0001-Improve-reproducibility.patch       | 39
++++++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc      |  4 ++-
 .../{postgresql_11.2.bb => postgresql_11.5.bb}     |  5 +--
 meta-oe/recipes-kernel/oprofile/oprofile.inc       |  1 -
 meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb       |  2 +-
 6 files changed, 48 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.1.bb =>
wireshark_3.0.3.bb} (95%)
 create mode 100644
meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_11.2.bb =>
postgresql_11.5.bb} (51%)


