Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id D106D60249
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:46:26 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id y84so19214932lfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=38O+/HKvyv7MubICim1kgzO3lWKSpMZ0UOeJqkP5318=;
	b=0XDRixGcDBcItmXYdQq3cN6p+S0VwcXR/dsNoznton4ohbNInD0XnUCmAGER9ZCHgS
	+Abf9spsco3IDk8/UorGg7BxiD6dObSFEfqB8r6DrV1mAi7RxXqHlZ4knqCB7tLwWdbJ
	IbVSxJ1xVKLpKr4QrY+34fCNqSQZLf0v7E8N70ViNlLnZB1nnm3Ioemi7h4zsRNPW//y
	H6WX3CTJ/oCYTi2feDdAaYkDFc14sD8vggkFz9QM2+FlXK6b19xdKDCcp3NktigLlTME
	p06N+6D3S0WCrs5zHThBB8JN2AM+KVChDzCqwFeMs6O02dPoWxSpBOvsSLU7jjrhN6Nr
	H8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=38O+/HKvyv7MubICim1kgzO3lWKSpMZ0UOeJqkP5318=;
	b=a0xp1VFdS5W5UF86xBnU+g91q02giH5SjJxYLn/f+oxNh/mdj+dgWC9Fatp4Q6AdXv
	OmnVhi7qcYmhGyfPBoK4Vwbppx55Cou3GBIdlk4nSC8g5Dr42IMBjad98HddDQgOqVge
	8VYx8iP2t0gpvtLcX1mKRmXKmfmafltSOoYs+ck0NfgK6oSSe5qrWn4sC36IjqcKinvK
	6Uy/Jqe7pdGYnRN63Dmrdfb/bnAKH16T8pKjpyC/GGncSZRw3LesJ5hlo8g0q4Wd/0r8
	idbHk+fg+NoTJA0irBZ6KfJZ/zydhClMXL0THtuMXqr575aTHznMrtlEpcsYoQVbxURn
	jkhg==
X-Gm-Message-State: AOPr4FUVedOUd5O8frKuV4XSLlsKCUsaBcwx/c+YaH4L1hgvTiNiAi8wa+iJf8mryWviKvtkwY6Ba8VlG91eEw==
X-Received: by 10.25.86.144 with SMTP id k138mr14220406lfb.6.1461591985505;
	Mon, 25 Apr 2016 06:46:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.22.193 with HTTP; Mon, 25 Apr 2016 06:45:55 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 25 Apr 2016 10:45:55 -0300
Message-ID: <CAAPZna3rXuTpEx1F=jzqUMRyCkD+xh6S_d+QR++XALMh6bBLZA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-python][krogoth] Backport python recipes
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
X-List-Received-Date: Mon, 25 Apr 2016 13:46:27 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

Recently I sent some python recipes for review and last week were merged to
master. Could these recipes be backported for krogoth? I tested all them in
krogoth branch.

Recipes are listed bellow:

python-bcrypt:              cb95c5edaa977c8361628dab04b95192c423fc1a
python-blinker:             5a7f267941689eff28b4b0721752708bad4747b6
python-flask-bcrypt:        00d5837fd39af7ffae262282f56a0cb42a1c3b89
python-flask-bootstrap:     962e2ab371844f5119df2b8ab4a4231f6f7f9f3d
python-flask-navigation:    381d498441bd66bdae2d8da1ddcaadee1ff6de73
python-flask-sqlalchemy:    3e4ecdd6fe6709f394d92e86ccbc228ae5a43663
python-flask-wtf:           4be70064670c34d1b67224672b7caed7b4ed7b04
python-pam:                 49b35175d5018dc626a17a9a0662d97e812aab7c
python-wtforms:             9676ebb7d14090126f667671d525ce3f3ee89279
python-dominate:            5a20e8799eb1c1dd38ec9fee15fd90b88b38bba4
python-netaddr:             d3767d923d5044604633be3a3ba8bb4564f51b04
python-visitor:             834392bfada652260f6d5924278dd5839d095941

