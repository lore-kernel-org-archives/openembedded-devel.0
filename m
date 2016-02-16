Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8E965CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 11:51:02 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id c10so106255742pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 03:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=bx1mULzrsdsZZdRwhP8mQSjH1WHqB1klWe22cYgMRgE=;
	b=Hl8ld0Y4BL+K7pp4SLpOpvOZrX91K/kYnH+2CzFfYWD01mRQfq1gv64ogxYHhZeScQ
	1Oa6DxghUENwVcFKGKCc5lrejC4uuLMenkm4AcOLI80+6qu8TwR6XUe1lAUFSac1FweJ
	t5PnHmwrL/IwY6FTW8MysN7K1vEFiQKbVmeFh+QPsMJMouH0X//cDDDC01d/liOsJ7Qg
	mU25aZEyFGKixsxWCOY58v6F1rjxzyU2UNiMXb/JftkzhwfC+YHkr9QASU0iQIzu1tzb
	t8kGUVXKGJqtWLkgxDaAOvX036zTEFsM6EI/zcDxzlrd+7zpur2iEVM5ZJp0jpP4Pzkw
	xpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=bx1mULzrsdsZZdRwhP8mQSjH1WHqB1klWe22cYgMRgE=;
	b=VsYDcY2grDRs3a3aTXv73Xdh48prWJHxAlKsAnxkz25w9R5FD9WuTDrkSZLN228uSR
	vU20bu3GKB0eDIJDZlvqHxhr8oo3wtMTSbGAoyvmvKvA0Ku0KcW9QUkzH7ELFawWk22E
	sDr1CAWYIV/XyxCWufZjTey+bL1B3PGssesnD8/+CcG6IkYGQZaPBV3EzzRdiTYjdNmV
	BygviMFR6jHnALGxybi4rx8rF9ZqA7TF0l9rfPwgTtuelKjcZflNXGCWPmJ7n05qcYDQ
	zpZLzM4l8gRQL+b71yCJUbQftzWsmO/ItUVE3beTh5llCs3czWOEqn55NCf3Y6HqTqdJ
	1y2g==
X-Gm-Message-State: AG10YOSet3IJ0GXVNBrRoMV5QcSdUZBKCiDcBu7NbDRe6EWi758PIy+m8sbe09SHVqumbQ==
X-Received: by 10.98.42.20 with SMTP id q20mr30876444pfq.146.1455623463752;
	Tue, 16 Feb 2016 03:51:03 -0800 (PST)
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com.
	[209.85.220.52]) by smtp.gmail.com with ESMTPSA id
	195sm45341049pfa.5.2016.02.16.03.51.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 03:51:02 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f52.google.com with SMTP id yy13so102226972pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 03:51:02 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.121.10 with SMTP id lg10mr10640742pab.59.1455623461808;
	Tue, 16 Feb 2016 03:51:01 -0800 (PST)
Received: by 10.66.79.8 with HTTP; Tue, 16 Feb 2016 03:51:01 -0800 (PST)
In-Reply-To: <1455622845-14510-1-git-send-email-pascal.bach@siemens.com>
References: <1455622845-14510-1-git-send-email-pascal.bach@siemens.com>
Date: Tue, 16 Feb 2016 09:51:01 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqB8dnsThLVpK=+xC0XPagMGyvT-8Rma3LTP9rds4u7oQ@mail.gmail.com>
Message-ID: <CAP9ODKqB8dnsThLVpK=+xC0XPagMGyvT-8Rma3LTP9rds4u7oQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 0/2] nginx: make mainline and stable version available
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
X-List-Received-Date: Tue, 16 Feb 2016 11:51:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 16, 2016 at 9:40 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Nginx has two supported branches, mainline and stable.
> Currently meta-webserver contains the mainline version (1.9.x) of nginx.
> For embedded system it might however be more appropriate to use the stable version (1.8.x)
> which only receives security updates and bugfixes.

Agreed; I also think 1.9 recipe ought to have default preference as -1
so users take the stable by default.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

