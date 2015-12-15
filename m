Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6A06FF76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 10:27:43 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id a188so2557056vkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 02:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=ZLmyrGdvX2sC3Dmrda7YNhPcQ+yS/bUUbWiNs/t58Fw=;
	b=L35IU2BxkBoFl/EZKSxfEsShhssUWEY+eMByKoqq1Vk2jZhIdzDYgZyoEMCD5QJ9yh
	cu1rOBQRQ+HbgTwsEhH+9IISnba8yQZYCu/0regeBSKbngtDIQ8dACvGRND8d6ebDqi4
	GxDlYXObYoaLASQS8XhK+hYaLsyb8nggwalstAaQFXjmn4vklnn4VITA9KdsDZaPuyJn
	FRTgSLOYHAfLhN9gS8mu0SxwqmpEaKFhKKUcTjPTFy8u7mwEF2ImMCzNLHvMrxSewS8i
	jDTNw4wN+sNt9H/5iBuk7HU8rWeVOaKRlyzs/N/cLhdlGGwjUEe2KFpws3kpgyaDIor0
	5rJA==
X-Received: by 10.31.152.195 with SMTP id a186mr25959712vke.137.1450175264048; 
	Tue, 15 Dec 2015 02:27:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 15 Dec 2015 02:27:24 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 15 Dec 2015 23:27:24 +1300
Message-ID: <CADySD0Eg_YH_kr7K73+58q+8ZmfeysPV1vECwQZ=HKNxN6hjZg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: QT5 application NOT generating core dump upon receiving segmentation fault
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
X-List-Received-Date: Tue, 15 Dec 2015 10:27:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am running a QT5 based application on TI AM335x EVM kit. I am using
meta-arago daisy configuration.

My system is configured to generate core dump and core dumps are generated
whenever application receives segmentation fault (expected).

But when my QT5 based application received SIGSEGV, then no core dump is
generated. It dies without "Segmentation fault" message on stdout.

To debug this further, I added nullptr dereference in my application main()
before QApplication object is created and when executed, core dump was
created.
When I moved nullptr dereference after QApplication object is created, then
no core dump was created. Application died without any message.

So it seems QT is handling SIGSEGV and not allowing to create core dump.

Is it expected ? I believe not. What wrong am I doing and how to fix this ?

thanks
Ankur

