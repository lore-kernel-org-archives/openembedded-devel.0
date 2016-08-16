Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4D97326D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:36:23 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id k90so124585926uak.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Gf9HFrJ0GBQeW/alenH9bwEbAqHJ19LENXdy1xfdCS4=;
	b=oEnBpRbkdE//UCQSyG+ZKRrJ0Bvi7JjIi6ikZ4ie7EcQ9rIpTh7C5F6xp47jiyxUjJ
	uJDwFDSiybT5joVUJX8R/ZOeJpycApeBt9B38hm+pcVUcyN8clWvhALcubxsHguJ6Lia
	tnRGoZHbJzoq/XnC0UXsQdi/hmUHlmUhZ2+pUj6ngOGJMwPrGtef0AyeV77bpb4WUaXJ
	EWxqN6AvZVkG7aKXCLESYHRImhLTMO3ZGXU5xTI7uj1DJaPXr6yC+FjYU1r0llD0JXPQ
	Ukw4bTzgXdKzXWRnTrLS0/CNVMgHB9ItcBgAhdvz9y3Ob0ssTwTFau+sAbgC7q1WALRr
	QgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Gf9HFrJ0GBQeW/alenH9bwEbAqHJ19LENXdy1xfdCS4=;
	b=b2pXeJmSsNJbCvHhl2/Ujojx4YJGB6dDYs7UmstDQYSOTFptGlr1t28FB5vdFXI9N1
	9vOCJrbRcv2lcOxllvd73TRvE3dNbF8Gf5MjouVYu1oJI3vBSlNOtQ+XYdn5fp4Ih7ef
	Nq7VAouWMXwxkp+UO+lWSnlaZCc3lo1e7Uqj1LOFeyXlgsE93LZx02QJES9mym9Dmjv3
	h2jwP+Tw4fwNLPgyk3J3gCiB3qVPz6Orl0Grvdr8lbvpt2ScdTdY4lhff+Wutcie+PlD
	QXKHz+DdVLX9uAHBw9Xr6hNPcqspDLNbhcX8ZRue/S5XHsoQdIO3+8X2Mzb4w55AmQvC
	YqkA==
X-Gm-Message-State: AEkoouu4rgSmtH5E/OLUtLBequFgGWibwC3d5jvuuc22X62Pa3v9guWE4qA1MFij5b41SA==
X-Received: by 10.31.159.67 with SMTP id i64mr14477349vke.104.1471358183578;
	Tue, 16 Aug 2016 07:36:23 -0700 (PDT)
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com.
	[209.85.217.171])
	by smtp.gmail.com with ESMTPSA id 6sm5254675uar.8.2016.08.16.07.36.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Aug 2016 07:36:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f171.google.com with SMTP id 97so124521502uav.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 07:36:22 -0700 (PDT)
X-Received: by 10.159.41.98 with SMTP id t89mr14574631uat.97.1471358181959;
	Tue, 16 Aug 2016 07:36:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Tue, 16 Aug 2016 07:36:21 -0700 (PDT)
In-Reply-To: <12690292.VtMlGpGA8f@localhost.localdomain>
References: <12690292.VtMlGpGA8f@localhost.localdomain>
Date: Tue, 16 Aug 2016 11:36:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpwHhJ07D2KGXGbNHtBXrOB20=YoO8n4VRdpi0=nnFJuA@mail.gmail.com>
Message-ID: <CAP9ODKpwHhJ07D2KGXGbNHtBXrOB20=YoO8n4VRdpi0=nnFJuA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Chromium build issue.
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
X-List-Received-Date: Tue, 16 Aug 2016 14:36:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 16, 2016 at 11:32 AM, Davis, Michael
<michael.davis@essvote.com> wrote:
> I am having a build issue with Chromium ever since the increase to version 52.  Wanted to check if anyone else was seeing this or if I was just special like that.
> The build system is x86_64 and it is building a x86 Intel target system using the HEAD of krogoth branch.
> It's strange because it appears to be using my build os gcc and directories not the cross compiler.


Trevor, could you take a look on this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

