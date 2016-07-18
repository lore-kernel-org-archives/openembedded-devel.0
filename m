Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id E27F660746
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:44:58 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id x130so239097492vkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=O+d2K03dlec+qQBFaCtEihfOMmjKc2XWMjKfYL2x0h4=;
	b=nYtFLizWDbgYcU5bWAv0Vu8Ot7+ARIgZVRt/N+g4VsHZl1O/iPLa3COI84tbNVq/R4
	MTNJXifzIAyT8GMeEiTXZyk7sRVgGIdsSx0zjDXye/5yIt0JgdVFpdXTihaXcFe9GFDP
	3DJ1FrSemhBJUjo/7Ni+WXTB2QF2iXBXSiPOF/1TBNLjijiFwBxMY88HaW7eH82Aeq33
	nlcafDWfrDnXtlfzo/wUCDiFBOPCNAMhrJJ+3JH8IvzNRtXjyRt5PEO7uk/dujghFr2l
	VGzb8gM5TxVJBM+GtQ6pPXz+6l7F26997KrL+zIji6Vlsyb+Nzp/XkSGIoDzO4p+3ddX
	F+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=O+d2K03dlec+qQBFaCtEihfOMmjKc2XWMjKfYL2x0h4=;
	b=jBbBClym7sTZwBQxn94poehN0VAxWKSMlIQ+G+WjENYHhCvN6NQlx46lHIk+SVV1xr
	eSe/o1//SmuT6fldcKDA9z2RnklTwHAjngBkeH8ryLz4CnDPWF8sWnsrjADIB8ybUqe+
	mZsL2OltnB46UP3SqjSNxucvs5ZNL3vgKnUkQm7Fm/UgVG3Jikh69UoGlL1vLvGvREu2
	zSvDXBAbLkQAxCaC6mIU7/VFEg9TN21xfjdzbS7uFNLwtcpkbmvqZgCB7Xs7EzqBsvDG
	gfGohrNTmD2neSoLJGJC2rhahN92eqmholwLi4NUzRdFxoe1nXjuShMePdBiU6ixNvBK
	/gDQ==
X-Gm-Message-State: ALyK8tKR/7B7bJQVq6/YrVt78cQ1Xu+n/Yk/RWEl5TLkr8VzEx5t/LvfBmdWBHowjIieqg==
X-Received: by 10.31.93.193 with SMTP id r184mr17083404vkb.53.1468849498607;
	Mon, 18 Jul 2016 06:44:58 -0700 (PDT)
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com.
	[209.85.213.47]) by smtp.gmail.com with ESMTPSA id
	131sm3053154vkn.22.2016.07.18.06.44.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 06:44:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f47.google.com with SMTP id x130so239095872vkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 06:44:56 -0700 (PDT)
X-Received: by 10.31.161.81 with SMTP id k78mr17714410vke.122.1468849496491;
	Mon, 18 Jul 2016 06:44:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 18 Jul 2016 06:44:54 -0700 (PDT)
In-Reply-To: <1464832273.22882.2.camel@pek-signage.wrs.com>
References: <1464745422-12428-1-git-send-email-Feng.Mu@windriver.com>
	<20160601093257.GA15832@mbabyjoh-desk.ger.corp.intel.com>
	<1464832273.22882.2.camel@pek-signage.wrs.com>
Date: Mon, 18 Jul 2016 10:44:54 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqKk5=T_cVvGQhTeLBgSmLb8jRT9DUHG2vryk6LXWC=iw@mail.gmail.com>
Message-ID: <CAP9ODKqKk5=T_cVvGQhTeLBgSmLb8jRT9DUHG2vryk6LXWC=iw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] javasqlite: add support
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
X-List-Received-Date: Mon, 18 Jul 2016 13:45:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2016 at 10:51 PM, Feng Mu <Feng.Mu@windriver.com> wrote:
> Attached please find the new PATCH.

Send this using the send-email too; attached patches are bad for
git-am and patchwork workflow.



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

