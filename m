Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2ADD760107
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 13:41:20 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so9842230wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 05:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=LeMyNEmQQddlYt6sj6Ci58adOoNZ2HQT24AqklzNVDs=;
	b=PHXepniBO8b4nEoQP19lH9dB68zk0jCtf0AkPZF/miZsNNYZvN8pQeOK0kTa6DvxRL
	PoBhALeaU4SEH2HWmI6/V2YKTZw1CDwfzESiK4RHZCj916ErTB6GttaP3EarUf2Ib/St
	KTupiTzSMcQ7Y+bRkTrDQZouVJQ27ReRt0ep5xHRL1p6U/ncHuH9zHz2unbLE4su8CL/
	IMqkukWPM2Z3EMgWSVGjSbu7YOpLwfpnHKVdVjVi14NDjqeoaG/3rKtalURFun/ydqcT
	YO4oPtvcQsYQ9yYyP9iUL9wWZ0JHztCQCKim1wsJu8iIXduA2H8KmafC83BH5UA0drZi
	YNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=LeMyNEmQQddlYt6sj6Ci58adOoNZ2HQT24AqklzNVDs=;
	b=gwNRVax2HJ52OMgzPp0BpLePZBIxdcpkA5pY15LUiylz0g0N8UIP7fKIM7YO6Af8pu
	fJSSjKQExFCsByoOl4VovoHX0Sa9VDlus+T6PAbkzZyy1d+hDU4rCozhb3c2k8DwWQtG
	foF8u/hrZbkfPCXI1IF/Y2xgaSBKOLwd61qzH9/Pzx7ieX6xpweZVx2X70UOvlZCOpNu
	ORWivS0SYZV2sIhtu2A0WiBJw772SFK2APqygPWkoNtKuOpq4ZPd0mECb6L3P61QGTgg
	69K4SXHrQE8bWu0Yj0NaIi0VcRwyyCJjLgoEWjUkGuAPSJJu4p/ZVHd35ItGbxqy3QSF
	I2CQ==
X-Gm-Message-State: AKaTC01nGW53XbdCWw7l1mqiE1SLLf6R4WkfAC/NiPyZ4Jd1fjSLBttWLbdA0507JxB3zw==
X-Received: by 10.194.248.233 with SMTP id yp9mr1521874wjc.228.1481809281560; 
	Thu, 15 Dec 2016 05:41:21 -0800 (PST)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com.
	[74.125.82.41]) by smtp.gmail.com with ESMTPSA id
	up5sm2116274wjc.12.2016.12.15.05.41.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 05:41:20 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f41.google.com with SMTP id a197so164194363wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 05:41:20 -0800 (PST)
X-Received: by 10.28.35.14 with SMTP id j14mr1493806wmj.24.1481809280011; Thu,
	15 Dec 2016 05:41:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.25.106 with HTTP; Thu, 15 Dec 2016 05:41:19 -0800 (PST)
In-Reply-To: <1481807926-8204-1-git-send-email-armccurdy@gmail.com>
References: <1481807926-8204-1-git-send-email-armccurdy@gmail.com>
Date: Thu, 15 Dec 2016 11:41:19 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpCc_SKsLwpw2EnmG9eadCKRzoGKEbvvMDTMVv9r5rEEg@mail.gmail.com>
Message-ID: <CAP9ODKpCc_SKsLwpw2EnmG9eadCKRzoGKEbvvMDTMVv9r5rEEg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gtest, gmock: update 1.7.0 -> 1.8.0
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
X-List-Received-Date: Thu, 15 Dec 2016 13:41:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 15, 2016 at 11:18 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Add install command for libraries and headers


There seem to be a missing patch which installs the headers and
libraries. Did you check if it has merged upstream?

The commit log needs to be extended to mention what happened to those
patches as well as that it now provides gmock.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

